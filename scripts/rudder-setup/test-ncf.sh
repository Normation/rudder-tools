
test_ncf() {
    cd "${directory}"
    # Use path from Rudder package if present
    export PATH="${PATH}:/var/rudder/cfengine-community/bin/"

    # Start the test suite
    echo "Beginning tests, using CFEngine version \"`cf-agent -V`\""
    make "${TEST_TARGET}"
}

install_test_dependencies() {
    set +e
    TEST_DEPENDENCIES="htop python-jinja2 ntp acl python3 python3-jinja2 augeas augeas-tools augeas"
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
      curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py || /bin/true
      python get-pip.py || /bin/true
      pip install -U six || /bin/true
      pip install -U testinfra --ignore-installed six || /bin/true
    fi
    set -e
}
