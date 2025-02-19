[DEFAULT]

#
# From oslo.messaging
#

# ZeroMQ bind address. Should be a wildcard (*), an ethernet interface, or IP.
# The "host" option should point or resolve to this address. (string value)
#rpc_zmq_bind_address=*

# MatchMaker driver. (string value)
#rpc_zmq_matchmaker=oslo_messaging._drivers.matchmaker.MatchMakerLocalhost

# ZeroMQ receiver listening port. (integer value)
#rpc_zmq_port=9501

# Number of ZeroMQ contexts, defaults to 1. (integer value)
#rpc_zmq_contexts=1

# Maximum number of ingress messages to locally buffer per topic. Default is
# unlimited. (integer value)
#rpc_zmq_topic_backlog=<None>

# Directory for holding IPC sockets. (string value)
#rpc_zmq_ipc_dir=/var/run/openstack

# Name of this node. Must be a valid hostname, FQDN, or IP address. Must match
# "host" option, if running Nova. (string value)
#rpc_zmq_host=localhost

# Seconds to wait before a cast expires (TTL). Only supported by impl_zmq.
# (integer value)
#rpc_cast_timeout=30

# Heartbeat frequency. (integer value)
#matchmaker_heartbeat_freq=300

# Heartbeat time-to-live. (integer value)
#matchmaker_heartbeat_ttl=600

# Size of RPC thread pool. (integer value)
#rpc_thread_pool_size=64

# Driver or drivers to handle sending notifications. (multi valued)
#notification_driver =

# AMQP topic used for OpenStack notifications. (list value)
# Deprecated group;name - [rpc_notifier2]/topics
#notification_topics=notifications

# Seconds to wait for a response from a call. (integer value)
#rpc_response_timeout=60

# A URL representing the messaging driver to use and its full configuration. If
# not set, we fall back to the rpc_backend option and driver specific
# configuration. (string value)
#transport_url=<None>

# The messaging driver to use, defaults to rabbit. Other drivers include qpid
# and zmq. (string value)
rpc_backend=rabbit

# The default exchange under which topics are scoped. May be overridden by an
# exchange name specified in the transport_url option. (string value)
#control_exchange=openstack


#
# Options defined in nova.availability_zones
#

# The availability_zone to show internal services under
# (string value)
#internal_service_availability_zone=internal

# Default compute node availability_zone (string value)
#default_availability_zone=nova


#
# Options defined in nova.crypto
#

# Filename of root CA (string value)
#ca_file=cacert.pem

# Filename of private key (string value)
#key_file=private/cakey.pem

# Filename of root Certificate Revocation List (string value)
#crl_file=crl.pem

# Where we keep our keys (string value)
#keys_path=$state_path/keys

# Where we keep our root CA (string value)
#ca_path=$state_path/CA

# Should we use a CA for each project? (boolean value)
#use_project_ca=false

# Subject for certificate for users, %s for project, user,
# timestamp (string value)
#user_cert_subject=/C=US/ST=California/O=OpenStack/OU=NovaDev/CN=%.16s-%.16s-%s

# Subject for certificate for projects, %s for project,
# timestamp (string value)
#project_cert_subject=/C=US/ST=California/O=OpenStack/OU=NovaDev/CN=project-ca-%.16s-%s


#
# Options defined in nova.exception
#

# Make exception message format errors fatal (boolean value)
#fatal_exception_format_errors=false


#
# Options defined in nova.netconf
#

# IP address of this host (string value)
my_ip={{management_ip}}

# Block storage IP address of this host (string value)
#my_block_storage_ip=$my_ip

# Name of this node.  This can be an opaque identifier.  It is
# not necessarily a hostname, FQDN, or IP address. However,
# the node name must be valid within an AMQP key, and if using
# ZeroMQ, a valid hostname, FQDN, or IP address (string value)
#host=nova

# Use IPv6 (boolean value)
#use_ipv6=false


#
# Options defined in nova.notifications
#

# If set, send compute.instance.update notifications on
# instance state changes.  Valid values are None for no
# notifications, "vm_state" for notifications on VM state
# changes, or "vm_and_task_state" for notifications on VM and
# task state changes. (string value)
#notify_on_state_change=<None>

# If set, send api.fault notifications on caught exceptions in
# the API service. (boolean value)
#notify_api_faults=false

# Default notification level for outgoing notifications
# (string value)
#default_notification_level=INFO

# Default publisher_id for outgoing notifications (string
# value)
#default_publisher_id=<None>


#
# Options defined in nova.paths
#

# Directory where the nova python module is installed (string
# value)
#pybasedir=/usr/lib/python/site-packages

# Directory where nova binaries are installed (string value)
#bindir=/usr/local/bin

# Top-level directory for maintaining nova's state (string
# value)
#state_path=/var/lib/nova


#
# Options defined in nova.quota
#

# Number of instances allowed per project (integer value)
#quota_instances=10

# Number of instance cores allowed per project (integer value)
#quota_cores=20

# Megabytes of instance RAM allowed per project (integer
# value)
#quota_ram=51200

# Number of floating IPs allowed per project (integer value)
#quota_floating_ips=10

# Number of fixed IPs allowed per project (this should be at
# least the number of instances allowed) (integer value)
#quota_fixed_ips=-1

# Number of metadata items allowed per instance (integer
# value)
#quota_metadata_items=128

# Number of injected files allowed (integer value)
#quota_injected_files=5

# Number of bytes allowed per injected file (integer value)
#quota_injected_file_content_bytes=10240

# Length of injected file path (integer value)
#quota_injected_file_path_length=255

# Number of security groups per project (integer value)
#quota_security_groups=10

# Number of security rules per security group (integer value)
#quota_security_group_rules=20

# Number of key pairs per user (integer value)
#quota_key_pairs=100

# Number of server groups per project (integer value)
#quota_server_groups=10

# Number of servers per server group (integer value)
#quota_server_group_members=10

# Number of seconds until a reservation expires (integer
# value)
#reservation_expire=86400

# Count of reservations until usage is refreshed. This
# defaults to 0(off) to avoid additional load but it is useful
# to turn on to help keep quota usage up to date and reduce
# the impact of out of sync usage issues. (integer value)
#until_refresh=0

# Number of seconds between subsequent usage refreshes. This
# defaults to 0(off) to avoid additional load but it is useful
# to turn on to help keep quota usage up to date and reduce
# the impact of out of sync usage issues. Note that quotas are
# not updated on a periodic task, they will update on a new
# reservation if max_age has passed since the last reservation
# (integer value)
#max_age=0

# Default driver to use for quota checks (string value)
#quota_driver=nova.quota.DbQuotaDriver


#
# Options defined in nova.service
#

# Seconds between nodes reporting state to datastore (integer
# value)
#report_interval=10

# Enable periodic tasks (boolean value)
#periodic_enable=true

# Range of seconds to randomly delay when starting the
# periodic task scheduler to reduce stampeding. (Disable by
# setting to 0) (integer value)
#periodic_fuzzy_delay=60

# A list of APIs to enable by default (list value)
#enabled_apis=ec2,osapi_compute,metadata

# A list of APIs with enabled SSL (list value)
#enabled_ssl_apis=

# The IP address on which the EC2 API will listen. (string
# value)
#ec2_listen=0.0.0.0

# The port on which the EC2 API will listen. (integer value)
#ec2_listen_port=8773

# Number of workers for EC2 API service. The default will be
# equal to the number of CPUs available. (integer value)
#ec2_workers=<None>

# The IP address on which the OpenStack API will listen.
# (string value)
#osapi_compute_listen=0.0.0.0

# The port on which the OpenStack API will listen. (integer
# value)
#osapi_compute_listen_port=8774

# Number of workers for OpenStack API service. The default
# will be the number of CPUs available. (integer value)
#osapi_compute_workers=<None>

# OpenStack metadata service manager (string value)
#metadata_manager=nova.api.manager.MetadataManager

# The IP address on which the metadata API will listen.
# (string value)
#metadata_listen=0.0.0.0

# The port on which the metadata API will listen. (integer
# value)
#metadata_listen_port=8775

# Number of workers for metadata service. The default will be
# the number of CPUs available. (integer value)
#metadata_workers=<None>

# Full class name for the Manager for compute (string value)
#compute_manager=nova.compute.manager.ComputeManager

# Full class name for the Manager for console proxy (string
# value)
#console_manager=nova.console.manager.ConsoleProxyManager

# Manager for console auth (string value)
#consoleauth_manager=nova.consoleauth.manager.ConsoleAuthManager

# Full class name for the Manager for cert (string value)
#cert_manager=nova.cert.manager.CertManager

# Full class name for the Manager for network (string value)
network_manager=nova.network.manager.FlatDHCPManager

# Full class name for the Manager for scheduler (string value)
#scheduler_manager=nova.scheduler.manager.SchedulerManager

# Maximum time since last check-in for up service (integer
# value)
#service_down_time=60


#
# Options defined in nova.utils
#

# Whether to log monkey patching (boolean value)
#monkey_patch=false

# List of modules/decorators to monkey patch (list value)
#monkey_patch_modules=nova.api.ec2.cloud:nova.notifications.notify_decorator,nova.compute.api:nova.notifications.notify_decorator

# Length of generated instance admin passwords (integer value)
#password_length=12

# Time period to generate instance usages for.  Time period
# must be hour, day, month or year (string value)
#instance_usage_audit_period=month

# Path to the rootwrap configuration file to use for running
# commands as root (string value)
#rootwrap_config=/etc/nova/rootwrap.conf

# Explicitly specify the temporary working directory (string
# value)
#tempdir=<None>


#
# Options defined in nova.wsgi
#

# File name for the paste.deploy config for nova-api (string
# value)
#api_paste_config=api-paste.ini

# A python format string that is used as the template to
# generate log lines. The following values can be formatted
# into it: client_ip, date_time, request_line, status_code,
# body_length, wall_seconds. (string value)
#wsgi_log_format=%(client_ip)s "%(request_line)s" status: %(status_code)s len: %(body_length)s time: %(wall_seconds).7f

# CA certificate file to use to verify connecting clients
# (string value)
#ssl_ca_file=<None>

# SSL certificate of API server (string value)
#ssl_cert_file=<None>

# SSL private key of API server (string value)
#ssl_key_file=<None>

# Sets the value of TCP_KEEPIDLE in seconds for each server
# socket. Not supported on OS X. (integer value)
#tcp_keepidle=600

# Size of the pool of greenthreads used by wsgi (integer
# value)
#wsgi_default_pool_size=1000

# Maximum line size of message headers to be accepted.
# max_header_line may need to be increased when using large
# tokens (typically those generated by the Keystone v3 API
# with big service catalogs). (integer value)
#max_header_line=16384

# If False, closes the client socket connection explicitly.
# (boolean value)
#wsgi_keep_alive=true

# Timeout for client connections' socket operations. If an
# incoming connection is idle for this number of seconds it
# will be closed. A value of '0' means wait forever. (integer
# value)
#client_socket_timeout=900


#
# Options defined in nova.api.auth
#

# Whether to use per-user rate limiting for the api. This
# option is only used by v2 api. Rate limiting is removed from
# v3 api. (boolean value)
#api_rate_limit=false

#  The strategy to use for auth: keystone, noauth
# (deprecated), or noauth2. Both noauth and noauth2 are
# designed for testing only, as they do no actual credential
# checking. noauth provides administrative credentials
# regardless of the passed in user, noauth2 only does if
# 'admin' is specified as the username.  (string value)
auth_strategy=keystone

# Treat X-Forwarded-For as the canonical remote address. Only
# enable this if you have a sanitizing proxy. (boolean value)
#use_forwarded_for=false


#
# Options defined in nova.api.ec2
#

# Number of failed auths before lockout. (integer value)
#lockout_attempts=5

# Number of minutes to lockout if triggered. (integer value)
#lockout_minutes=15

# Number of minutes for lockout window. (integer value)
#lockout_window=15

# URL to get token from ec2 request. (string value)
#keystone_ec2_url=http://localhost:5000/v2.0/ec2tokens

# Return the IP address as private dns hostname in describe
# instances (boolean value)
#ec2_private_dns_show_ip=false

# Validate security group names according to EC2 specification
# (boolean value)
#ec2_strict_validation=true

# Time in seconds before ec2 timestamp expires (integer value)
#ec2_timestamp_expiry=300

# Disable SSL certificate verification. (boolean value)
#keystone_ec2_insecure=false


#
# Options defined in nova.api.ec2.cloud
#

# The IP address of the EC2 API server (string value)
#ec2_host=$my_ip

# The internal IP address of the EC2 API server (string value)
#ec2_dmz_host=$my_ip

# The port of the EC2 API server (integer value)
#ec2_port=8773

# The protocol to use when connecting to the EC2 API server
# (http, https) (string value)
#ec2_scheme=http

# The path prefix used to call the ec2 API server (string
# value)
#ec2_path=/

# List of region=fqdn pairs separated by commas (list value)
#region_list=


#
# Options defined in nova.api.metadata.base
#

# List of metadata versions to skip placing into the config
# drive (string value)
#config_drive_skip_versions=1.0 2007-01-19 2007-03-01 2007-08-29 2007-10-10 2007-12-15 2008-02-01 2008-09-01

# Driver to use for vendor data (string value)
#vendordata_driver=nova.api.metadata.vendordata_json.JsonFileVendorData


#
# Options defined in nova.api.metadata.handler
#

