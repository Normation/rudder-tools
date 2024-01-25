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
  [ "${PM}" = "pkg" ] && REPO_TYPE="misc/solaris"
  [ "${PM}" = "slackpkg" ] && REPO_TYPE="misc/slackware"

  # old os that do not support TLS 1.2
  if [ "${OS_COMPATIBLE}" = "RHEL" -a "${OS_COMPATIBLE_VERSION}" -lt 6 ] ||
     [ "${OS_COMPATIBLE}" = "SLES" -a "${OS_COMPATIBLE_VERSION}" -lt 12 ]
  then
    USE_HTTPS="false"
  fi
  if [ "${USE_HTTPS}" != "false" ]; then
    S="s"
    if [ "${OS_COMPATIBLE}" = "UBUNTU" -a $(echo ${OS_COMPATIBLE_VERSION}|cut -d. -f1) -lt 20 ] ||
       [ "${OS_COMPATIBLE}" = "DEBIAN" -a $(echo ${OS_COMPATIBLE_VERSION}|cut -d. -f1) -lt 10 ]
    then
       ${PM_INSTALL} apt-transport-https
    fi
  else
    S=""
  fi

  # Add jdk repo on AL2
  if [ "${OS_NAME}" = "Amazon" ] && [ "${OS_VERSION}" = "2" ]; then
    amazon-linux-extras enable java-openjdk11
  fi

  # On sles we need to urlencode the password or if it contains special chars it won't be able to
  # add the repo

  if [ "${DOWNLOAD_USER}" = "" ]; then
    USER=""
  elif [ "${PM}" = "zypper" ]; then
    URLENCODED_PASSWORD=$(echo "${DOWNLOAD_PASSWORD}" | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g')
    USER="${DOWNLOAD_USER}:${URLENCODED_PASSWORD}@"
  elif [ "${OS_COMPATIBLE}" = "UBUNTU" -o "${OS_COMPATIBLE}" = "DEBIAN" ]; then
    USER=""
  else
    USER="${DOWNLOAD_USER}:${DOWNLOAD_PASSWORD}@"
  fi

  if [ "${USE_CI}" = "yes" ]
  then
    HOST="publisher.normation.com"
  else
    if [ "${DOWNLOAD_USER}" = "" ]; then
      HOST="repository.rudder.io"
    else
      HOST="${USER}download.rudder.io"
    fi
  fi
  URL_BASE="http${S}://${HOST}/${REPO_PREFIX}${REPO_TYPE}/${RUDDER_VERSION}"

  if [ "${PM}" = "yum" ] || [ "${PM}" = "rpm" ] || [ "${PM}" = "zypper" ]
  then
    URL_BASE="${URL_BASE}/${OS_COMPATIBLE}_${OS_MAJOR_VERSION}"
  elif [ "${PM}" = "pkg" ]
  then
    URL_BASE="${URL_BASE}/$(echo ${OS_COMPATIBLE} | tr '[:upper:]' '[:lower:]')-${OS_COMPATIBLE_VERSION}"
  fi

  RELEASE_GPG_KEY="http${S}://repository.rudder.io/rudder_release_key"
  # RPM may use an old gpg key on old versions
  if is_version_valid "${RUDDER_VERSION}" "[8.2 *]"
  then
    RPM_GPG_KEY="${RELEASE_GPG_KEY}.pub"
  else
    RPM_GPG_KEY="http${S}://repository.rudder.io/rpm/rudder_rpm_key.pub"
  fi

  # add repository
  if [ "${PM}" = "apt" ]
  then
    if [ "${OS_COMPATIBLE}" = "UBUNTU" -a $(echo ${OS_COMPATIBLE_VERSION}|cut -d. -f1) -le 10 ] ||
       [ "${OS_COMPATIBLE}" = "DEBIAN" -a $(echo ${OS_COMPATIBLE_VERSION}|cut -d. -f1) -le 6 ]
    then
      # old Debian / Ubuntu like
      ${PM_INSTALL} -y --force-yes gnupg
      get - "${RELEASE_GPG_KEY}.pub" | apt-key add -
    else
      # Debian / Ubuntu like
      get /etc/apt/trusted.gpg.d/rudder_release_key.gpg "${RELEASE_GPG_KEY}.gpg"
    fi

    # force the default architecture
    dpkg_arch=$(dpkg --print-architecture)

    # the source configuration
    cat > /etc/apt/sources.list.d/rudder.list << EOF
deb [arch=${dpkg_arch}] ${URL_BASE}/ ${OS_CODENAME} main
EOF

    # source password
    if [ "${DOWNLOAD_USER}" != "" ]; then
      if [ "${OS_COMPATIBLE}" = "UBUNTU" -a $(echo ${OS_COMPATIBLE_VERSION}|cut -d. -f1) -lt 20 ] ||
         [ "${OS_COMPATIBLE}" = "DEBIAN" -a $(echo ${OS_COMPATIBLE_VERSION}|cut -d. -f1) -lt 10 ]
      then
        # old distro don't have an apt/auth.conf.d
        AUTH_CONF="/etc/apt/auth.conf"
      else
        AUTH_CONF="/etc/apt/auth.conf.d/rudder.conf"
      fi

      echo "machine download.rudder.io login ${DOWNLOAD_USER} password ${DOWNLOAD_PASSWORD}" >> "${AUTH_CONF}"
      chmod 640 ${AUTH_CONF}
    fi

    ${PM_UPDATE}
    return 0

  elif [ "${PM}" = "yum" ]
  then
    # Add RHEL like rpm repo
    cat > /etc/yum.repos.d/rudder.repo << EOF
[Rudder]
name=Rudder ${RUDDER_VERSION} Repository
baseurl=${URL_BASE}/
gpgcheck=1
gpgkey=${RPM_GPG_KEY}
EOF
    # CentOS 5 only supports importing keys from files
    get "/tmp/rudder_rpm_key.pub" "${RPM_GPG_KEY}"
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
    get "/tmp/rudder_rpm_key.pub" "${RPM_GPG_KEY}"
    rpm --import "/tmp/rudder_rpm_key.pub"
    rm "/tmp/rudder_rpm_key.pub"
    zypper removerepo Rudder || true
    zypper --non-interactive addrepo /tmp/rudder.repo || true
    ${PM_UPDATE}
    return 0
  elif [ "${PM}" = "rpm" ]
  then
    # No repo management, install directly
    return 0
  elif [ "${PM}" = "pkg" ]
  then
    pkg set-publisher -g "${URL_BASE}/" normation
    return 0
  elif [ "${PM}" = "slackpkg" ]
  then
    LOCALINSTALL_URL="${URL_BASE}/slackware-${OS_COMPATIBLE_VERSION}"
    return 0
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
  elif [ "${PM}" = "pkg" ]
  then
    URL_BASE=$(LANG=C pkg publisher | grep ^normation | awk '{print $5}' | sed "s%misc/solaris/\(latest\|nightly\|[0-9.]\+\(-nightly\|~beta[0-9]\+\|~rc[0-9]\+\)\?\)/%misc/solaris/${RUDDER_VERSION}/%")
    pkg set-publisher -g "${URL_BASE}/" normation
    return
  elif [ "${PM}" = "slackpkg" ]
  then
    # slack repository are only used for Slackware distro itself
    # but we need the call to compute package URL
    add_repo
  else
    echo "Sorry your Package Manager is not *yet* supported !"
    return 1
  fi

  # The real edit
  sed -i "s%${REPO_TYPE}/\(latest\|nightly\|[0-9.]\+\(-nightly\|~beta[0-9]\+\|~rc[0-9]\+\)\?\)/%${REPO_TYPE}/${RUDDER_VERSION}/%" "${file}"

  if [ "${PM}" = "apt" ] || [ "${PM}" = "zypper" ]
  then
    ${PM_UPDATE}
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
  elif [ "${PM}" = "pkg" ]
  then
    pkg unset-publisher normation
  fi
}

can_remove_repo() {
  if [ "${FORGET_CREDENTIALS}" = "true" ]
  then
    remove_repo
  fi
}
