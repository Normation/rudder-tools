#!/bin/bash

#####################################################################################
# Copyright 2014 Normation SAS
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

set -e

# Avoid any environment pollution that may cause package installation to fail
export LANG=C LC_ALL=C

# VARS
SERVER_INSTANCE_HOST=`curl http://169.254.169.254/latest/meta-data/public-hostname`
DEMOSAMPLE="no"
LDAPRESET="yes"
INITPRORESET="yes"
ALLOWEDNETWORK[0]='127.0.0.1/8'

# Import GPG key
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 474A19E8 >> /tmp/log

# Add Rudder repository and update local package database
echo "deb http://www.rudder-project.org/apt-2.10-nightly/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/rudder.list
aptitude update >> /tmp/log

# Install Rudder server components
aptitude install -y rudder-server-root >> /tmp/log

# Allow all connections to LDAP and PostgreSQL

if [ -e /etc/default/rudder-slapd ]; then
    sed -i "s/^IP=.*$/IP=*/" /etc/default/rudder-slapd
    /etc/init.d/rudder-slapd restart >> /tmp/log
else
    sed -i "s/^IP=.*$/IP=*/" /etc/default/slapd
    /etc/init.d/slapd restart >> /tmp/log
fi

echo "listen_addresses = '*'" >> /etc/postgresql/*/main/postgresql.conf
echo "host    all         all         192.168.90.0/24       trust" >> /etc/postgresql/*/main/pg_hba.conf
echo "host    all         all         10.94.94.0/24       trust" >> /etc/postgresql/*/main/pg_hba.conf
/etc/init.d/postgresql restart >> /tmp/log

# Initialize Rudder
/opt/rudder/bin/rudder-init.sh $SERVER_INSTANCE_HOST $DEMOSAMPLE $LDAPRESET $INITPRORESET ${ALLOWEDNETWORK[0]} >> /tmp/log

# Install some basic stats tools and Tsung and Perl-lib for UUID generation
aptitude install -y htop iotop tsung libdata-uuid-perl

# Get a sample inventory file and scripts to generate random hostnames/MACs
cd /tmp
wget https://github.com/Normation/rudder-tools/raw/master/contrib/stress_suite/genhosts.pl
wget https://github.com/Normation/rudder-tools/raw/master/contrib/stress_suite/inv.ocs
wget https://github.com/Normation/rudder-tools/raw/master/contrib/stress_suite/tsung.xml

# Generate hosts data
perl /tmp/genhosts.pl > /tmp/hosts

# Run tsung to load nodes into Rudder
export HOME=/home/ubuntu
tsung -f /tmp/tsung.xml start >> /tmp/log
