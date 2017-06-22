# Change logs for Rudder 2.8.\* "Patrol boat" versions

Rudder 2.8 has reached End of Life the in November 2013. This
branch is codenamed "Patrol boat".

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**​Main new features in Rudder 2.8:**

  - Configuration for change messages and change requests (validation
    workflow) can now be done inside the web interface (Administration
    -\> Settings)
  - Relay servers are now fully operational, and a simple process has
    been put into place to make a regular node into a relay for
    promises, reports and inventories. See
    http://www.rudder-project.org/rudder-doc-2.8/rudder-doc.html\#relay-servers.
  - HTTP/S is now enabled and configured by default (using a self-signed
    certificate)
  - Change Requests (validation workflow) can now be managed through
    REST API. See
    http://www.rudder-project.org/rudder-api-doc/#api-Change_Requests.
  - Significant performance improvements (up to 30% speed increase) on
    displaying pages with reports in the web interface ("Rules" and
    "Node details" pages)
  - The rudder-agent now uses CFEngine 3.5
  - Android system is now supported in all Techniques
  - Directive details display has been improved, so you can focus on
    configuration settings

A blog post about all these features is available here:
http://blog.normation.com/en/2013/11/20/rudder-2-8/

**Installing, upgrading and testing**

Documentation to Install and Upgrade is available online. The Download
page sums up URLs. We also recommend using the Rudder Vagrant config if
you want a quick and easy way to get an installation for testing.

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server: **Debian 5, Debian 6, Debian 7, RHEL/CentOS 6, SLES
    11, Ubuntu 12.04 and Ubuntu 12.10**
  - Rudder agent: all of the above plus **RHEL/CentOS 3, RHEL/CentOS
    5 and SLES 10 and Ubuntu 10.04**

## Rudder 2.8.4 (2014-03-14)

### Changes

### Bug fixes