# Time in seconds to cache metadata; 0 to disable metadata
# caching entirely (not recommended). Increasingthis should
# improve response times of the metadata API when under heavy
# load. Higher values may increase memoryusage and result in
# longer times for host metadata changes to take effect.
# (integer value)
#metadata_cache_expiration=15


#
# Options defined in nova.api.metadata.vendordata_json
#

# File to load JSON formatted vendor data from (string value)
#vendordata_jsonfile_path=<None>


#
# Options defined in nova.api.openstack.common
#

# The maximum number of items returned in a single response
# from a collection resource (integer value)
#osapi_max_limit=1000

# Base URL that will be presented to users in links to the
# OpenStack Compute API (string value)
#osapi_compute_link_prefix=<None>

# Base URL that will be presented to users in links to glance
# resources (string value)
#osapi_glance_link_prefix=<None>


#
# Options defined in nova.api.openstack.compute
#

# Permit instance snapshot operations. (boolean value)
#allow_instance_snapshots=true


#
# Options defined in nova.api.openstack.compute.contrib
#

# Specify list of extensions to load when using
# osapi_compute_extension option with
# nova.api.openstack.compute.contrib.select_extensions (list
# value)
#osapi_compute_ext_list=


#
# Options defined in nova.api.openstack.compute.contrib.fping
#

# Full path to fping. (string value)
#fping_path=/usr/sbin/fping


#
# Options defined in nova.api.openstack.compute.contrib.os_tenant_networks
#

# Enables or disables quota checking for tenant networks
# (boolean value)
#enable_network_quota=false

# Control for checking for default networks (string value)
#use_neutron_default_nets=False

# Default tenant id when creating neutron networks (string
# value)
#neutron_default_tenant_id=default

# Number of private networks allowed per project (integer
# value)
#quota_networks=3


#
# Options defined in nova.api.openstack.compute.extensions
#

# osapi compute extension to load (multi valued)
#osapi_compute_extension=nova.api.openstack.compute.contrib.standard_extensions


#
# Options defined in nova.api.openstack.compute.plugins.v3.hide_server_addresses
#

# List of instance states that should hide network info (list
# value)
#osapi_hide_server_address_states=building


#
# Options defined in nova.api.openstack.compute.servers
#

# Enables returning of the instance password by the relevant
# server API calls such as create, rebuild or rescue, If the
# hypervisor does not support password injection then the
# password returned will not be correct (boolean value)
#enable_instance_password=true


#
# Options defined in nova.cert.rpcapi
#

# The topic cert nodes listen on (string value)
#cert_topic=cert


#
# Options defined in nova.cloudpipe.pipelib
#

# Image ID used when starting up a cloudpipe vpn server
# (string value)
#vpn_image_id=0

# Flavor for vpn instances (string value)
#vpn_flavor=m1.tiny

# Template for cloudpipe instance boot script (string value)
#boot_script_template=$pybasedir/nova/cloudpipe/bootscript.template

# Network to push into openvpn config (string value)
#dmz_net=10.0.0.0

# Netmask to push into openvpn config (string value)
#dmz_mask=255.255.255.0

# Suffix to add to project name for vpn key and secgroups
# (string value)
#vpn_key_suffix=-vpn


#
# Options defined in nova.cmd.novnc
#

# Record sessions to FILE.[session_number] (boolean value)
#record=false

# Become a daemon (background process) (boolean value)
#daemon=false

# Disallow non-encrypted connections (boolean value)
#ssl_only=false

# Source is ipv6 (boolean value)
#source_is_ipv6=false

# SSL certificate file (string value)
#cert=self.pem

# SSL key file (if separate from cert) (string value)
#key=<None>

# Run webserver on same port. Serve files from DIR. (string
# value)
#web=/usr/share/spice-html5


#
# Options defined in nova.cmd.novncproxy
#

# Host on which to listen for incoming requests (string value)
#novncproxy_host=0.0.0.0

# Port on which to listen for incoming requests (integer
# value)
#novncproxy_port=6080


#
# Options defined in nova.compute.api
#

# Allow destination machine to match source for resize. Useful
# when testing in single-host environments. (boolean value)
#allow_resize_to_same_host=false

# Allow migrate machine to the same host. Useful when testing
# in single-host environments. (boolean value)
#allow_migrate_to_same_host=false

# Availability zone to use when user doesn't specify one
# (string value)
#default_schedule_zone=<None>

# These are image properties which a snapshot should not
# inherit from an instance (list value)
#non_inheritable_image_properties=cache_in_nova,bittorrent

# Kernel image that indicates not to use a kernel, but to use
# a raw disk image instead (string value)
#null_kernel=nokernel

# When creating multiple instances with a single request using
# the os-multiple-create API extension, this template will be
# used to build the display name for each instance. The
# benefit is that the instances end up with different
# hostnames. To restore legacy behavior of every instance
# having the same name, set this option to "%(name)s".  Valid
# keys for the template are: name, uuid, count. (string value)
#multi_instance_display_name_template=%(name)s-%(count)d

# Maximum number of devices that will result in a local image
# being created on the hypervisor node. Setting this to 0
# means nova will allow only boot from volume. A negative
# number means unlimited. (integer value)
#max_local_block_devices=3


#
# Options defined in nova.compute.flavors
#

# Default flavor to use for the EC2 API only. The Nova API
# does not support a default flavor. (string value)
#default_flavor=m1.small


#
# Options defined in nova.compute.manager
#

# Console proxy host to use to connect to instances on this
# host. (string value)
#console_host=nova

# Name of network to use to set access IPs for instances
# (string value)
#default_access_ip_network_name=<None>

# Whether to batch up the application of IPTables rules during
# a host restart and apply all at the end of the init phase
# (boolean value)
#defer_iptables_apply=false

# Where instances are stored on disk (string value)
#instances_path=$state_path/instances

# Generate periodic compute.instance.exists notifications
# (boolean value)
#instance_usage_audit=false

# Number of 1 second retries needed in live_migration (integer
# value)
#live_migration_retry_count=30

# Whether to start guests that were running before the host
# rebooted (boolean value)
#resume_guests_state_on_host_boot=false

# Number of times to retry network allocation on failures
# (integer value)
#network_allocate_retries=0

# Maximum number of instance builds to run concurrently
# (integer value)
#max_concurrent_builds=10

# Number of times to retry block device allocation on failures
# (integer value)
#block_device_allocate_retries=60

# The number of times to attempt to reap an instance's files.
# (integer value)
#maximum_instance_delete_attempts=5

# Interval to pull network bandwidth usage info. Not supported
# on all hypervisors. Set to -1 to disable. Setting this to 0
# will run at the default rate. (integer value)
#bandwidth_poll_interval=600

# Interval to sync power states between the database and the
# hypervisor. Set to -1 to disable. Setting this to 0 will run
# at the default rate. (integer value)
#sync_power_state_interval=600

# Number of seconds between instance network information cache
# updates (integer value)
#heal_instance_info_cache_interval=60

# Interval in seconds for reclaiming deleted instances
# (integer value)
#reclaim_instance_interval=0

# Interval in seconds for gathering volume usages (integer
# value)
#volume_usage_poll_interval=0

# Interval in seconds for polling shelved instances to
# offload. Set to -1 to disable.Setting this to 0 will run at
# the default rate. (integer value)
#shelved_poll_interval=3600

# Time in seconds before a shelved instance is eligible for
# removing from a host.  -1 never offload, 0 offload when
# shelved (integer value)
#shelved_offload_time=0

# Interval in seconds for retrying failed instance file
# deletes. Set to -1 to disable. Setting this to 0 will run at
# the default rate. (integer value)
#instance_delete_interval=300

# Waiting time interval (seconds) between block device
# allocation retries on failures (integer value)
#block_device_allocate_retries_interval=3

# Waiting time interval (seconds) between sending the
# scheduler a list of current instance UUIDs to verify that
# its view of instances is in sync with nova. If the CONF
# option `scheduler_tracks_instance_changes` is False,
# changing this option will have no effect. (integer value)
#scheduler_instance_sync_interval=120

# Action to take if a running deleted instance is detected.
# Valid options are 'noop', 'log', 'shutdown', or 'reap'. Set
# to 'noop' to take no action. (string value)
#running_deleted_instance_action=reap

# Number of seconds to wait between runs of the cleanup task.
# (integer value)
#running_deleted_instance_poll_interval=1800

# Number of seconds after being deleted when a running
# instance should be considered eligible for cleanup. (integer
# value)
#running_deleted_instance_timeout=0

# Automatically hard reboot an instance if it has been stuck
# in a rebooting state longer than N seconds. Set to 0 to
# disable. (integer value)
#reboot_timeout=0

# Amount of time in seconds an instance can be in BUILD before
# going into ERROR status. Set to 0 to disable. (integer
# value)
#instance_build_timeout=0

# Automatically unrescue an instance after N seconds. Set to 0
# to disable. (integer value)
#rescue_timeout=0

# Automatically confirm resizes after N seconds. Set to 0 to
# disable. (integer value)
#resize_confirm_window=0

# Total amount of time to wait in seconds for an instance to
# perform a clean shutdown. (integer value)
#shutdown_timeout=60


#
# Options defined in nova.compute.monitors
#

# Monitor classes available to the compute which may be
# specified more than once. (multi valued)
#compute_available_monitors=nova.compute.monitors.all_monitors

# A list of monitors that can be used for getting compute
# metrics. (list value)
#compute_monitors=


#
# Options defined in nova.compute.resource_tracker
#

# Amount of disk in MB to reserve for the host (integer value)
#reserved_host_disk_mb=0

# Amount of memory in MB to reserve for the host (integer
# value)
#reserved_host_memory_mb=512

# Class that will manage stats for the local compute host
# (string value)
#compute_stats_class=nova.compute.stats.Stats

# The names of the extra resources to track. (list value)
#compute_resources=vcpu


#
# Options defined in nova.compute.rpcapi
#

# The topic compute nodes listen on (string value)
#compute_topic=compute


#
# Options defined in nova.conductor.tasks.live_migrate
#

# Number of times to retry live-migration before failing. If
# == -1, try until out of hosts. If == 0, only try once, no
# retries. (integer value)
#migrate_max_retries=-1


#
# Options defined in nova.console.manager
#

# Driver to use for the console proxy (string value)
#console_driver=nova.console.xvp.XVPConsoleProxy

# Stub calls to compute worker for tests (boolean value)
#stub_compute=false

# Publicly visible name for this console host (string value)
#console_public_hostname=nova


#
# Options defined in nova.console.rpcapi
#

# The topic console proxy nodes listen on (string value)
#console_topic=console


#
# Options defined in nova.console.xvp
#

# XVP conf template (string value)
#console_xvp_conf_template=$pybasedir/nova/console/xvp.conf.template

# Generated XVP conf file (string value)
#console_xvp_conf=/etc/xvp.conf

# XVP master process pid file (string value)
#console_xvp_pid=/var/run/xvp.pid

# XVP log file (string value)
#console_xvp_log=/var/log/xvp.log

# Port for XVP to multiplex VNC connections on (integer value)
#console_xvp_multiplex_port=5900


#
# Options defined in nova.consoleauth
#

# The topic console auth proxy nodes listen on (string value)
#consoleauth_topic=consoleauth


#
# Options defined in nova.consoleauth.manager
#

# How many seconds before deleting tokens (integer value)
#console_token_ttl=600


#
# Options defined in nova.db.api
#

# Services to be added to the available pool on create
# (boolean value)
#enable_new_services=true

# Template string to be used to generate instance names
# (string value)
#instance_name_template=instance-%08x

# Template string to be used to generate snapshot names
# (string value)
#snapshot_name_template=snapshot-%s


#
# Options defined in nova.db.base
#

# The driver to use for database access (string value)
#db_driver=nova.db


#
# Options defined in nova.db.sqlalchemy.api
#

# When set, compute API will consider duplicate hostnames
# invalid within the specified scope, regardless of case.
# Should be empty, "project" or "global". (string value)
#osapi_compute_unique_server_name_scope=


#
# Options defined in nova.image.s3
#

# Parent directory for tempdir used for image decryption
# (string value)
#image_decryption_dir=/tmp

# Hostname or IP for OpenStack to use when accessing the S3
# api (string value)
#s3_host=$my_ip

# Port used when accessing the S3 api (integer value)
#s3_port=3333

# Access key to use for S3 server for images (string value)
#s3_access_key=notchecked

# Secret key to use for S3 server for images (string value)
#s3_secret_key=notchecked

# Whether to use SSL when talking to S3 (boolean value)
#s3_use_ssl=false

# Whether to affix the tenant id to the access key when
# downloading from S3 (boolean value)
#s3_affix_tenant=false


#
# Options defined in nova.ipv6.api
#

# Backend to use for IPv6 generation (string value)
#ipv6_backend=rfc2462


#
# Options defined in nova.network
#

# The full class name of the network API class to use (string
# value)
network_api_class=nova.network.api.API


#
# Options defined in nova.network.driver
#

# Driver to use for network creation (string value)
#network_driver=nova.network.linux_net


#
# Options defined in nova.network.floating_ips
#

# Default pool for floating IPs (string value)
#default_floating_pool=nova

# Autoassigning floating IP to VM (boolean value)
#auto_assign_floating_ip=false

# Full class name for the DNS Manager for floating IPs (string
# value)
#floating_ip_dns_manager=nova.network.noop_dns_driver.NoopDNSDriver

