#!/bin/sh

set -e

# Documentation !
usage() {
  echo "Usage $0 [add-repository|setup-agent|setup-server|upgrade-agent|upgrade-server] <rudder_version>"
  echo "  Adds a repository and setup rudder on your OS" 
  echo "  Should work on as many OS as possible"
  echo "  Currently suported : Debian, Ubuntu, RHEL, Fedora, Centos, Amazon, Oracle, SLES"
  exit 1
}
# GOTO bottom for main()

# Include: lib.sh

MATRIX=`cat <<'EOF'
# Include: matrix
EOF
`

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
    add_repo
    setup_agent
    ;;
  "setup-relay")
    add_repo
    setup_agent
    setup_relay
    ;;
  "setup-server")
    add_repo
    setup_server
    ;;
  "upgrade-agent")
    add_repo
    upgrade_agent
    ;;
  "upgrade-relay")
    add_repo
    upgrade_agent
    upgrade_relay
    ;;
  "upgrade-server")
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
