#!/bin/sh

openstack="/usr/bin/openstack --os-token {{admin.token}} --os-url http://{{admin.controller}}:{{admin.port}}/v2.0"

${openstack} service create --name keystone --description "OpenStack Identity" identity
${openstack} endpoint create --publicurl http://{{admin.controller}}:5000/v2.0 --internalurl http://{{admin.controller}}:5000/v2.0 --adminurl http://{{admin.controller}}:35357/v2.0 --region RegionOne identity

${openstack} project create --description "Admin Project" {{admin.project}}
${openstack} user create --password {{admin.password}} {{admin.user}}
${openstack} role create admin
${openstack} role add --project {{admin.project}} --user {{admin.user}} admin

${openstack} project create --description "Service Project" service

${openstack} project create --description "Demo Project" {{demo.project}}
${openstack} user create --password {{demo.password}} {{demo.user}}
${openstack} role create user
${openstack} role add --project {{demo.project}} --user {{demo.user}} user

${openstack} user create --password {{glance.password}} {{glance.user}}
${openstack} role add --project service --user {{glance.user}} admin
${openstack} service create --name glance --description "OpenStack Image service" image
${openstack} endpoint create --publicurl http://{{admin.controller}}:9292 --internalurl http://{{admin.controller}}:9292 --adminurl http://{{admin.controller}}:9292 --region RegionOne image

${openstack} user create --password {{nova.password}} {{nova.user}}
${openstack} role add --project service --user {{nova.user}} admin
${openstack} service create --name nova --description "OpenStack Compute" compute
${openstack} endpoint create --publicurl http://{{admin.controller}}:8774/v2/%\(tenant_id\)s --internalurl http://{{admin.controller}}:8774/v2/%\(tenant_id\)s --adminurl http://{{admin.controller}}:8774/v2/%\(tenant_id\)s --region RegionOne compute
