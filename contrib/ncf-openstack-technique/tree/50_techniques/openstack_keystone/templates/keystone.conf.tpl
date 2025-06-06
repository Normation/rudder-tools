[DEFAULT]

#
# From keystone
#

# A "shared secret" that can be used to bootstrap Keystone. This "token" does
# not represent a user, and carries no explicit authorization. To disable in
# production (highly recommended), remove AdminTokenAuthMiddleware from your
# paste application pipelines (for example, in keystone-paste.ini). (string
# value)
admin_token = {{admin.token}}

# (Deprecated) The port which the OpenStack Compute service listens on. This
# option was only used for string replacement in the templated catalog backend.
# Templated catalogs should replace the "$(compute_port)s" substitution with
# the static port of the compute service. As of Juno, this option is deprecated
# and will be removed in the L release. (integer value)
#compute_port = 8774

# The base public endpoint URL for Keystone that is advertised to clients
# (NOTE: this does NOT affect how Keystone listens for connections). Defaults
# to the base host URL of the request. E.g. a request to
# http://server:5000/v3/users will default to http://server:5000. You should
# only need to set this value if the base URL contains a path (e.g. /prefix/v3)
# or the endpoint should be found on a different server. (string value)
#public_endpoint = <None>

# The base admin endpoint URL for Keystone that is advertised to clients (NOTE:
# this does NOT affect how Keystone listens for connections). Defaults to the
# base host URL of the request. E.g. a request to http://server:35357/v3/users
# will default to http://server:35357. You should only need to set this value
# if the base URL contains a path (e.g. /prefix/v3) or the endpoint should be
# found on a different server. (string value)
#admin_endpoint = <None>

# Maximum depth of the project hierarchy. WARNING: setting it to a large value
# may adversely impact performance. (integer value)
#max_project_tree_depth = 5

# Limit the sizes of user & project ID/names. (integer value)
#max_param_size = 64

# Similar to max_param_size, but provides an exception for token values.
# (integer value)
#max_token_size = 8192

# Similar to the member_role_name option, this represents the default role ID
# used to associate users with their default projects in the v2 API. This will
# be used as the explicit role where one is not specified by the v2 API.
# (string value)
#member_role_id = 9fe2ff9ee4384b1894a90878d3e92bab

# This is the role name used in combination with the member_role_id option; see
# that option for more detail. (string value)
#member_role_name = _member_

# The value passed as the keyword "rounds" to passlib's encrypt method.
# (integer value)
#crypt_strength = 40000

# The maximum number of entities that will be returned in a collection, with no
# limit set by default. This global limit may be then overridden for a specific
# driver, by specifying a list_limit in the appropriate section (e.g.
# [assignment]). (integer value)
#list_limit = <None>

# Set this to false if you want to enable the ability for user, group and
# project entities to be moved between domains by updating their domain_id.
# Allowing such movement is not recommended if the scope of a domain admin is
# being restricted by use of an appropriate policy file (see
# policy.v3cloudsample as an example). (boolean value)
#domain_id_immutable = true

# If set to true, strict password length checking is performed for password
# manipulation. If a password exceeds the maximum length, the operation will
# fail with an HTTP 403 Forbidden error. If set to false, passwords are
# automatically truncated to the maximum length. (boolean value)
#strict_password_check = false

# The HTTP header used to determine the scheme for the original request, even
# if it was removed by an SSL terminating proxy. Typical value is
# "HTTP_X_FORWARDED_PROTO". (string value)
#secure_proxy_ssl_header = <None>

#
# From keystone.notifications
#

# Default publisher_id for outgoing notifications (string value)
#default_publisher_id = <None>

# Define the notification format for Identity Service events. A "basic"
# notification has information about the resource being operated on. A "cadf"
# notification has the same information, as well as information about the
# initiator of the event. Valid options are: basic and cadf (string value)
#notification_format = basic

#
# From keystone.openstack.common.eventlet_backdoor
#

# Enable eventlet backdoor.  Acceptable values are 0, <port>, and
# <start>:<end>, where 0 results in listening on a random tcp port number;
# <port> results in listening on the specified port number (and not enabling
# backdoor if that port is in use); and <start>:<end> results in listening on
# the smallest unused port number within the specified range of port numbers.
# The chosen port is displayed in the service's log file. (string value)
#backdoor_port = <None>

#
# From oslo.log
#

# Print debugging output (set logging level to DEBUG instead of default WARNING
# level). (boolean value)
#debug = false

# Print more verbose output (set logging level to INFO instead of default
# WARNING level). (boolean value)
#verbose = false

# The name of a logging configuration file. This file is appended to any
# existing logging configuration files. For details about logging configuration
# files, see the Python logging module documentation. (string value)
# Deprecated group/name - [DEFAULT]/log_config
#log_config_append = <None>

# DEPRECATED. A logging.Formatter log message format string which may use any
# of the available logging.LogRecord attributes. This option is deprecated.
# Please use logging_context_format_string and logging_default_format_string
# instead. (string value)
#log_format = <None>

# Format string for %%(asctime)s in log records. Default: %(default)s . (string
# value)
#log_date_format = %Y-%m-%d %H:%M:%S

# (Optional) Name of log file to output to. If no default is set, logging will
# go to stdout. (string value)
# Deprecated group/name - [DEFAULT]/logfile
#log_file = <None>

# (Optional) The base directory used for relative --log-file paths. (string
# value)
# Deprecated group/name - [DEFAULT]/logdir
#log_dir = <None>

# Use syslog for logging. Existing syslog format is DEPRECATED during I, and
# will change in J to honor RFC5424. (boolean value)
#use_syslog = false

# (Optional) Enables or disables syslog rfc5424 format for logging. If enabled,
# prefixes the MSG part of the syslog message with APP-NAME (RFC5424). The
# format without the APP-NAME is deprecated in I, and will be removed in J.
# (boolean value)
#use_syslog_rfc_format = false

# Syslog facility to receive log lines. (string value)
#syslog_log_facility = LOG_USER

# Log output to standard error. (boolean value)
#use_stderr = true

# Format string to use for log messages with context. (string value)
#logging_context_format_string = %(asctime)s.%(msecs)03d %(process)d %(levelname)s %(name)s [%(request_id)s %(user_identity)s] %(instance)s%(message)s

# Format string to use for log messages without context. (string value)
#logging_default_format_string = %(asctime)s.%(msecs)03d %(process)d %(levelname)s %(name)s [-] %(instance)s%(message)s

# Data to append to log format when level is DEBUG. (string value)
#logging_debug_format_suffix = %(funcName)s %(pathname)s:%(lineno)d

# Prefix each line of exception output with this format. (string value)
#logging_exception_prefix = %(asctime)s.%(msecs)03d %(process)d TRACE %(name)s %(instance)s