#### System integration

  - Fixed: check-rudder-agent script fails to create a new UUID if not
    defined and no backup exists
    ([\#4607](http://www.rudder-project.org/redmine/issues/4607))
  - Fixed: Typo in the deletion of lock file if the promises are not
    updated
    ([\#4604](http://www.rudder-project.org/redmine/issues/4604))

#### Webapp - Reporting

  - Fixed: A rare race condition can lead to an error when looking at
    compliance while a deployment is in progress
    ([\#4559](http://www.rudder-project.org/redmine/issues/4559))

#### Webapp - Config management

  - Fixed: Remove unused data from the LDAP tree initialization
    ([\#4575](http://www.rudder-project.org/redmine/issues/4575))

#### Webapp - Node management

  - Fixed: When accepting several nodes, one policy generation is
    triggered for each of them
    ([\#4492](http://www.rudder-project.org/redmine/issues/4492))

#### Webapp - Display, home page

  - Fixed: Too many Rules are displayed on the Home page ( 3 system
    Rules are included )
    ([\#4570](http://www.rudder-project.org/redmine/issues/4570))

#### Techniques - System & initial promises

  - Fixed: Last update detection is broken, causing cron remove cf\_lock
    database and flood with emails every 5 minutes
    ([\#4582](http://www.rudder-project.org/redmine/issues/4582))

#### Packaging

  - Fixed: Missing dependencies declaration (rsyslog-pgsql) in debian
    may prevents from installing Rudder server correctly
    ([\#4569](http://www.rudder-project.org/redmine/issues/4569))

#### Documentation

  - Fixed: Documentation does not build anymore due to an unclosed
    section
    ([\#4572](http://www.rudder-project.org/redmine/issues/4572))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Olivier Desport
  - Cédric Jardin
  - Christophe Nowicki
  - Alex Tkachenko

This is a bug fix release in the 2.8 series and all installations of
2.8.\* should be upgraded when possible. This version is not yet marked
"stable", since it has not yet proven itself to be reliable on
production systems over a period of several months. The current "stable"
release is still 2.6.\*.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. To be
declared "stable" we prefer to wait until a version has been available
and running in production for several months. However, since new 2.9.\*
versions has been released, we expect that new version to be declared
stable very soon.

## Rudder 2.8.3 (2014-03-06)

### Changes

#### Agent

  - Upgrade CFEngine version to 3.5.3
    ([\#4553](http://www.rudder-project.org/redmine/issues/4553))

#### Techniques

  - Technique 'Group management': Add an option to enforce group content
    ([\#4467](http://www.rudder-project.org/redmine/issues/4467))
  - Technique 'ssh keys distribution': Have several keys per users
    ([\#4439](http://www.rudder-project.org/redmine/issues/4439))
  - Technique "Generic Variable definition": Allow empty values
    ([\#3848](http://www.rudder-project.org/redmine/issues/3848))
  - Technique 'Group management': Set GID of group
    ([\#3843](http://www.rudder-project.org/redmine/issues/3843))

#### System integration

  - Add a script to change Rudder policy server IP/host name
    ([\#4325](http://www.rudder-project.org/redmine/issues/4325))

#### Techniques - System & init promises

  - Improve zypper detection and usage on SLES10 agents
    ([\#4449](http://www.rudder-project.org/redmine/issues/4449))

#### Documentation

  - Add a section in documentation about sizing of a Rudder server
    ([\#4053](http://www.rudder-project.org/redmine/issues/4053))
  - Add information about firewall for rudder-webapp
    ([\#4131](http://www.rudder-project.org/redmine/issues/4131))

### Bug fixes

#### Techniques

  - Fixed: Technique "Package Management for RPM systems": Wrong
    operator for "This version or any earlier one"
    ([\#4447](http://www.rudder-project.org/redmine/issues/4447))
  - Fixed: Technique "Download a file from the shared folder": Error
    message when a copy failed using does not explain what actually
    failed
    ([\#4278](http://www.rudder-project.org/redmine/issues/4278))
  - Fixed: Technique "RUG / \!YaST package manager configuration (ZMD)":
    'security-level' option is misnamed 'package source policy'
    ([\#4128](http://www.rudder-project.org/redmine/issues/4128))
  - Fixed: Technique "Package management for APT systems": packages with
    suffix :amd64 are not correctly detected
    ([\#3830](http://www.rudder-project.org/redmine/issues/3830))
  - Fixed: Technique 'Download a file from the shared folder': Cannot
    copy a file from the shared-folder on the root server
    ([\#3581](http://www.rudder-project.org/redmine/issues/3581))
  - Fixed: Technique 'Group management' v3.0: There is no backup to file
    repository when updating /etc/group file
    ([\#4471](http://www.rudder-project.org/redmine/issues/4471))
  - Fixed: Technique "Download a file from the shared folder":
    Explanation about which files will be copied are not correct
    ([\#4354](http://www.rudder-project.org/redmine/issues/4354))

#### Webapp - Config management

  - Fixed: Newline characters may be missing from archived files in
    configuration repository
    ([\#4476](http://www.rudder-project.org/redmine/issues/4476))
  - Fixed: Can not delete custom Active techniques category
    ([\#4392](http://www.rudder-project.org/redmine/issues/4392))
  - Fixed: Special characters (ie, accents such as éèùô) are replaced by
    "?" in CFEngine promises
    ([\#4381](http://www.rudder-project.org/redmine/issues/4381))
  - Fixed: Missing Node Configuration entry in LDAP prevents Rudder from
    starting
    ([\#4348](http://www.rudder-project.org/redmine/issues/4348))
  - Fixed: The default disclaimer message loaded initially into LDAP has
    an invalid charachter in it
    ([\#4393](http://www.rudder-project.org/redmine/issues/4393))
  - Fixed: When adding a Directive to a Rule from a newly created
    Directives screen, Change Request popup not displayed
    ([\#4383](http://www.rudder-project.org/redmine/issues/4383))

#### Webapp - Administration

  - Fixed: Rudder max days of archived reports retained cannot be
    configured from properties
    ([\#4401](http://www.rudder-project.org/redmine/issues/4401))

#### Webapp - Node management

  - Fixed: Sort in group tree is case-sensitive
    ([\#4157](http://www.rudder-project.org/redmine/issues/4157))

#### Inventory (webapp, Fusion)

  - Fixed: Inventory with empty CFEngine agent public key cannot be
    processed by Rudder raising exceptions
    ([\#4518](http://www.rudder-project.org/redmine/issues/4518))
  - Fixed: Bios version from inventory is not correctly displayed into
    the web interface
    ([\#4500](http://www.rudder-project.org/redmine/issues/4500))
  - Fixed: Variables from /etc/profile and /etc/profile.d files are not
    passed to the inventory environment
    ([\#4493](http://www.rudder-project.org/redmine/issues/4493))
  - Fixed: When new inventory is processed, hardware Node information
    may not be updated
    ([\#4440](http://www.rudder-project.org/redmine/issues/4440))
  - Fixed: Process start date are not parsed correctly when parsing
    inventory file
    ([\#4402](http://www.rudder-project.org/redmine/issues/4402))
  - Fixed: Process start date are displayed as "bad format" in Rudder
    web interface
    ([\#4400](http://www.rudder-project.org/redmine/issues/4400))
  - Fixed: Rudder considers an inventory as "failed" if the endpoint is
    unavailable
    ([\#4491](http://www.rudder-project.org/redmine/issues/4491))

#### Webapp - CFEngine integration

  - Fixed: Promises are not generated when Rudder server starts for the
    first time
    ([\#4532](http://www.rudder-project.org/redmine/issues/4532))
  - Fixed: A freshly installed Rudder server will not apply root server
    specific policies until promises are regenerated
    ([\#4533](http://www.rudder-project.org/redmine/issues/4533))
  - Fixed: Accumulation of cf-agent processes due to locking on CFEngine
    tcdb lock file
    ([\#4494](http://www.rudder-project.org/redmine/issues/4494))
  - Fixed: Template expansion sometimes removes spaces and adds a block
    in several times
    ([\#4487](http://www.rudder-project.org/redmine/issues/4487))
  - Fixed: Sometimes CFEngine get stuck because of locks on
    \!TokyoCabinet
    ([\#3928](http://www.rudder-project.org/redmine/issues/3928))

#### Webapp - Reporting

  - Fixed: The rsyslog regexp matching executionTimeStamp is too greedy
    and could take more characters than it should
    ([\#4431](http://www.rudder-project.org/redmine/issues/4431))
  - Fixed: Rsyslog filters reports when too many reports arrive
    simultaneously
    ([\#4281](http://www.rudder-project.org/redmine/issues/4281))

#### Relay Servers

  - Fixed: The allowed network on the relay servers are those of their
    own policy server
    ([\#4380](http://www.rudder-project.org/redmine/issues/4380))

#### System integration

  - Fixed: Remove the unnecessary licenses file creation for CFEngine
    Enterprise systems in the rudder-init script
    ([\#4482](http://www.rudder-project.org/redmine/issues/4482))
  - Fixed: Rudder should not complain if the license file for CFEngine
    Enterprise is not present
    ([\#4481](http://www.rudder-project.org/redmine/issues/4481))

#### Performance and scalability

  - Fixed: Optimization on LDAP requests (number of rules, ...) from
    home page
    ([\#4495](http://www.rudder-project.org/redmine/issues/4495))
  - Fixed: An unnecesseary promise generation is launched right after
    making a new archive of the configuration
    ([\#4479](http://www.rudder-project.org/redmine/issues/4479))

#### Techniques - System & init promises

  - Fixed: Log file about non compliant reports is not managed by
    logrotate on Red Hat-like Rudder server
    ([\#4556](http://www.rudder-project.org/redmine/issues/4556))
  - Fixed: Initial logrotate configuration (from initial-promises) does
    not include recent fixes
    ([\#4551](http://www.rudder-project.org/redmine/issues/4551))
  - Fixed: Wrong permissions slapd.log after logrotate
    ([\#4445](http://www.rudder-project.org/redmine/issues/4445))
  - Fixed: System technique complain when a lot of user are defined on
    the system
    ([\#4434](http://www.rudder-project.org/redmine/issues/4434))
  - Fixed: Cf-execd started by cron is missing environment variables,
    making the agent unable to run correctly
    ([\#4198](http://www.rudder-project.org/redmine/issues/4198))
  - Fixed: Command to restart rsyslog is not correct on Fedora
    ([\#4156](http://www.rudder-project.org/redmine/issues/4156))
  - Fixed: Commands to check and restart cron daemon on Fedora are not
    correct
    ([\#4155](http://www.rudder-project.org/redmine/issues/4155))
  - Fixed: Initial logrotate configuration (from initial-promises) does
    not apply delaycompress option
    ([\#4554](http://www.rudder-project.org/redmine/issues/4554))

#### Packaging

  - Fixed: rudder-inventory-ldap package should 'conflict' with other
    \!OpenLDAP packages that install /etc/init.d/slapd
    ([\#4508](http://www.rudder-project.org/redmine/issues/4508))
  - Fixed: rudder-jetty package should 'conflict' with other jetty
    packages that install /etc/init.d/jetty
    ([\#4496](http://www.rudder-project.org/redmine/issues/4496))
  - Fixed: The rudder-webapp package can't be installed on SLES due to a
    syntax error in post-inst
    ([\#4484](http://www.rudder-project.org/redmine/issues/4484))
  - Fixed: Add Fedora related dependencies to rudder-agent to allow it
    to build on this platform
    ([\#4154](http://www.rudder-project.org/redmine/issues/4154))
  - Fixed: Unnecessary and confusing properties deprecation messages on
    new install
    ([\#4412](http://www.rudder-project.org/redmine/issues/4412))
  - Fixed: "/etc/init.d/rudder-server-root status" returns no pid for
    postgres on ubuntu
    ([\#4283](http://www.rudder-project.org/redmine/issues/4283))
  - Fixed: Create a robots.txt file in /opt/rudder/share/load-page to
    prevent an apache error log flooding
    ([\#3120](http://www.rudder-project.org/redmine/issues/3120))

#### Documentation

  - Fixed: Documentation still mentions port 80 for web interface
    instead of 443
    ([\#4394](http://www.rudder-project.org/redmine/issues/4394))

#### Architecture - Tests

  - Fixed: Connection releasing of test LDAP server is incorrect,
    leading to lost of connection
    ([\#4464](http://www.rudder-project.org/redmine/issues/4464))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Fabrice Flore-Thébault
  - Michael Gliwinski
  - Yvan Masson
  - Olivier Mauras
  - Christophe Nowicki
  - Jean Remond
  - Alex Tkachenko

This is a bug fix release in the 2.8 series and all installations of
2.8.\* should be upgraded when possible. This version is not yet marked
"stable", since it has not yet proven itself to be reliable on
production systems over a period of several months. The current "stable"
release is still 2.6.\*.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. To be
declared "stable" we prefer to wait until a version has been available
and running in production for several months. However, since new 2.9.\*
versions has been released, we expect that new version to be declared
stable very soon

## Rudder 2.8.2 (2014-01-16)

### Changes

#### Techniques

  - Technique "Download a file from the shared folder" should display
    where the shared folder is located
    ([\#4353](http://www.rudder-project.org/redmine/issues/4353))

### Bug fixes

#### Webapp - Administration

  - Fixed: Archive parameter files are named 'ParameterName(name).xml'
    instead of 'name.xml'
    ([\#4377](http://www.rudder-project.org/redmine/issues/4377))
  - Fixed: Parameters are not included when dowloading zip archive
    ([\#4374](http://www.rudder-project.org/redmine/issues/4374))
  - Fixed: Techniques are not included when downloading zip archive
    ([\#4279](http://www.rudder-project.org/redmine/issues/4279))
  - Fixed: Size of databases displayed in the web interface are lower
    than they really are
    ([\#4101](http://www.rudder-project.org/redmine/issues/4101))

#### Inventory (webapp, Fusion)

  - Fixed: Without lsb\_release installed, [RedHat](RedHat) is detected
    as Scientific Linux
    ([\#4360](http://www.rudder-project.org/redmine/issues/4360))
  - Fixed: Inventories containing very long (\> 4096) process name
    cannot be send to rudder server via CFEngine
    ([\#4314](http://www.rudder-project.org/redmine/issues/4314))

#### Webapp - Config management

  - Fixed: "Missing node" error message in rule compliance when a node
    is deleted
    ([\#3955](http://www.rudder-project.org/redmine/issues/3955))
  - Fixed: In Rule edit form, group tree is sent to the end of the page
    if one name is too long
    ([\#4175](http://www.rudder-project.org/redmine/issues/4175))
  - Fixed: When a Rule is disabled due to an invalid state, some changes
    made on that Rule may be overwritten
    ([\#4209](http://www.rudder-project.org/redmine/issues/4209))
  - Fixed: Exporting groups with same name but in different categories
    to another server Rudder is not working
    ([\#4149](http://www.rudder-project.org/redmine/issues/4149))

#### Documentation

  - Fixed: Specify the modules needed by the relay server installation
    ([\#4266](http://www.rudder-project.org/redmine/issues/4266))
  - Fixed: Incorrect English grammar
    ([\#4206](http://www.rudder-project.org/redmine/issues/4206))
  - Fixed: Remove unused relay documentation placeholder files
    ([\#4267](http://www.rudder-project.org/redmine/issues/4267))

#### Webapp - Display, home page

  - Fixed: If a popup is too large for a screen, save buttons can't be
    used ([\#3795](http://www.rudder-project.org/redmine/issues/3795))

#### Packaging

  - Fixed: Rudder server cannot be installed on [CentOS](CentOS) and Red
    Hat 6.5 since dependency 'jre' does not exist anymore
    ([\#4290](http://www.rudder-project.org/redmine/issues/4290))
  - Fixed: Necessary entries in the apache2 sysconfig of SLES systems
    are missing
    ([\#4280](http://www.rudder-project.org/redmine/issues/4280))

#### Techniques

  - Fixed: Report state is "unknown" on Root server for "Inventories"
    component in "Distibute policy"
    ([\#4364](http://www.rudder-project.org/redmine/issues/4364))
  - Fixed: There is no reports for package removal on debian/ubuntu
    systems
    ([\#4144](http://www.rudder-project.org/redmine/issues/4144))
  - Fixed: All techniques should back up all modified/copied files by
    Rudder
    ([\#4371](http://www.rudder-project.org/redmine/issues/4371))
  - Fixed: Technique "Download a file from the shared folder":
    permissions defaulted to none (mode 0000)
    ([\#4368](http://www.rudder-project.org/redmine/issues/4368))
  - Fixed: Incorrect detection of empty password/name in
    'userManagement' Technique when several user are to be managed
    ([\#4347](http://www.rudder-project.org/redmine/issues/4347))
  - Fixed: In 'userManagement' Technique, the full name is checked only
    every 60 minutes, resulting in unknown reports
    ([\#4346](http://www.rudder-project.org/redmine/issues/4346))
  - Fixed: Change the Path statement in 'Enforce a file content'
    Technique (all versions)
    ([\#4311](http://www.rudder-project.org/redmine/issues/4311))
  - Fixed: With initial-promises, error message is not displayed when
    policies could not be updated
    ([\#4244](http://www.rudder-project.org/redmine/issues/4244))
  - Fixed: A Xen Hypervisor on SLES does not make a valid inventory and
    can't be accepted into Rudder since binary path to xenstore is wrong
    on SLES 11 and does not exist on SLES 10
    ([\#4227](http://www.rudder-project.org/redmine/issues/4227))
  - Fixed: It is not possible to add a block content or at a specified
    location of a file using 'Enforce file content' Technique
    ([\#3293](http://www.rudder-project.org/redmine/issues/3293))
  - Fixed: Command to restart rsyslog is not correct on Fedora
    ([\#4156](http://www.rudder-project.org/redmine/issues/4156)) \*
    Fixed: correct some typos is 'sshConfiguration' Technique v3.0
    ([\#4328](http://www.rudder-project.org/redmine/issues/4328))

#### Webapp - Reporting

  - Fixed: Reports containing a \_ in the "Policy" (human readable
    policy name) are rejected by rsyslog
    ([\#4247](http://www.rudder-project.org/redmine/issues/4247))

#### Webapp - CFEngine integration

  - Fixed: CFEngine refuses to start after upgrade from 2.7.5 to 2.8.1
    due to a CFEngine buffer overflow
    ([\#4241](http://www.rudder-project.org/redmine/issues/4241))
  - Fixed: Rudder 2.8 reports that it couldn't update its promises when
    it could, because it cannot purge directory
    ([\#4173](http://www.rudder-project.org/redmine/issues/4173))
  - Fixed: At each agent run, promises are validated and value of
    $ is invalid
    ([\#4158](http://www.rudder-project.org/redmine/issues/4158))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Yvan Masson
  - Olivier Mauras
  - Christophe Nowicki
  - Joachim Setzer
  - Daniel Stan
  - Alex Tkachenko

This is a bug fix release in the 2.8 series and all installations of
2.8.\* should be upgraded when possible. This version is not yet marked
"stable", since it has not yet proven itself to be reliable on
production systems over a period of several months. The current "stable"
release is still 2.6.\*.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. To be
declared "stable" we prefer to wait until a version has been available
and running in production for several months. However, since new 2.9.\*
versions has been released, we expect that new version to be declared
stable very soon.

## Rudder 2.8.1 (2013-11-20)

### Changes

#### Techniques

  - Hide by default sections that are not "mandatory" within Techniques
    ([\#4105](http://www.rudder-project.org/redmine/issues/4105))
  - New Technique added: Partition monitoring
    ([\#3984](http://www.rudder-project.org/redmine/issues/3984))

### Bug fixes

#### Logging

  - Fixed: Excessive logs from "Store Agent Run Times" task
    ([\#4138](http://www.rudder-project.org/redmine/issues/4138))
  - Fixed: Disabling workflow functionnality should disable change
    request, however a log about change request is still displayed
    ([\#4143](http://www.rudder-project.org/redmine/issues/4143))

#### Documentation

  - Fixed: Upgrading order for 2.8 is not sufficiently visible
    ([\#4168](http://www.rudder-project.org/redmine/issues/4168))

#### Packaging

  - Fixed: [PostgreSQL](PostgreSQL) migration of 'nodes execution' table
    can take a long time, a warning should be displayed
    ([\#4167](http://www.rudder-project.org/redmine/issues/4167))
  - Fixed: RPM postinst command for apache start is missing "Done"
    output
    ([\#4141](http://www.rudder-project.org/redmine/issues/4141))
  - Fixed: First inventory sending may not contains UUID
    ([\#4147](http://www.rudder-project.org/redmine/issues/4147))

#### Webapp - Administration

  - Fixed: Correct English in "change message" pop-ups
    ([\#4151](http://www.rudder-project.org/redmine/issues/4151))
  - Fixed: Rudder cannot load several plugins at the same time
    ([\#3314](http://www.rudder-project.org/redmine/issues/3314))

#### Webapp - Node management

  - Fixed: A node in an invalid time could lead to have 'No answer'
    state on the whole promises
    ([\#4148](http://www.rudder-project.org/redmine/issues/4148))

#### Webapp - Config management

  - Fixed: The deletion of a Technique version used by a Directive will
    throw an error ' [NoSuchElementError](NoSuchElementError) '
    ([\#3687](http://www.rudder-project.org/redmine/issues/3687))

#### Techniques

  - Fixed: Technique 'Package management for RHEL / [CentOS](CentOS) /
    ([SuSE](SuSE) / RPM systems' v4.0, 4.1 and 5.0: Incorrect clear of
    cache of installed packaged on promises updates lead to have 'No
    answer' states after a modification of packages in Directive
    ([\#4145](http://www.rudder-project.org/redmine/issues/4145))
  - Fixed: Reporting message that state that curl is missing should be
    clearer ([](http://www.rudder-project.org/redmine/issues/4021)
    ([\#4166](http://www.rudder-project.org/redmine/issues/4166))
  - Fixed: The first inventory made display disturbing error messages
    about CPU
    ([\#3854](http://www.rudder-project.org/redmine/issues/3854))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Olivier Mauras
  - Jean Remond

This is a bug fix release in the 2.8 series and all installations of
2.8.x should be upgraded when possible. 
This version is not yet marked "stable", since it has not yet proven
itself to be reliable on production systems over a period of several
months. The current "stable" release is still 2.6.\*. 
 
When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. To be
declared "stable" we prefer to wait until a version has been available
and running in production for several months. As such, we expect version
2.7 of Rudder to be declared stable very soon.

## Rudder 2.8.0 (2013-11-07)

### Bug fixes

#### Packaging

  - Fixed: URL given at the end of rudder-init.sh still use 'http'
    instead of 'https'
    ([\#4135](http://www.rudder-project.org/redmine/issues/4135))
  - Fixed: slapd is not always restarted on upgrading, leading to
    missing schema update
    ([\#4132](http://www.rudder-project.org/redmine/issues/4132))
  - Fixed: Apache is not started after reboot on RPM systems
    ([\#4126](http://www.rudder-project.org/redmine/issues/4126))
  - Fixed: If a node has not cron (or equivalent) installed, then the
    uuid or init script are not restored
    ([\#4009](http://www.rudder-project.org/redmine/issues/4009))
  - Fixed: Ubuntu oneiric (11.10) packages are not built anymore since
    Rudder 2.8
    ([\#4122](http://www.rudder-project.org/redmine/issues/4122))

#### API

  - Fixed: API for Change Request details returns the wrong action name
    ([\#4134](http://www.rudder-project.org/redmine/issues/4134))

#### Webapp - CFEngine integration

  - Fixed: When upgrading 2.4 -\> 2.8, promises are generated before the
    migration of CFEngine variable, leading to wrong promises generated
    ([\#4130](http://www.rudder-project.org/redmine/issues/4130))

#### Documentation

  - Fixed: User manual doesn't mention RHEL/CentOS 3 support
    ([\#4125](http://www.rudder-project.org/redmine/issues/4125))
  - Fixed: User manual doesn't mention Debian wheezy support
    ([\#4124](http://www.rudder-project.org/redmine/issues/4124))

#### Techniques - Sys & init promis

  - Fixed: The rSyslog rate limiting bug fix is defined but not called
    in the Techniques
    ([\#4127](http://www.rudder-project.org/redmine/issues/4127))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

 Jean Remond

This version of Rudder is a final release. We have tested it thoroughly
and believe it to be free of any major bugs. However, this branch is not
marked "stable", since it still has to be proven reliable on production
systems over a period of several months. The current "stable" release is
2.6.\*.

## Rudder 2.8.0~rc2 (2013-10-31)

### Bug fixes

#### Packaging

  - Fixed: A typo in root server policy prevents upgrading Rudder server
    to Rudder 2.8
    ([\#4112](http://www.rudder-project.org/redmine/issues/4112))
  - Fixed: Upgrading a node with invalid promises to Rudder 2.8 fails
    ([\#4110](http://www.rudder-project.org/redmine/issues/4110))
  - Fixed: /etc/cron.d/rudder-agent is not installed on Debian/Ubuntu
    ([\#4109](http://www.rudder-project.org/redmine/issues/4109))
  - Fixed: Rudder upgrade fails if you accept to replace
    rudder-web.properties with new default one
    ([\#4062](http://www.rudder-project.org/redmine/issues/4062))
  - Fixed: On Rudder install, "/opt/rudder/etc/rudder-password.conf"
    does not exists leading to an error while installing
    ([\#4120](http://www.rudder-project.org/redmine/issues/4120))
  - Fixed: Rudder upgrade script is not launched on installation on RPM
    based systems
    ([\#4121](http://www.rudder-project.org/redmine/issues/4121))

#### Webapp - Administration

  - Fixed: Reload technique library at webapp startup if a flag file
    exists
    ([\#4113](http://www.rudder-project.org/redmine/issues/4113))
  - Fixed: Automatic technique library updater is not launched
    ([\#4116](http://www.rudder-project.org/redmine/issues/4116))
  - Fixed: "Change request" menu does not appear if it was disabled at
    startup
    ([\#4114](http://www.rudder-project.org/redmine/issues/4114))

#### Techniques

  - Fixed: Inventory Technique is not valid: "isfile" function does not
    exist ([\#4111](http://www.rudder-project.org/redmine/issues/4111))

#### Miscellaneous

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter

This version is a release candidate, and contains bug fixes since
2.8.0~rc1. We have tested it and believe it to be free of any critical
bugs. The use on production systems is not encouraged at this time and
is at your own risk. However, we do encourage testing, and welcome all
and any feedback\!

## Rudder 2.8.0~rc1 (2013-10-25)

### Changes

#### Techniques - Sys & init promis

  - Rudder-agent cron file now use check-rudder-agent script
    (/opt/rudder/bin/check-rudder-agent)
    ([\#3930](http://www.rudder-project.org/redmine/issues/3930))

#### Webapp - Administration

  - When Rudder does not start due to an error in rudder-users.xml, the
    webapp will display an usable error log
    ([\#4079](http://www.rudder-project.org/redmine/issues/4079))

#### Webapp - Display, home page

  - Add Rudder 2.8 logo: The patrol boat
    ([\#4096](http://www.rudder-project.org/redmine/issues/4096))

#### Webapp - Config management

  - Reduce Directive information size
    ([\#4103](http://www.rudder-project.org/redmine/issues/4103))

#### Inventory (webapp, Fusion)

  - Move broken received inventories to a separate directory
    ([\#3139](http://www.rudder-project.org/redmine/issues/3139))

#### Techniques

  - Android support
    ([\#4099](http://www.rudder-project.org/redmine/issues/4099))
  - Suppress an unwanted warning when the Rudder tools have not been
    uploaded on the agent and an inventory runs.
    ([\#3854](http://www.rudder-project.org/redmine/issues/3854))
  - Partition monitoring technique
    ([\#3984](http://www.rudder-project.org/redmine/issues/3984))
  - Hide by default sections that are not "mandatory" within Techniques
    ([\#4105](http://www.rudder-project.org/redmine/issues/4105))

### Bug fixes

#### Techniques - Sys & init promis

  - Fixed: Using list of path for sending inventories in Rudder 2.8
    leads to inconsistent failure
    ([\#4094](http://www.rudder-project.org/redmine/issues/4094))
  - Fixed: There is a typo in Rudder file disclaimer
    ([\#4032](http://www.rudder-project.org/redmine/issues/4032))
  - Fixed: The inventory promises truncate the policy server uuid to 33
    characters
    ([\#4018](http://www.rudder-project.org/redmine/issues/4018))

#### Documentation

  - Fixed: Upgrade instructions from 2.5 to 2.8
    ([\#4081](http://www.rudder-project.org/redmine/issues/4081))
  - Fixed: Change all references to version number to be 2.8 for the 2.8
    doc ([\#4080](http://www.rudder-project.org/redmine/issues/4080))

#### Webapp - Reporting

  - Fixed: When we migrate to 2.8, the time to catch up on all the nodes
    execution time is very long
    ([\#4091](http://www.rudder-project.org/redmine/issues/4091))
  - Fixed: A query about execution date of reports still use old
    parameters
    ([\#4089](http://www.rudder-project.org/redmine/issues/4089))

#### Webapp - Node management

  - Fixed: Deleted and pending nodes Role is displayed as an error
    message.
    ([\#4086](http://www.rudder-project.org/redmine/issues/4086))
  - Fixed: "No Machine Inventory" in the Nodes list but machine
    inventory details available
    ([\#4085](http://www.rudder-project.org/redmine/issues/4085))

#### Webapp - Config management

  - Fixed: The check of validity of rudder parameters within variable
    values is too strict
    ([\#4063](http://www.rudder-project.org/redmine/issues/4063))

#### Webapp - Administration

  - Fixed: Properties not updated in the webapp
    ([\#4084](http://www.rudder-project.org/redmine/issues/4084))
  - Fixed: An error occurs when displaying a change request where a
    directive technique was moved
    ([\#4030](http://www.rudder-project.org/redmine/issues/4030))

#### Webapp - Display, home page

  - Fixed: Links to Node in the change request and event log are broken
    ([\#4049](http://www.rudder-project.org/redmine/issues/4049))
  - Fixed: There is a typo in text displayed when there are no
    modifications to save
    ([\#4043](http://www.rudder-project.org/redmine/issues/4043))

#### Techniques

  - Fixed: Remove comma after the promiser from passwordCheck in the
    distirbutePolicy promises
    ([\#4040](http://www.rudder-project.org/redmine/issues/4040))
  - Fixed: The failsafe of the initial promises cannot update promises
    ([\#4025](http://www.rudder-project.org/redmine/issues/4025))
  - Fixed: Reporting message that state that curl is missing should be
    clearer
    ([\#4021](http://www.rudder-project.org/redmine/issues/4021))
  - Fixed: Initial Promises are missing package\_patch\_command
    ([\#4070](http://www.rudder-project.org/redmine/issues/4070))
  - Fixed: Duplicate reports from check of the
    'configuration-repository' git lock since a wrong merge from 2.4 to
    2.6 ([\#4048](http://www.rudder-project.org/redmine/issues/4048))

#### Packaging issues

  - Fixed: Rudder-agent upgrade fails if one of the binaries is in use
    during upgrade
    ([\#4098](http://www.rudder-project.org/redmine/issues/4098),
    ([\#3665](http://www.rudder-project.org/redmine/issues/3665))
  - Fixed: Error when upgrading a server where both policy.xml and
    metadata.xml were existing for the same techniques
    ([\#4088](http://www.rudder-project.org/redmine/issues/4088))
  - Fixed: Agent upgrade blocked by /opt/rudder/etc/disable-agent
    ([\#4087](http://www.rudder-project.org/redmine/issues/4087))
  - Fixed: Upgrading rudder-agent from 2.6.8 to 2.8beta fails on Debian
    ([\#4098](http://www.rudder-project.org/redmine/issues/4098))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Cédric Cabessa
  - Fabrice Flore-Thébault
  - Dennis Cabooter
  - Olivier Mauras

This version is a release candidate, and contains bug fixes sinces
2.8.0~beta1. We have tested it and believe it to be free of any critical
bugs. The use on production systems is not encouraged at this time and
is at your own risk. However, we do encourage testing, and welcome all
and any feedback\!

## Rudder 2.8.0~beta1 (2013-10-16)

### Changes

#### Documentation

  - Add informations about the upgrade process for Rudder 2.8
    ([\#3986](http://www.rudder-project.org/redmine/issues/3986))
      - Look at the [upgrade
        process](http://www.rudder-project.org/rudder-doc-2.8/rudder-doc.html#_upgrading_from_rudder_2_4_2_6_or_2_7)
        here\!

#### Logging

  - Improve debug log when a Change Request can't be merged
    ([\#3977](http://www.rudder-project.org/redmine/issues/3977))

#### Webapp - Config management

  - Display Technique version used for each Directive in the Directives
    tree ([\#4007](http://www.rudder-project.org/redmine/issues/4007))
  - When saving a Rule without target groups or directives, display a
    warning message
    ([\#3937](http://www.rudder-project.org/redmine/issues/3937))

#### Webapp - Administration

  - Manage properties inside the web interface.
    ([\#4057](http://www.rudder-project.org/redmine/issues/4057))

#### System integration

  - Enable HTTP/S by default
    ([\#3877](http://www.rudder-project.org/redmine/issues/3877),
    ([\#4006](http://www.rudder-project.org/redmine/issues/4006),
    ([\#4067](http://www.rudder-project.org/redmine/issues/4067),
    ([\#4073](http://www.rudder-project.org/redmine/issues/4073),
    ([\#4074](http://www.rudder-project.org/redmine/issues/4074),
    ([\#4075](http://www.rudder-project.org/redmine/issues/4075),
    ([\#4076](http://www.rudder-project.org/redmine/issues/4076))
  - Integration of CFEngine 3.5.\* into Rudder
    ([\#3869](http://www.rudder-project.org/redmine/issues/3869),
    ([\#4041](http://www.rudder-project.org/redmine/issues/4041),
    ([\#4042](http://www.rudder-project.org/redmine/issues/4042))
  - Add 'status' option to the rudder-server-root init script
    ([\#3610](http://www.rudder-project.org/redmine/issues/3610))
  - All Apache logs should be sent to /var/log/rudder/apache2
    ([\#4010](http://www.rudder-project.org/redmine/issues/4010))
  - 'delaycompress' is now applied on every logs in logrotate
    ([\#3923](http://www.rudder-project.org/redmine/issues/3923))
  - Upgrade script commits updates of configuration-repository from the
    repository base directory
    ([\#4046](http://www.rudder-project.org/redmine/issues/4046))

#### API

  - Manage Change Request through REST API
    ([\#3952](http://www.rudder-project.org/redmine/issues/3952)). See
    documentation [Change Request API
    documentation](http://www.rudder-project.org/rudder-api-doc/#api-Change_Requests)
    here\!

#### Relay Servers

  - Implement Relay Server within Rudder
    ([\#4023](http://www.rudder-project.org/redmine/issues/4023),
    ([\#4017](http://www.rudder-project.org/redmine/issues/4017),
    ([\#4077](http://www.rudder-project.org/redmine/issues/4077)) See
    documentation about [relay
    servers](http://www.rudder-project.org/rudder-doc-2.8/rudder-doc.html#relay-servers)
    here\!

#### Webapp - Reporting

  - Store agent executions history in a 'lightweight' table, to speed up
    Rudder web interface
    ([\#3945](http://www.rudder-project.org/redmine/issues/3945))

#### Webapp - Node management

  - Display Node's Role on the Node detail page
    ([\#4044](http://www.rudder-project.org/redmine/issues/4044))

This software is in beta status and contains a lots of new features. We
have tested it and believe it to be free of any critical bugs. The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!