# Full class name for the DNS Manager for instance IPs (string
# value)
#instance_dns_manager=nova.network.noop_dns_driver.NoopDNSDriver

# Full class name for the DNS Zone for instance IPs (string
# value)
#instance_dns_domain=


#
# Options defined in nova.network.ldapdns
#

# URL for LDAP server which will store DNS entries (string
# value)
#ldap_dns_url=ldap://ldap.example.com:389

# User for LDAP DNS (string value)
#ldap_dns_user=uid=admin,ou=people,dc=example,dc=org

# Password for LDAP DNS (string value)
#ldap_dns_password=password

# Hostmaster for LDAP DNS driver Statement of Authority
# (string value)
#ldap_dns_soa_hostmaster=hostmaster@example.org

# DNS Servers for LDAP DNS driver (multi valued)
#ldap_dns_servers=dns.example.org

# Base DN for DNS entries in LDAP (string value)
#ldap_dns_base_dn=ou=hosts,dc=example,dc=org

# Refresh interval (in seconds) for LDAP DNS driver Statement
# of Authority (string value)
#ldap_dns_soa_refresh=1800

# Retry interval (in seconds) for LDAP DNS driver Statement of
# Authority (string value)
#ldap_dns_soa_retry=3600

# Expiry interval (in seconds) for LDAP DNS driver Statement
# of Authority (string value)
#ldap_dns_soa_expiry=86400

# Minimum interval (in seconds) for LDAP DNS driver Statement
# of Authority (string value)
#ldap_dns_soa_minimum=7200


#
# Options defined in nova.network.linux_net
#

# Location of flagfiles for dhcpbridge (multi valued)
#dhcpbridge_flagfile=/etc/nova/nova.conf

# Location to keep network config files (string value)
#networks_path=$state_path/networks

# Interface for public IP addresses (string value)
public_interface={{external_interface}}

# Location of nova-dhcpbridge (string value)
#dhcpbridge=/usr/bin/nova-dhcpbridge

# Public IP of network host (string value)
#routing_source_ip=$my_ip

# Lifetime of a DHCP lease in seconds (integer value)
#dhcp_lease_time=86400

# If set, uses specific DNS server for dnsmasq. Can be
# specified multiple times. (multi valued)
#dns_server=

# If set, uses the dns1 and dns2 from the network ref. as dns
# servers. (boolean value)
#use_network_dns_servers=false

# A list of dmz ranges that should be accepted (list value)
#dmz_cidr=

# Traffic to this range will always be snatted to the fallback
# ip, even if it would normally be bridged out of the node.
# Can be specified multiple times. (multi valued)
#force_snat_range=

# Override the default dnsmasq settings with this file (string
# value)
#dnsmasq_config_file=

# Driver used to create ethernet devices. (string value)
#linuxnet_interface_driver=nova.network.linux_net.LinuxBridgeInterfaceDriver

# Name of Open vSwitch bridge used with linuxnet (string
# value)
#linuxnet_ovs_integration_bridge=br-int

# Send gratuitous ARPs for HA setup (boolean value)
send_arp_for_ha=true

# Send this many gratuitous ARPs for HA setup (integer value)
#send_arp_for_ha_count=3

# Use single default gateway. Only first nic of vm will get
# default gateway from dhcp server (boolean value)
#use_single_default_gateway=false

# An interface that bridges can forward to. If this is set to
# all then all traffic will be forwarded. Can be specified
# multiple times. (multi valued)
#forward_bridge_interface=all

# The IP address for the metadata API server (string value)
#metadata_host=$my_ip

# The port for the metadata API port (integer value)
#metadata_port=8775

# Regular expression to match the iptables rule that should
# always be on the top. (string value)
#iptables_top_regex=

# Regular expression to match the iptables rule that should
# always be on the bottom. (string value)
#iptables_bottom_regex=

# The table that iptables to jump to when a packet is to be
# dropped. (string value)
#iptables_drop_action=DROP

# Amount of time, in seconds, that ovs_vsctl should wait for a
# response from the database. 0 is to wait forever. (integer
# value)
#ovs_vsctl_timeout=120

# If passed, use fake network devices and addresses (boolean
# value)
#fake_network=false

# Number of times to retry ebtables commands on failure.
# (integer value)
#ebtables_exec_attempts=3

# Number of seconds to wait between ebtables retries.
# (floating point value)
#ebtables_retry_interval=1.0


#
# Options defined in nova.network.manager
#

# Bridge for simple network instances (string value)
flat_network_bridge={{bridge}}

# DNS server for simple network (string value)
#flat_network_dns=8.8.4.4

# Whether to attempt to inject network setup into guest
# (boolean value)
#flat_injected=false

# FlatDhcp will bridge into this interface if set (string
# value)
flat_interface={{external_interface}}

# First VLAN for private networks (integer value)
#vlan_start=100

# VLANs will bridge into this interface if set (string value)
#vlan_interface=<None>

# Number of networks to support (integer value)
#num_networks=1

# Public IP for the cloudpipe VPN servers (string value)
#vpn_ip=$my_ip

# First Vpn port for private networks (integer value)
#vpn_start=1000

# Number of addresses in each private subnet (integer value)
network_size=254

# Fixed IPv6 address block (string value)
#fixed_range_v6=fd00::/48

# Default IPv4 gateway (string value)
#gateway=<None>

# Default IPv6 gateway (string value)
#gateway_v6=<None>

# Number of addresses reserved for vpn clients (integer value)
#cnt_vpn_clients=0

# Seconds after which a deallocated IP is disassociated
# (integer value)
#fixed_ip_disassociate_timeout=600

# Number of attempts to create unique mac address (integer
# value)
#create_unique_mac_address_attempts=5

# If True, skip using the queue and make local calls (boolean
# value)
#fake_call=false

# If True, unused gateway devices (VLAN and bridge) are
# deleted in VLAN network mode with multi hosted networks
# (boolean value)
#teardown_unused_network_gateway=false

# If True, send a dhcp release on instance termination
# (boolean value)
force_dhcp_release=True

# If True, when a DNS entry must be updated, it sends a fanout
# cast to all network hosts to update their DNS entries in
# multi host mode (boolean value)
#update_dns_entries=false

# Number of seconds to wait between runs of updates to DNS
# entries. (integer value)
#dns_update_periodic_interval=-1

# Domain to use for building the hostnames (string value)
#dhcp_domain=novalocal

# Indicates underlying L3 management library (string value)
#l3_lib=nova.network.l3.LinuxNetL3


#
# Options defined in nova.network.rpcapi
#

# The topic network nodes listen on (string value)
#network_topic=network

# Default value for multi_host in networks. Also, if set, some
# rpc network calls will be sent directly to host. (boolean
# value)
multi_host=true


#
# Options defined in nova.network.security_group.openstack_driver
#

# The full class name of the security API class (string value)
security_group_api=nova


#
# Options defined in nova.objects.network
#

# DEPRECATED: THIS VALUE SHOULD BE SET WHEN CREATING THE
# NETWORK. If True in multi_host mode, all compute hosts share
# the same dhcp address. The same IP address used for DHCP
# will be added on each nova-network node which is only
# visible to the vms on the same host. (boolean value)
share_dhcp_address=true

# DEPRECATED: THIS VALUE SHOULD BE SET WHEN CREATING THE
# NETWORK. MTU setting for network interface. (integer value)
#network_device_mtu=<None>


#
# Options defined in nova.objectstore.s3server
#

# Path to S3 buckets (string value)
#buckets_path=$state_path/buckets

# IP address for S3 API to listen (string value)
#s3_listen=0.0.0.0

# Port for S3 API to listen (integer value)
#s3_listen_port=3333


#
# From oslo.log
#

# Print debugging output (set logging level to DEBUG instead of default WARNING
# level). (boolean value)
#debug=false

# Print more verbose output (set logging level to INFO instead of default
# WARNING level). (boolean value)
#verbose=false

# The name of a logging configuration file. This file is appended to any
# existing logging configuration files. For details about logging configuration
# files, see the Python logging module documentation. (string value)
# Deprecated group;name - DEFAULT;log_config
#log_config_append=<None>

# DEPRECATED. A logging.Formatter log message format string which may use any
# of the available logging.LogRecord attributes. This option is deprecated.
# Please use logging_context_format_string and logging_default_format_string
# instead. (string value)
#log_format=<None>

# Format string for %%(asctime)s in log records. Default: %(default)s . (string
# value)
#log_date_format=%Y-%m-%d %H:%M:%S

# (Optional) Name of log file to output to. If no default is set, logging will
# go to stdout. (string value)
# Deprecated group;name - DEFAULT;logfile
#log_file=<None>

# (Optional) The base directory used for relative --log-file paths. (string
# value)
# Deprecated group;name - DEFAULT;logdir
#log_dir=/var/log/nova

# Use syslog for logging. Existing syslog format is DEPRECATED during I, and
# will change in J to honor RFC5424. (boolean value)
#use_syslog=false

# (Optional) Enables or disables syslog rfc5424 format for logging. If enabled,
# prefixes the MSG part of the syslog message with APP-NAME (RFC5424). The
# format without the APP-NAME is deprecated in I, and will be removed in J.
# (boolean value)
#use_syslog_rfc_format=false

# Syslog facility to receive log lines. (string value)
#syslog_log_facility=LOG_USER

# Log output to standard error. (boolean value)
#use_stderr=False

# Format string to use for log messages with context. (string value)
#logging_context_format_string=%(asctime)s.%(msecs)03d %(process)d %(levelname)s %(name)s [%(request_id)s %(user_identity)s] %(instance)s%(message)s

# Format string to use for log messages without context. (string value)
#logging_default_format_string=%(asctime)s.%(msecs)03d %(process)d %(levelname)s %(name)s [-] %(instance)s%(message)s

# Data to append to log format when level is DEBUG. (string value)
#logging_debug_format_suffix=%(funcName)s %(pathname)s:%(lineno)d

# Prefix each line of exception output with this format. (string value)
#logging_exception_prefix=%(asctime)s.%(msecs)03d %(process)d TRACE %(name)s %(instance)s

# List of logger=LEVEL pairs. (list value)
#default_log_levels=amqp=WARN,amqplib=WARN,boto=WARN,qpid=WARN,sqlalchemy=WARN,suds=INFO,oslo.messaging=INFO,iso8601=WARN,requests.packages.urllib3.connectionpool=WARN,urllib3.connectionpool=WARN,websocket=WARN,requests.packages.urllib3.util.retry=WARN,urllib3.util.retry=WARN,keystonemiddleware=WARN,routes.middleware=WARN,stevedore=WARN

# Enables or disables publication of error events. (boolean value)
#publish_errors=false

# Enables or disables fatal status of deprecations. (boolean value)
#fatal_deprecations=false

# The format for an instance that is passed with the log message. (string
# value)
#instance_format="[instance: %(uuid)s] "

# The format for an instance UUID that is passed with the log message. (string
# value)
#instance_uuid_format="[instance: %(uuid)s] "


#
# Options defined in nova.pci.request
#

# An alias for a PCI passthrough device requirement. This
# allows users to specify the alias in the extra_spec for a
# flavor, without needing to repeat all the PCI property
# requirements. For example: pci_alias = { "name":
# "QuicAssist",   "product_id": "0443",   "vendor_id": "8086",
# "device_type": "ACCEL" } defines an alias for the Intel
# QuickAssist card. (multi valued) (multi valued)
#pci_alias=


#
# Options defined in nova.pci.whitelist
#

# White list of PCI devices available to VMs. For example:
# pci_passthrough_whitelist =  [{"vendor_id": "8086",
# "product_id": "0443"}] (multi valued)
#pci_passthrough_whitelist=


#
# Options defined in nova.scheduler.driver
#

# The scheduler host manager class to use (string value)
#scheduler_host_manager=nova.scheduler.host_manager.HostManager


#
# Options defined in nova.scheduler.filter_scheduler
#

# New instances will be scheduled on a host chosen randomly
# from a subset of the N best hosts. This property defines the
# subset size that a host is chosen from. A value of 1 chooses
# the first host returned by the weighing functions. This
# value must be at least 1. Any value less than 1 will be
# ignored, and 1 will be used instead (integer value)
#scheduler_host_subset_size=1


#
# Options defined in nova.scheduler.filters.aggregate_image_properties_isolation
#

# Force the filter to consider only keys matching the given
# namespace. (string value)
#aggregate_image_properties_isolation_namespace=<None>

# The separator used between the namespace and keys (string
# value)
#aggregate_image_properties_isolation_separator=.


#
# Options defined in nova.scheduler.filters.core_filter
#

# Virtual CPU to physical CPU allocation ratio which affects
# all CPU filters. This configuration specifies a global ratio
# for CoreFilter. For AggregateCoreFilter, it will fall back
# to this configuration value if no per-aggregate setting
# found. (floating point value)
#cpu_allocation_ratio=16.0


#
# Options defined in nova.scheduler.filters.disk_filter
#

# Virtual disk to physical disk allocation ratio (floating
# point value)
#disk_allocation_ratio=1.0


#
# Options defined in nova.scheduler.filters.io_ops_filter
#

# Tells filters to ignore hosts that have this many or more
# instances currently in build, resize, snapshot, migrate,
# rescue or unshelve task states (integer value)
#max_io_ops_per_host=8


#
# Options defined in nova.scheduler.filters.isolated_hosts_filter
#

# Images to run on isolated host (list value)
#isolated_images=

# Host reserved for specific images (list value)
#isolated_hosts=

