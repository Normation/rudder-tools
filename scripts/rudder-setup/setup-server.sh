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

  # Install rudder-server-root
  ${PM_INSTALL} rudder-server-root

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

  if is_version_valid "${RUDDER_VERSION}" "[5.0.14 *]"; then
    rudder server health -w
  fi
}

upgrade_server() {
  # Upgrade via package manager only
  if [ -z "${PM}" ]
  then
    echo "Sorry your System is not *yet* supported !"
    exit 4
  fi

  # Upgrade
  ${PM_UPGRADE} rudder-server-root
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
  
  rudder agent run

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
