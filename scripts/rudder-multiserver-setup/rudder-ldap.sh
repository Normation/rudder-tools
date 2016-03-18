#!/bin/bash

# add repository
./add_repo 3.1

. detect_os.sh

# This is copied from http://www.rudder-project.org/rudder-doc-2.11/rudder-doc.html#relay-servers
if [ "$OS" = "RHEL" ] ; then
        $PM_COMMAND rudder-agent rudder-inventory-endpoint rudder-inventory-ldap
elif [ "$OS" = "UBUNTU" -o "$OS" = "DEBIAN" ] ; then
        $PM_COMMAND rudder-agent rudder-inventory-endpoint rudder-inventory-ldap
        echo "Now fix the bug on /var/lib/dpkg/info/rudder-agent.postinst"
        echo "Then run aptitude install"
        bash -i
elif [ "$OS" = "SLES" ] ; then
        $PM_COMMAND rudder-agent rudder-inventory-endpoint rudder-inventory-ldap
fi

# Make LDAP listen on all interfaces
sed -i "s/^IP=.*$/IP=*/" /etc/default/rudder-slapd
service rudder-slapd restart

# Make jetty listen on all interfaces
grep -q "-Djetty.host=0.0.0.0" /opt/rudder/etc/rudder-jetty.conf || echo 'JAVA_OPTIONS="-Djetty.host=0.0.0.0"' >> /opt/rudder/etc/rudder-jetty.conf

# Change memory limits in /opt/rudder/etc/rudder-jetty.conf
sed  -i "s/JAVA_XMX=.*/JAVA_XMX=384/" /opt/rudder/etc/rudder-jetty.conf
sed  -i "s/JAVA_MAXPERMSIZE=.*/JAVA_MAXPERMSIZE=128/" /opt/rudder/etc/rudder-jetty.conf
service rudder-jetty restart

# Set the policy server to be server 4 (rudder-webapp)
echo "rudder-web" > /var/rudder/cfengine-community/policy_server.dat
service rudder-agent restart

# If you're using a firewall, allow the following incoming connections to this server:
# - TCP port 389: Server 4 (rudder-webapp)
# - TCP port 8080: Server 4 (rudder-webapp) + Server 1 (rudder-front)