# Whether to force isolated hosts to run only isolated images
# (boolean value)
#restrict_isolated_hosts_to_isolated_images=true


#
# Options defined in nova.scheduler.filters.num_instances_filter
#

# Ignore hosts that have too many instances (integer value)
#max_instances_per_host=50


#
# Options defined in nova.scheduler.filters.ram_filter
#

# Virtual ram to physical ram allocation ratio which affects
# all ram filters. This configuration specifies a global ratio
# for RamFilter. For AggregateRamFilter, it will fall back to
# this configuration value if no per-aggregate setting found.
# (floating point value)
#ram_allocation_ratio=1.5


#
# Options defined in nova.scheduler.host_manager
#

# Filter classes available to the scheduler which may be
# specified more than once.  An entry of
# "nova.scheduler.filters.all_filters" maps to all filters
# included with nova. (multi valued)
#scheduler_available_filters=nova.scheduler.filters.all_filters

# Which filter class names to use for filtering hosts when not
# specified in the request. (list value)
#scheduler_default_filters=RetryFilter,AvailabilityZoneFilter,RamFilter,ComputeFilter,ComputeCapabilitiesFilter,ImagePropertiesFilter,ServerGroupAntiAffinityFilter,ServerGroupAffinityFilter

# Which weight class names to use for weighing hosts (list
# value)
#scheduler_weight_classes=nova.scheduler.weights.all_weighers

# Determines if the Scheduler tracks changes to instances to
# help with its filtering decisions. (boolean value)
#scheduler_tracks_instance_changes=true


#
# Options defined in nova.scheduler.ironic_host_manager
#

# Which filter class names to use for filtering baremetal
# hosts when not specified in the request. (list value)
#baremetal_scheduler_default_filters=RetryFilter,AvailabilityZoneFilter,ComputeFilter,ComputeCapabilitiesFilter,ImagePropertiesFilter,ExactRamFilter,ExactDiskFilter,ExactCoreFilter

# Flag to decide whether to use
# baremetal_scheduler_default_filters or not. (boolean value)
#scheduler_use_baremetal_filters=false


#
# Options defined in nova.scheduler.manager
#

# Default driver to use for the scheduler (string value)
#scheduler_driver=nova.scheduler.filter_scheduler.FilterScheduler

# How often (in seconds) to run periodic tasks in the
# scheduler driver of your choice. Please note this is likely
# to interact with the value of service_down_time, but exactly
# how they interact will depend on your choice of scheduler
# driver. (integer value)
#scheduler_driver_task_period=60


#
# Options defined in nova.scheduler.rpcapi
#

# The topic scheduler nodes listen on (string value)
#scheduler_topic=scheduler


#
# Options defined in nova.scheduler.scheduler_options
#

# Absolute path to scheduler configuration JSON file. (string
# value)
#scheduler_json_config_location=


#
# Options defined in nova.scheduler.utils
#

# Maximum number of attempts to schedule an instance (integer
# value)
#scheduler_max_attempts=3


#
# Options defined in nova.scheduler.weights.io_ops
#

# Multiplier used for weighing host io ops. Negative numbers
# mean a preference to choose light workload compute hosts.
# (floating point value)
#io_ops_weight_multiplier=-1.0


#
# Options defined in nova.scheduler.weights.ram
#

# Multiplier used for weighing ram.  Negative numbers mean to
# stack vs spread. (floating point value)
#ram_weight_multiplier=1.0


#
# Options defined in nova.servicegroup.api
#

# The driver for servicegroup service (valid options are: db,
# zk, mc) (string value)
#servicegroup_driver=db


#
# Options defined in nova.virt.configdrive
#

# Config drive format. One of iso9660 (default) or vfat
# (string value)
#config_drive_format=iso9660

# Set to "always" to force injection to take place on a config
# drive. NOTE: The "always" will be deprecated in the Liberty
# release cycle. (string value)
#force_config_drive=<None>

# Name and optionally path of the tool used for ISO image
# creation (string value)
#mkisofs_cmd=genisoimage


#
# Options defined in nova.virt.disk.api
#

# Name of the mkfs commands for ephemeral device. The format
# is <os_type>=<mkfs command> (multi valued)
#virt_mkfs=

# Attempt to resize the filesystem by accessing the image over
# a block device. This is done by the host and may not be
# necessary if the image contains a recent version of cloud-
# init. Possible mechanisms require the nbd driver (for qcow
# and raw), or loop (for raw). (boolean value)
#resize_fs_using_block_device=false


#
# Options defined in nova.virt.disk.mount.nbd
#

# Amount of time, in seconds, to wait for NBD device start up.
# (integer value)
#timeout_nbd=10


#
# Options defined in nova.virt.driver
#

# Driver to use for controlling virtualization. Options
# include: libvirt.LibvirtDriver, xenapi.XenAPIDriver,
# fake.FakeDriver, baremetal.BareMetalDriver,
# vmwareapi.VMwareVCDriver, hyperv.HyperVDriver (string value)
#compute_driver=libvirt.LibvirtDriver

# The default format an ephemeral_volume will be formatted
# with on creation. (string value)
#default_ephemeral_format=<None>

# VM image preallocation mode: "none" => no storage
# provisioning is done up front, "space" => storage is fully
# allocated at instance start (string value)
#preallocate_images=none

# Whether to use cow images (boolean value)
#use_cow_images=true

# Fail instance boot if vif plugging fails (boolean value)
#vif_plugging_is_fatal=true

# Number of seconds to wait for neutron vif plugging events to
# arrive before continuing or failing (see
# vif_plugging_is_fatal). If this is set to zero and
# vif_plugging_is_fatal is False, events should not be
# expected to arrive at all. (integer value)
#vif_plugging_timeout=300


#
# Options defined in nova.virt.firewall
#

# Firewall driver (defaults to hypervisor specific iptables
# driver) (string value)
firewall_driver=nova.virt.libvirt.firewall.IptablesFirewallDriver

# Whether to allow network traffic from same network (boolean
# value)
allow_same_net_traffic=false


#
# Options defined in nova.virt.hardware
#

# Defines which pcpus that instance vcpus can use. For
# example, "4-12,^8,15" (string value)
#vcpu_pin_set=<None>


#
# Options defined in nova.virt.imagecache
#

# Number of seconds to wait between runs of the image cache
# manager. Set to -1 to disable. Setting this to 0 will run at
# the default rate. (integer value)
#image_cache_manager_interval=2400

# Where cached images are stored under $instances_path. This
# is NOT the full path - just a folder name. For per-compute-
# host cached images, set to _base_$my_ip (string value)
#image_cache_subdirectory_name=_base

# Should unused base images be removed? (boolean value)
#remove_unused_base_images=true

# Unused unresized base images younger than this will not be
# removed (integer value)
#remove_unused_original_minimum_age_seconds=86400


#
# Options defined in nova.virt.images
#

# Force backing images to raw format (boolean value)
#force_raw_images=true


#
# Options defined in nova.virt.netutils
#

# Template file for injected network (string value)
#injected_network_template=/usr/share/nova/interfaces.template


#
# Options defined in nova.vnc
#

# Location of VNC console proxy, in the form
# "http://127.0.0.1:6080/vnc_auto.html" (string value)
novncproxy_base_url=http://{{controller}}:6080/vnc_auto.html

# Location of nova xvp VNC console proxy, in the form
# "http://127.0.0.1:6081/console" (string value)
#xvpvncproxy_base_url=http://127.0.0.1:6081/console

# IP address on which instance vncservers should listen
# (string value)
vncserver_listen=0.0.0.0

# The address to which proxy clients (like nova-xvpvncproxy)
# should connect (string value)
vncserver_proxyclient_address={{management_ip}}

