#!/bin/bash

if [ -z "$4" ]
then
  echo "Usage $0 <RUDDER_SERVER_NAME> <RUDDER_LDAP_NAME> <RUDDER_DB> <RUDDER_RELAY>"
  exit 1
fi
RUDDER_WEB="$1"
RUDDER_LDAP="$2"
RUDDER_DB="$3"
RUDDER_RELAY="$4"

# add repository
./add_repo 2.11-nightly

. detect_os.sh

# Inform Rudder about the various roles so installation can proceed successfully
mkdir -p /var/rudder/cfengine-community/inputs
cat > /var/rudder/cfengine-community/inputs/rudder-server-roles.conf << EOF
# Fill out this file with your hostnames from the other servers
rudder-ldap: ${RUDDER_LDAP}
rudder-inventory-endpoint: ${RUDDER_LDAP}
rudder-db: ${RUDDER_DB}
rudder-front: ${RUDDER_RELAY}
rudder-relay-top: ${RUDDER_RELAY}
rudder-webapp: ${RUDDER_WEB}
rudder-web: ${RUDDER_WEB}
EOF

# This is copied from http://www.rudder-project.org/rudder-doc-2.11/rudder-doc.html#relay-servers
if [ "${OS}" = "RHEL" ] ; then
        ${PM_COMMAND} rudder-agent rudder-webapp rudder-techniques rsyslog rsyslog-pgsql httpd 
elif [ "${OS}" = "UBUNTU" -o "${OS}" = "DEBIAN" ] ; then
        ${PM_COMMAND} rudder-agent rudder-webapp rudder-techniques rsyslog rsyslog-pgsql apache2 apache2-utils
        echo "Now fix the bug on /var/lib/dpkg/info/rudder-agent.postinst"
        echo "Then run aptitude install"
        bash -i
elif [ "${OS}" = "SLES" ] ; then
        ${PM_COMMAND} rudder-agent rudder-webapp rudder-techniques rsyslog rsyslog-pgsql apache2 apache2-utils
fi

# update DNS !
cat /etc/hosts
setenforce 0

# Initialize the server
# Fill in interactive question (or provide answer as command line arguments for automation)
/opt/rudder/bin/rudder-init

echo "Now, accept the other three servers in the web interface (it may take up to 5 minutes for them to appear in 'Accept new nodes')"
echo "Then, use the UUID of server 1 (rudder-front) we stored above and run this command (from /opt/rudder/etc/uuid.hive)"
echo "/opt/rudder/bin/rudder-node-to-relay ${FRONT_UUID}"

