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
  if [ "${USE_HTTPS}" = "true" ]; then
    S="s"
  else
    S=""
  fi
  if [ "${DOWNLOAD_USER}" = "" ]; then
    USER=""
  else
    USER="${DOWNLOAD_USER}:${DOWNLOAD_PASSWORD}@"
  fi

  if [ "${USE_CI}" = "yes" ]
  then
    if [ -z "$(echo "${RUDDER_VERSION}" | sed -e '/\..*\./d')" ]; then
      $local URL_BASE="http${S}://publisher.normation.com/${REPO_PREFIX}${REPO_TYPE}/${RUDDER_VERSION}-nightly"
    else
      $local URL_BASE="http${S}://publisher.normation.com/${REPO_PREFIX}${REPO_TYPE}/${RUDDER_VERSION}"
    fi
  else
    if [ "${USER}" = "" ]; then
      $local URL_BASE="http${S}://repository.rudder.io/${REPO_PREFIX}${REPO_TYPE}/${RUDDER_VERSION}"
    else
      $local URL_BASE="http${S}://${USER}downloads.rudder.io/${REPO_PREFIX}${REPO_TYPE}/${RUDDER_VERSION}"
    fi
  fi

  if [ "${PM}" = "yum" ]
  then
    URL_BASE="${URL_BASE}/${OS_COMPATIBLE}_${OS_MAJOR_VERSION}"
  elif [ "${PM}" = "zypper" ]
  then
    URL_BASE="${URL_BASE}/${OS_COMPATIBLE}_${OS_MAJOR_VERSION}"
  fi

  # add repository
  if [ "${PM}" = "apt" ]
  then
    # Debian / Ubuntu like
   get - "https://repository.rudder.io/apt/rudder_apt_key.pub" | apt-key add -
    cat > /etc/apt/sources.list.d/rudder-apt.list << EOF
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
    # Add SuSE repo
    # SLES11 only supports importing keys from files
    get "/tmp/rudder_rpm_key.pub" "https://repository.rudder.io/rpm/rudder_rpm_key.pub"
    rpm --import "/tmp/rudder_rpm_key.pub"
    rm "/tmp/rudder_rpm_key.pub"
    zypper removerepo Rudder || true
    zypper --non-interactive addrepo -n "Rudder repository" "${URL_BASE}/" Rudder || true
    zypper --non-interactive refresh
    return 0
  elif [ "${PM}" = "pkg" ]
  then
    # when we have a public repo
    echo "No public repository for Solaris"
    exit 1
  fi

  # TODO pkgng emerge pacman smartos
  # There is help in Fusion Inventory lib/FusionInventory/Agent/Task/Inventory/Linux/Distro/NonLSB.pm
  echo "Sorry your Package Manager is not *yet* supported !"
  return 1
}

remove_repo() {
  if [ "${PM}" = "apt" ]
  then
    rm -f /etc/apt/sources.list.d/rudder-apt.list
  elif [ "${PM}" = "yum" ]
  then
    rm -f /etc/yum.repos.d/rudder.repo
  elif [ "${PM}" = "zypper" ]
  then
    zypper removerepo Rudder || true
  fi
}
