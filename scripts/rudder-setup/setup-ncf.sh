###############################
# Setup ncf for a local usage #
###############################
get_cfengine_url() {
  if [ "${PM}" = "apt" ]
  then
    ARCH=$(dpkg --print-architecture)
    if is_version_valid "$1" "3.7"; then echo "https://cfengine-package-repos.s3.amazonaws.com/community_binaries/cfengine-community_3.7.1-1_${ARCH}.deb"; fi
    if is_version_valid "$1" "3.6"; then echo "https://cfengine-package-repos.s3.amazonaws.com/community_binaries/cfengine-community_3.6.6-1_${ARCH}.deb"; fi
  elif [ "${PM}" = "yum" ] || [ "${PM}" = "zypper" ]
  then
    ARCH=$(arch)
    if is_version_valid "$1" "3.7"; then echo "https://cfengine-package-repos.s3.amazonaws.com/community_binaries/cfengine-community-3.7.1-1.${ARCH}.rpm"; fi
    if is_version_valid "$1" "3.6"; then echo "https://cfengine-package-repos.s3.amazonaws.com/community_binaries/cfengine-community-3.6.6-1.${ARCH}.rpm"; fi
  fi
}

setup_ncf() {

  # setup cfengine

  # cfengine from ci
  echo "${CFENGINE_VERSION}" | grep "^ci" >/dev/null && USE_CI=yes
  if echo "${CFENGINE_VERSION}" | grep "rudder" >/dev/null
  then
    # cfengine from Rudder
    RUDDER_VERSION=$(echo "${CFENGINE_VERSION}" | cut -f 2 -d "-")
    add_repo
    setup_agent
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
    make install
  fi

  # setup ncf within cfengine
  rm -rf /var/cfengine/inputs/*
  cp -r /usr/share/ncf/tree/* /var/cfengine/inputs/
}
