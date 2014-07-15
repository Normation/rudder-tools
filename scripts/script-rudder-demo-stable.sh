#!/bin/bash
#####################################################################################
# Copyright 2013 Normation SAS
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

# This script is the script used for our demo. It consists into several commands
# to install the last release of Rudder 'stable' automatically.

set -ex

#VARS
SERVER_INSTANCE_HOST="demo-stable.rudder-project.org"
DEMOSAMPLE="no"
LDAPRESET="yes"
INITPRORESET="yes"
ALLOWEDNETWORK[0]='192.168.0.0/24'

##Accept Java Licence
echo sun-java6-jre shared/accepted-sun-dlj-v1-1 select true | /usr/bin/debconf-set-selections
#Add Rudder repo key
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 474A19E8
#APT configuration
echo "deb http://ftp.fr.debian.org/debian/ squeeze main non-free" > /etc/apt/sources.list
echo "deb-src http://ftp.fr.debian.org/debian/ squeeze main non-free" >> /etc/apt/sources.list
echo "deb http://security.debian.org/ squeeze/updates main" >> /etc/apt/sources.list
echo "deb-src http://security.debian.org/ squeeze/updates main" >> /etc/apt/sources.list
echo "deb http://ftp.fr.debian.org/debian/ squeeze-updates main" >> /etc/apt/sources.list
echo "deb-src http://ftp.fr.debian.org/debian/ squeeze-updates main" >> /etc/apt/sources.list
echo "deb http://www.rudder-project.org/apt-stable/ squeeze main non-free" >> /etc/apt/sources.list
echo "deb-src http://www.rudder-project.org/apt-stable/ squeeze main non-free" >> /etc/apt/sources.list

aptitude update
#Packages minimum
aptitude install -y debian-archive-keyring
aptitude install -y rudder-inventory-ldap
aptitude install -y rudder-server-root

# Allow all connections to LDAP and PostgreSQL

if [ -e /etc/default/rudder-slapd ]; then
    sed -i "s/^IP=.*$/IP=*/" /etc/default/rudder-slapd
else
    sed -i "s/^IP=.*$/IP=*/" /etc/default/slapd
fi

echo "listen_addresses = '*'" >> /etc/postgresql/8.4/main/postgresql.conf
echo "host    all         all         192.168.90.0/24       trust" >> /etc/postgresql/8.4/main/pg_hba.conf
echo "host    all         all         10.94.94.0/24       trust" >> /etc/postgresql/8.4/main/pg_hba.conf
/etc/init.d/postgresql restart

#Install fake nodes
cp /root/inventories/* /var/rudder/inventories/incoming/

# Initialize Rudder
/opt/rudder/bin/rudder-init.sh $SERVER_INSTANCE_HOST $DEMOSAMPLE $LDAPRESET $INITPRORESET ${ALLOWEDNETWORK[0]}

# Replace cf-agent by harmless binary
ln -sf /bin/true /var/rudder/cfengine-community/bin/cf-agent
