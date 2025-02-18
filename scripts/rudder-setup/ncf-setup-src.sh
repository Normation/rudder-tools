#!/bin/sh

set -e

# Documentation !
usage() {
  echo "Usage $0 [add-repository|setup-local|test-local] <ncf_version> <cfengine_version> [test-target] [--testinfra]"
  echo "  $0 test-pr <ncf_version> <cfengine_version> <pull_request_id> [test-target] [--testinfra]"

  echo "  Adds a repository and setup ncf on your OS"
  echo "  Should work on as many OS as possible"
  echo "  Currently supported : Debian, Ubuntu, RHEL, Fedora, Centos, Amazon, Oracle, SLES"
  echo "  ncf_version ex: 1.0.0.201607292014, rudder-3.1, git@github.com:Normation/ncf.git#master"
  echo "  cfengine_version ex: 3.6.6 3.7.1 rudder-3.1 ci/rudder-3.2.1"
  echo "  test-target: test, test-unsafe"
  echo "  --testinfra: install ruby and run the ncf tests based on testinfra"
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

# Parsing the options before anything, and removing them from $@
TESTINFRA=0
for opt in "$@"
do
    # Remove first arg of $@
    shift
    case "$opt" in
      --testinfra)
        TESTINFRA=1
        ;;
      *)
        # This push $opt at the end of $@
        set -- "$@" "$opt"
        ;;
    esac
done

COMMAND="$1"
NCF_VERSION="$2"
CFENGINE_VERSION="$3"

[ -z "${CFENGINE_VERSION}" ] && usage

if [ "$COMMAND" = "test-pr" ]
then
  PULL_REQUEST="$4"
  shift
fi

if [ -z "$4" ]
then
  TEST_TARGET="test-unsafe"
else
  TEST_TARGET="$4"
fi

PREFIX=$(echo "${CFENGINE_VERSION}" | cut -f 1 -d "/")
if [ "${PREFIX}" = "ci" ]
then
  USE_CI=yes
  CFENGINE_VERSION=$(echo "${CFENGINE_VERSION}" | cut -f 2 -d "/")
fi

detect_os


case "${COMMAND}" in
  "add-repository")
#    add_repo
    ;;
  "setup-local")
#    add_repo
    setup_ncf
    ;;
  "test-local")
    SERVER="localhost"
    setup_ncf
    test_ncf
    ;;
  "test-pr")
    SERVER="localhost"
    setup_ncf
    checkout_pr
    test_ncf
    ;;
  *)
    usage
    ;;
esac