# List of logger=LEVEL pairs. (list value)
#default_log_levels = amqp=WARN,amqplib=WARN,boto=WARN,qpid=WARN,sqlalchemy=WARN,suds=INFO,oslo.messaging=INFO,iso8601=WARN,requests.packages.urllib3.connectionpool=WARN,urllib3.connectionpool=WARN,websocket=WARN,requests.packages.urllib3.util.retry=WARN,urllib3.util.retry=WARN,keystonemiddleware=WARN,routes.middleware=WARN,stevedore=WARN

# Enables or disables publication of error events. (boolean value)
#publish_errors = false

# Enables or disables fatal status of deprecations. (boolean value)
#fatal_deprecations = false

# The format for an instance that is passed with the log message. (string
# value)
#instance_format = "[instance: %(uuid)s] "

# The format for an instance UUID that is passed with the log message. (string
# value)
#instance_uuid_format = "[instance: %(uuid)s] "

#
# From oslo.messaging
#

# ZeroMQ bind address. Should be a wildcard (*), an ethernet interface, or IP.
# The "host" option should point or resolve to this address. (string value)
#rpc_zmq_bind_address = *

# MatchMaker driver. (string value)
#rpc_zmq_matchmaker = oslo_messaging._drivers.matchmaker.MatchMakerLocalhost

# ZeroMQ receiver listening port. (integer value)
#rpc_zmq_port = 9501

# Number of ZeroMQ contexts, defaults to 1. (integer value)
#rpc_zmq_contexts = 1

# Maximum number of ingress messages to locally buffer per topic. Default is
# unlimited. (integer value)
#rpc_zmq_topic_backlog = <None>

# Directory for holding IPC sockets. (string value)
#rpc_zmq_ipc_dir = /var/run/openstack

# Name of this node. Must be a valid hostname, FQDN, or IP address. Must match
# "host" option, if running Nova. (string value)
#rpc_zmq_host = localhost

# Seconds to wait before a cast expires (TTL). Only supported by impl_zmq.
# (integer value)
#rpc_cast_timeout = 30

# Heartbeat frequency. (integer value)
#matchmaker_heartbeat_freq = 300

# Heartbeat time-to-live. (integer value)
#matchmaker_heartbeat_ttl = 600

# Size of RPC thread pool. (integer value)
#rpc_thread_pool_size = 64

# Driver or drivers to handle sending notifications. (multi valued)
#notification_driver =

# AMQP topic used for OpenStack notifications. (list value)
# Deprecated group/name - [rpc_notifier2]/topics
#notification_topics = notifications

# Seconds to wait for a response from a call. (integer value)
#rpc_response_timeout = 60

# A URL representing the messaging driver to use and its full configuration. If
# not set, we fall back to the rpc_backend option and driver specific
# configuration. (string value)
#transport_url = <None>

# The messaging driver to use, defaults to rabbit. Other drivers include qpid
# and zmq. (string value)
#rpc_backend = rabbit

# The default exchange under which topics are scoped. May be overridden by an
# exchange name specified in the transport_url option. (string value)
#control_exchange = keystone


[assignment]

#
# From keystone
#

# Assignment backend driver. (string value)
#driver = <None>


[auth]

#
# From keystone
#

# Default auth methods. (list value)
#methods = external,password,token,oauth1

# The password auth plugin module. (string value)
#password = keystone.auth.plugins.password.Password

# The token auth plugin module. (string value)
#token = keystone.auth.plugins.token.Token

# The external (REMOTE_USER) auth plugin module. (string value)
#external = keystone.auth.plugins.external.DefaultDomain

# The oAuth1.0 auth plugin module. (string value)
#oauth1 = keystone.auth.plugins.oauth1.OAuth


[cache]

#
# From keystone
#

# Prefix for building the configuration dictionary for the cache region. This
# should not need to be changed unless there is another dogpile.cache region
# with the same configuration name. (string value)
#config_prefix = cache.keystone

# Default TTL, in seconds, for any cached item in the dogpile.cache region.
# This applies to any cached method that doesn't have an explicit cache
# expiration time defined for it. (integer value)
#expiration_time = 600

# Dogpile.cache backend module. It is recommended that Memcache with pooling
# (keystone.cache.memcache_pool) or Redis (dogpile.cache.redis) be used in
# production deployments.  Small workloads (single process) like devstack can
# use the dogpile.cache.memory backend. (string value)
#backend = keystone.common.cache.noop

# Arguments supplied to the backend module. Specify this option once per
# argument to be passed to the dogpile.cache backend. Example format:
# "<argname>:<value>". (multi valued)
#backend_argument =

# Proxy classes to import that will affect the way the dogpile.cache backend
# functions. See the dogpile.cache documentation on changing-backend-behavior.
# (list value)
#proxies =

# Global toggle for all caching using the should_cache_fn mechanism. (boolean
# value)
#enabled = false

# Extra debugging from the cache backend (cache keys, get/set/delete/etc
# calls). This is only really useful if you need to see the specific cache-
# backend get/set/delete calls with the keys/values.  Typically this should be
# left set to false. (boolean value)
#debug_cache_backend = false

# Memcache servers in the format of "host:port". (dogpile.cache.memcache and
# keystone.cache.memcache_pool backends only). (list value)
#memcache_servers = localhost:11211

# Number of seconds memcached server is considered dead before it is tried
# again. (dogpile.cache.memcache and keystone.cache.memcache_pool backends
# only). (integer value)
#memcache_dead_retry = 300

# Timeout in seconds for every call to a server. (dogpile.cache.memcache and
# keystone.cache.memcache_pool backends only). (integer value)
#memcache_socket_timeout = 3

# Max total number of open connections to every memcached server.
# (keystone.cache.memcache_pool backend only). (integer value)
#memcache_pool_maxsize = 10

# Number of seconds a connection to memcached is held unused in the pool before
# it is closed. (keystone.cache.memcache_pool backend only). (integer value)
#memcache_pool_unused_timeout = 60

# Number of seconds that an operation will wait to get a memcache client
# connection. (integer value)
#memcache_pool_connection_get_timeout = 10


[catalog]

#
# From keystone
#

# Catalog template file name for use with the template catalog backend. (string
# value)
#template_file = default_catalog.templates

# Catalog backend driver. (string value)
#driver = keystone.catalog.backends.sql.Catalog

# Toggle for catalog caching. This has no effect unless global caching is
# enabled. (boolean value)
#caching = true

# Time to cache catalog data (in seconds). This has no effect unless global and
# catalog caching are enabled. (integer value)
#cache_time = <None>

# Maximum number of entities that will be returned in a catalog collection.
# (integer value)
#list_limit = <None>


[credential]

#
# From keystone
#

# Credential backend driver. (string value)
#driver = keystone.credential.backends.sql.Credential


[database]

#
# From oslo.db
#

# The file name to use with SQLite. (string value)
# Deprecated group/name - [DEFAULT]/sqlite_db
#sqlite_db = oslo.sqlite

# If True, SQLite uses synchronous mode. (boolean value)
# Deprecated group/name - [DEFAULT]/sqlite_synchronous
#sqlite_synchronous = true

