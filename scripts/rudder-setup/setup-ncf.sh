###############################
# Setup ncf for a local usage #
###############################
get_cfengine_url() {
  VERSION="$1"
  if [ "${PM}" = "apt" ]
  then
    ARCH=$(dpkg --print-architecture)
    echo "https://cfengine-package-repos.s3.amazonaws.com/community_binaries/cfengine-community_${VERSION}-1_${ARCH}.deb"
  elif [ "${PM}" = "yum" ] || [ "${PM}" = "zypper" ]
  then
    ARCH=$(arch)
    echo "https://cfengine-package-repos.s3.amazonaws.com/community_binaries/cfengine-community-${VERSION}-1.${ARCH}.rpm"
  fi
}

setup_ncf() {

  # setup cfengine

  # cfengine from ci
  if echo "${CFENGINE_VERSION}" | grep "rudder" >/dev/null
  then
    # cfengine from Rudder
    RUDDER_VERSION=$(echo "${CFENGINE_VERSION}" | cut -f 2 -d "-")
    add_repo
    setup_agent || true # To allow failing inventories, when we have no server
    remove_repo
    ln -s /var/rudder/cfengine-community /var/cfengine
  else
    # cfengine vanilla
    url=$(get_cfengine_url "${CFENGINE_VERSION}")
    file=$(mktemp)
    get "${file}" "${url}"
    ${PM_LOCAL_INSTALL} "${file}"
  fi

  # setup ncf

  if echo "${NCF_VERSION}" | grep "^[0-9.\\-]*$" > /dev/null
  then
    # TODO ncf package from repo
    echo "pure ncf packaging not ready yet"
  elif echo "${NCF_VERSION}" | grep "^rudder" > /dev/null
  then
    if [ "${COMMAND}" = "test-local" ]
    then
      echo "tests requires using a git repository as ncf source"
      exit 1
    fi

    # ncf package from Rudder
    RUDDER_VERSION=$(echo "${NCF_VERSION}" | cut -f 2 -d "-")
    add_repo
    ${PM_INSTALL} ncf
    remove_repo
  else
  ## ncf from git
    git_url=$(echo "${NCF_VERSION}" | cut -f 1 -d "#")
    git_branch=$(echo "${NCF_VERSION}" | cut -f 2 -d "#")
    [ -z "${git_branch}" ] && git_branch=master
    directory=$(mktemp -d)
    git clone -q -b "${git_branch}" "${git_url}" "${directory}"

    cd "${directory}"
    # avoid making doc
    touch doc/ncf.1
    # Old branches do not have an "install" target
    if grep -q "install:" Makefile; then 
      make install
    fi
  fi

  # setup ncf within cfengine
  rm -rf /var/cfengine/inputs/*
  if [ -d /usr/share/ncf/tree/ ]; then
    cp -r /usr/share/ncf/tree/* /var/cfengine/inputs/
  fi
}
