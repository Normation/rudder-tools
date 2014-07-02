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

# Install Rudder server components
DEBIAN_FRONTEND=noninteractive LC_ALL=C aptitude install -y rudder-agent rudder-reports >> /tmp/log 2>&1

# Allow all internal connections to PostgreSQL
echo "listen_addresses = '*'" >> /etc/postgresql/*/main/postgresql.conf
echo "host    all         all         10.0.0.0/8       trust" >> /etc/postgresql/*/main/pg_hba.conf
/etc/init.d/postgresql restart >> /tmp/log 2>&1

# Disable rsyslog remote listening
rm /etc/rsyslog.d/rudder.conf
service rsyslog restart