# The back end to use for the database. (string value)
# Deprecated group/name - [DEFAULT]/db_backend
#backend = sqlalchemy

# The SQLAlchemy connection string to use to connect to the database. (string
# value)
# Deprecated group/name - [DEFAULT]/sql_connection
# Deprecated group/name - [DATABASE]/sql_connection
# Deprecated group/name - [sql]/connection
connection = mysql://{{database.user}}:{{database.password}}@{{database.host}}/{{database.name}}

# The SQLAlchemy connection string to use to connect to the slave database.
# (string value)
#slave_connection = <None>

# The SQL mode to be used for MySQL sessions. This option, including the
# default, overrides any server-set SQL mode. To use whatever SQL mode is set
# by the server configuration, set this to no value. Example: mysql_sql_mode=
# (string value)
#mysql_sql_mode = TRADITIONAL

# Timeout before idle SQL connections are reaped. (integer value)
# Deprecated group/name - [DEFAULT]/sql_idle_timeout
# Deprecated group/name - [DATABASE]/sql_idle_timeout
# Deprecated group/name - [sql]/idle_timeout
#idle_timeout = 3600

# Minimum number of SQL connections to keep open in a pool. (integer value)
# Deprecated group/name - [DEFAULT]/sql_min_pool_size
# Deprecated group/name - [DATABASE]/sql_min_pool_size
#min_pool_size = 1

# Maximum number of SQL connections to keep open in a pool. (integer value)
# Deprecated group/name - [DEFAULT]/sql_max_pool_size
# Deprecated group/name - [DATABASE]/sql_max_pool_size
#max_pool_size = <None>

# Maximum number of database connection retries during startup. Set to -1 to
# specify an infinite retry count. (integer value)
# Deprecated group/name - [DEFAULT]/sql_max_retries
# Deprecated group/name - [DATABASE]/sql_max_retries
#max_retries = 10

# Interval between retries of opening a SQL connection. (integer value)
# Deprecated group/name - [DEFAULT]/sql_retry_interval
# Deprecated group/name - [DATABASE]/reconnect_interval
#retry_interval = 10

# If set, use this value for max_overflow with SQLAlchemy. (integer value)
# Deprecated group/name - [DEFAULT]/sql_max_overflow
# Deprecated group/name - [DATABASE]/sqlalchemy_max_overflow
#max_overflow = <None>

# Verbosity of SQL debugging information: 0=None, 100=Everything. (integer
# value)
# Deprecated group/name - [DEFAULT]/sql_connection_debug
#connection_debug = 0

# Add Python stack traces to SQL as comment strings. (boolean value)
# Deprecated group/name - [DEFAULT]/sql_connection_trace
#connection_trace = false

# If set, use this value for pool_timeout with SQLAlchemy. (integer value)
# Deprecated group/name - [DATABASE]/sqlalchemy_pool_timeout
#pool_timeout = <None>

# Enable the experimental use of database reconnect on connection lost.
# (boolean value)
#use_db_reconnect = false

# Seconds between retries of a database transaction. (integer value)
#db_retry_interval = 1

# If True, increases the interval between retries of a database operation up to
# db_max_retry_interval. (boolean value)
#db_inc_retry_interval = true

# If db_inc_retry_interval is set, the maximum seconds between retries of a
# database operation. (integer value)
#db_max_retry_interval = 10

# Maximum retries in case of connection error or deadlock error before error is
# raised. Set to -1 to specify an infinite retry count. (integer value)
#db_max_retries = 20


[domain_config]

#
# From keystone
#

# Domain config backend driver. (string value)
#driver = keystone.resource.config_backends.sql.DomainConfig

# Toggle for domain config caching. This has no effect unless global caching is
# enabled. (boolean value)
#caching = true

# TTL (in seconds) to cache domain config data. This has no effect unless
# domain config caching is enabled. (integer value)
#cache_time = 300


[endpoint_filter]

#
# From keystone
#

# Endpoint Filter backend driver (string value)
#driver = keystone.contrib.endpoint_filter.backends.sql.EndpointFilter

# Toggle to return all active endpoints if no filter exists. (boolean value)
#return_all_endpoints_if_no_filter = true


[endpoint_policy]

#
# From keystone
#

# Endpoint policy backend driver (string value)
#driver = keystone.contrib.endpoint_policy.backends.sql.EndpointPolicy


[eventlet_server]

#
# From keystone
#

# The number of worker processes to serve the public eventlet application.
# Defaults to number of CPUs (minimum of 2). (integer value)
# Deprecated group/name - [DEFAULT]/public_workers
#public_workers = <None>

# The number of worker processes to serve the admin eventlet application.
# Defaults to number of CPUs (minimum of 2). (integer value)
# Deprecated group/name - [DEFAULT]/admin_workers
#admin_workers = <None>

# The IP address of the network interface for the public service to listen on.
# (string value)
# Deprecated group/name - [DEFAULT]/bind_host
# Deprecated group/name - [DEFAULT]/public_bind_host
#public_bind_host = 0.0.0.0

# The port number which the public service listens on. (integer value)
# Deprecated group/name - [DEFAULT]/public_port
#public_port = 5000

# The IP address of the network interface for the admin service to listen on.
# (string value)
# Deprecated group/name - [DEFAULT]/bind_host
# Deprecated group/name - [DEFAULT]/admin_bind_host
#admin_bind_host = 0.0.0.0

# The port number which the admin service listens on. (integer value)
# Deprecated group/name - [DEFAULT]/admin_port
#admin_port = 35357

# Set this to true if you want to enable TCP_KEEPALIVE on server sockets, i.e.
# sockets used by the Keystone wsgi server for client connections. (boolean
# value)
# Deprecated group/name - [DEFAULT]/tcp_keepalive
#tcp_keepalive = false

# Sets the value of TCP_KEEPIDLE in seconds for each server socket. Only
# applies if tcp_keepalive is true. (integer value)
# Deprecated group/name - [DEFAULT]/tcp_keepidle
#tcp_keepidle = 600


[eventlet_server_ssl]

#
# From keystone
#

# Toggle for SSL support on the Keystone eventlet servers. (boolean value)
# Deprecated group/name - [ssl]/enable
#enable = false

# Path of the certfile for SSL. For non-production environments, you may be
# interested in using `keystone-manage ssl_setup` to generate self-signed
# certificates. (string value)
# Deprecated group/name - [ssl]/certfile
#certfile = /etc/keystone/ssl/certs/keystone.pem

# Path of the keyfile for SSL. (string value)
# Deprecated group/name - [ssl]/keyfile
#keyfile = /etc/keystone/ssl/private/keystonekey.pem

# Path of the CA cert file for SSL. (string value)
# Deprecated group/name - [ssl]/ca_certs
#ca_certs = /etc/keystone/ssl/certs/ca.pem

# Require client certificate. (boolean value)
# Deprecated group/name - [ssl]/cert_required
#cert_required = false


[federation]

#
# From keystone
#

# Federation backend driver. (string value)
#driver = keystone.contrib.federation.backends.sql.Federation

