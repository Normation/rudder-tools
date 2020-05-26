######################
# Setup rudder agent #
######################
setup_agent() {
  [ -z "${SERVER}" ] && SERVER="rudder"

  # Install via package manager only
  if [ -z "${PM}" ]
  then
    echo "Sorry your System is not *yet* supported !"
    exit 4
  fi

  if [ -n "${SERVER}" ]
  then
    mkdir -p /var/rudder/cfengine-community/
    echo "${SERVER}" > /var/rudder/cfengine-community/policy_server.dat
  fi

  # The version given is a file or a URL
  if [ -f "${RUDDER_VERSION}" ] || echo "${RUDDER_VERSION}" | grep "^http" > /dev/null || echo "${RUDDER_VERSION}" | grep "^ftp" > /dev/null
  then
    # localinstall
    if [ "${PM}" = "pkg" ] && LANG=C file "${RUDDER_VERSION}" | grep "gzip compressed data" > /dev/null
    then
      cd /tmp
      gzip -d -c "${RUDDER_VERSION}" | tar xf -
      ${PM_LOCAL_INSTALL} /tmp RudderAgent
    elif [ "${PM}" = "pkg" ]
    then
      ${PM_LOCAL_INSTALL} "${RUDDER_VERSION}" RudderAgent
    else
      ${PM_LOCAL_INSTALL} "${RUDDER_VERSION}"
    fi
  # remote install without repository manager
  elif [ "${PM}" = "rpm" ] && [ "${OS_COMPATIBLE}" = "AIX" ]
  then
    $local fields="`echo "${RUDDER_VERSION}" | tr . ' ' | wc -w`"
    if [ "${fields}" -eq 2 ]
    then
      if echo "${RUDDER_VERSION}" | grep nightly > /dev/null
      then
        file=`get - "${URL_BASE}/ppc/" | sed -n '/href="rudder-agent/s/.*href="\(.*\)">rudder.*/\1/p' | tail -n 1`
      else
        RUDDER_VERSION=`get - "https://www.rudder-project.org/release-info/rudder/versions/${RUDDER_VERSION}/next"`
        file="rudder-agent-${RUDDER_VERSION}.release-1.AIX.5.3.aix5.3.ppc.rpm"
      fi
    fi
    ${PM_INSTALL} "${URL_BASE}/ppc/${file}"
  else
    # Install
    ${PM_INSTALL} rudder-agent
  fi

  # System specific behavior
  #######

  # TODO rhel5 only
  #${PM_INSTALL} pcre openssl db4-devel

  rudder agent inventory

  # No start needed anymore in 6.0
  if is_version_valid "${RUDDER_VERSION}" "[* 5.0]"
  then
    if is_version_valid "${RUDDER_VERSION}" "[4.1 *]"
    then
      rudder agent start
    else
      service_cmd rudder-agent start
    fi
  fi

  if is_version_valid "${RUDDER_VERSION}" "[4.0 *]"; then
    rudder agent health
  fi
}

upgrade_agent() {
  # Upgrade via package manager only
  if [ -z "${PM}" ]
  then
    echo "Sorry your System is not *yet* supported !"
    exit 4
  fi
  ${PM_UPGRADE} rudder-agent
}

setup_relay() {
  # Install via package manager only
  if [ -z "${PM}" ]
  then
    echo "Sorry your System is not *yet* supported !"
    exit 4
  fi
  ${PM_INSTALL} rudder-server-relay
}

upgrade_relay() {
  # Upgrade via package manager only
  if [ -z "${PM}" ]
  then
    echo "Sorry your System is not *yet* supported !"
    exit 4
  fi
  ${PM_UPGRADE} rudder-server-relay
}
