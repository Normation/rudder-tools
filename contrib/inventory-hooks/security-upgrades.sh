#!/bin/sh

set -e

export LANG=C
export DEBIAN_FRONTEND=noninteractive

result () {
  echo "{ \"security_upgrades\": $1 }"
  exit 0
}

if [ ! -f /etc/debian_version ]; then
  result -2
fi

# ensure latest package list + check status
if ! apt-get update >/dev/null 2>&1; then
  result -1
fi

upgrades=$(apt-get upgrade --simulate | grep "^Inst " | grep ", Debian-Security:" | wc -l)
result ${upgrades}