# Value to be used when filtering assertion parameters from the environment.
# (string value)
#assertion_prefix =

# Value to be used to obtain the entity ID of the Identity Provider from the
# environment (e.g. if using the mod_shib plugin this value is `Shib-Identity-
# Provider`). (string value)
#remote_id_attribute = <None>

# A domain name that is reserved to allow federated ephemeral users to have a
# domain concept. Note that an admin will not be able to create a domain with
# this name or update an existing domain to this name. You are not advised to
# change this value unless you really have to. Changing this option to empty
# string or None will not have any impact and default name will be used.
# (string value)
#federated_domain_name = Federated

# A list of trusted dashboard hosts. Before accepting a Single Sign-On request
# to return a token, the origin host must be a member of the trusted_dashboard
# list. This configuration option may be repeated for multiple values. For
# example: trusted_dashboard=http://acme.com trusted_dashboard=http://beta.com
# (multi valued)
#trusted_dashboard =

# Location of Single Sign-On callback handler, will return a token to a trusted
# dashboard host. (string value)
#sso_callback_template = /etc/keystone/sso_callback_template.html


[fernet_tokens]

#
# From keystone
#

# Directory containing Fernet token keys. (string value)
#key_repository = /etc/keystone/fernet-keys/

# This controls how many keys are held in rotation by keystone-manage
# fernet_rotate before they are discarded. The default value of 3 means that
# keystone will maintain one staged key, one primary key, and one secondary
# key. Increasing this value means that additional secondary keys will be kept
# in the rotation. (integer value)
#max_active_keys = 3


[identity]

#
# From keystone
#

# This references the domain to use for all Identity API v2 requests (which are
# not aware of domains). A domain with this ID will be created for you by
# keystone-manage db_sync in migration 008. The domain referenced by this ID
# cannot be deleted on the v3 API, to prevent accidentally breaking the v2 API.
# There is nothing special about this domain, other than the fact that it must
# exist to order to maintain support for your v2 clients. (string value)
#default_domain_id = default

# A subset (or all) of domains can have their own identity driver, each with
# their own partial configuration options, stored in either the resource
# backend or in a file in a domain configuration directory (depending on the
# setting of domain_configurations_from_database). Only values specific to the
# domain need to be specified in this manner. This feature is disabled by
# default; set to true to enable. (boolean value)
#domain_specific_drivers_enabled = false

# Extract the domain specific configuration options from the resource backend
# where they have been stored with the domain data. This feature is disabled by
# default (in which case the domain specific options will be loaded from files
# in the domain configuration directory); set to true to enable. (boolean
# value)
#domain_configurations_from_database = false

# Path for Keystone to locate the domain specific identity configuration files
# if domain_specific_drivers_enabled is set to true. (string value)
#domain_config_dir = /etc/keystone/domains

# Identity backend driver. (string value)
#driver = keystone.identity.backends.sql.Identity

# Toggle for identity caching. This has no effect unless global caching is
# enabled. (boolean value)
#caching = true

# Time to cache identity data (in seconds). This has no effect unless global
# and identity caching are enabled. (integer value)
#cache_time = 600

# Maximum supported length for user passwords; decrease to improve performance.
# (integer value)
#max_password_length = 4096

# Maximum number of entities that will be returned in an identity collection.
# (integer value)
#list_limit = <None>


[identity_mapping]

#
# From keystone
#

# Keystone Identity Mapping backend driver. (string value)
#driver = keystone.identity.mapping_backends.sql.Mapping

# Public ID generator for user and group entities. The Keystone identity mapper
# only supports generators that produce no more than 64 characters. (string
# value)
#generator = keystone.identity.id_generators.sha256.Generator

# The format of user and group IDs changed in Juno for backends that do not
# generate UUIDs (e.g. LDAP), with keystone providing a hash mapping to the
# underlying attribute in LDAP. By default this mapping is disabled, which
# ensures that existing IDs will not change. Even when the mapping is enabled
# by using domain specific drivers, any users and groups from the default
# domain being handled by LDAP will still not be mapped to ensure their IDs
# remain backward compatible. Setting this value to False will enable the
# mapping for even the default LDAP driver. It is only safe to do this if you
# do not already have assignments for users and groups from the default LDAP
# domain, and it is acceptable for Keystone to provide the different IDs to
# clients than it did previously.  Typically this means that the only time you
# can set this value to False is when configuring a fresh installation.
# (boolean value)
#backward_compatible_ids = true


[kvs]

#
# From keystone
#

# Extra dogpile.cache backend modules to register with the dogpile.cache
# library. (list value)
#backends =

# Prefix for building the configuration dictionary for the KVS region. This
# should not need to be changed unless there is another dogpile.cache region
# with the same configuration name. (string value)
#config_prefix = keystone.kvs

# Toggle to disable using a key-mangling function to ensure fixed length keys.
# This is toggle-able for debugging purposes, it is highly recommended to
# always leave this set to true. (boolean value)
#enable_key_mangler = true

# Default lock timeout (in seconds) for distributed locking. (integer value)
#default_lock_timeout = 5


[ldap]

#
# From keystone
#

# URL for connecting to the LDAP server. (string value)
#url = ldap://localhost

# User BindDN to query the LDAP server. (string value)
#user = <None>

# Password for the BindDN to query the LDAP server. (string value)
#password = <None>

# LDAP server suffix (string value)
#suffix = cn=example,cn=com

# If true, will add a dummy member to groups. This is required if the
# objectclass for groups requires the "member" attribute. (boolean value)
#use_dumb_member = false

# DN of the "dummy member" to use when "use_dumb_member" is enabled. (string
# value)
#dumb_member = cn=dumb,dc=nonexistent

# Delete subtrees using the subtree delete control. Only enable this option if
# your LDAP server supports subtree deletion. (boolean value)
#allow_subtree_delete = false

# The LDAP scope for queries, this can be either "one" (onelevel/singleLevel)
# or "sub" (subtree/wholeSubtree). (string value)
#query_scope = one

# Maximum results per page; a value of zero ("0") disables paging. (integer
# value)
#page_size = 0

# The LDAP dereferencing option for queries. This can be either "never",
# "searching", "always", "finding" or "default". The "default" option falls
# back to using default dereferencing configured by your ldap.conf. (string
# value)
#alias_dereferencing = default

# Sets the LDAP debugging level for LDAP calls. A value of 0 means that
# debugging is not enabled. This value is a bitmask, consult your LDAP
# documentation for possible values. (integer value)
#debug_level = <None>

# Override the system's default referral chasing behavior for queries. (boolean
# value)
#chase_referrals = <None>

# Search base for users. (string value)
#user_tree_dn = <None>

# LDAP search filter for users. (string value)
#user_filter = <None>

# LDAP objectclass for users. (string value)
#user_objectclass = inetOrgPerson

# LDAP attribute mapped to user id. WARNING: must not be a multivalued
# attribute. (string value)
#user_id_attribute = cn

