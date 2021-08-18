release_file() {
  $local rf_distro="$1"
  $local rf_release_file="$2"
  $local rf_regex="$3"
  if [ ! -f "${rf_release_file}" ]; then return 1; fi
  OS_NAME="${rf_distro}"
  OS_VERSION=`sed -n "/${rf_regex}/s/${rf_regex}/\\1/p" ${rf_release_file}`
}

os_release_file() {
  $local os_release="$1"
  if [ ! -f "${os_release}" ]; then return 1; fi
  OS_NAME=`grep "^NAME=" ${os_release} | sed s/NAME=//g | sed s/\"//g | cut -d' ' -f1`
  OS_VERSION=`grep "^VERSION=" ${os_release} | sed s/VERSION=//g | sed s/\"//g | cut -d' ' -f1`
}

# output example
#
#OS_NAME=Centos
#OS_COMPATIBLE=RHEL
#OS_VERSION=7.2014_sp3
#OS_COMPATIBLE_VERSION=7.0
#OS_MAJOR_VERSION=7
#
#PM=apt
#PM_INSTALL="DEBIAN_FRONTEND=noninteractive apt-get -y install"

detect_os() {
  # defaults values
  OS_NAME="unknown"
  OS_COMPATIBLE=""
  OS_VERSION=""
  OS_COMPATIBLE_VERSION=""
  PM=""
  PM_INSTALL="echo Your package manager is not yet supported"
  PM_UPGRADE="echo Your package manager is not yet supported"
  PM_LOCAL_INSTALL="echo Your package manager is not yet supported for local install"

  # detect package manager
  ########################
  # TODO macports, homebrew, portage
  if exists apt-get
  then
    PM="apt"
    export DEBIAN_FRONTEND=noninteractive
    PM_INSTALL="apt-get -y install"
    PM_UPDATE="apt-get -y update --allow-releaseinfo-change"
    PM_UPGRADE="apt-get -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold -y install"
    PM_LOCAL_INSTALL="dpkg -i"
  elif exists yum
  then
    PM="yum"
    PM_INSTALL="yum -y install"
    PM_UPDATE="yum -y makecache"
    PM_UPGRADE="yum -y update"
    PM_LOCAL_INSTALL="rpm -i"
  elif exists zypper
  then
    PM="zypper"
    PM_INSTALL="zypper --non-interactive install"
    PM_UPDATE="zypper --non-interactive refresh"
    PM_UPGRADE="zypper --non-interactive update"
    PM_LOCAL_INSTALL="rpm -i"
  elif exists pkgadd
  then # solaris
    PM="pkg"
    PM_INSTALL="pkg install --accept"
    PM_UPDATE="true"
    PM_UPGRADE="pkg update --accept"
    PM_LOCAL_INSTALL="yes | pkgadd -d"
  fi

  # install lsb_release if required
  #################################

  if [ -e /etc/debian_version ]; then
    if ! dpkg -l lsb-release > /dev/null 2>/dev/null
    then
      echo "lsb-release is needed to detect debian derivative, installing it."
      ${PM_INSTALL} lsb-release
    fi
  fi

  # detect os and version
  #######################

  if [ "$(uname -s)" = "AIX" ]; then
    OS_NAME="AIX"
    # Format: Major.Minor (Ex: 5.3)
    OS_VERSION="$(uname -v).$(uname -r)"
    PM="rpm"
    PM_INSTALL="rpm -i"
    PM_UPGRADE="rpm -u"
  elif [ "$(uname -s)" = "SunOS" ] ; then
    . /etc/os-release
    OS_NAME="${ID}"
    OS_VERSION="${VERSION}"

  # try with lsb_release
  elif exists lsb_release; then
    OS_NAME=`lsb_release -is`
    OS_VERSION=`lsb_release -rs`
    OS_CODENAME=`lsb_release -cs`

  # manual detection adapted from FusionInventory lib/FusionInventory/Agent/Task/Inventory/Linux/Distro/NonLSB.pm
  elif release_file  'VMWare' '/etc/vmware-release' '.*\([0-9.]\+\).*'; then true
  elif release_file  'ArchLinux' '/etc/arch-release' '\(.*\)'; then true
  elif release_file  'Debian' '/etc/debian_version' '\(.*\)'; then
    if [  "${OS_VERSION}" = "jessie/sid" ]; then OS_VERSION=7; fi
  elif release_file  'Fedora' '/etc/fedora-release' '.*release \([0-9.]\+\)'; then true
  elif release_file  'Gentoo' '/etc/gentoo-release' '\(.*\)'; then true
  elif release_file  'Knoppix' '/etc/knoppix_version' '\(.*\)'; then true
  elif release_file  'Mandriva' '/etc/mandriva-release' '.*release \([0-9.]\+\).*'; then true
  elif release_file  'Mandrake' '/etc/mandrake-release' '.*release \([0-9.]\+\).*'; then true
  elif release_file  'Oracle' '/etc/oracle-release' '.*release \([0-9.]\+\).*'; then true
  elif release_file  'CentOS' '/etc/centos-release' '.*release \([0-9.]\+\).*'; then true
  elif release_file  'RedHat' '/etc/redhat-release' '.*release \([0-9.]\+\).*'; then true
  elif release_file  'Slackware' '/etc/slackware-version' '.*Slackware \(.*\).*'; then true
  elif release_file  'Trustix' '/etc/trustix-release' '.*release \([0-9.]\+\).*'; then true
  elif release_file  'SuSE' '/etc/SuSE-release' 'VERSION *= *\([0-9.]\+\).*'; then
    OS_VERSION="${OS_VERSION}-`sed -n '/PATCHLEVEL/s/PATCHLEVEL *= *\([0-9.]\+\).*/\1/p' /etc/SuSE-release`"
  elif release_file  'Amazon' '/etc/system-release-cpe' '[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:\([^:]*\):.*'; then true
  elif os_release_file '/etc/os-release'; then true
  fi

  # Detect compatibility
  ######################
  OS_COMPATIBLE=`echo "${OS_NAME}" | tr '[a-z]' '[A-Z]'`
  OS_COMPATIBLE_VERSION="${OS_VERSION}"
  case "${OS_NAME}" in
    AIX)    OS_COMPATIBLE_VERSION=5;;
    RedHat) OS_COMPATIBLE="RHEL" ;;
    RedHatEnterprise*) OS_COMPATIBLE="RHEL" ;;
    Oracle) OS_COMPATIBLE="RHEL" ;;
    CentOS) OS_COMPATIBLE="RHEL" ;;
    Amazon) OS_COMPATIBLE="RHEL"
            OS_COMPATIBLE_VERSION=6;;
    SuSE)   OS_COMPATIBLE="SLES" ;;
    SUSE)   OS_COMPATIBLE="SLES" ;;
    "SLES") OS_COMPATIBLE="SLES" ;;
    "SUSE LINUX")   OS_COMPATIBLE="SLES" ;;
  esac
  OS_MAJOR_VERSION=`echo "${OS_COMPATIBLE_VERSION}" | sed 's/[^0-9].*//'`

  # Package manager fixup
  #######################
  # Debian 6 gpg key has expired will not be updated anymore
  if [ "${OS_CODENAME}" = "squeeze" ]
  then
    PM_INSTALL="${PM_INSTALL} --allow-unauthenticated"
    PM_UPGRADE="${PM_UPGRADE} --allow-unauthenticated"
  fi

  export OS_NAME OS_COMPATIBLE OS_VERSION OS_COMPATIBLE_VERSION OS_MAJOR_VERSION PM PM_INSTALL
}

