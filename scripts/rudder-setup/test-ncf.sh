TEST_DEPENDENCIES="curl lsb-release htop python-jinja2 git ntp acl"
SLES_DEPENDENCIES="curl lsb-release dos2unix git-core createrepo createrepo_c acl"

test_ncf() {
    cd "${directory}"

    # Install dependencies
    ${PM_UPDATE}
    if [ ${OS_NAME} = "SuSE" ] || [ ${OS_COMPATIBLE} = "SLES" ];
    then
      # assume that jinja2 is already installed (most likely by pip)
      ${PM_INSTALL} ${SLES_DEPENDENCIES}
    else
      ${PM_INSTALL} ${TEST_DEPENDENCIES}
    fi

    # Use path from Rudder package if present
    export PATH="${PATH}:/var/rudder/cfengine-community/bin/"

    # Start the test suite
    echo "Beginning tests, using CFEngine version \"`cf-agent -V`\""
    make "${TEST_TARGET}"
}