# LDAP attribute mapped to user name. (string value)
#user_name_attribute = sn

# LDAP attribute mapped to user email. (string value)
#user_mail_attribute = mail

# LDAP attribute mapped to password. (string value)
#user_pass_attribute = userPassword

# LDAP attribute mapped to user enabled flag. (string value)
#user_enabled_attribute = enabled

# Invert the meaning of the boolean enabled values. Some LDAP servers use a
# boolean lock attribute where "true" means an account is disabled. Setting
# "user_enabled_invert = true" will allow these lock attributes to be used.
# This setting will have no effect if "user_enabled_mask" or
# "user_enabled_emulation" settings are in use. (boolean value)
#user_enabled_invert = false

# Bitmask integer to indicate the bit that the enabled value is stored in if
# the LDAP server represents "enabled" as a bit on an integer rather than a
# boolean. A value of "0" indicates the mask is not used. If this is not set to
# "0" the typical value is "2". This is typically used when
# "user_enabled_attribute = userAccountControl". (integer value)
#user_enabled_mask = 0

# Default value to enable users. This should match an appropriate int value if
# the LDAP server uses non-boolean (bitmask) values to indicate if a user is
# enabled or disabled. If this is not set to "True" the typical value is "512".
# This is typically used when "user_enabled_attribute = userAccountControl".
# (string value)
#user_enabled_default = True

# List of attributes stripped off the user on update. (list value)
#user_attribute_ignore = default_project_id,tenants

# LDAP attribute mapped to default_project_id for users. (string value)
#user_default_project_id_attribute = <None>

# Allow user creation in LDAP backend. (boolean value)
#user_allow_create = true

# Allow user updates in LDAP backend. (boolean value)
#user_allow_update = true

# Allow user deletion in LDAP backend. (boolean value)
#user_allow_delete = true

# If true, Keystone uses an alternative method to determine if a user is
# enabled or not by checking if they are a member of the
# "user_enabled_emulation_dn" group. (boolean value)
#user_enabled_emulation = false

# DN of the group entry to hold enabled users when using enabled emulation.
# (string value)
#user_enabled_emulation_dn = <None>

# List of additional LDAP attributes used for mapping additional attribute
# mappings for users. Attribute mapping format is <ldap_attr>:<user_attr>,
# where ldap_attr is the attribute in the LDAP entry and user_attr is the
# Identity API attribute. (list value)
#user_additional_attribute_mapping =

# Search base for projects (string value)
# Deprecated group/name - [ldap]/tenant_tree_dn
#project_tree_dn = <None>

# LDAP search filter for projects. (string value)
# Deprecated group/name - [ldap]/tenant_filter
#project_filter = <None>

# LDAP objectclass for projects. (string value)
# Deprecated group/name - [ldap]/tenant_objectclass
#project_objectclass = groupOfNames

# LDAP attribute mapped to project id. (string value)
# Deprecated group/name - [ldap]/tenant_id_attribute
#project_id_attribute = cn

# LDAP attribute mapped to project membership for user. (string value)
# Deprecated group/name - [ldap]/tenant_member_attribute
#project_member_attribute = member

# LDAP attribute mapped to project name. (string value)
# Deprecated group/name - [ldap]/tenant_name_attribute
#project_name_attribute = ou

# LDAP attribute mapped to project description. (string value)
# Deprecated group/name - [ldap]/tenant_desc_attribute
#project_desc_attribute = description

# LDAP attribute mapped to project enabled. (string value)
# Deprecated group/name - [ldap]/tenant_enabled_attribute
#project_enabled_attribute = enabled

# LDAP attribute mapped to project domain_id. (string value)
# Deprecated group/name - [ldap]/tenant_domain_id_attribute
#project_domain_id_attribute = businessCategory

# List of attributes stripped off the project on update. (list value)
# Deprecated group/name - [ldap]/tenant_attribute_ignore
#project_attribute_ignore =

# Allow project creation in LDAP backend. (boolean value)
# Deprecated group/name - [ldap]/tenant_allow_create
#project_allow_create = true

# Allow project update in LDAP backend. (boolean value)
# Deprecated group/name - [ldap]/tenant_allow_update
#project_allow_update = true

# Allow project deletion in LDAP backend. (boolean value)
# Deprecated group/name - [ldap]/tenant_allow_delete
#project_allow_delete = true

# If true, Keystone uses an alternative method to determine if a project is
# enabled or not by checking if they are a member of the
# "project_enabled_emulation_dn" group. (boolean value)
# Deprecated group/name - [ldap]/tenant_enabled_emulation
#project_enabled_emulation = false

# DN of the group entry to hold enabled projects when using enabled emulation.
# (string value)
# Deprecated group/name - [ldap]/tenant_enabled_emulation_dn
#project_enabled_emulation_dn = <None>

# Additional attribute mappings for projects. Attribute mapping format is
# <ldap_attr>:<user_attr>, where ldap_attr is the attribute in the LDAP entry
# and user_attr is the Identity API attribute. (list value)
# Deprecated group/name - [ldap]/tenant_additional_attribute_mapping
#project_additional_attribute_mapping =

# Search base for roles. (string value)
#role_tree_dn = <None>

# LDAP search filter for roles. (string value)
#role_filter = <None>

# LDAP objectclass for roles. (string value)
#role_objectclass = organizationalRole

# LDAP attribute mapped to role id. (string value)
#role_id_attribute = cn

# LDAP attribute mapped to role name. (string value)
#role_name_attribute = ou

# LDAP attribute mapped to role membership. (string value)
#role_member_attribute = roleOccupant

# List of attributes stripped off the role on update. (list value)
#role_attribute_ignore =

# Allow role creation in LDAP backend. (boolean value)
#role_allow_create = true

# Allow role update in LDAP backend. (boolean value)
#role_allow_update = true

# Allow role deletion in LDAP backend. (boolean value)
#role_allow_delete = true

# Additional attribute mappings for roles. Attribute mapping format is
# <ldap_attr>:<user_attr>, where ldap_attr is the attribute in the LDAP entry
# and user_attr is the Identity API attribute. (list value)
#role_additional_attribute_mapping =

# Search base for groups. (string value)
#group_tree_dn = <None>

# LDAP search filter for groups. (string value)
#group_filter = <None>

# LDAP objectclass for groups. (string value)
#group_objectclass = groupOfNames

# LDAP attribute mapped to group id. (string value)
#group_id_attribute = cn

# LDAP attribute mapped to group name. (string value)
#group_name_attribute = ou

# LDAP attribute mapped to show group membership. (string value)
#group_member_attribute = member

# LDAP attribute mapped to group description. (string value)
#group_desc_attribute = description

# List of attributes stripped off the group on update. (list value)
#group_attribute_ignore =

# Allow group creation in LDAP backend. (boolean value)
#group_allow_create = true

# Allow group update in LDAP backend. (boolean value)
#group_allow_update = true

# Allow group deletion in LDAP backend. (boolean value)
#group_allow_delete = true

