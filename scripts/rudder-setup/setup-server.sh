#######################
# Setup rudder server #
#######################
setup_server() {

  if is_version_valid "${RUDDER_VERSION}" "[1.0 3.0]"; then
    # Disable SELinux on Rudder server < 3.1
    if [ -e /etc/sysconfig/selinux ]
    then
      setenforce 0 2>/dev/null
      sed -i -e 's/^SELINUX=.*/SELINUX=disabled/' /etc/sysconfig/selinux
    fi
  fi

  # Install via package manager only
  if [ -z "${PM}" ]
  then
    echo "Sorry your System is not *yet* supported !"
    exit 4
  fi

  # TODO detect supported OS
  # echo "Sorry your System is not supported by Rudder Server !"
  # exit 5

  $local SERVER_HOSTNAME=`hostname`
  $local DEMOSAMPLE="no"
  $local LDAPRESET="yes"
  $local INITPRORESET="yes"

  # TODO detect
  [ -z "${ALLOWEDNETWORK}" ] && $local ALLOWEDNETWORK='127.0.0.1/24'

  # Debian with Sun's JRE
  if [ "${PM}" = "apt" ]
  then
    cat << EOF | debconf-set-selections
sun-java6-bin   shared/accepted-sun-dlj-v1-1    boolean true
sun-java6-jre   shared/accepted-sun-dlj-v1-1    boolean true
EOF
  fi

  # Install rudder-server-root
  ${PM_INSTALL} rudder-server-root

  # System specific behavior
  #######

  # Setup the Java TZ on SLES
  # On SLES, the Oracle JRE is often unable to get the system
  # timezone, resulting in broken reporting timings.
  if [ "${PM}" = "zypper" ]
  then
    grep -q JAVA_OPTIONS /opt/rudder/etc/rudder-jetty.conf || echo "JAVA_OPTIONS='-Duser.timezone=Europe/Paris'" >> /opt/rudder/etc/rudder-jetty.conf
  fi

  # Initialize Rudder
  echo -n "Running rudder-init.sh..."
  /opt/rudder/bin/rudder-init.sh ${SERVER_HOSTNAME} ${DEMOSAMPLE} ${LDAPRESET} ${INITPRORESET} ${ALLOWEDNETWORK} < /dev/null > /dev/null 2>&1
  echo "Done."

  service_cmd rudder-jetty restart
}

upgrade_server() {

  # Upgrade via package manager only
  if [ -z "${PM}" ]
  then
    echo "Sorry your System is not *yet* supported !"
    exit 4
  fi

  # Upgrade
  if [ "${PM}" = "apt" ]
  then
    ${PM_UPGRADE} rudder-server-root
  else
    ${PM_UPGRADE} "rudder-*" "ncf*"
  fi

  service_cmd rudder-jetty restart

}

upgrade_techniques() {

  cd /var/rudder/configuration-repository && cp -a /opt/rudder/share/techniques/* techniques/

  git add -u techniques
  git add techniques
  git commit -m "Technique upgrade to version ${RUDDER_VERSION}"

  curl -s -f -k "https://localhost/rudder/api/techniqueLibrary/reload"
  echo ""

}
