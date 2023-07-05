#######################
# Setup rudder server #
#######################
setup_server() {
  # Install via package manager only
  if [ -z "${PM}" ]
  then
    echo "Sorry your System is not *yet* supported !"
    exit 4
  fi

  # TODO detect supported OS
  # echo "Sorry your System is not supported by Rudder Server !"
  # exit 5

  $local LDAPRESET="yes"

  # 4.0 has autodetect support, older releases don't
  if [ -z "${ALLOWEDNETWORK}" ]
  then
    if is_version_valid "${RUDDER_VERSION}" "[4.0 *]"
    then
      $local ALLOWEDNETWORK='auto'
    else
      $local ALLOWEDNETWORK='127.0.0.1/24'
    fi
  elif [ "${DEV_MODE}" = "true" ]
  then
    $local ALLOWEDNETWORK='192.168.0.0/16'
  fi

  # guess package name
  if is_version_valid "${RUDDER_VERSION}" "[7.2 *]"
  then
    PACKAGE="rudder-server"
  else
    PACKAGE="rudder-server-root"
  fi

  # Install rudder server package
  ${PM_INSTALL} "${PACKAGE}"

  # System specific behavior
  #######

  # Setup the Java TZ on SLES
  # On SLES, the Oracle JRE is often unable to get the system
  # timezone, resulting in broken reporting timings.
  if [ "${PM}" = "zypper" ]
  then
    grep -q JAVA_OPTIONS /opt/rudder/etc/rudder-jetty.conf || echo "JAVA_OPTIONS='-Duser.timezone=Europe/Paris'" >> /opt/rudder/etc/rudder-jetty.conf
  fi

  if is_version_valid "${RUDDER_VERSION}" "[* 5.0]"; then
    # Initialize Rudder
    echo -n "Running rudder-init..."
    /opt/rudder/bin/rudder-init ${LDAPRESET} ${ALLOWEDNETWORK} < /dev/null > /dev/null 2>&1
    echo "Done."
  fi

  [ "${DEV_MODE}" = "true" ] && setup_dev_mode

  # install plugins
  if is_version_valid "${RUDDER_VERSION}" "[6.0 *]" && [ "${PLUGINS}" != "" ]
  then
    if is_version_valid "${RUDDER_VERSION}" "[6.1 *]"; then
      quiet_arg="--quiet"
    fi

    # get licenses
    if [ "${DOWNLOAD_USER}" != "" ]; then
      cat > /opt/rudder/etc/rudder-pkg/rudder-pkg.conf <<EOF
[Rudder]
url = https://download.rudder.io/plugins
username = ${DOWNLOAD_USER}
password = ${DOWNLOAD_PASSWORD}
EOF
      rudder package licenses ${quiet_arg}
    fi

    # Configure plugins
    if  [ "$(echo ${PLUGINS_VERSION} | sed  's|.*/||')" = "nightly" ]; then
      nightly_plugins="--nighty"
    fi
    if [ "$(echo ${PLUGINS_VERSION} | sed  's|/.*||')" = "ci" ]; then
      url="https://publisher.normation.com/plugins/"
    elif [ "${DOWNLOAD_USER}" = "" ]; then
      url="https://repository.rudder.io/plugins/"
    else
      url="https://download.rudder.io/plugins"
    fi
    cat > /opt/rudder/etc/rudder-pkg/rudder-pkg.conf <<EOF
[Rudder]
url = ${url}
username = ${DOWNLOAD_USER}
password = ${DOWNLOAD_PASSWORD}
EOF

    # list available packages
    rudder package update ${quiet_arg}
    if [ "${PLUGINS}" = "all" ]; then
      PLUGINS=$(rudder package list --all | grep rudder-plugin | awk '{print $2}')
    fi

    # install plugins
    if [ "${PLUGINS_VERSION}" = "nightly" ] || echo "${RUDDER_VERSION}" | grep -q nightly ; then
      nightly_plugins="--nightly"
    fi
    for p in ${PLUGINS}
    do
      rudder package install "${p}" ${nightly_plugins} ${quiet_arg} || true # accept plugin install to fail
    done

    # remove credentials if needed
    if [ "${FORGET_CREDENTIALS}" = "true" ]; then
      rm -f /opt/rudder/etc/rudder-pkg/rudder-pkg.conf
    fi
  fi

  set_admin

  if is_version_valid "${RUDDER_VERSION}" "[5.0.14 *]"; then
    rudder server health -w
  fi
}

set_admin() {
  if is_version_valid "${RUDDER_VERSION}" "[7.1 *]"; then
    if [ "${ADMIN_PASSWORD}" != "" ]; then
      if [ "${ADMIN_USER}" != "" ]; then
        user_opt="-u ${ADMIN_USER}"
      fi
      rudder server create-user ${user_opt} -p "${ADMIN_PASSWORD}"
    fi
  elif is_version_valid "${RUDDER_VERSION}" "[6.1 *]"; then
    if [ "${ADMIN_PASSWORD}" != "" ]; then
      hash=$(htpasswd -nbBC 12 "" "${ADMIN_PASSWORD}" | tr -d ':\n')
      details="<user name=\"admin\" password=\"${hash}\" role=\"administrator\" />"
      sed -i "/^[[:space:]]*<\/authentication>/i ${details}" "/opt/rudder/etc/rudder-users.xml"
      systemctl restart rudder-jetty
      # force an inventory, because this restart often happens while inventory is being processed
      rudder agent inventory
    fi
  fi
}