# Additional attribute mappings for groups. Attribute mapping format is
# <ldap_attr>:<user_attr>, where ldap_attr is the attribute in the LDAP entry
# and user_attr is the Identity API attribute. (list value)
#group_additional_attribute_mapping =

# CA certificate file path for communicating with LDAP servers. (string value)
#tls_cacertfile = <None>

# CA certificate directory path for communicating with LDAP servers. (string
# value)
#tls_cacertdir = <None>

# Enable TLS for communicating with LDAP servers. (boolean value)
#use_tls = false

# Valid options for tls_req_cert are demand, never, and allow. (string value)
#tls_req_cert = demand

# Enable LDAP connection pooling. (boolean value)
#use_pool = false

# Connection pool size. (integer value)
#pool_size = 10

# Maximum count of reconnect trials. (integer value)
#pool_retry_max = 3

# Time span in seconds to wait between two reconnect trials. (floating point
# value)
#pool_retry_delay = 0.1

# Connector timeout in seconds. Value -1 indicates indefinite wait for
# response. (integer value)
#pool_connection_timeout = -1

# Connection lifetime in seconds. (integer value)
#pool_connection_lifetime = 600

# Enable LDAP connection pooling for end user authentication. If use_pool is
# disabled, then this setting is meaningless and is not used at all. (boolean
# value)
#use_auth_pool = false

# End user auth connection pool size. (integer value)
#auth_pool_size = 100

# End user auth connection lifetime in seconds. (integer value)
#auth_pool_connection_lifetime = 60


[matchmaker_redis]

#
# From oslo.messaging
#

# Host to locate redis. (string value)
#host = 127.0.0.1

# Use this port to connect to redis host. (integer value)
#port = 6379

# Password for Redis server (optional). (string value)
#password = <None>


[matchmaker_ring]

#
# From oslo.messaging
#

# Matchmaker ring file (JSON). (string value)
# Deprecated group/name - [DEFAULT]/matchmaker_ringfile
#ringfile = /etc/oslo/matchmaker_ring.json


[memcache]

#
# From keystone
#

# Memcache servers in the format of "host:port". (list value)
servers = localhost:11211

# Number of seconds memcached server is considered dead before it is tried
# again. This is used by the key value store system (e.g. token pooled
# memcached persistence backend). (integer value)
#dead_retry = 300

# Timeout in seconds for every call to a server. This is used by the key value
# store system (e.g. token pooled memcached persistence backend). (integer
# value)
#socket_timeout = 3

# Max total number of open connections to every memcached server. This is used
# by the key value store system (e.g. token pooled memcached persistence
# backend). (integer value)
#pool_maxsize = 10

# Number of seconds a connection to memcached is held unused in the pool before
# it is closed. This is used by the key value store system (e.g. token pooled
# memcached persistence backend). (integer value)
#pool_unused_timeout = 60

# Number of seconds that an operation will wait to get a memcache client
# connection. This is used by the key value store system (e.g. token pooled
# memcached persistence backend). (integer value)
#pool_connection_get_timeout = 10


[oauth1]

#
# From keystone
#

# Credential backend driver. (string value)
#driver = keystone.contrib.oauth1.backends.sql.OAuth1

# Duration (in seconds) for the OAuth Request Token. (integer value)
#request_token_duration = 28800

# Duration (in seconds) for the OAuth Access Token. (integer value)
#access_token_duration = 86400


[os_inherit]

#
# From keystone
#

# role-assignment inheritance to projects from owning domain or from projects
# higher in the hierarchy can be optionally enabled. (boolean value)
#enabled = false


[oslo_messaging_amqp]

#
# From oslo.messaging
#

# address prefix used when sending to a specific server (string value)
# Deprecated group/name - [amqp1]/server_request_prefix
#server_request_prefix = exclusive

# address prefix used when broadcasting to all servers (string value)
# Deprecated group/name - [amqp1]/broadcast_prefix
#broadcast_prefix = broadcast

# address prefix when sending to any server in group (string value)
# Deprecated group/name - [amqp1]/group_request_prefix
#group_request_prefix = unicast

# Name for the AMQP container (string value)
# Deprecated group/name - [amqp1]/container_name
#container_name = <None>

# Timeout for inactive connections (in seconds) (integer value)
# Deprecated group/name - [amqp1]/idle_timeout
#idle_timeout = 0

# Debug: dump AMQP frames to stdout (boolean value)
# Deprecated group/name - [amqp1]/trace
#trace = false

# CA certificate PEM file for verifying server certificate (string value)
# Deprecated group/name - [amqp1]/ssl_ca_file
#ssl_ca_file =

# Identifying certificate PEM file to present to clients (string value)
# Deprecated group/name - [amqp1]/ssl_cert_file
#ssl_cert_file =

# Private key PEM file used to sign cert_file certificate (string value)
# Deprecated group/name - [amqp1]/ssl_key_file
#ssl_key_file =

# Password for decrypting ssl_key_file (if encrypted) (string value)
# Deprecated group/name - [amqp1]/ssl_key_password
#ssl_key_password = <None>

# Accept clients using either SSL or plain TCP (boolean value)
# Deprecated group/name - [amqp1]/allow_insecure_clients
#allow_insecure_clients = false


[oslo_messaging_qpid]

#
# From oslo.messaging
#

# Use durable queues in AMQP. (boolean value)
# Deprecated group/name - [DEFAULT]/rabbit_durable_queues
#amqp_durable_queues = false

# Auto-delete queues in AMQP. (boolean value)
# Deprecated group/name - [DEFAULT]/amqp_auto_delete
#amqp_auto_delete = false

# Size of RPC connection pool. (integer value)
# Deprecated group/name - [DEFAULT]/rpc_conn_pool_size
#rpc_conn_pool_size = 30

# Qpid broker hostname. (string value)
# Deprecated group/name - [DEFAULT]/qpid_hostname
#qpid_hostname = localhost

# Qpid broker port. (integer value)
# Deprecated group/name - [DEFAULT]/qpid_port
#qpid_port = 5672

# Qpid HA cluster host:port pairs. (list value)
# Deprecated group/name - [DEFAULT]/qpid_hosts
#qpid_hosts = $qpid_hostname:$qpid_port

# Username for Qpid connection. (string value)
# Deprecated group/name - [DEFAULT]/qpid_username
#qpid_username =

# Password for Qpid connection. (string value)
# Deprecated group/name - [DEFAULT]/qpid_password
#qpid_password =

# Space separated list of SASL mechanisms to use for auth. (string value)
# Deprecated group/name - [DEFAULT]/qpid_sasl_mechanisms
#qpid_sasl_mechanisms =

# Seconds between connection keepalive heartbeats. (integer value)
# Deprecated group/name - [DEFAULT]/qpid_heartbeat
#qpid_heartbeat = 60

# Transport to use, either 'tcp' or 'ssl'. (string value)
# Deprecated group/name - [DEFAULT]/qpid_protocol
#qpid_protocol = tcp

