#!/bin/sh

set -e

# Documentation !
usage() {
  echo "Usage $0 [add-repository|setup-agent|setup-server|upgrade-agent|upgrade-server] <rudder_version>"
  echo "  Adds a repository and setup rudder on your OS" 
  echo "  Should work on as many OS as possible"
  echo "  Currently suported : Debian, Ubuntu, RHEL, Fedora, Centos, Amazon, Oracle, SLES"
  echo ""
  echo "  rudder_version : x.y or x.y.z or x.y-nightly or ci/x.y"
  echo "       x.y:   the last x.y release (ex: 3.2)"
  echo "       x.y.z: the exact x.y.z release (ex: 3.2.1)"
  echo "       x.y-nightly: the last public x.y nightly build (ex: 3.2-nightly)"
  echo "       ci/x.y: the last private x.y nightly build (ex: ci/3.2)"
  exit 1
}
# GOTO bottom for main()

# Include: lib.sh

# Include: detect-os.sh

# Include: version-test.sh

# Include: add-repo.sh

# Include: setup-agent.sh

# Include: setup-server.sh

# Include: setup-plugins.sh

########
# MAIN #
########

setlocal || re_exec "$@"

COMMAND="$1"
RUDDER_VERSION="$2"
SERVER="$3"

PREFIX=$(echo "${RUDDER_VERSION}" | cut -f 1 -d "/")
if [ "${PREFIX}" = "ci" ]
then
  USE_CI=yes
  RUDDER_VERSION=$(echo "${RUDDER_VERSION}" | cut -f 2 -d "/")
fi


detect_os

case "${COMMAND}" in
  "add-repository")
    add_repo
    ;;
  "setup-agent")
    rudder_compatibility_check "agent-allinone"
    add_repo
    setup_agent
    ;;
  "setup-relay")
    rudder_compatibility_check "relay"
    add_repo
    setup_agent
    setup_relay
    ;;
  "setup-server")
    rudder_compatibility_check "server"
    add_repo
    setup_server
    ;;
  "upgrade-agent")
    rudder_compatibility_check "agent-allinone"
    add_repo
    upgrade_agent
    ;;
  "upgrade-relay")
    rudder_compatibility_check "relay"
    add_repo
    upgrade_agent
    upgrade_relay
    ;;
  "upgrade-server")
    rudder_compatibility_check "server"
    add_repo
    upgrade_server
    ;;
  "upgrade-techniques")
    upgrade_techniques
    ;;
  "windows-plugin")
    install_windows_plugin "$2"
    ;;
  "reporting-plugin")
    install_advanced_reporting "$2"
    ;;
  *)
    usage
    ;;
esac