upgrade_server() {
  # Upgrade via package manager only
  if [ -z "${PM}" ]
  then
    echo "Sorry your System is not *yet* supported !"
    exit 4
  fi

  # guess package name
  if is_version_valid "${RUDDER_VERSION}" "[7.2 *]"
  then
    PACKAGE="rudder-server"
  else
    PACKAGE="rudder-server-root"
  fi

  # Upgrade
  ${PM_UPGRADE} "${PACKAGE}"

  if is_version_valid "${RUDDER_VERSION}" "[6.0 *]" && [ "${PLUGINS}" != "" ]
  then
    if [ "${PLUGINS_VERSION}" = "nightly" ]; then
      nightly_plugins="--nightly"
    fi
    if is_version_valid "${RUDDER_VERSION}" "[6.1 *]"; then
      quiet_arg="--quiet"
    fi
    rudder package update ${quiet_arg}
    rudder package upgrade-all ${nightly_plugins} ${quiet_arg}
  fi

  if is_version_valid "${RUDDER_VERSION}" "[5.0.14 *]"; then
    rudder server health -w
  fi
}

upgrade_techniques() {
  cd /var/rudder/configuration-repository && cp -a /opt/rudder/share/techniques/* techniques/

  git add -u techniques
  git add techniques
  git commit -m "Technique upgrade to version ${RUDDER_VERSION}"

  curl --silent --fail --insecure "https://localhost/rudder/api/techniqueLibrary/reload"
  echo ""
}

setup_dev_mode() {
  # Permit LDAP access from outside
  [ -f /opt/rudder/etc/rudder-slapd.conf ] && sed -i "s/^IP=.*$/IP=*/" /opt/rudder/etc/rudder-slapd.conf
  [ -f /opt/rudder/etc/rudder-slapd.conf ] && sed -i "s/^#IP=.*$/IP=*/" /etc/default/rudder-slapd
  if [ -f /usr/lib/systemd/system/rudder-slapd.service ]; then
    mkdir -p /etc/systemd/system/rudder-slapd.service.d
    cat > /etc/systemd/system/rudder-slapd.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=/opt/rudder/libexec/slapd -n rudder-slapd -u rudder-slapd -f /opt/rudder/etc/openldap/slapd.conf -h "ldap://0.0.0.0:389/"
EOF
  fi
  systemctl daemon-reload
  service_cmd rudder-slapd restart

  # Permit PostgreSQL access from outside
  PG_HBA_FILE=$(su - postgres -c "psql -t -P format=unaligned -c 'show hba_file';")
  if [ $? -ne 0 ]; then
    echo "Postgresql failed to start! Halting"
    exit 1
  fi

  PG_CONF_FILE=$(su - postgres -c "psql -t -P format=unaligned -c 'show config_file';")
  if [ $? -ne 0 ]; then
    echo "Postgresql failed to start! Halting"
    exit 1
  fi

  echo "listen_addresses = '*'" >> ${PG_CONF_FILE}
  echo "host    all         all         192.168.0.0/16    trust" >> ${PG_HBA_FILE}
  echo "host    all         all         10.0.0.0/16       trust" >> ${PG_HBA_FILE}

  POSTGRESQL_SERVICE_NAME=$(systemctl list-unit-files --type service | awk -F'.' '{print $1}' | grep -E "^postgresql-?[0-9]*$" | tail -n 1)
  if [ -z "${POSTGRESQL_SERVICE_NAME}" ]; then
    POSTGRESQL_SERVICE_NAME="postgresql"
  fi
  service_cmd ${POSTGRESQL_SERVICE_NAME} restart

  # Replace passwords with easy ones
  if [ -e /opt/rudder/etc/rudder-passwords.conf ] ; then
    sed -i "s/\(RUDDER_WEBDAV_PASSWORD:\).*/\1rudder/" /opt/rudder/etc/rudder-passwords.conf
    sed -i "s/\(RUDDER_PSQL_PASSWORD:\).*/\1Normation/" /opt/rudder/etc/rudder-passwords.conf
    sed -i "s/\(RUDDER_OPENLDAP_BIND_PASSWORD:\).*/\1secret/" /opt/rudder/etc/rudder-passwords.conf
  fi

  # -E option is available from 6.1.2
  if is_version_valid "${RUDDER_VERSION}" "[6.1.2 *]"; then
    rudder agent run -E
  else
    rudder agent run
  fi

  # insert sample inventories
  $local MAJOR_VERSION=$(echo "${RUDDER_VERSION}"| cut -d '-' -f 1 | cut -f 1-2 -d .)
  cd /tmp
  git clone --depth=1 --single-branch --branch=branches/rudder/${MAJOR_VERSION} https://github.com/Normation/rudder.git
  cd rudder/webapp/sources/ldap-inventory/inventory-fusion/src/test/resources/fusion-report
  for dir in $(find .  -maxdepth 1 -type d -name '[0-9]*')
  do
    cp ${dir}/* /var/rudder/inventories/incoming/
  done
  cd
  rm -rf /tmp/rudder
}
