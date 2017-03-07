TEST_DEPENDENCIES="curl lsb-release htop python-jinja2"

test_ncf() {
    cd "${directory}"

    # Install dependencies
    ${PM_INSTALL} ${TEST_DEPENDENCIES}

    # Use path from Rudder package if present
    export PATH="${PATH}:/var/rudder/cfengine-community/bin/"

    # Start the test suite
    echo "Beginning tests, using CFEngine version \"`cf-agent -V`\""
    make "${TEST_TARGET}"
}