# Enable VNC related features (boolean value)
{{#vnc_enabled}}
vnc_enabled=true
{{/vnc_enabled}}

# Keymap for VNC (string value)
#vnc_keymap=en-us


#
# Options defined in nova.vnc.xvp_proxy
#

# Port that the XCP VNC proxy should bind to (integer value)
#xvpvncproxy_port=6081

# Address that the XCP VNC proxy should bind to (string value)
#xvpvncproxy_host=0.0.0.0


#
# Options defined in nova.volume
#

# The full class name of the volume API class to use (string
# value)
#volume_api_class=nova.volume.cinder.API


#
# Options defined in nova.openstack.common.eventlet_backdoor
#

# Enable eventlet backdoor.  Acceptable values are 0, <port>,
# and <start>:<end>, where 0 results in listening on a random
# tcp port number; <port> results in listening on the
# specified port number (and not enabling backdoor if that
# port is in use); and <start>:<end> results in listening on
# the smallest unused port number within the specified range
# of port numbers.  The chosen port is displayed in the
# service's log file. (string value)
#backdoor_port=<None>


#
# Options defined in nova.openstack.common.memorycache
#

# Memcached servers or None for in process cache. (list value)
#memcached_servers=<None>


#
# Options defined in nova.openstack.common.periodic_task
#

# Some periodic tasks can be run in a separate process. Should
# we run them here? (boolean value)
#run_external_periodic_tasks=true


#
# Options defined in nova.openstack.common.policy
#

# The JSON file that defines policies. (string value)
#policy_file=policy.json

# Default rule. Enforced when a requested rule is not found.
# (string value)
#policy_default_rule=default

# Directories where policy configuration files are stored.
# They can be relative to any directory in the search path
# defined by the config_dir option, or absolute paths. The
# file defined by policy_file must exist for these directories
# to be searched.  Missing or empty directories are ignored.
# (multi valued)
#policy_dirs=policy.d


#
# Options defined in nova.openstack.common.versionutils
#

# Enables or disables fatal status of deprecations. (boolean
# value)
#fatal_deprecations=false


[api_database]

#
# Options defined in nova.db.sqlalchemy.api
#

# The SQLAlchemy connection string to use to connect to the
# Nova API database. (string value)
#connection=mysql://nova:nova@localhost/nova

# If True, SQLite uses synchronous mode. (boolean value)
#sqlite_synchronous=true

# Timeout before idle SQL connections are reaped. (integer
# value)
#idle_timeout=3600

# Maximum number of SQL connections to keep open in a pool.
# (integer value)
#max_pool_size=<None>

# Maximum number of database connection retries during
# startup. Set to -1 to specify an infinite retry count.
# (integer value)
#max_retries=-1

# Interval between retries of opening a SQL connection.
# (integer value)
#retry_interval=10

# If set, use this value for max_overflow with SQLAlchemy.
# (integer value)
#max_overflow=<None>

# Verbosity of SQL debugging information: 0=None,
# 100=Everything. (integer value)
#connection_debug=0

# Add Python stack traces to SQL as comment strings. (boolean
# value)
#connection_trace=false

# If set, use this value for pool_timeout with SQLAlchemy.
# (integer value)
#pool_timeout=<None>


[barbican]

#
# Options defined in nova.keymgr.barbican
#

# Info to match when looking for barbican in the service
# catalog. Format is: separated values of the form:
# <service_type>:<service_name>:<endpoint_type> (string value)
#catalog_info=key-manager:barbican:public

# Override service catalog lookup with template for barbican
# endpoint e.g. http://localhost:9311/v1/%(project_id)s
# (string value)
#endpoint_template=<None>

# Region name of this node (string value)
#os_region_name=<None>


#
# Options defined in nova.volume.cinder
#

# Region name of this node (string value)
#os_region_name=<None>


[cells]

#
# Options defined in nova.cells.manager
#

# Cells communication driver to use (string value)
#driver=nova.cells.rpc_driver.CellsRPCDriver

# Number of seconds after an instance was updated or deleted
# to continue to update cells (integer value)
#instance_updated_at_threshold=3600

# Number of instances to update per periodic task run (integer
# value)
#instance_update_num_instances=1


#
# Options defined in nova.cells.messaging
#

# Maximum number of hops for cells routing. (integer value)
#max_hop_count=10

# Cells scheduler to use (string value)
#scheduler=nova.cells.scheduler.CellsScheduler


#
# Options defined in nova.cells.opts
#

# Enable cell functionality (boolean value)
#enable=false

# The topic cells nodes listen on (string value)
#topic=cells

# Manager for cells (string value)
#manager=nova.cells.manager.CellsManager

# Name of this cell (string value)
#name=nova

# Key/Multi-value list with the capabilities of the cell (list
# value)
#capabilities=hypervisor=xenserver;kvm,os=linux;windows

# Seconds to wait for response from a call to a cell. (integer
# value)
#call_timeout=60

# Percentage of cell capacity to hold in reserve. Affects both
# memory and disk utilization (floating point value)
#reserve_percent=10.0

# Type of cell: api or compute (string value)
#cell_type=compute

# Number of seconds after which a lack of capability and
# capacity updates signals the child cell is to be treated as
# a mute. (integer value)
#mute_child_interval=300

# Seconds between bandwidth updates for cells. (integer value)
#bandwidth_update_interval=600


#
# Options defined in nova.cells.rpc_driver
#

# Base queue name to use when communicating between cells.
# Various topics by message type will be appended to this.
# (string value)
#rpc_driver_queue_base=cells.intercell


#
# Options defined in nova.cells.scheduler
#

# Filter classes the cells scheduler should use.  An entry of
# "nova.cells.filters.all_filters" maps to all cells filters
# included with nova. (list value)
#scheduler_filter_classes=nova.cells.filters.all_filters

# Weigher classes the cells scheduler should use.  An entry of
# "nova.cells.weights.all_weighers" maps to all cell weighers
# included with nova. (list value)
#scheduler_weight_classes=nova.cells.weights.all_weighers

# How many retries when no cells are available. (integer
# value)
#scheduler_retries=10

# How often to retry in seconds when no cells are available.
# (integer value)
#scheduler_retry_delay=2


#
# Options defined in nova.cells.state
#

# Interval, in seconds, for getting fresh cell information
# from the database. (integer value)
#db_check_interval=60

# Configuration file from which to read cells configuration.
# If given, overrides reading cells from the database. (string
# value)
#cells_config=<None>


#
# Options defined in nova.cells.weights.mute_child
#

# Multiplier used to weigh mute children. (The value should be
# negative.) (floating point value)
#mute_weight_multiplier=-10.0

# Weight value assigned to mute children. (The value should be
# positive.) (floating point value)
#mute_weight_value=1000.0


#
# Options defined in nova.cells.weights.ram_by_instance_type
#

# Multiplier used for weighing ram.  Negative numbers mean to
# stack vs spread. (floating point value)
#ram_weight_multiplier=10.0


#
# Options defined in nova.cells.weights.weight_offset
#

# Multiplier used to weigh offset weigher. (floating point
# value)
#offset_weight_multiplier=1.0


[cinder]

#
# Options defined in nova.volume.cinder
#

# Info to match when looking for cinder in the service
# catalog. Format is: separated values of the form:
# <service_type>:<service_name>:<endpoint_type> (string value)
#catalog_info=volumev2:cinderv2:publicURL

# Override service catalog lookup with template for cinder
# endpoint e.g. http://localhost:8776/v1/%(project_id)s
# (string value)
#endpoint_template=<None>

# Number of cinderclient retries on failed http calls (integer
# value)
#http_retries=3

# Allow attach between instance and volume in different
# availability zones. (boolean value)
#cross_az_attach=true


[conductor]

#
# Options defined in nova.conductor.api
#

# Perform nova-conductor operations locally (boolean value)
#use_local=false

# The topic on which conductor nodes listen (string value)
#topic=conductor

# Full class name for the Manager for conductor (string value)
#manager=nova.conductor.manager.ConductorManager

# Number of workers for OpenStack Conductor service. The
# default will be the number of CPUs available. (integer
# value)
#workers=<None>


[database]

#
# From oslo.db
#

# The file name to use with SQLite. (string value)
# Deprecated group;name - DEFAULT;sqlite_db
#sqlite_db=oslo.sqlite

# If True, SQLite uses synchronous mode. (boolean value)
# Deprecated group;name - DEFAULT;sqlite_synchronous
#sqlite_synchronous=true

# The back end to use for the database. (string value)
# Deprecated group;name - DEFAULT;db_backend
#backend=sqlalchemy

# The SQLAlchemy connection string to use to connect to the database. (string
# value)
# Deprecated group;name - DEFAULT;sql_connection
# Deprecated group;name - [DATABASE]/sql_connection
# Deprecated group;name - [sql]/connection
#connection=<None>

# The SQLAlchemy connection string to use to connect to the slave database.
# (string value)
#slave_connection=<None>

# The SQL mode to be used for MySQL sessions. This option, including the
# default, overrides any server-set SQL mode. To use whatever SQL mode is set
# by the server configuration, set this to no value. Example: mysql_sql_mode=
# (string value)
#mysql_sql_mode=TRADITIONAL

# Timeout before idle SQL connections are reaped. (integer value)
# Deprecated group;name - DEFAULT;sql_idle_timeout
# Deprecated group;name - [DATABASE]/sql_idle_timeout
# Deprecated group;name - [sql]/idle_timeout
#idle_timeout=3600

# Minimum number of SQL connections to keep open in a pool. (integer value)
# Deprecated group;name - DEFAULT;sql_min_pool_size
# Deprecated group;name - [DATABASE]/sql_min_pool_size
#min_pool_size=1

# Maximum number of SQL connections to keep open in a pool. (integer value)
# Deprecated group;name - DEFAULT;sql_max_pool_size
# Deprecated group;name - [DATABASE]/sql_max_pool_size
#max_pool_size=<None>

# Maximum number of database connection retries during startup. Set to -1 to
# specify an infinite retry count. (integer value)
# Deprecated group;name - DEFAULT;sql_max_retries
# Deprecated group;name - [DATABASE]/sql_max_retries
#max_retries=10

# Interval between retries of opening a SQL connection. (integer value)
# Deprecated group;name - DEFAULT;sql_retry_interval
# Deprecated group;name - [DATABASE]/reconnect_interval
#retry_interval=10

# If set, use this value for max_overflow with SQLAlchemy. (integer value)
# Deprecated group;name - DEFAULT;sql_max_overflow
# Deprecated group;name - [DATABASE]/sqlalchemy_max_overflow
#max_overflow=<None>

# Verbosity of SQL debugging information: 0=None, 100=Everything. (integer
# value)
# Deprecated group;name - DEFAULT;sql_connection_debug
#connection_debug=0

# Add Python stack traces to SQL as comment strings. (boolean value)
# Deprecated group;name - DEFAULT;sql_connection_trace
#connection_trace=false

# If set, use this value for pool_timeout with SQLAlchemy. (integer value)
# Deprecated group;name - [DATABASE]/sqlalchemy_pool_timeout
#pool_timeout=<None>

# Enable the experimental use of database reconnect on connection lost.
# (boolean value)
#use_db_reconnect=false

# Seconds between retries of a database transaction. (integer value)
#db_retry_interval=1

# If True, increases the interval between retries of a database operation up to
# db_max_retry_interval. (boolean value)
#db_inc_retry_interval=true

# If db_inc_retry_interval is set, the maximum seconds between retries of a
# database operation. (integer value)
#db_max_retry_interval=10

# Maximum retries in case of connection error or deadlock error before error is
# raised. Set to -1 to specify an infinite retry count. (integer value)
#db_max_retries=20


#
# Options defined in nova.db.sqlalchemy.api
#

# The SQLAlchemy connection string to use to connect to the
# slave database. (string value)
#slave_connection=<None>

# The SQL mode to be used for MySQL sessions. This option,
# including the default, overrides any server-set SQL mode. To
# use whatever SQL mode is set by the server configuration,
# set this to no value. Example: mysql_sql_mode= (string
# value)
#mysql_sql_mode=TRADITIONAL


[ephemeral_storage_encryption]

#
# Options defined in nova.compute.api
#

# Whether to encrypt ephemeral storage (boolean value)
#enabled=false

# The cipher and mode to be used to encrypt ephemeral storage.
# Which ciphers are available ciphers depends on kernel
# support. See /proc/crypto for the list of available options.
# (string value)
#cipher=aes-xts-plain64

# The bit length of the encryption key to be used to encrypt
# ephemeral storage (in XTS mode only half of the bits are
# used for encryption key) (integer value)
#key_size=512


[glance]

#
# Options defined in nova.image.glance
#

# Default glance hostname or IP address (string value)
host={{controller}}

# Default glance port (integer value)
#port=9292

# Default protocol to use when connecting to glance. Set to
# https for SSL. (string value)
#protocol=http

# A list of the glance api servers available to nova. Prefix
# with https:// for ssl-based glance api servers.
# ([hostname|ip]:port) (list value)
#api_servers=<None>

# Allow to perform insecure SSL (https) requests to glance
# (boolean value)
#api_insecure=false

# Number of retries when uploading / downloading an image to /
# from glance. (integer value)
#num_retries=0

# A list of url scheme that can be downloaded directly via the
# direct_url.  Currently supported schemes: [file]. (list
# value)
#allowed_direct_url_schemes=


[guestfs]

#
# Options defined in nova.virt.disk.vfs.guestfs
#

# Enable guestfs debug (boolean value)
#debug=false


[hyperv]

#
# Options defined in nova.virt.hyperv.pathutils
#

# The name of a Windows share name mapped to the
# "instances_path" dir and used by the resize feature to copy
# files to the target host. If left blank, an administrative
# share will be used, looking for the same "instances_path"
# used locally (string value)
#instances_path_share=


#
# Options defined in nova.virt.hyperv.utilsfactory
#

# Force V1 WMI utility classes (boolean value)
#force_hyperv_utils_v1=false

# Force V1 volume utility class (boolean value)
#force_volumeutils_v1=false


#
# Options defined in nova.virt.hyperv.vif
#

# External virtual switch Name, if not provided, the first
# external virtual switch is used (string value)
#vswitch_name=<None>


#
# Options defined in nova.virt.hyperv.vmops
#

# Required for live migration among hosts with different CPU
# features (boolean value)
#limit_cpu_features=false

# Sets the admin password in the config drive image (boolean
# value)
#config_drive_inject_password=false

# Path of qemu-img command which is used to convert between
# different image types (string value)
#qemu_img_cmd=qemu-img.exe

# Attaches the Config Drive image as a cdrom drive instead of
# a disk drive (boolean value)
#config_drive_cdrom=false

# Enables metrics collections for an instance by using
# Hyper-V's metric APIs. Collected data can by retrieved by
# other apps and services, e.g.: Ceilometer. Requires Hyper-V
# / Windows Server 2012 and above (boolean value)
#enable_instance_metrics_collection=false

# Enables dynamic memory allocation (ballooning) when set to a
# value greater than 1. The value expresses the ratio between
# the total RAM assigned to an instance and its startup RAM
# amount. For example a ratio of 2.0 for an instance with
# 1024MB of RAM implies 512MB of RAM allocated at startup
# (floating point value)
#dynamic_memory_ratio=1.0

# Number of seconds to wait for instance to shut down after
# soft reboot request is made. We fall back to hard reboot if
# instance does not shutdown within this window. (integer
# value)
#wait_soft_reboot_seconds=60


#
# Options defined in nova.virt.hyperv.volumeops
#

# The number of times to retry to attach a volume (integer
# value)
#volume_attach_retry_count=10

# Interval between volume attachment attempts, in seconds
# (integer value)
#volume_attach_retry_interval=5

# The number of times to retry checking for a disk mounted via
# iSCSI. (integer value)
#mounted_disk_query_retry_count=10

# Interval between checks for a mounted iSCSI disk, in
# seconds. (integer value)
#mounted_disk_query_retry_interval=5


[image_file_url]

#
# Options defined in nova.image.download.file
#

# List of file systems that are configured in this file in the
# image_file_url:<list entry name> sections (list value)
#filesystems=


[ironic]

#
# Options defined in nova.virt.ironic.driver
#

# Version of Ironic API service endpoint. (integer value)
#api_version=1

# URL for Ironic API endpoint. (string value)
#api_endpoint=<None>

# Ironic keystone admin name (string value)
#admin_username=<None>

# Ironic keystone admin password. (string value)
#admin_password=%SERVICE_PASSWORD%

# Ironic keystone auth token. (string value)
#admin_auth_token=<None>

# Keystone public API endpoint. (string value)
#admin_url=<None>

# Log level override for ironicclient. Set this in order to
# override the global "default_log_levels", "verbose", and
# "debug" settings. DEPRECATED: use standard logging
# configuration. (string value)
#client_log_level=<None>

# Ironic keystone tenant name. (string value)
#admin_tenant_name=%SERVICE_TENANT_NAME%

# How many retries when a request does conflict. (integer
# value)
#api_max_retries=60

# How often to retry in seconds when a request does conflict
# (integer value)
#api_retry_interval=2


[keymgr]

#
# Options defined in nova.keymgr
#

# The full class name of the key manager API class (string
# value)
#api_class=nova.keymgr.conf_key_mgr.ConfKeyManager


#
# Options defined in nova.keymgr.conf_key_mgr
#

# Fixed key returned by key manager, specified in hex (string
# value)
#fixed_key=<None>


[keystone_authtoken]

#
# From keystonemiddleware.auth_token
#

# Complete public Identity API endpoint. (string value)
auth_uri = http://{{controller}}:5000
auth_url = http://{{controller}}:35357

auth_plugin = password
project_domain_id = default
user_domain_id = default
project_name = service
username = {{keystone.user}}
password = {{keystone.password}}

# API version of the admin Identity API endpoint. (string value)
#auth_version=v2.0

# Do not handle authorization requests within the middleware, but delegate the
# authorization decision to downstream WSGI components. (boolean value)
#delay_auth_decision=false

# Request timeout value for communicating with Identity API server. (integer
# value)
#http_connect_timeout=<None>

# How many times are we trying to reconnect when communicating with Identity
# API Server. (integer value)
#http_request_max_retries=3

# Env key for the swift cache. (string value)
#cache=<None>

# Required if identity server requires client certificate (string value)
#certfile=<None>

# Required if identity server requires client certificate (string value)
#keyfile=<None>

# A PEM encoded Certificate Authority to use when verifying HTTPs connections.
# Defaults to system CAs. (string value)
#cafile=<None>

# Verify HTTPS connections. (boolean value)
#insecure=false

# Directory used to cache files related to PKI tokens. (string value)
#signing_dir=<None>

# Optionally specify a list of memcached server(s) to use for caching. If left
# undefined, tokens will instead be cached in-process. (list value)
# Deprecated group;name - DEFAULT;memcache_servers
#memcached_servers=<None>

# In order to prevent excessive effort spent validating tokens, the middleware
# caches previously-seen tokens for a configurable duration (in seconds). Set
# to -1 to disable caching completely. (integer value)
#token_cache_time=300

# Determines the frequency at which the list of revoked tokens is retrieved
# from the Identity service (in seconds). A high number of revocation events
# combined with a low cache duration may significantly reduce performance.
# (integer value)
#revocation_cache_time=10

# (Optional) If defined, indicate whether token data should be authenticated or
# authenticated and encrypted. Acceptable values are MAC or ENCRYPT.  If MAC,
# token data is authenticated (with HMAC) in the cache. If ENCRYPT, token data
# is encrypted and authenticated in the cache. If the value is not one of these
# options or empty, auth_token will raise an exception on initialization.
# (string value)
#memcache_security_strategy=<None>

# (Optional, mandatory if memcache_security_strategy is defined) This string is
# used for key derivation. (string value)
#memcache_secret_key=<None>

# (Optional) Number of seconds memcached server is considered dead before it is
# tried again. (integer value)
#memcache_pool_dead_retry=300

# (Optional) Maximum total number of open connections to every memcached
# server. (integer value)
#memcache_pool_maxsize=10

# (Optional) Socket timeout in seconds for communicating with a memcache
# server. (integer value)
#memcache_pool_socket_timeout=3

# (Optional) Number of seconds a connection to memcached is held unused in the
# pool before it is closed. (integer value)
#memcache_pool_unused_timeout=60

# (Optional) Number of seconds that an operation will wait to get a memcache
# client connection from the pool. (integer value)
#memcache_pool_conn_get_timeout=10

# (Optional) Use the advanced (eventlet safe) memcache client pool. The
# advanced pool will only work under python 2.x. (boolean value)
#memcache_use_advanced_pool=false

# (Optional) Indicate whether to set the X-Service-Catalog header. If False,
# middleware will not ask for service catalog on token validation and will not
# set the X-Service-Catalog header. (boolean value)
#include_service_catalog=true

# Used to control the use and type of token binding. Can be set to: "disabled"
# to not check token binding. "permissive" (default) to validate binding
# information if the bind type is of a form known to the server and ignore it
# if not. "strict" like "permissive" but if the bind type is unknown the token
# will be rejected. "required" any form of token binding is needed to be
# allowed. Finally the name of a binding method that must be present in tokens.
# (string value)
#enforce_token_bind=permissive

# If true, the revocation list will be checked for cached tokens. This requires
# that PKI tokens are configured on the identity server. (boolean value)
#check_revocations_for_cached=false

# Hash algorithms to use for hashing PKI tokens. This may be a single algorithm
# or multiple. The algorithms are those supported by Python standard
# hashlib.new(). The hashes will be tried in the order given, so put the
# preferred one first for performance. The result of the first hash will be
# stored in the cache. This will typically be set to multiple values only while
# migrating from a less secure algorithm to a more secure one. Once all the old
# tokens are expired this option should be set to a single value for better
# performance. (list value)
#hash_algorithms=md5

# Prefix to prepend at the beginning of the path. Deprecated, use identity_uri.
# (string value)
#auth_admin_prefix =

# Host providing the admin Identity API endpoint. Deprecated, use identity_uri.
# (string value)
#auth_host=127.0.0.1

# Port of the admin Identity API endpoint. Deprecated, use identity_uri.
# (integer value)
#auth_port=35357

# Protocol of the admin Identity API endpoint (http or https). Deprecated, use
# identity_uri. (string value)
#auth_protocol=http

# Complete admin Identity API endpoint. This should specify the unversioned
# root endpoint e.g. https://localhost:35357/ (string value)
#identity_uri=<None>

# This option is deprecated and may be removed in a future release. Single
# shared secret with the Keystone configuration used for bootstrapping a
# Keystone installation, or otherwise bypassing the normal authentication
# process. This option should not be used, use `admin_user` and
# `admin_password` instead. (string value)
#admin_token=<None>

# Service username. (string value)
#admin_user=%SERVICE_USER%

# Service user password. (string value)
#admin_password=<None>

# Service tenant name. (string value)
#admin_tenant_name=admin


[libvirt]

#
# Options defined in nova.virt.libvirt.driver
#

# Rescue ami image. This will not be used if an image id is
# provided by the user. (string value)
#rescue_image_id=<None>

# Rescue aki image (string value)
#rescue_kernel_id=<None>

# Rescue ari image (string value)
#rescue_ramdisk_id=<None>

# Libvirt domain type (valid options are: kvm, lxc, qemu, uml,
# xen and parallels) (string value)
virt_type={{virt_type}}

# Override the default libvirt URI (which is dependent on
# virt_type) (string value)
#connection_uri=

# Inject the admin password at boot time, without an agent.
# (boolean value)
#inject_password=false

# Inject the ssh public key at boot time (boolean value)
#inject_key=false

# The partition to inject to : -2 => disable, -1 => inspect
# (libguestfs only), 0 => not partitioned, >0 => partition
# number (integer value)
#inject_partition=-2

# Sync virtual and real mouse cursors in Windows VMs (boolean
# value)
#use_usb_tablet=true

# Migration target URI (any included "%s" is replaced with the
# migration target hostname) (string value)
#live_migration_uri=qemu+tcp://%s/system

# Migration flags to be set for live migration (string value)
#live_migration_flag=VIR_MIGRATE_UNDEFINE_SOURCE, VIR_MIGRATE_PEER2PEER, VIR_MIGRATE_LIVE, VIR_MIGRATE_TUNNELLED

# Migration flags to be set for block migration (string value)
#block_migration_flag=VIR_MIGRATE_UNDEFINE_SOURCE, VIR_MIGRATE_PEER2PEER, VIR_MIGRATE_LIVE, VIR_MIGRATE_TUNNELLED, VIR_MIGRATE_NON_SHARED_INC

# Maximum bandwidth to be used during migration, in Mbps
# (integer value)
#live_migration_bandwidth=0

# Snapshot image format (valid options are : raw, qcow2, vmdk,
# vdi). Defaults to same as source image (string value)
#snapshot_image_format=<None>

# Override the default disk prefix for the devices attached to
# a server, which is dependent on virt_type. (valid options
# are: sd, xvd, uvd, vd) (string value)
#disk_prefix=<None>

# Number of seconds to wait for instance to shut down after
# soft reboot request is made. We fall back to hard reboot if
# instance does not shutdown within this window. (integer
# value)
#wait_soft_reboot_seconds=120

# Set to "host-model" to clone the host CPU feature flags; to
# "host-passthrough" to use the host CPU model exactly; to
# "custom" to use a named CPU model; to "none" to not set any
# CPU model. If virt_type="kvm|qemu", it will default to
# "host-model", otherwise it will default to "none" (string
# value)
#cpu_mode=<None>

# Set to a named libvirt CPU model (see names listed in
# /usr/share/libvirt/cpu_map.xml). Only has effect if
# cpu_mode="custom" and virt_type="kvm|qemu" (string value)
#cpu_model=<None>

# Location where libvirt driver will store snapshots before
# uploading them to image service (string value)
#snapshots_directory=$instances_path/snapshots

# Location where the Xen hvmloader is kept (string value)
#xen_hvmloader_path=/usr/lib/xen/boot/hvmloader

# Specific cachemodes to use for different disk types e.g:
# file=directsync,block=none (list value)
#disk_cachemodes=

# A path to a device that will be used as source of entropy on
# the host. Permitted options are: /dev/random or /dev/hwrng
# (string value)
#rng_dev_path=<None>

# For qemu or KVM guests, set this option to specify a default
# machine type per host architecture. You can find a list of
# supported machine types in your environment by checking the
# output of the "virsh capabilities"command. The format of the
# value for this config option is host-arch=machine-type. For
# example: x86_64=machinetype1,armv7l=machinetype2 (list
# value)
#hw_machine_type=<None>

# The data source used to the populate the host "serial" UUID
# exposed to guest in the virtual BIOS. Permitted options are
# "hardware", "os", "none" or "auto" (default). (string value)
#sysinfo_serial=auto

# A number of seconds to memory usage statistics period. Zero
# or negative value mean to disable memory usage statistics.
# (integer value)
#mem_stats_period_seconds=10

# List of uid targets and ranges.Syntax is guest-uid:host-
# uid:countMaximum of 5 allowed. (list value)
#uid_maps=

# List of guid targets and ranges.Syntax is guest-gid:host-
# gid:countMaximum of 5 allowed. (list value)
#gid_maps=


#
# Options defined in nova.virt.libvirt.imagebackend
#

# VM Images format. Acceptable values are: raw, qcow2, lvm,
# rbd, default. If default is specified, then use_cow_images
# flag is used instead of this one. (string value)
#images_type=default

# LVM Volume Group that is used for VM images, when you
# specify images_type=lvm. (string value)
#images_volume_group=<None>

# Create sparse logical volumes (with virtualsize) if this
# flag is set to True. (boolean value)
#sparse_logical_volumes=false

# The RADOS pool in which rbd volumes are stored (string
# value)
#images_rbd_pool=rbd

# Path to the ceph configuration file to use (string value)
#images_rbd_ceph_conf=

# Discard option for nova managed disks (valid options are:
# ignore, unmap). Need Libvirt(1.0.6) Qemu1.5 (raw format)
# Qemu1.6(qcow2 format) (string value)
#hw_disk_discard=<None>


#
# Options defined in nova.virt.libvirt.imagecache
#

# Allows image information files to be stored in non-standard
# locations (string value)
#image_info_filename_pattern=$instances_path/$image_cache_subdirectory_name/%(image)s.info

# Should unused kernel images be removed? This is only safe to
# enable if all compute nodes have been updated to support
# this option. This will be enabled by default in future.
# (boolean value)
#remove_unused_kernels=false

# Unused resized base images younger than this will not be
# removed (integer value)
#remove_unused_resized_minimum_age_seconds=3600

# Write a checksum for files in _base to disk (boolean value)
#checksum_base_images=false

# How frequently to checksum base images (integer value)
#checksum_interval_seconds=3600


#
# Options defined in nova.virt.libvirt.lvm
#

# Method used to wipe old volumes (valid options are: none,
# zero, shred) (string value)
#volume_clear=zero

# Size in MiB to wipe at start of old volumes. 0 => all
# (integer value)
#volume_clear_size=0


#
# Options defined in nova.virt.libvirt.utils
#

# Compress snapshot images when possible. This currently
# applies exclusively to qcow2 images (boolean value)
#snapshot_compression=false


#
# Options defined in nova.virt.libvirt.vif
#

# Use virtio for bridge interfaces with KVM/QEMU (boolean
# value)
#use_virtio_for_bridges=true


#
# Options defined in nova.virt.libvirt.volume
#

# Number of times to rescan iSCSI target to find volume
# (integer value)
#num_iscsi_scan_tries=5

# Number of times to rescan iSER target to find volume
# (integer value)
#num_iser_scan_tries=5

# The RADOS client name for accessing rbd volumes (string
# value)
#rbd_user=<None>

# The libvirt UUID of the secret for the rbd_uservolumes
# (string value)
#rbd_secret_uuid=<None>

# Directory where the NFS volume is mounted on the compute
# node (string value)
#nfs_mount_point_base=$state_path/mnt

# Mount options passed to the NFS client. See section of the
# nfs man page for details (string value)
#nfs_mount_options=<None>

# Directory where the SMBFS shares are mounted on the compute
# node (string value)
#smbfs_mount_point_base=$state_path/mnt

# Mount options passed to the SMBFS client. See mount.cifs man
# page for details. Note that the libvirt-qemu uid and gid
# must be specified. (string value)
#smbfs_mount_options=

# Number of times to rediscover AoE target to find volume
# (integer value)
#num_aoe_discover_tries=3

# Directory where the glusterfs volume is mounted on the
# compute node (string value)
#glusterfs_mount_point_base=$state_path/mnt

# Use multipath connection of the iSCSI volume (boolean value)
#iscsi_use_multipath=false

# Use multipath connection of the iSER volume (boolean value)
#iser_use_multipath=false

# Path or URL to Scality SOFS configuration file (string
# value)
#scality_sofs_config=<None>

# Base dir where Scality SOFS shall be mounted (string value)
#scality_sofs_mount_point=$state_path/scality

# Protocols listed here will be accessed directly from QEMU.
# Currently supported protocols: [gluster] (list value)
#qemu_allowed_storage_drivers=

# Directory where the Quobyte volume is mounted on the compute
# node (string value)
#quobyte_mount_point_base=$state_path/mnt

# Path to a Quobyte Client configuration file. (string value)
#quobyte_client_cfg=<None>

# The iSCSI transport iface to use to connect to target in
# case offload support is desired. Supported transports are
# be2iscsi, bnx2i, cxgb3i, cxgb4i, qla4xxx and ocs. Default
# format is transport_name.hwaddress and can be generated
# manually or via iscsiadm -m iface (string value)
# Deprecated group;name - DEFAULT;iscsi_transport
#iscsi_iface=<None>


[metrics]

#
# Options defined in nova.scheduler.weights.metrics
#

# Multiplier used for weighing metrics. (floating point value)
#weight_multiplier=1.0

# How the metrics are going to be weighed. This should be in
# the form of "<name1>=<ratio1>, <name2>=<ratio2>, ...", where
# <nameX> is one of the metrics to be weighed, and <ratioX> is
# the corresponding ratio. So for "name1=1.0, name2=-1.0" The
# final weight would be name1.value * 1.0 + name2.value *
# -1.0. (list value)
#weight_setting=

# How to treat the unavailable metrics. When a metric is NOT
# available for a host, if it is set to be True, it would
# raise an exception, so it is recommended to use the
# scheduler filter MetricFilter to filter out those hosts. If
# it is set to be False, the unavailable metric would be
# treated as a negative factor in weighing process, the
# returned value would be set by the option
# weight_of_unavailable. (boolean value)
#required=true

# The final weight value to be returned if required is set to
# False and any one of the metrics set by weight_setting is
# unavailable. (floating point value)
#weight_of_unavailable=-10000.0


[neutron]

#
# Options defined in nova.api.metadata.handler
#

# Set flag to indicate Neutron will proxy metadata requests
# and resolve instance ids. (boolean value)
#service_metadata_proxy=false

# Shared secret to validate proxies Neutron metadata requests
# (string value)
#metadata_proxy_shared_secret=


#
# Options defined in nova.network.neutronv2.api
#

# URL for connecting to neutron (string value)
#url=http://127.0.0.1:9696

# User id for connecting to neutron in admin context.
# DEPRECATED: specify an auth_plugin and appropriate
# credentials instead. (string value)
#admin_user_id=<None>

# Username for connecting to neutron in admin context
# DEPRECATED: specify an auth_plugin and appropriate
# credentials instead. (string value)
#admin_username=<None>

# Password for connecting to neutron in admin context
# DEPRECATED: specify an auth_plugin and appropriate
# credentials instead. (string value)
#admin_password=<None>

# Tenant id for connecting to neutron in admin context
# DEPRECATED: specify an auth_plugin and appropriate
# credentials instead. (string value)
#admin_tenant_id=<None>

# Tenant name for connecting to neutron in admin context. This
# option will be ignored if neutron_admin_tenant_id is set.
# Note that with Keystone V3 tenant names are only unique
# within a domain. DEPRECATED: specify an auth_plugin and
# appropriate credentials instead. (string value)
#admin_tenant_name=<None>

# Region name for connecting to neutron in admin context
# (string value)
#region_name=<None>

# Authorization URL for connecting to neutron in admin
# context. DEPRECATED: specify an auth_plugin and appropriate
# credentials instead. (string value)
#admin_auth_url=http://localhost:5000/v2.0

# Authorization strategy for connecting to neutron in admin
# context. DEPRECATED: specify an auth_plugin and appropriate
# credentials instead. If an auth_plugin is specified strategy
# will be ignored. (string value)
#auth_strategy=keystone

# Name of Integration Bridge used by Open vSwitch (string
# value)
#ovs_bridge=br-int

# Number of seconds before querying neutron for extensions
# (integer value)
#extension_sync_interval=600

# DEPRECATED: Allow an instance to have multiple vNICs
# attached to the same Neutron network. This option is
# deprecated in the 2015.1 release and will be removed in the
# 2015.2 release where the default behavior will be to always
# allow multiple ports from the same network to be attached to
# an instance. (boolean value)
#allow_duplicate_networks=false


[osapi_v3]

#
# Options defined in nova.api.openstack
#

# Whether the V3 API is enabled or not (boolean value)
#enabled=false

# A list of v3 API extensions to never load. Specify the
# extension aliases here. (list value)
#extensions_blacklist=

# If the list is not empty then a v3 API extension will only
# be loaded if it exists in this list. Specify the extension
# aliases here. (list value)
#extensions_whitelist=


[rdp]

#
# Options defined in nova.rdp
#

# Location of RDP html5 console proxy, in the form
# "http://127.0.0.1:6083/" (string value)
#html5_proxy_base_url=http://127.0.0.1:6083/

# Enable RDP related features (boolean value)
#enabled=false


[serial_console]

#
# Options defined in nova.cmd.serialproxy
#

# Host on which to listen for incoming requests (string value)
#serialproxy_host=0.0.0.0

# Port on which to listen for incoming requests (integer
# value)
#serialproxy_port=6083


#
# Options defined in nova.console.serial
#

# Enable serial console related features (boolean value)
#enabled=false

# Range of TCP ports to use for serial ports on compute hosts
# (string value)
#port_range=10000:20000

# Location of serial console proxy. (string value)
#base_url=ws://127.0.0.1:6083/

# IP address on which instance serial console should listen
# (string value)
#listen=127.0.0.1

# The address to which proxy clients (like nova-serialproxy)
# should connect (string value)
#proxyclient_address=127.0.0.1


[spice]

#
# Options defined in nova.cmd.spicehtml5proxy
#

# Host on which to listen for incoming requests (string value)
#html5proxy_host=0.0.0.0

# Port on which to listen for incoming requests (integer
# value)
#html5proxy_port=6082


#
# Options defined in nova.spice
#

# Location of spice HTML5 console proxy, in the form
# "http://127.0.0.1:6082/spice_auto.html" (string value)
#html5proxy_base_url=http://127.0.0.1:6082/spice_auto.html

# IP address on which instance spice server should listen
# (string value)
#server_listen=127.0.0.1

# The address to which proxy clients (like nova-
# spicehtml5proxy) should connect (string value)
#server_proxyclient_address=127.0.0.1

# Enable spice related features (boolean value)
#enabled=false

# Enable spice guest agent support (boolean value)
#agent_enabled=true

# Keymap for spice (string value)
#keymap=en-us


[ssl]

#
# Options defined in nova.openstack.common.sslutils
#

# CA certificate file to use to verify connecting clients.
# (string value)
#ca_file=<None>

# Certificate file to use when starting the server securely.
# (string value)
#cert_file=<None>

# Private key file to use when starting the server securely.
# (string value)
#key_file=<None>


[trusted_computing]

#
# Options defined in nova.scheduler.filters.trusted_filter
#

# Attestation server HTTP (string value)
#attestation_server=<None>

# Attestation server Cert file for Identity verification
# (string value)
#attestation_server_ca_file=<None>

# Attestation server port (string value)
#attestation_port=8443

# Attestation web API URL (string value)
#attestation_api_url=/OpenAttestationWebServices/V1.0

# Attestation authorization blob - must change (string value)
#attestation_auth_blob=<None>

# Attestation status cache valid period length (integer value)
#attestation_auth_timeout=60

# Disable SSL cert verification for Attestation service
# (boolean value)
#attestation_insecure_ssl=false


[upgrade_levels]

#
# Options defined in nova.baserpc
#

# Set a version cap for messages sent to the base api in any
# service (string value)
#baseapi=<None>


#
# Options defined in nova.cells.rpc_driver
#

# Set a version cap for messages sent between cells services
# (string value)
#intercell=<None>


#
# Options defined in nova.cells.rpcapi
#

# Set a version cap for messages sent to local cells services
# (string value)
#cells=<None>


#
# Options defined in nova.cert.rpcapi
#

# Set a version cap for messages sent to cert services (string
# value)
#cert=<None>


#
# Options defined in nova.compute.rpcapi
#

# Set a version cap for messages sent to compute services. If
# you plan to do a live upgrade from havana to icehouse, you
# should set this option to "icehouse-compat" before beginning
# the live upgrade procedure. (string value)
#compute=<None>


#
# Options defined in nova.conductor.rpcapi
#

# Set a version cap for messages sent to conductor services
# (string value)
#conductor=<None>


#
# Options defined in nova.console.rpcapi
#

# Set a version cap for messages sent to console services
# (string value)
#console=<None>


#
# Options defined in nova.consoleauth.rpcapi
#

# Set a version cap for messages sent to consoleauth services
# (string value)
#consoleauth=<None>


#
# Options defined in nova.network.rpcapi
#

# Set a version cap for messages sent to network services
# (string value)
#network=<None>


#
# Options defined in nova.scheduler.rpcapi
#

# Set a version cap for messages sent to scheduler services
# (string value)
#scheduler=<None>


[vmware]

#
# Options defined in nova.virt.vmwareapi.driver
#

# The PBM status. (boolean value)
#pbm_enabled=false

# PBM service WSDL file location URL. e.g.
# file:///opt/SDK/spbm/wsdl/pbmService.wsdl Not setting this
# will disable storage policy based placement of instances.
# (string value)
#pbm_wsdl_location=<None>

# The PBM default policy. If pbm_wsdl_location is set and
# there is no defined storage policy for the specific request
# then this policy will be used. (string value)
#pbm_default_policy=<None>

# Hostname or IP address for connection to VMware VC host.
# (string value)
#host_ip=<None>

# Port for connection to VMware VC host. (integer value)
#host_port=443

# Username for connection to VMware VC host. (string value)
#host_username=<None>

# Password for connection to VMware VC host. (string value)
#host_password=<None>

# Name of a VMware Cluster ComputeResource. (multi valued)
#cluster_name=<None>

# Regex to match the name of a datastore. (string value)
#datastore_regex=<None>

# The interval used for polling of remote tasks. (floating
# point value)
#task_poll_interval=0.5

# The number of times we retry on failures, e.g., socket
# error, etc. (integer value)
#api_retry_count=10

# VNC starting port (integer value)
#vnc_port=5900

# Total number of VNC ports (integer value)
#vnc_port_total=10000

# Whether to use linked clone (boolean value)
#use_linked_clone=true

# Optional VIM Service WSDL Location e.g
# http://<server>/vimService.wsdl. Optional over-ride to
# default location for bug work-arounds (string value)
#wsdl_location=<None>


#
# Options defined in nova.virt.vmwareapi.vif
#

# Physical ethernet adapter name for vlan networking (string
# value)
#vlan_interface=vmnic0

# Name of Integration Bridge (string value)
#integration_bridge=br-int


#
# Options defined in nova.virt.vmwareapi.vim_util
#

# The maximum number of ObjectContent data objects that should
# be returned in a single result. A positive value will cause
# the operation to suspend the retrieval when the count of
# objects reaches the specified maximum. The server may still
# limit the count to something less than the configured value.
# Any remaining objects may be retrieved with additional
# requests. (integer value)
#maximum_objects=100


#
# Options defined in nova.virt.vmwareapi.vmops
#

# The prefix for Where cached images are stored. This is NOT
# the full path - just a folder prefix. This should only be
# used when a datastore cache should be shared between compute
# nodes. Note: this should only be used when the compute nodes
# have a shared file system. (string value)
#cache_prefix=<None>


[workarounds]

#
# Options defined in nova.utils
#

# This option allows a fallback to sudo for performance
# reasons. For example see
# https://bugs.launchpad.net/nova/+bug/1415106 (boolean value)
#disable_rootwrap=false

# When using libvirt 1.2.2 fails live snapshots intermittently
# under load.  This config option provides mechanism to
# disable livesnapshot while this is resolved.  See
# https://bugs.launchpad.net/nova/+bug/1334398 (boolean value)
#disable_libvirt_livesnapshot=true

# Whether to destroy instances on startup when we suspect they
# have previously been evacuated. This can result in data loss
# if undesired. See https://launchpad.net/bugs/1419785
# (boolean value)
#destroy_after_evacuate=true


[xenserver]

#
# Options defined in nova.virt.xenapi.agent
#

# Number of seconds to wait for agent reply (integer value)
#agent_timeout=30

# Number of seconds to wait for agent to be fully operational
# (integer value)
#agent_version_timeout=300

# Number of seconds to wait for agent reply to resetnetwork
# request (integer value)
#agent_resetnetwork_timeout=60

# Specifies the path in which the XenAPI guest agent should be
# located. If the agent is present, network configuration is
# not injected into the image. Used if
# compute_driver=xenapi.XenAPIDriver and flat_injected=True
# (string value)
#agent_path=usr/sbin/xe-update-networking

# Disables the use of the XenAPI agent in any image regardless
# of what image properties are present. (boolean value)
#disable_agent=false

# Determines if the XenAPI agent should be used when the image
# used does not contain a hint to declare if the agent is
# present or not. The hint is a glance property
# "xenapi_use_agent" that has the value "True" or "False".
# Note that waiting for the agent when it is not present will
# significantly increase server boot times. (boolean value)
#use_agent_default=false


#
# Options defined in nova.virt.xenapi.client.session
#

# Timeout in seconds for XenAPI login. (integer value)
#login_timeout=10

# Maximum number of concurrent XenAPI connections. Used only
# if compute_driver=xenapi.XenAPIDriver (integer value)
#connection_concurrent=5


#
# Options defined in nova.virt.xenapi.driver
#

# URL for connection to XenServer/Xen Cloud Platform. A
# special value of unix://local can be used to connect to the
# local unix socket.  Required if
# compute_driver=xenapi.XenAPIDriver (string value)
#connection_url=<None>

# Username for connection to XenServer/Xen Cloud Platform.
# Used only if compute_driver=xenapi.XenAPIDriver (string
# value)
#connection_username=root

# Password for connection to XenServer/Xen Cloud Platform.
# Used only if compute_driver=xenapi.XenAPIDriver (string
# value)
#connection_password=<None>

# The interval used for polling of coalescing vhds. Used only
# if compute_driver=xenapi.XenAPIDriver (floating point value)
#vhd_coalesce_poll_interval=5.0

# Ensure compute service is running on host XenAPI connects
# to. (boolean value)
#check_host=true

# Max number of times to poll for VHD to coalesce. Used only
# if compute_driver=xenapi.XenAPIDriver (integer value)
#vhd_coalesce_max_attempts=20

# Base path to the storage repository (string value)
#sr_base_path=/var/run/sr-mount

# The iSCSI Target Host (string value)
#target_host=<None>

# The iSCSI Target Port, default is port 3260 (string value)
#target_port=3260

# IQN Prefix (string value)
#iqn_prefix=iqn.2010-10.org.openstack

# Used to enable the remapping of VBD dev (Works around an
# issue in Ubuntu Maverick) (boolean value)
#remap_vbd_dev=false

# Specify prefix to remap VBD dev to (ex. /dev/xvdb ->
# /dev/sdb) (string value)
#remap_vbd_dev_prefix=sd


#
# Options defined in nova.virt.xenapi.image.bittorrent
#

# Base URL for torrent files. (string value)
#torrent_base_url=<None>

# Probability that peer will become a seeder. (1.0 = 100%)
# (floating point value)
#torrent_seed_chance=1.0

# Number of seconds after downloading an image via BitTorrent
# that it should be seeded for other peers. (integer value)
#torrent_seed_duration=3600

# Cached torrent files not accessed within this number of
# seconds can be reaped (integer value)
#torrent_max_last_accessed=86400

# Beginning of port range to listen on (integer value)
#torrent_listen_port_start=6881

# End of port range to listen on (integer value)
#torrent_listen_port_end=6891

# Number of seconds a download can remain at the same progress
# percentage w/o being considered a stall (integer value)
#torrent_download_stall_cutoff=600

# Maximum number of seeder processes to run concurrently
# within a given dom0. (-1 = no limit) (integer value)
#torrent_max_seeder_processes_per_host=1


#
# Options defined in nova.virt.xenapi.pool
#

# To use for hosts with different CPUs (boolean value)
#use_join_force=true


#
# Options defined in nova.virt.xenapi.vif
#

# Name of Integration Bridge used by Open vSwitch (string
# value)
#ovs_integration_bridge=xapi1


#
# Options defined in nova.virt.xenapi.vm_utils
#

# Cache glance images locally. `all` will cache all images,
# `some` will only cache images that have the image_property
# `cache_in_nova=True`, and `none` turns off caching entirely
# (string value)
#cache_images=all

# Compression level for images, e.g., 9 for gzip -9. Range is
# 1-9, 9 being most compressed but most CPU intensive on dom0.
# (integer value)
#image_compression_level=<None>

# Default OS type (string value)
#default_os_type=linux

# Time to wait for a block device to be created (integer
# value)
#block_device_creation_timeout=10

# Maximum size in bytes of kernel or ramdisk images (integer
# value)
#max_kernel_ramdisk_size=16777216

# Filter for finding the SR to be used to install guest
# instances on. To use the Local Storage in default
# XenServer/XCP installations set this flag to other-config
# :i18n-key=local-storage. To select an SR with a different
# matching criteria, you could set it to other-
# config:my_favorite_sr=true. On the other hand, to fall back
# on the Default SR, as displayed by XenCenter, set this flag
# to: default-sr:true (string value)
#sr_matching_filter=default-sr:true

# Whether to use sparse_copy for copying data on a resize down
# (False will use standard dd). This speeds up resizes down
# considerably since large runs of zeros won't have to be
# rsynced (boolean value)
#sparse_copy=true

# Maximum number of retries to unplug VBD. if <=0, should try
# once and no retry (integer value)
#num_vbd_unplug_retries=10

# Whether or not to download images via Bit Torrent
# (all|some|none). (string value)
#torrent_images=none

# Name of network to use for booting iPXE ISOs (string value)
#ipxe_network_name=<None>

# URL to the iPXE boot menu (string value)
#ipxe_boot_menu_url=<None>

# Name and optionally path of the tool used for ISO image
# creation (string value)
#ipxe_mkisofs_cmd=mkisofs


#
# Options defined in nova.virt.xenapi.vmops
#

# Number of seconds to wait for instance to go to running
# state (integer value)
#running_timeout=60

# The XenAPI VIF driver using XenServer Network APIs. (string
# value)
#vif_driver=nova.virt.xenapi.vif.XenAPIBridgeDriver

# Dom0 plugin driver used to handle image uploads. (string
# value)
#image_upload_handler=nova.virt.xenapi.image.glance.GlanceStore


#
# Options defined in nova.virt.xenapi.volume_utils
#

# Number of seconds to wait for an SR to settle if the VDI
# does not exist when first introduced (integer value)
#introduce_vdi_retry_wait=20


[zookeeper]

#
# Options defined in nova.servicegroup.drivers.zk
#

# The ZooKeeper addresses for servicegroup service in the
# format of host1:port,host2:port,host3:port (string value)
#address=<None>

# The recv_timeout parameter for the zk session (integer
# value)
#recv_timeout=4000

# The prefix used in ZooKeeper to store ephemeral nodes
# (string value)
#sg_prefix=/servicegroups

# Number of seconds to wait until retrying to join the session
# (integer value)
#sg_retry_interval=5


[matchmaker_redis]

#
# From oslo.messaging
#

# Host to locate redis. (string value)
#host=127.0.0.1

# Use this port to connect to redis host. (integer value)
#port=6379

# Password for Redis server (optional). (string value)
#password=<None>


[matchmaker_ring]

#
# From oslo.messaging
#

# Matchmaker ring file (JSON). (string value)
# Deprecated group;name - DEFAULT;matchmaker_ringfile
#ringfile=/etc/oslo/matchmaker_ring.json


[oslo_concurrency]

#
# From oslo.concurrency
#

# Enables or disables inter-process locks. (boolean value)
# Deprecated group;name - DEFAULT;disable_process_locking
#disable_process_locking=false

# Directory to use for lock files.  For security, the specified directory
# should only be writable by the user running the processes that need locking.
# Defaults to environment variable OSLO_LOCK_PATH. If external locks are used,
# a lock path must be set. (string value)
# Deprecated group;name - DEFAULT;lock_path
lock_path=/var/lib/nova/tmp


[oslo_messaging_amqp]

#
# From oslo.messaging
#

# address prefix used when sending to a specific server (string value)
# Deprecated group;name - [amqp1]/server_request_prefix
#server_request_prefix=exclusive

# address prefix used when broadcasting to all servers (string value)
# Deprecated group;name - [amqp1]/broadcast_prefix
#broadcast_prefix=broadcast

# address prefix when sending to any server in group (string value)
# Deprecated group;name - [amqp1]/group_request_prefix
#group_request_prefix=unicast

# Name for the AMQP container (string value)
# Deprecated group;name - [amqp1]/container_name
#container_name=<None>

# Timeout for inactive connections (in seconds) (integer value)
# Deprecated group;name - [amqp1]/idle_timeout
#idle_timeout=0

# Debug: dump AMQP frames to stdout (boolean value)
# Deprecated group;name - [amqp1]/trace
#trace=false

# CA certificate PEM file for verifying server certificate (string value)
# Deprecated group;name - [amqp1]/ssl_ca_file
#ssl_ca_file =

# Identifying certificate PEM file to present to clients (string value)
# Deprecated group;name - [amqp1]/ssl_cert_file
#ssl_cert_file =

# Private key PEM file used to sign cert_file certificate (string value)
# Deprecated group;name - [amqp1]/ssl_key_file
#ssl_key_file =

# Password for decrypting ssl_key_file (if encrypted) (string value)
# Deprecated group;name - [amqp1]/ssl_key_password
#ssl_key_password=<None>

# Accept clients using either SSL or plain TCP (boolean value)
# Deprecated group;name - [amqp1]/allow_insecure_clients
#allow_insecure_clients=false


[oslo_messaging_qpid]

#
# From oslo.messaging
#

# Use durable queues in AMQP. (boolean value)
# Deprecated group;name - DEFAULT;rabbit_durable_queues
#amqp_durable_queues=false

# Auto-delete queues in AMQP. (boolean value)
# Deprecated group;name - DEFAULT;amqp_auto_delete
#amqp_auto_delete=false

# Size of RPC connection pool. (integer value)
# Deprecated group;name - DEFAULT;rpc_conn_pool_size
#rpc_conn_pool_size=30

# Qpid broker hostname. (string value)
# Deprecated group;name - DEFAULT;qpid_hostname
#qpid_hostname=localhost

# Qpid broker port. (integer value)
# Deprecated group;name - DEFAULT;qpid_port
#qpid_port=5672

# Qpid HA cluster host:port pairs. (list value)
# Deprecated group;name - DEFAULT;qpid_hosts
#qpid_hosts=$qpid_hostname:$qpid_port

# Username for Qpid connection. (string value)
# Deprecated group;name - DEFAULT;qpid_username
#qpid_username =

# Password for Qpid connection. (string value)
# Deprecated group;name - DEFAULT;qpid_password
#qpid_password =

# Space separated list of SASL mechanisms to use for auth. (string value)
# Deprecated group;name - DEFAULT;qpid_sasl_mechanisms
#qpid_sasl_mechanisms =

# Seconds between connection keepalive heartbeats. (integer value)
# Deprecated group;name - DEFAULT;qpid_heartbeat
#qpid_heartbeat=60

# Transport to use, either 'tcp' or 'ssl'. (string value)
# Deprecated group;name - DEFAULT;qpid_protocol
#qpid_protocol=tcp

# Whether to disable the Nagle algorithm. (boolean value)
# Deprecated group;name - DEFAULT;qpid_tcp_nodelay
#qpid_tcp_nodelay=true

# The number of prefetched messages held by receiver. (integer value)
# Deprecated group;name - DEFAULT;qpid_receiver_capacity
#qpid_receiver_capacity=1

# The qpid topology version to use.  Version 1 is what was originally used by
# impl_qpid.  Version 2 includes some backwards-incompatible changes that allow
# broker federation to work.  Users should update to version 2 when they are
# able to take everything down, as it requires a clean break. (integer value)
# Deprecated group;name - DEFAULT;qpid_topology_version
#qpid_topology_version=1


[oslo_messaging_rabbit]

#
# From oslo.messaging
#

# Use durable queues in AMQP. (boolean value)
# Deprecated group;name - DEFAULT;rabbit_durable_queues
#amqp_durable_queues=false

# Auto-delete queues in AMQP. (boolean value)
# Deprecated group;name - DEFAULT;amqp_auto_delete
#amqp_auto_delete=false

# Size of RPC connection pool. (integer value)
# Deprecated group;name - DEFAULT;rpc_conn_pool_size
#rpc_conn_pool_size=30

# SSL version to use (valid only if SSL enabled). Valid values are TLSv1 and
# SSLv23. SSLv2, SSLv3, TLSv1_1, and TLSv1_2 may be available on some
# distributions. (string value)
# Deprecated group;name - DEFAULT;kombu_ssl_version
#kombu_ssl_version =

# SSL key file (valid only if SSL enabled). (string value)
# Deprecated group;name - DEFAULT;kombu_ssl_keyfile
#kombu_ssl_keyfile =

# SSL cert file (valid only if SSL enabled). (string value)
# Deprecated group;name - DEFAULT;kombu_ssl_certfile
#kombu_ssl_certfile =

# SSL certification authority file (valid only if SSL enabled). (string value)
# Deprecated group;name - DEFAULT;kombu_ssl_ca_certs
#kombu_ssl_ca_certs =

# How long to wait before reconnecting in response to an AMQP consumer cancel
# notification. (floating point value)
# Deprecated group;name - DEFAULT;kombu_reconnect_delay
#kombu_reconnect_delay=1.0

# The RabbitMQ broker address where a single node is used. (string value)
# Deprecated group;name - DEFAULT;rabbit_host
rabbit_host={{controller}}

# The RabbitMQ broker port where a single node is used. (integer value)
# Deprecated group;name - DEFAULT;rabbit_port
#rabbit_port=5672

# RabbitMQ HA cluster host:port pairs. (list value)
# Deprecated group;name - DEFAULT;rabbit_hosts
#rabbit_hosts=$rabbit_host:$rabbit_port

# Connect over SSL for RabbitMQ. (boolean value)
# Deprecated group;name - DEFAULT;rabbit_use_ssl
#rabbit_use_ssl=false

# The RabbitMQ userid. (string value)
# Deprecated group;name - DEFAULT;rabbit_userid
rabbit_userid={{rabbit.user}}

# The RabbitMQ password. (string value)
# Deprecated group;name - DEFAULT;rabbit_password
rabbit_password={{rabbit.password}}

# The RabbitMQ login method. (string value)
# Deprecated group;name - DEFAULT;rabbit_login_method
#rabbit_login_method=AMQPLAIN

# The RabbitMQ virtual host. (string value)
# Deprecated group;name - DEFAULT;rabbit_virtual_host
#rabbit_virtual_host=/

# How frequently to retry connecting with RabbitMQ. (integer value)
#rabbit_retry_interval=1

# How long to backoff for between retries when connecting to RabbitMQ. (integer
# value)
# Deprecated group;name - DEFAULT;rabbit_retry_backoff
#rabbit_retry_backoff=2

# Maximum number of RabbitMQ connection retries. Default is 0 (infinite retry
# count). (integer value)
# Deprecated group;name - DEFAULT;rabbit_max_retries
#rabbit_max_retries=0

# Use HA queues in RabbitMQ (x-ha-policy: all). If you change this option, you
# must wipe the RabbitMQ database. (boolean value)
# Deprecated group;name - DEFAULT;rabbit_ha_queues
#rabbit_ha_queues=false

# Number of seconds after which the Rabbit broker is considered down if
# heartbeat's keep-alive fails (0 disable the heartbeat). (integer value)
#heartbeat_timeout_threshold=60

# How often times during the heartbeat_timeout_threshold we check the
# heartbeat. (integer value)
#heartbeat_rate=2

# Deprecated, use rpc_backend=kombu+memory or rpc_backend=fake (boolean value)
# Deprecated group;name - DEFAULT;fake_rabbit
#fake_rabbit=false