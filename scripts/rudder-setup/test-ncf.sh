
test_ncf() {
    cd "${directory}"
    # Use path from Rudder package if present
    export PATH="${PATH}:/var/rudder/cfengine-community/bin/"

    # Start the test suite
    echo "Beginning tests, using CFEngine version \"`cf-agent -V`\""
    set +e
    make "${TEST_TARGET}"
    TEST_RESULT=$?
    set -e
    find . -type f -name '*test*.log' -exec cat {} + >> /tmp/ncf_tests.log
    exit $TEST_RESULT
}

install_test_dependencies() {
    set +e
    TEST_DEPENDENCIES="htop python-jinja2 ntp acl python3 python3-jinja2 augeas augeas-tools augeas python3-pytest"
    SLES_DEPENDENCIES="dos2unix createrepo createrepo_c acl"
    # Install dependencies
    ${PM_UPDATE}
    if [ "${OS_NAME}" = "CentOS" ];
    then
      ${PM_INSTALL} curl libcurl nss
      ${PM_UPGRADE} curl libcurl nss
    fi

    ${PM_INSTALL} git || ${PM_INSTALL} git-core
    ${PM_INSTALL} make curl lsb-release

    # Install dependencies
    ${PM_UPDATE}
    if [ "${OS_NAME}" = "SuSE" ] || [ "${OS_COMPATIBLE}" = "SLES" ];
    then
      TEST_DEPENDENCIES="${SLES_DEPENDENCIES} ${TEST_DEPENDENCIES}"
    fi

    for package in ${TEST_DEPENDENCIES}; do
      ${PM_INSTALL} ${package} || echo "Could not install ${package}"
    done

    if [ $TESTINFRA -eq 1 ];
    then
      # install pip
      ${PM_INSTALL} python
      ${PM_INSTALL} python3-pip || true
      if command -v pip3 >/dev/null 2>&1
      then
        PIP="pip3"
      else
        PIP=pip
        curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
        python get-pip.py
      fi
      # needed on SLES12
      $PIP install -U jinja2
      $PIP install -U six
      $PIP install -U testinfra --ignore-installed six
    fi
    set -e
}
