#!/bin/sh

role=$1
hostname=$2

install_agent() {
  yum install -y rudder-agent
  echo 'server.rudder.local' > /var/rudder/cfengine-community/policy_server.dat
  rudder agent run
  mkdir -p /etc/rudder/openstack && sudo cp -r /vagrant/configuration/${hostname}/* /etc/rudder/openstack/
}

install_server() {
  setenforce 0
  yum install -y rudder-server-root
  /opt/rudder/bin/rudder-init "no" "192.168.10.0/24"
  cp -r /vagrant/tree/30_generic_methods/* /usr/share/ncf/tree/30_generic_methods/
  cp -r /vagrant/tree/40_it_ops_knowledge/* /usr/share/ncf/tree/40_it_ops_knowledge/
  cp -r /vagrant/tree/50_techniques /var/rudder/configuration-repository/ncf/
  cd /var/rudder/configuration-repository/ncf/ && sudo chown -R ncf-api-venv:rudder . && sudo git add . && sudo git commit -m 'Add OpenStack techniques'
  rudder agent update
  rudder agent run
}

####

chkconfig iptables off 2>/dev/null
chkconfig firewalld off 2>/dev/null
service iptables stop 2>/dev/null
service firewalld stop 2>/dev/null

echo "[Rudder_3.1]
name=Rudder 3.1 EL repository
baseurl=http://www.rudder-project.org/rpm-3.1/RHEL_7/
gpgcheck=1
gpgkey=http://www.rudder-project.org/rpm-3.1/RHEL_7/repodata/repomd.xml.key" > /etc/yum.repos.d/rudder.repo

echo "127.0.0.1 localhost ${hostname} ${hostname}.rudder.local
192.168.10.10 server.rudder.local
192.168.10.2 controller.rudder.local
192.168.10.3 compute1.rudder.local
192.168.10.4 compute2.rudder.local
192.168.20.2 controller
192.168.20.3 compute1
192.168.20.4 compute2" > /etc/hosts

echo "${hostname}" > /etc/hostname

echo "domain rudder.local
search rudder.local
nameserver 8.8.8.8" > /etc/resolv.conf

case "$role" in
  "agent" ) install_agent;;
  "server") install_server;;
esac
