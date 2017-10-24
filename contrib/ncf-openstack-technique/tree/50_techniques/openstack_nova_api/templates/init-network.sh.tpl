#!/bin/sh

source /root/.openstack/admin-openrc.sh

nova="/usr/bin/nova"

${nova} network-create demo-net --bridge {{network.bridge}} --multi-host T --fixed-range-v4 {{network.range}}