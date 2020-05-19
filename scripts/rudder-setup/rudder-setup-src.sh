#!/bin/sh

set -e

# Documentation !
usage() {
  echo "Usage $0 (add-repository|setup-agent|setup-server|upgrade-agent|upgrade-server) <rudder_version> [<policy_server>] ['<plugins>']"
  echo "  Adds a repository and setup rudder on your OS" 
  echo "  Should work on as many OS as possible"
  echo "  Currently suported : Debian, Ubuntu, RHEL, Fedora, Centos, Amazon, Oracle, SLES"
  echo ""
  echo "  rudder_version : x.y or x.y.z or x.y-nightly or ci/x.y or lts or latest"
  echo "       x.y:            the latest x.y release (ex: 3.2)"
  echo "       x.y.z:          the exact x.y.z release (ex: 3.2.1)"
  echo "       x.y.z~a:        the latest x.y.z pre-release where a can be alpha1, beta1, rc1... (ex: 4.0.0~rc1) "
  echo "       x.y-nightly:    the latest public x.y nightly build (ex: 3.2-nightly)"
  echo "       ci/x.y.z:       the latest development x.y.z release build (ex: ci/3.2.16)"
  echo "       ci/x.y.z~a:     the latest development x.y.z pre-release build (ex: ci/4.0.0~rc1)"
  echo "       ci/x.y-nightly: the latest development x.y nightly build (ex: ci/5.1-nightly)"
  echo "       latest:         the latest stable version"
  echo ""
  echo "  plugins: 'all' or a list of plugin names between ''"
  echo "  plugin_version: '', 'nightly', 'ci', 'ci/nightly' (see below)" 
  echo ""
  echo "  Environment variables"
  echo "    USE_HTTPS=true          use https in repository source (default true)"
  echo "    PLUGINS_VERSION=...     download nightly or ci version of plugins"
  echo "    DOWNLOAD_USER=...       download from private repository with this user"
  echo "    DOWNLOAD_PASSWORD=...   use this password for private repository"
  echo "    FORGET_CREDENTIALS=true remove credentials after installing plugins and licenses"
  echo "    DEV_MODE=true           permit external access to server and databases (default false)"
  exit 1
}
# GOTO bottom for main()

# Include: lib.sh

# Include: detect-os.sh

# Include: version-test.sh

# Include: add-repo.sh

# Include: setup-agent.sh

# Include: setup-server.sh

########
# MAIN #
########

preinst_check() {
  $local ROLE="$1"
  if [ "${ROLE}" = "server" ]
  then
    if ! getent hosts `hostname` > /dev/null
    then
      echo "Your hostname cannot be resolved, this is mandatory for Rudder server to work !"
      exit 1
    fi
  fi
}

setlocal || re_exec "$@"

COMMAND="$1"
RUDDER_VERSION=`rudder_real_version "$2"`
SERVER="$3"
PLUGINS="$3"

PREFIX=$(echo "${RUDDER_VERSION}" | cut -f 1 -d "/")
if [ "${PREFIX}" = "ci" ]
then
  USE_CI=yes
  RUDDER_VERSION=$(echo "${RUDDER_VERSION}" | cut -f 2- -d "/")
fi

PREFIX=$(echo "${RUDDER_VERSION}" | cut -f 1 -d "/")
if [ "${PREFIX}" = "prototype" ]
then
  PROTOTYPE=yes
  RUDDER_VERSION=$(echo "${RUDDER_VERSION}" | cut -f 2- -d "/")
fi


if [ $(whoami) != "root" ]
then
  echo "You need to be root to run rudder-setup"
  usage
  exit 1
fi

detect_os

case "${COMMAND}" in
  "add-repository")
    add_repo
    ;;
  "setup-agent")
    rudder_compatibility_check "agent-allinone"
    preinst_check "agent-allinone"
    add_repo
    setup_agent
    can_remove_repo
    ;;
  "setup-relay")
    rudder_compatibility_check "relay"
    preinst_check "relay"
    add_repo
    setup_agent
    setup_relay
    can_remove_repo
    ;;
  "setup-server")
    rudder_compatibility_check "server"
    preinst_check "server"
    add_repo
    setup_server
    can_remove_repo
    ;;
  "upgrade-agent")
    rudder_compatibility_check "agent-allinone"
    add_repo
    upgrade_agent
    can_remove_repo
    ;;
  "upgrade-relay")
    rudder_compatibility_check "relay"
    add_repo
    upgrade_agent
    upgrade_relay
    can_remove_repo
    ;;
  "upgrade-server")
    rudder_compatibility_check "server"
    add_repo
    upgrade_server
    can_remove_repo
    ;;
  "upgrade-techniques")
    upgrade_techniques
    ;;
  *)
    usage
    ;;
esac
