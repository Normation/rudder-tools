############################################
# Add rudder repository to package manager #
############################################
add_repo() {
  # if the version is a file or a URL stop here
  if [ -f "${RUDDER_VERSION}" ] || echo "${RUDDER_VERSION}" | grep "^http" > /dev/null
  then
    return
  fi

  # Make Repository URL
  [ "${PM}" = "apt" ] && REPO_TYPE="apt"
  [ "${PM}" = "yum" ] && REPO_TYPE="rpm"
  [ "${PM}" = "zypper" ] && REPO_TYPE="rpm"
  [ "${PM}" = "rpm" ] && REPO_TYPE="rpm"
  if [ "${USE_HTTPS}" != "false" ]; then
    S="s"
    [ "${PM}" = "apt" ] && ${PM_INSTALL} apt-transport-https
  else
    S=""
  fi


  # On sles we need to urlencode the password or if it contains special chars it won't be able to
  # add the repo
  if [ "${PM}" = "zypper" ]; then
    DOWNLOAD_PASSWORD=$(echo "${DOWNLOAD_PASSWORD}" | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g')
  fi

  if [ "${DOWNLOAD_USER}" = "" ]; then
    USER=""
  else
    USER="${DOWNLOAD_USER}:${DOWNLOAD_PASSWORD}@"
  fi

  if [ "${USE_CI}" = "yes" ]
  then
    URL_BASE="http${S}://publisher.normation.com/${REPO_PREFIX}${REPO_TYPE}/${RUDDER_VERSION}"
  else
    if [ "${USER}" = "" ]; then
      URL_BASE="http${S}://repository.rudder.io/${REPO_PREFIX}${REPO_TYPE}/${RUDDER_VERSION}"
    else
      URL_BASE="http${S}://${USER}download.rudder.io/${REPO_PREFIX}${REPO_TYPE}/${RUDDER_VERSION}"
    fi
  fi

  if [ "${PM}" = "yum" ] || [ "${PM}" = "rpm" ] || [ "${PM}" = "zypper" ]
  then
    URL_BASE="${URL_BASE}/${OS_COMPATIBLE}_${OS_MAJOR_VERSION}"
  fi

  # add repository
  if [ "${PM}" = "apt" ]
  then
    # Debian / Ubuntu like
   get - "https://repository.rudder.io/apt/rudder_apt_key.pub" | apt-key add -
    cat > /etc/apt/sources.list.d/rudder.list << EOF
deb ${URL_BASE}/ ${OS_CODENAME} main
EOF
    apt-get update
    return 0

  elif [ "${PM}" = "yum" ]
  then
    # Add RHEL like rpm repo
    cat > /etc/yum.repos.d/rudder.repo << EOF
[Rudder]
name=Rudder ${RUDDER_VERSION} Repository
baseurl=${URL_BASE}/
gpgcheck=1
gpgkey=https://repository.rudder.io/rpm/rudder_rpm_key.pub
EOF
    # CentOS 5 only supports importing keys from files
    get "/tmp/rudder_rpm_key.pub" "https://repository.rudder.io/rpm/rudder_rpm_key.pub"
    rpm --import "/tmp/rudder_rpm_key.pub"
    rm "/tmp/rudder_rpm_key.pub"
    return 0

  elif [ "${PM}" = "zypper" ]
  then
    cat > /tmp/rudder.repo << EOF
[Rudder]
enable=1
autorefresh=0
baseurl=${URL_BASE}/
type=rpm-md
EOF
    # Add SuSE repo
    # SLES11 only supports importing keys from files
    get "/tmp/rudder_rpm_key.pub" "https://repository.rudder.io/rpm/rudder_rpm_key.pub"
    rpm --import "/tmp/rudder_rpm_key.pub"
    rm "/tmp/rudder_rpm_key.pub"
    zypper removerepo Rudder || true
    zypper --non-interactive addrepo /tmp/rudder.repo || true
    zypper --non-interactive refresh
    return 0
  elif [ "${PM}" = "rpm" ]
  then
    # No repo management, install directly
    return 0
  elif [ "${PM}" = "pkg" ]
  then
    # when we have a public repo
    echo "No public repository for Solaris"
    exit 1
  fi

  # TODO pkgng emerge pacman smartos
  echo "Sorry your Package Manager is not *yet* supported !"
  return 1
}

update_repo() {
  # nothing to update
  if [ "${RUDDER_VERSION}" = "" ]
  then
    return
  fi

  # if the version is a file or a URL stop here
  if [ -f "${RUDDER_VERSION}" ] || echo "${RUDDER_VERSION}" | grep "^http" > /dev/null
  then
    return
  fi

  if [ "${PM}" = "apt" ]
  then
    file=/etc/apt/sources.list.d/rudder.list
    REPO_TYPE="apt"
  elif [ "${PM}" = "yum" ]
  then
    file=/etc/yum.repos.d/rudder.repo
    REPO_TYPE="rpm"
  elif [ "${PM}" = "zypper" ]
  then
    file=/etc/zypp/repos.d/Rudder.repo
    REPO_TYPE="rpm"
  else
    echo "Sorry your Package Manager is not *yet* supported !"
    return 1
  fi

  # The real edit
  sed -i "s%${REPO_TYPE}/\(latest\|nightly\|[0-9.]\+\(-nightly\|~beta[0-9]\+\|~rc[0-9]\+\)\?\)/%${REPO_TYPE}/${RUDDER_VERSION}/%" "${file}"

  if [ "${PM}" = "apt" ]
  then
    apt-get update
  elif [ "${PM}" = "zypper" ]
  then
    zypper --non-interactive refresh
  fi
}

remove_repo() {
  # if the version is a file or a URL stop here
  if [ -f "${RUDDER_VERSION}" ] || echo "${RUDDER_VERSION}" | grep "^http" > /dev/null
  then
    return
  fi

  if [ "${PM}" = "apt" ]
  then
    rm -f /etc/apt/sources.list.d/rudder.list
  elif [ "${PM}" = "yum" ]
  then
    rm -f /etc/yum.repos.d/rudder.repo
  elif [ "${PM}" = "zypper" ]
  then
    zypper removerepo Rudder || true
  fi
}

can_remove_repo() {
  if [ "${FORGET_CREDENTIALS}" = "true" ]
  then
    remove_repo
  fi
}