# Whether to disable the Nagle algorithm. (boolean value)
# Deprecated group/name - [DEFAULT]/qpid_tcp_nodelay
#qpid_tcp_nodelay = true

# The number of prefetched messages held by receiver. (integer value)
# Deprecated group/name - [DEFAULT]/qpid_receiver_capacity
#qpid_receiver_capacity = 1

# The qpid topology version to use.  Version 1 is what was originally used by
# impl_qpid.  Version 2 includes some backwards-incompatible changes that allow
# broker federation to work.  Users should update to version 2 when they are
# able to take everything down, as it requires a clean break. (integer value)
# Deprecated group/name - [DEFAULT]/qpid_topology_version
#qpid_topology_version = 1


[oslo_messaging_rabbit]

#
# From oslo.messaging
#

# Use durable queues in AMQP. (boolean value)
# Deprecated group/name - [DEFAULT]/rabbit_durable_queues
#amqp_durable_queues = false

# Auto-delete queues in AMQP. (boolean value)
# Deprecated group/name - [DEFAULT]/amqp_auto_delete
#amqp_auto_delete = false

# Size of RPC connection pool. (integer value)
# Deprecated group/name - [DEFAULT]/rpc_conn_pool_size
#rpc_conn_pool_size = 30

# SSL version to use (valid only if SSL enabled). Valid values are TLSv1 and
# SSLv23. SSLv2, SSLv3, TLSv1_1, and TLSv1_2 may be available on some
# distributions. (string value)
# Deprecated group/name - [DEFAULT]/kombu_ssl_version
#kombu_ssl_version =

# SSL key file (valid only if SSL enabled). (string value)
# Deprecated group/name - [DEFAULT]/kombu_ssl_keyfile
#kombu_ssl_keyfile =

# SSL cert file (valid only if SSL enabled). (string value)
# Deprecated group/name - [DEFAULT]/kombu_ssl_certfile
#kombu_ssl_certfile =

# SSL certification authority file (valid only if SSL enabled). (string value)
# Deprecated group/name - [DEFAULT]/kombu_ssl_ca_certs
#kombu_ssl_ca_certs =

# How long to wait before reconnecting in response to an AMQP consumer cancel
# notification. (floating point value)
# Deprecated group/name - [DEFAULT]/kombu_reconnect_delay
#kombu_reconnect_delay = 1.0

# The RabbitMQ broker address where a single node is used. (string value)
# Deprecated group/name - [DEFAULT]/rabbit_host
#rabbit_host = localhost

# The RabbitMQ broker port where a single node is used. (integer value)
# Deprecated group/name - [DEFAULT]/rabbit_port
#rabbit_port = 5672

# RabbitMQ HA cluster host:port pairs. (list value)
# Deprecated group/name - [DEFAULT]/rabbit_hosts
#rabbit_hosts = $rabbit_host:$rabbit_port

# Connect over SSL for RabbitMQ. (boolean value)
# Deprecated group/name - [DEFAULT]/rabbit_use_ssl
#rabbit_use_ssl = false

# The RabbitMQ userid. (string value)
# Deprecated group/name - [DEFAULT]/rabbit_userid
#rabbit_userid = guest

# The RabbitMQ password. (string value)
# Deprecated group/name - [DEFAULT]/rabbit_password
#rabbit_password = guest

# The RabbitMQ login method. (string value)
# Deprecated group/name - [DEFAULT]/rabbit_login_method
#rabbit_login_method = AMQPLAIN

# The RabbitMQ virtual host. (string value)
# Deprecated group/name - [DEFAULT]/rabbit_virtual_host
#rabbit_virtual_host = /

# How frequently to retry connecting with RabbitMQ. (integer value)
#rabbit_retry_interval = 1

# How long to backoff for between retries when connecting to RabbitMQ. (integer
# value)
# Deprecated group/name - [DEFAULT]/rabbit_retry_backoff
#rabbit_retry_backoff = 2

# Maximum number of RabbitMQ connection retries. Default is 0 (infinite retry
# count). (integer value)
# Deprecated group/name - [DEFAULT]/rabbit_max_retries
#rabbit_max_retries = 0

# Use HA queues in RabbitMQ (x-ha-policy: all). If you change this option, you
# must wipe the RabbitMQ database. (boolean value)
# Deprecated group/name - [DEFAULT]/rabbit_ha_queues
#rabbit_ha_queues = false

# Number of seconds after which the Rabbit broker is considered down if
# heartbeat's keep-alive fails (0 disable the heartbeat). (integer value)
#heartbeat_timeout_threshold = 60

# How often times during the heartbeat_timeout_threshold we check the
# heartbeat. (integer value)
#heartbeat_rate = 2

# Deprecated, use rpc_backend=kombu+memory or rpc_backend=fake (boolean value)
# Deprecated group/name - [DEFAULT]/fake_rabbit
#fake_rabbit = false


[oslo_middleware]

#
# From oslo.middleware
#

# The maximum body size for each  request, in bytes. (integer value)
# Deprecated group/name - [DEFAULT]/osapi_max_request_body_size
# Deprecated group/name - [DEFAULT]/max_request_body_size
#max_request_body_size = 114688


[oslo_policy]

#
# From oslo.policy
#

# The JSON file that defines policies. (string value)
# Deprecated group/name - [DEFAULT]/policy_file
#policy_file = policy.json

# Default rule. Enforced when a requested rule is not found. (string value)
# Deprecated group/name - [DEFAULT]/policy_default_rule
#policy_default_rule = default

# Directories where policy configuration files are stored. They can be relative
# to any directory in the search path defined by the config_dir option, or
# absolute paths. The file defined by policy_file must exist for these
# directories to be searched.  Missing or empty directories are ignored. (multi
# valued)
# Deprecated group/name - [DEFAULT]/policy_dirs
#policy_dirs = policy.d


[paste_deploy]

#
# From keystone
#

# Name of the paste configuration file that defines the available pipelines.
# (string value)

# https://review.openstack.org/#/c/185464/
config_file = /etc/keystone/keystone-paste.ini


[policy]

#
# From keystone
#

# Policy backend driver. (string value)
#driver = keystone.policy.backends.sql.Policy

# Maximum number of entities that will be returned in a policy collection.
# (integer value)
#list_limit = <None>


[resource]

#
# From keystone
#

# Resource backend driver. If a resource driver is not specified, the
# assignment driver will choose the resource driver. (string value)
#driver = <None>

# Toggle for resource caching. This has no effect unless global caching is
# enabled. (boolean value)
# Deprecated group/name - [assignment]/caching
#caching = true

# TTL (in seconds) to cache resource data. This has no effect unless global
# caching is enabled. (integer value)
# Deprecated group/name - [assignment]/cache_time
#cache_time = <None>

# Maximum number of entities that will be returned in a resource collection.
# (integer value)
# Deprecated group/name - [assignment]/list_limit
#list_limit = <None>


[revoke]

#
# From keystone
#

# An implementation of the backend for persisting revocation events. (string
# value)
driver = keystone.contrib.revoke.backends.sql.Revoke

