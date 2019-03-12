#!/bin/sh

set -e

# Documentation !
usage() {
  echo "Usage $0 [add-repository|setup-local|test-local] <ncf_version> <cfengine_version> [test-target]"
  echo "  Adds a repository and setup ncf on your OS" 
  echo "  Should work on as many OS as possible"
  echo "  Currently suported : Debian, Ubuntu, RHEL, Fedora, Centos, Amazon, Oracle, SLES"
  echo "  ncf_version ex: 1.0.0.201607292014, rudder-3.1, git@github.com:Normation/ncf.git#master"
  echo "  cfengine_version ex: 3.6.6 3.7.1 rudder-3.1 ci/rudder-3.2.1"
  echo "  test-target: test, test-unsafe"
  exit 1
}
# GOTO bottom for main()

# Include: lib.sh

# Include: detect-os.sh

# Include: version-test.sh

# Include: add-repo.sh

# Include: setup-ncf.sh

# Include: setup-agent.sh

# Include: test-ncf.sh

########
# MAIN #
########

setlocal || re_exec "$@"

COMMAND="$1"
NCF_VERSION="$2"
CFENGINE_VERSION="$3"

if [ -z "$3" ]
then
  TEST_TARGET="$3"
else
  TEST_TARGET="test-unsafe"
fi

[ -z "${CFENGINE_VERSION}" ] && usage

PREFIX=$(echo "${CFENGINE_VERSION}" | cut -f 1 -d "/")
if [ "${PREFIX}" = "ci" ]
then
  USE_CI=yes
  CFENGINE_VERSION=$(echo "${CFENGINE_VERSION}" | cut -f 2 -d "/")
fi

detect_os

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
SERVERSPEC=0
shift 3
while getopts "-:" opt; do
    case "$opt" in
      -)
        echo "${OPTARG}"
          case "${OPTARG}" in
              server-spec)
                  SERVERSPEC=1
                  ;;
              *)
                  echo "Unknown option --${OPTARG}" >&2
                  ;;
          esac;;
    esac
    shift
done

case "${COMMAND}" in
  "add-repository")
#    add_repo
    ;;
  "setup-local")
#    add_repo
    setup_ncf
    ;;
  "test-local")
#    add_repo
    # avoid sending a real inventory in tests
    SERVER="localhost"
    setup_ncf
    test_ncf
    ;;
  *)
    usage
    ;;
esac
