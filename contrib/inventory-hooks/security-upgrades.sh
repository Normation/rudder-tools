#!/bin/sh

set -e

export LANG=C
export DEBIAN_FRONTEND=noninteractive

result () {
  echo "{ \"security_upgrades\": $1 }"
  exit 0
}

# Source os-release
. /etc/os-release

if [ "debian" != "$ID" ]; then
  if [ "ubuntu" != "$ID" ]; then
    result -2
  fi
fi

# ensure latest package list + check status
if ! apt-get update >/dev/null 2>&1; then
  result -1
fi

# Ubuntu and Debian differ on the method
if [ "ubuntu" = "$ID" ]; then
  upgrades=$(apt-get upgrade --simulate | grep -i "$UBUNTU_CODENAME-security" | wc -l)
  result ${upgrades}
fi

if [ "debian" = "$ID" ]; then
  upgrades=$(apt-get upgrade --simulate | grep "^Inst " | grep ", Debian-Security:" | wc -l)
  result ${upgrades}
fi

#Neither Debian nor Ubuntu
result -2