# This value (calculated in seconds) is added to token expiration before a
# revocation event may be removed from the backend. (integer value)
#expiration_buffer = 1800

# Toggle for revocation event caching. This has no effect unless global caching
# is enabled. (boolean value)
#caching = true

# Time to cache the revocation list and the revocation events (in seconds).
# This has no effect unless global and token caching are enabled. (integer
# value)
# Deprecated group/name - [token]/revocation_cache_time
#cache_time = 3600


[role]

#
# From keystone
#

# Role backend driver. (string value)
#driver = <None>

# Toggle for role caching. This has no effect unless global caching is enabled.
# (boolean value)
#caching = true

# TTL (in seconds) to cache role data. This has no effect unless global caching
# is enabled. (integer value)
#cache_time = <None>

# Maximum number of entities that will be returned in a role collection.
# (integer value)
#list_limit = <None>


[saml]

#
# From keystone
#

# Default TTL, in seconds, for any generated SAML assertion created by
# Keystone. (integer value)
#assertion_expiration_time = 3600

# Binary to be called for XML signing. Install the appropriate package, specify
# absolute path or adjust your PATH environment variable if the binary cannot
# be found. (string value)
#xmlsec1_binary = xmlsec1

# Path of the certfile for SAML signing. For non-production environments, you
# may be interested in using `keystone-manage pki_setup` to generate self-
# signed certificates. Note, the path cannot contain a comma. (string value)
#certfile = /etc/keystone/ssl/certs/signing_cert.pem

# Path of the keyfile for SAML signing. Note, the path cannot contain a comma.
# (string value)
#keyfile = /etc/keystone/ssl/private/signing_key.pem

# Entity ID value for unique Identity Provider identification. Usually FQDN is
# set with a suffix. A value is required to generate IDP Metadata. For example:
# https://keystone.example.com/v3/OS-FEDERATION/saml2/idp (string value)
#idp_entity_id = <None>

# Identity Provider Single-Sign-On service value, required in the Identity
# Provider's metadata. A value is required to generate IDP Metadata. For
# example: https://keystone.example.com/v3/OS-FEDERATION/saml2/sso (string
# value)
#idp_sso_endpoint = <None>

# Language used by the organization. (string value)
#idp_lang = en

# Organization name the installation belongs to. (string value)
#idp_organization_name = <None>

# Organization name to be displayed. (string value)
#idp_organization_display_name = <None>

# URL of the organization. (string value)
#idp_organization_url = <None>

# Company of contact person. (string value)
#idp_contact_company = <None>

# Given name of contact person (string value)
#idp_contact_name = <None>

# Surname of contact person. (string value)
#idp_contact_surname = <None>

# Email address of contact person. (string value)
#idp_contact_email = <None>

# Telephone number of contact person. (string value)
#idp_contact_telephone = <None>

# Contact type. Allowed values are: technical, support, administrative billing,
# and other (string value)
#idp_contact_type = other

# Path to the Identity Provider Metadata file. This file should be generated
# with the keystone-manage saml_idp_metadata command. (string value)
#idp_metadata_path = /etc/keystone/saml2_idp_metadata.xml

# The prefix to use for the RelayState SAML attribute, used when generating ECP
# wrapped assertions. (string value)
#relay_state_prefix = ss:mem:


[signing]

#
# From keystone
#

# Path of the certfile for token signing. For non-production environments, you
# may be interested in using `keystone-manage pki_setup` to generate self-
# signed certificates. (string value)
#certfile = /etc/keystone/ssl/certs/signing_cert.pem

# Path of the keyfile for token signing. (string value)
#keyfile = /etc/keystone/ssl/private/signing_key.pem

# Path of the CA for token signing. (string value)
#ca_certs = /etc/keystone/ssl/certs/ca.pem

# Path of the CA key for token signing. (string value)
#ca_key = /etc/keystone/ssl/private/cakey.pem

# Key size (in bits) for token signing cert (auto generated certificate).
# (integer value)
#key_size = 2048

# Days the token signing cert is valid for (auto generated certificate).
# (integer value)
#valid_days = 3650

# Certificate subject (auto generated certificate) for token signing. (string
# value)
#cert_subject = /C=US/ST=Unset/L=Unset/O=Unset/CN=www.example.com


[ssl]

#
# From keystone
#

# Path of the CA key file for SSL. (string value)
#ca_key = /etc/keystone/ssl/private/cakey.pem

# SSL key length (in bits) (auto generated certificate). (integer value)
#key_size = 1024

# Days the certificate is valid for once signed (auto generated certificate).
# (integer value)
#valid_days = 3650

# SSL certificate subject (auto generated certificate). (string value)
#cert_subject = /C=US/ST=Unset/L=Unset/O=Unset/CN=localhost


[token]

#
# From keystone
#

# External auth mechanisms that should add bind information to token, e.g.,
# kerberos,x509. (list value)
#bind =

# Enforcement policy on tokens presented to Keystone with bind information. One
# of disabled, permissive, strict, required or a specifically required bind
# mode, e.g., kerberos or x509 to require binding to that authentication.
# (string value)
#enforce_token_bind = permissive

# Amount of time a token should remain valid (in seconds). (integer value)
#expiration = 3600

# Controls the token construction, validation, and revocation operations. Core
# providers are "keystone.token.providers.[fernet|pkiz|pki|uuid].Provider".
# (string value)
provider = keystone.token.providers.uuid.Provider

# Token persistence backend driver. (string value)
driver = keystone.token.persistence.backends.memcache.Token

# Toggle for token system caching. This has no effect unless global caching is
# enabled. (boolean value)
#caching = true

# Time to cache tokens (in seconds). This has no effect unless global and token
# caching are enabled. (integer value)
#cache_time = <None>

# Revoke token by token identifier. Setting revoke_by_id to true enables
# various forms of enumerating tokens, e.g. `list tokens for user`. These
# enumerations are processed to determine the list of tokens to revoke. Only
# disable if you are switching to using the Revoke extension with a backend
# other than KVS, which stores events in memory. (boolean value)
#revoke_by_id = true

# Allow rescoping of scoped token. Setting allow_rescoped_scoped_token to false
# prevents a user from exchanging a scoped token for any other token. (boolean
# value)
#allow_rescope_scoped_token = true

# The hash algorithm to use for PKI tokens. This can be set to any algorithm
# that hashlib supports. WARNING: Before changing this value, the auth_token
# middleware must be configured with the hash_algorithms, otherwise token
# revocation will not be processed correctly. (string value)
hash_algorithm = {{hash_algorithm}}


[trust]

#
# From keystone
#

# Delegation and impersonation features can be optionally disabled. (boolean
# value)
#enabled = true

# Enable redelegation feature. (boolean value)
#allow_redelegation = false

# Maximum depth of trust redelegation. (integer value)
#max_redelegation_count = 3

# Trust backend driver. (string value)
#driver = keystone.trust.backends.sql.Trust