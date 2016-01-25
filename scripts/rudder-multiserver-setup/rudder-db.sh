#!/bin/bash

if [ -z "$2" ]
then
  echo "Usage $0 <RUDDER_WEB_SERVER> <ALLOWED_NETWORK>"
  exit 1
fi

RUDDER_WEB="$1"
NETWORK="$2"

# add repository
./add_repo 2.11-nightly

. detect_os.sh

# This is copied from http://www.rudder-project.org/rudder-doc-2.11/rudder-doc.html#relay-servers
if [ "${OS}" = "RHEL" ] ; then
        ${PM_COMMAND} rudder-agent rudder-reports postgresql-client
  PG_CONF=/var/lib/pgsql/data
elif [ "${OS}" = "UBUNTU" -o "${OS}" = "DEBIAN" ] ; then
        ${PM_COMMAND} rudder-agent rudder-reports postgresql-client
        echo "Now fix the bug on /var/lib/dpkg/info/rudder-agent.postinst"
        echo "Then run aptitude install"
        bash -i
  PG_CONF=/etc/postgresql/*/main
elif [ "${OS}" = "SLES" ] ; then
        ${PM_COMMAND} rudder-agent rudder-reports postgresql-client
  PG_CONF=/var/lib/pgsql/data
fi

# Allow all internal connections to PostgreSQL
echo "listen_addresses = '*'" >> ${PG_CONF}/postgresql.conf
echo "host    all         all         ${NETWORK}       trust" >> ${PG_CONF}/pg_hba.conf
service postgresql restart 

# Disable rsyslog remote listening
rm -f /etc/rsyslog.d/rudder.conf
# rsyslog-pgsql bug on ubuntu
rm -f /etc/rsyslog.d/pgsql.conf
service rsyslog restart

# Set the policy server to be server 4 (rudder-webapp)
echo "${RUDDER_WEB}" > /var/rudder/cfengine-community/policy_server.dat
service rudder-agent restart

# If you're using a firewall, allow the following incoming connections to this server:
# - TCP port 5432: Server 4 (rudder-webapp)
# - TCP port 5432: Server 1 (rudder-front)


