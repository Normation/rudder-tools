# rudder-openstack

*WARNING*: This configuration is experimental and outdated.*

The repository contains Rudder techniques to deploy and maintain a simple OpenStack infrastructure.

The master branch tracks OpenStack Kilo. The deployment has only been tested on CentOS, but should be easy to adapt to Ubuntu. It does not provide choice over the backends, and chooses:
* RabbitMQ as message queue
* MariaDB as database

## Introduction

There are techniques for each component:

* ntpd: configure an NTP service
* openstack_repository: configure OpenStack repositories
* rabbitmq: configure RabbitMQ
* opnstack_mysql: configure MySQL/MariaDB
* openstack_keystone: configure the *Identity* service
* openstack_horizon: configure the *Dashboard* service
* openstack_nova_compute: configure the *Compute* service on an hypervisor
* openstack_nova_api: configure the *Compute* service on a controller
* openstack_glance_api: configure the *Image* service on a controller
* openstack_glance_registry: configure the *Image* service on an image node

The techniques objective:
* KISS: every component is configured separately from the others
* Security: Rudder enforces a secured and hardened configuration
* Compliance: the techniques focus on 

## Installation

A sample environment for testing and development is provided using Vagrant. Just use

```
vagrant up
```

to get the demo OpenStack deployment. The dashboard should then be accessible at http://localhost:8082/dashboard.

It will deploy:
* A controller with the *Identity* and *Image* service
* Two *Compute* nodes as hypervisors
