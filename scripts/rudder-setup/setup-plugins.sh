#######################
# Setup rudder server #
#######################
install_windows_plugin() {
  # check parameter
  FILE="$1"
  cd /tmp
  if [ ! -f "${FILE}" ]
  then
    echo "Package file '${FILE}' for windows plugin doesn't exist"
    exit 5
  fi

  unzip "${FILE}"
  cd server
  if type rudder >/dev/null 2>&1
  then
    rudder agent inventory
  else
    /var/rudder/cfengine-community/bin/cf-agent -KC -D force_inventory
  fi
  ./rudder_plugin_windows.sh
  exit $?
}

install_advanced_reporting() {
  echo "Installing advanced reporting plugin is not supported yet!"
  exit 5
}

