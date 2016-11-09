#!/bin/bash

#####################################################################################
# Copyright 2013-2014 Normation SAS
#####################################################################################
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, Version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#####################################################################################

#
# This script starts a demo on the current machine running Rudder's latest version.
#

set -ex

# Avoid any environment pollution that may cause package installation to fail
export LANG=C LC_ALL=C

# Configuration

## INSTALLATION PARAMETERS
GPG_KEYSERVER='keyserver.ubuntu.com'
RUDDER_GPG_KEY='474A19E8'

## VERSIONS
DEBIAN_VERSION='wheezy'
POSTGRESQL_VERSION='9.1'

## RUDDER-INIT SETTINGS
LDAPRESET='yes'
ALLOWEDNETWORK[0]='192.168.0.0/24'

# Installation

## 1 - Base apt configuration
echo "deb http://ftp.fr.debian.org/debian/ ${DEBIAN_VERSION} main" > /etc/apt/sources.list

## 2 - Import Debian GPG keyrings
aptitude update
aptitude install -y debian-keyring debian-archive-keyring

## 3 - Add other apt repos
echo "deb http://security.debian.org/ ${DEBIAN_VERSION}/updates main" >> /etc/apt/sources.list
echo "deb http://ftp.fr.debian.org/debian/ ${DEBIAN_VERSION}-updates main" >> /etc/apt/sources.list

## 4 - Import Rudder GPG key
apt-key adv --recv-keys --keyserver ${GPG_KEYSERVER} ${RUDDER_GPG_KEY}

## 5 - Add Rudder repository
echo "deb http://www.rudder-project.org/apt-latest/ ${DEBIAN_VERSION} main" > /etc/apt/sources.list.d/rudder.list

## 6 - Install Rudder server
aptitude update
aptitude install -y rudder-server-root

## 7 - Allow all connections to LDAP and PostgreSQL
sed -i "s/^IP=.*$/IP=*/" /etc/default/rudder-slapd

echo "listen_addresses = '*'" >> /etc/postgresql/${POSTGRESQL_VERSION}/main/postgresql.conf
echo "host    all         all         192.168.90.0/24       trust" >> /etc/postgresql/${POSTGRESQL_VERSION}/main/pg_hba.conf
echo "host    all         all         10.94.94.0/24       trust" >> /etc/postgresql/${POSTGRESQL_VERSION}/main/pg_hba.conf

service postgresql restart

## 8 - Initialize Rudder
/opt/rudder/bin/rudder-init ${LDAPRESET} ${ALLOWEDNETWORK[0]}

### Check that Rudder it is running OK, giving it some time to settle
TIMEOUT=0
while [ "${STATUS}" != "OK" ]
do
  ### Give Rudder 5s * 24 (120s/2m) to return OK before giving up
  if [ ${TIMEOUT} -eq 24 ]; then echo "[WARNING] Rudder failed to respond correctly after 2m and might be broken."; break; fi
  TIMEOUT=$((TIMEOUT + 1))
  STATUS=$(curl -s -k https://localhost/rudder/api/status)
  sleep 5
done

## 9 - Insert demo machines inventories (to showcase some OSes)
git clone --depth=1 https://github.com/Normation/ldap-inventory.git
cp ldap-inventory/inventory-fusion/src/test/resources/fusion-report/* /var/rudder/inventories/incoming/

### Trigger an agent run to insert the inventories
rudder agent run >/dev/null 2>&1

## 10 - The end
echo "Demo installation complete."
