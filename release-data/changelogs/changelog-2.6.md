# Change logs for Rudder 2.6.\* "Clipper" versions

Rudder 2.6 has reached End of Life the in April 2013.
This branch is codenamed "Clipper".

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Installing, upgrading and testing**

Documentation to Install and Upgrade is available online. The Download
page sums up URLs. We also recommend using the Rudder Vagrant config if
you want a quick and easy way to get an installation for testing.

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server: **Debian 5, Debian 6, Debian 7, RHEL/CentOS 6, SLES
    11, Ubuntu 11.10, Ubuntu 12.04, Ubuntu 12.10**
  - Rudder agent: all of the above plus **RHEL/CentOS 3, RHEL/CentOS 5
    and SLES 10**

## Rudder 2.6.19 (2014-11-18)

### Bug fixes

#### Webapp - Config management

  - Fixed: No tooltip displayed when you add a new section in a
    Directive
    ([\#5706](http://www.rudder-project.org/redmine/issues/5706))
  - Fixed: No groups directory in /var/rudder/configuration-repository
    ([\#5509](http://www.rudder-project.org/redmine/issues/5509))

#### Webapp - Display, home page

  - Fixed: Popups buttons may not be accessible after window is resized
    ([\#5492](http://www.rudder-project.org/redmine/issues/5492))
  - Fixed: White page with HTTP status: 413: FULL head
    ([\#4378](http://www.rudder-project.org/redmine/issues/4378))

#### Techniques

  - Fixed: Technique 'rpmPackageInstallation' v6.0 stores a file in the
    wrong directory
    ([\#5697](http://www.rudder-project.org/redmine/issues/5697))
  - Fixed: Permissions may be applied recursively even if not asked to
    by "filesPermissions" Technique
    ([\#5632](http://www.rudder-project.org/redmine/issues/5632))
  - Fixed: It's not possible to update package to latest version
    ([\#5609](http://www.rudder-project.org/redmine/issues/5609))
  - Fixed: Packages are not updated correctly on redhat based systems
    ([\#5608](http://www.rudder-project.org/redmine/issues/5608))
  - Fixed: Zypper technique says skipping but returns UNKNOWN.
    ([\#5493](http://www.rudder-project.org/redmine/issues/5493))
  - Fixed: Generic variables definition forbid '&' character usage
    ([\#5605](http://www.rudder-project.org/redmine/issues/5605))
  - Update all techniques to respect normal ordering
    ([\#5306](http://www.rudder-project.org/redmine/issues/5306))

#### Documentation

  - Fixed: Technique upgrade documentation is not correct
    ([\#5611](http://www.rudder-project.org/redmine/issues/5611))

#### Inventory (webapp, Fusion)

  - Fixed: Non-unique machine UUID mess up collected inventory
    ([\#4490](http://www.rudder-project.org/redmine/issues/4490))

#### Webapp - CFEngine integration

  - Fixed: Two techniques with the same ID leads to strange error about
    git tree ids
    ([\#5614](http://www.rudder-project.org/redmine/issues/5614))

#### Webapp - Node management

  - Fixed: Node details is missing plugin extension points
    ([\#5767](http://www.rudder-project.org/redmine/issues/5767))

#### Packaging

  - Fixed: We do not depend on apache2 utilities (and need it to use
    htpasswd)
    ([\#5599](http://www.rudder-project.org/redmine/issues/5599))

#### Miscellaneous

  - Fixed: cf-clerk does not compile with Java 8
    ([\#5657](http://www.rudder-project.org/redmine/issues/5657))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Matthieu Ca.
  - Florian Heigl
  - Olivier Mauras
  - Alex Tkachenko

This is a maintenance release, part of the "old stable" 2.6 branch. It
is recommended to upgrade all pre-2.10 installations to 2.10 as soon as
possible to enjoy the latest features and improvements of a more mature
and stable version.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
release is marked as 'old-stable' since a subsequent release (branch
2.10) has proven itself to be 'stable'.

## Rudder 2.6.18 (2014-10-06)

### Changes

### Bug fixes

#### Techniques - Sys & init promis

  - Fixed: Initial promises use yum list installed to check installed
    package rather than rpm
    ([\#5567](http://www.rudder-project.org/redmine/issues/5567))

#### Techniques

  - Fixed: Rewrite system techniques to use normal ordering on 2.6
    ([\#5547](http://www.rudder-project.org/redmine/issues/5547))
  - Fixed: Rewrite techniques to use normal ordering on 2.6
    ([\#5505](http://www.rudder-project.org/redmine/issues/5505))
  - Fixed: Rewrite initial promises to use normal ordering on 2.6
    ([\#5497](http://www.rudder-project.org/redmine/issues/5497))
  - Fixed: The Rudder logrotate configuration uses the wrong argument to
    reload rsyslog on Debian Wheezy
    ([\#5486](http://www.rudder-project.org/redmine/issues/5486))
  - Fixed: Add a placeholder for new technique on old versions
    ([\#5463](http://www.rudder-project.org/redmine/issues/5463))
  - Fixed: We cannot edit only section of the file with enforce file
    content
    ([\#5301](http://www.rudder-project.org/redmine/issues/5301))

#### Inventory (webapp, Fusion)

  - Fixed: [FusionInventory](FusionInventory): Doesn't display (most)
    disk sizes - branch 2.6
    ([\#5542](http://www.rudder-project.org/redmine/issues/5542))

#### Documentation

  - Fixed: Do not use contrib and non-free
    ([\#5181](http://www.rudder-project.org/redmine/issues/5181))

#### Packaging

  - Fixed: Upgrade rudder-agent can fail if cf-serverd/cf-execd fails to
    stop gracefully
    ([\#4387](http://www.rudder-project.org/redmine/issues/4387))

### Release notes

This is a maintenance release, part of the "old stable" 2.6 branch. It
is recommended to upgrade all pre-2.10 installations to 2.10 as soon as
possible to enjoy the latest features and improvements of a more mature
and stable version.

## Rudder 2.6.17 (2014-08-14)

### Changes

### Bug fixes

#### Documentation

  - Fixed: Screenshots are not Rudder 2.6 compliant
    ([\#5348](http://www.rudder-project.org/redmine/issues/5348))
  - Fixed: Incomplete command to force inventory
    ([\#5205](http://www.rudder-project.org/redmine/issues/5205))
  - Fixed: The documentation says there is no Rudder server packages for
    RHEL 6
    ([\#5204](http://www.rudder-project.org/redmine/issues/5204))

#### Webapp - Display, home page

  - Fixed: Popup content can be displayed outside of popup if content
    grow after initialisation
    ([\#5314](http://www.rudder-project.org/redmine/issues/5314))

#### Packaging

  - Fixed: Missing dependency on net-tools for rudder-agent and
    rudder-thin
    ([\#5199,](http://www.rudder-project.org/redmine/issues/5199)
    ([\#5380](http://www.rudder-project.org/redmine/issues/5380))

#### Techniques

  - Fixed: Technique "Fstab Configuration": it empties all options with
    Rudder 2.11
    ([\#5328](http://www.rudder-project.org/redmine/issues/5328))
  - Fixed: Technique "Enforce a file content" v5.0: post-hook
    modification reporting is in "No answer" status if the file is
    correct
    ([\#5318](http://www.rudder-project.org/redmine/issues/5318))
  - Fixed: Technique "Enforce a file content" v5.0: post-hook
    modification reporting is in "Uknown" status if we request a mix of
    insertion, deletion and/or replacement
    ([\#5312](http://www.rudder-project.org/redmine/issues/5312))
  - Fixed: Technique "User Management" v3.0: If the password is not set,
    the password component is in a "No answer" status
    ([\#5239](http://www.rudder-project.org/redmine/issues/5239))
  - Fixed: Technique "Enforce a file content": post-hook modification
    reporting is in "No answer" status if we enforce the content of the
    file only at creation
    ([\#5208](http://www.rudder-project.org/redmine/issues/5208))
  - Fixed: Technique "Sudo utility configuration": Incorrect use of
    commands without their full path
    ([\#5187](http://www.rudder-project.org/redmine/issues/5187))
  - Fixed: Process management technique uses invalid syntax on CFEngine
    3.5+ ([\#5315](http://www.rudder-project.org/redmine/issues/5315))

#### System integration

  - Fixed: Apache documentroot for SLES seems misconfigured
    ([\#5370](http://www.rudder-project.org/redmine/issues/5370))
  - Fixed: Authorized network sometimes have invalid values after
    rudder-init if you add more than one network
    ([\#5103](http://www.rudder-project.org/redmine/issues/5103))

#### Techniques

  - Fixed: Technique "Set the permissions on files": We can't set the
    SUID/SGID
    ([\#5325](http://www.rudder-project.org/redmine/issues/5325))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Florian Heigl
  - Lionel Le Folgoc

This is a maintenance release, part of the "old stable" 2.6 branch. It
is recommended to upgrade all pre-2.10 installations to 2.10 as soon as
possible to enjoy the latest features and improvements of a more mature
and stable version.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
release is marked as 'old-stable' since a subsequent release (branch
2.10) has proven itself to be 'stable'.

## Rudder 2.6.14 (2014-06-12)

### Bug fixes

#### Techniques

  - Fixed: Technique groupManagement: Members of group are enforced at
    group creation even if option is not set
    ([\#5001](http://www.rudder-project.org/redmine/issues/5001))
  - Fixed: Technique User management: cannot create an user if a group
    using the same name laready exists
    ([\#4270](http://www.rudder-project.org/redmine/issues/4270))

#### Techniques - Sys & init promis

  - Fixed: Initial promises on server cause an error to be logged due to
    duplicate "empty\_file\_before\_editing" setting
    ([\#5003](http://www.rudder-project.org/redmine/issues/5003))
  - Fixed: Initial promises for Rudder 2.6 (CFEngine 3.4) cannot be used
    when upgrading to 2.10 (CFEngine 3.5)
    ([\#4996](http://www.rudder-project.org/redmine/issues/4996))
  - Fixed: Windows clients may run the execRun command several times -
    for cygwin and plain windows cases
    ([\#4975](http://www.rudder-project.org/redmine/issues/4975))
  - Fixed: Date/time is not defined on all reports in failsafe.cf from
    initial promises
    ([\#4966](http://www.rudder-project.org/redmine/issues/4966))
  - Fixed: RHEL 3 and 4 don't report correctly due to "/bin/date:
    unrecognized option \`--rfc-3339=second'"
    ([\#4963](http://www.rudder-project.org/redmine/issues/4963))

#### Packaging

  - Fixed: Package upgrade can fail if
    /etc//rudder-agent are missing
    ([\#5002](http://www.rudder-project.org/redmine/issues/5002))
  - Fixed: rudder-agent build rely too much on CPAN availability
    ([\#4965](http://www.rudder-project.org/redmine/issues/4965))

#### Documentation

  - Fixed: Installation section is too hard to follow
    ([\#4998](http://www.rudder-project.org/redmine/issues/4998))
  - Fixed: The documentation gives no examples about role management in
    Rudder
    ([\#4960](http://www.rudder-project.org/redmine/issues/4960))
  - Fixed: Procedure on how to update the Technique Librairy is invalid
    ([\#4822](http://www.rudder-project.org/redmine/issues/4822))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Fabrice Flore-Thébault
  - Cédric Jardin
  - William Ott

This is a maintenance release, part of the "old stable" 2.6 branch. 
It is recommended to upgrade all pre-2.10 installations to 2.10 as soon
as possible to enjoy the latest features and improvements of a more
mature and stable version.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
release is marked as 'old-stable' since a subsequent release (branch
2.10) has proven itself to be 'stable'. 'Old-stable' also means that
this release has been assigned an 'end-of-life' date, in this case
December 2014. 
See our FAQ for details, on
https://www.rudder-project.org/site/documentation/faq/\#what_is_the_versioning_policy.

## Rudder 2.6.13 (2014-06-06)

### Changes

### Bug fixes

#### Techniques - System & initial promises

  - Fixed: cf-agent slowed by users addition into inventory and displays
    a lot of warnings about that
    ([\#4932](http://www.rudder-project.org/redmine/issues/4932))
  - Fixed: Automatic reparation method for cf\_lock. is only
    checked once an hour
    ([\#4812](http://www.rudder-project.org/redmine/issues/4812))
  - Fixed: Reports are not inserted into Rudder because regexp in
    rsyslog is too greedy when matching execuction timestamp
    ([\#4761](http://www.rudder-project.org/redmine/issues/4761))

#### Inventory (webapp, Fusion)

  - Fixed: Solaris Node are not correctly identified by Rudder inventory
    process
    ([\#4701](http://www.rudder-project.org/redmine/issues/4701))
  - Fixed: Network interface sharing the ip adress are ignored by the
    inventory parser
    ([\#4883](http://www.rudder-project.org/redmine/issues/4883))

#### Documentation

  - Fixed: The documentation entry concerning the ramdisk state
    directory gives a wrong mount mode
    ([\#4792](http://www.rudder-project.org/redmine/issues/4792))
  - Fixed: The documentation entry concerning the ramdisk state
    directory gives wrong mount options
    ([\#4788](http://www.rudder-project.org/redmine/issues/4788))

#### Miscellaneous

  - Fixed: Typo in rudder-commons project, display a warning when
    compiling
    ([\#4853](http://www.rudder-project.org/redmine/issues/4853))

#### Packaging

  - Fixed: Rudder init script may not correctly initialize
    policy\_server.dat file, resulting in a non functionning Rudder
    server
    ([\#4915](http://www.rudder-project.org/redmine/issues/4915))

#### System integration

  - Fixed: rudder agent is restarted by the cron job even if
    /opt/rudder/etc/disable-agent is present
    ([\#4688](http://www.rudder-project.org/redmine/issues/4688))
  - Fixed: A race condition may occur during rudder-server-root
    initialisation
    ([\#4635](http://www.rudder-project.org/redmine/issues/4635))
  - Fixed: The script rudder-init.sh should not output CFEngine
    execution, and keep the output of all commands in the log
    ([\#4634](http://www.rudder-project.org/redmine/issues/4634))
  - Fixed: When multiples cf-execd are running at the same time, agent
    is not behaving properly, and node is in [NoAnswer](NoAnswer) state
    ([\#4613](http://www.rudder-project.org/redmine/issues/4613))

#### Techniques

  - Fixed: policy\_server.dat file is not read on Nodes if its size
    exceed 40 bytes
    ([\#4921](http://www.rudder-project.org/redmine/issues/4921))
  - Fixed: Permit script check\_rsyslog\_version to stop if an error is
    encountered
    ([\#4869](http://www.rudder-project.org/redmine/issues/4869))
  - Fixed: [CheckGenericFileContent](CheckGenericFileContent) can have
    several "repaired" status on each of the different component, even
    is the end state is convergent
    ([\#4805](http://www.rudder-project.org/redmine/issues/4805))
  - Fixed: The initial promises are missing a class definition for
    force\_inventory when /opt/rudder/etc/force\_inventory is here
    ([\#4765](http://www.rudder-project.org/redmine/issues/4765))
  - Fixed: The script /var/rudder/tools/check\_rsyslog\_version will not
    work without absolute path of rsyslogd
    ([\#4758](http://www.rudder-project.org/redmine/issues/4758))
  - Fixed: Technique "Package management for Debian / Ubuntu / APT
    systems", typo in the option to install an earlier package
    ([\#4754](http://www.rudder-project.org/redmine/issues/4754))
  - Fixed: Rudder causes RHEL nodes to be blacklisted in RHN due to
    intensive yum usage
    ([\#3855](http://www.rudder-project.org/redmine/issues/3855))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Fabrice Flore-Thébault

This is a maintenance release, part of the "old stable" 2.6 branch. 
It is recommended to upgrade all pre-2.10 installations to 2.10 as soon
as possible to enjoy the latest features and improvements of a more
mature and stable version.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
release is marked as 'old-stable' since a subsequent release (branch
2.10) has proven itself to be 'stable'. 'Old-stable' also means that
this release has been assigned an 'end-of-life' date, in this case
December 2014. 
See our FAQ for details, on
https://www.rudder-project.org/site/documentation/faq/#what_is_the_versioning_policy.

## Rudder 2.6.12 (2014-03-19)

### Changes

### Bug fixes

#### Vagrant integration - Dev

  - Fixed: On some systems, the install fails because rsyslog-psql ask
    insteractive question
    ([\#4599](http://www.rudder-project.org/redmine/issues/4599))

#### Techniques - Sys & init promis

  - Fixed: Last update detection is broken, causing cron remove cf\_lock
    database and flood with emails every 5 minutes
    ([\#4582](http://www.rudder-project.org/redmine/issues/4582))

#### Webapp - Display, home page

  - Fixed: Too many Rules are displayed on the Home page ( 3 system
    Rules are included )
    ([\#4570](http://www.rudder-project.org/redmine/issues/4570))

#### Packaging

  - Fixed: Missing dependencies declaration (rsyslog-pgsql) in debian
    may prevents from installing Rudder server correctly
    ([\#4569](http://www.rudder-project.org/redmine/issues/4569))

#### System integration

  - Fixed: check-rudder-agent script fails to create a new UUID if not
    defined and no backup exists
    ([\#4607](http://www.rudder-project.org/redmine/issues/4607))

#### Webapp - Reporting

  - Fixed: A rare race condition can lead to an error when looking at
    compliance while a deployment is in progress
    ([\#4559](http://www.rudder-project.org/redmine/issues/4559))

#### Webapp - Node management

  - Fixed: When accepting several nodes, one policy generation is
    triggered for each of them
    ([\#4492](http://www.rudder-project.org/redmine/issues/4492))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Cédric Jardin
  - Christophe Nowicki
  - Alex Tkachenko

This is a bug fix release in the 2.6 series. All installations of 2.6.x
should be upgraded when possible. 
It is recommended to upgrade all pre-2.6 installations to 2.6 as soon as
possible to enjoy the latest features and improvements of a more mature
and stable version. 
 
When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
version is declared "stable" since it has proven itself to be stable in
production over a period of several months following general
availability of the release.

## Rudder 2.6.11 (2014-03-06)

### Changes

#### Techniques

  - Technique 'Group management': Add an option to enforce group content
    ([\#4467](http://www.rudder-project.org/redmine/issues/4467))
  - Technique 'ssh keys distribution': Have several keys per users
    ([\#4439](http://www.rudder-project.org/redmine/issues/4439))
  - Technique 'Generic Variable definition': Allow empty values
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

### Bug fixes

#### Techniques

  - Fixed: Technique 'Package Management for RPM systems': Wrong
    operator for "This version or any earlier one"
    ([\#4447](http://www.rudder-project.org/redmine/issues/4447))
  - Fixed: Technique 'Download a file from the shared folder': Error
    message when a copy failed using does not explain what actually
    failed
    ([\#4278](http://www.rudder-project.org/redmine/issues/4278))
  - Fixed: Technique 'RUG / \!YaST package manager configuration (ZMD)':
    'security-level' option is misnamed 'package source policy'
    ([\#4128](http://www.rudder-project.org/redmine/issues/4128))
  - Fixed: Technique 'Package management for APT systems': packages with
    suffix :amd64 are not correctly detected
    ([\#3830](http://www.rudder-project.org/redmine/issues/3830))
  - Fixed: Technique 'Download a file from the shared folder': Cannot
    copy a file from the shared-folder on the root server
    ([\#3581](http://www.rudder-project.org/redmine/issues/3581))
  - Fixed: Technique 'Group management' v3.0: There is no backup to file
    repository when updating /etc/group file
    ([\#4471](http://www.rudder-project.org/redmine/issues/4471))
  - Fixed: Technique 'Download a file from the shared folder':
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
  - Fixed: When new inventory is processed, hardware Node informations
    may not be updated
    ([\#4440](http://www.rudder-project.org/redmine/issues/4440))
  - Fixed: Process start date are not parsed correctly when parsing
    inventory file
    ([\#4402](http://www.rudder-project.org/redmine/issues/4402))
  - Fixed: Process start date are displayed as "bad format" in Rudder
    web interface
    ([\#4400](http://www.rudder-project.org/redmine/issues/4400))

#### Webapp - CFEngine integration

  - Fixed: Promises are not generated when Rudder server starts for the
    first time
    ([\#4532](http://www.rudder-project.org/redmine/issues/4532))

#### Webapp - Reporting

  - Fixed: The rsyslog regexp matching executionTimeStamp is too greedy
    and could take more characters than it should
    ([\#4431](http://www.rudder-project.org/redmine/issues/4431))
  - Fixed: Rsyslog filters reports when too many reports arrive
    simultaneously
    ([\#4281](http://www.rudder-project.org/redmine/issues/4281))

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
  - Fixed: An unnecessary promise generation is launched right after
    making a new archive of the configuration
    ([\#4479](http://www.rudder-project.org/redmine/issues/4479))

#### Techniques - Sys & init promis

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
  - Alex Tkachenko

This is a bug fix release in the 2.6 series. All installations of 2.6.x
should be upgraded when possible. 
It is recommended to upgrade all pre-2.6 installations to 2.6 as soon as
possible to enjoy the latest features and improvements of a more mature
and stable version. 
 
When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
version is declared "stable" since it has proven itself to be stable in
production over a period of several months following general
availability of the release.

## Rudder 2.6.10 (2014-01-16)

### Changes

#### Techniques

  - Technique "Download a file from the shared folder" should display
    where the shared folder is located
    ([\#4353](http://www.rudder-project.org/redmine/issues/4353))

### Bug fixes

#### Webapp - Administration

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
    ([\#4156](http://www.rudder-project.org/redmine/issues/4156))

#### Webapp - Reporting

  - Fixed: Reports containing a \_ in the "Policy" (human readable
    policy name) are rejected by rsyslog
    ([\#4247](http://www.rudder-project.org/redmine/issues/4247))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Yvan Masson
  - Olivier Mauras
  - Christophe Nowicki
  - Alex Tkachenko

This is a bug fix release in the 2.6 series. All installations of 2.6.x
should be upgraded when possible. 
It is recommended to upgrade all pre-2.6 installations to 2.6 as soon as
possible to enjoy the latest features and improvements of a more mature
and stable version. 
 
When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
version is declared "stable" since it has proven itself to be stable in
production over a period of several months following general
availability of the release.

## Rudder 2.6.9 (2013-11-20)

### Changes

#### Techniques

  - Hide by default sections that are not "mandatory" within Techniques
    ([\#4105](http://www.rudder-project.org/redmine/issues/4105))
  - New Technique added: Partition monitoring
    ([\#3984](http://www.rudder-project.org/redmine/issues/3984))

### Bug fixes

#### Techniques - Sys & init promis

  - Fixed: The rsyslog version \> 5.7.1 drops messages if there is more
    than 200 messages in 5 seconds and could lead to 'No Answer' status
    of all nodes
    ([\#4127](http://www.rudder-project.org/redmine/issues/4127))

#### Logging

  - Fixed: Disabling workflow functionnality should disable change
    request, however a log about change request is still displayed
    ([\#4143](http://www.rudder-project.org/redmine/issues/4143))

#### Documentation

  - Fixed: User manual doesn't mention RHEL/CentOS 3 support
    ([\#4125](http://www.rudder-project.org/redmine/issues/4125))
  - Fixed: User manual doesn't mention Debian wheezy support
    ([\#4124](http://www.rudder-project.org/redmine/issues/4124))

#### Webapp - Display, home page

  - Fixed: Links to Node in the change request and event log are broken
    ([\#4049](http://www.rudder-project.org/redmine/issues/4049))
  - Fixed: Typo in 'There are no modifications to save' error message
    ([\#4043](http://www.rudder-project.org/redmine/issues/4043))

#### Miscellaneous

  - Fixed: Rudder-agent upgrade fails if one of the binaries is in use
    during upgrade
    ([\#4098](http://www.rudder-project.org/redmine/issues/4098),
    ([\#3665](http://www.rudder-project.org/redmine/issues/3665))
  - Fixed: Error when upgrading from a Rudder server 2.3 if both
    policy.xml and metadata.xml were existing for the same techniques
    ([\#4088](http://www.rudder-project.org/redmine/issues/4088))
  - Fixed: Agent upgrade does not work if /opt/rudder/etc/disable-agent
    file exists
    ([\#4087](http://www.rudder-project.org/redmine/issues/4087))

#### Packaging

  - Fixed: /etc/cron.d/rudder-agent is not installed on Debian/Ubuntu
    ([\#4109](http://www.rudder-project.org/redmine/issues/4109))
  - Fixed: First inventory sending may not contains UUID
    ([\#4147](http://www.rudder-project.org/redmine/issues/4147))
  - Fixed: slapd is not always restarted on upgrading, leading to
    missing schema update
    ([\#4132](http://www.rudder-project.org/redmine/issues/4132))
  - Fixed: Apache is not started after reboot on RPM systems
    ([\#4126](http://www.rudder-project.org/redmine/issues/4126))
  - Fixed: If a node has not cron (or equivalent) installed, then the
    uuid or init script are not restored
    ([\#4009](http://www.rudder-project.org/redmine/issues/4009))

#### Webapp - Administration

  - Fixed: Automatic Technique library updater is not launched.
    ([\#4116](http://www.rudder-project.org/redmine/issues/4116))
  - Fixed: An error occurs when displaying a change request where a
    directive technique was moved
    ([\#4030](http://www.rudder-project.org/redmine/issues/4030))
  - Fixed: Correct English in "change message" pop-ups
    ([\#4151](http://www.rudder-project.org/redmine/issues/4151))
  - Fixed: Rudder cannot load several plugins at the same time
    ([\#3314](http://www.rudder-project.org/redmine/issues/3314))

#### Techniques

  - Fixed: Initial Promises were not able to install missing packages
    (rsyslog, curl or xen) on Debian/Ubuntu due to missing
    'package\_patch\_command' attribute in promises
    ([\#4070](http://www.rudder-project.org/redmine/issues/4070))
  - Fixed: Reports of distributePolicy promises is in 'Unknown' status
    caused by a duplicate reports about 'configuration-repository' git
    lock ([\#4048](http://www.rudder-project.org/redmine/issues/4048))
  - Fixed: Technique 'Package management for RHEL / [CentOS](CentOS) /
    ([SuSE](SuSE) / RPM systems' v4.0, 4.1 and 5.0: Incorrect clear of
    cache of installed packaged on promises updates lead to have 'No
    answer' states after a modification of packages in Directive
    ([\#4145](http://www.rudder-project.org/redmine/issues/4145))
  - Fixed: Remove comma after the promiser from passwordCheck in the
    distirbutePolicy promises
    ([\#4040](http://www.rudder-project.org/redmine/issues/4040))
  - Fixed: The failsafe of the initial promises cannot update promises
    ([\#4025](http://www.rudder-project.org/redmine/issues/4025))
  - Fixed: Reporting message that state that curl is missing should be
    clearer
    ([\#4021,](http://www.rudder-project.org/redmine/issues/4021)
    ([\#4166](http://www.rudder-project.org/redmine/issues/4166))
  - Fixed: The first inventory made display disturbing error messages
    about CPU
    ([\#3854](http://www.rudder-project.org/redmine/issues/3854),
    ([\#4111](http://www.rudder-project.org/redmine/issues/4111))
  - Fixed: There is a typo in Rudder file disclaimer
    ([\#4032](http://www.rudder-project.org/redmine/issues/4032))
  - Fixed: Reporting is never caught if the Rudder server UUID
    (/var/rudder/tmp/uuid.txt) was more than 33 characters long
    ([\#4018](http://www.rudder-project.org/redmine/issues/4018))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Olivier Mauras
  - Jean Remond

This is a bug fix release in the 2.6 series. All installations of 2.6.x
should be upgraded when possible. 
It is recommended to upgrade all pre-2.6 installations to 2.6 as soon as
possible to enjoy the latest features and improvements of a more mature
and stable version. 
 
When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
version is declared "stable" since it has proven itself to be stable in
production over a period of several months following general
availability of the release.

## Rudder 2.6.8 (2013-10-09)

### Bug fixes

#### Packaging

  - Fixed: The logrotate configuration file from Debian/Ubuntu
    rudder-server-root is duplicate between the old (rudder-server-root)
    and the new one (rudder)
    ([\#4026](http://www.rudder-project.org/redmine/issues/4026))
  - Fixed: rudder-server-root package should use logrotate.rhel file for
    RHEL/CentOS
    ([\#4014](http://www.rudder-project.org/redmine/issues/4014))
  - Fixed: After upgrading the policy server, the rsyslog configuration
    is invalid
    ([\#4004](http://www.rudder-project.org/redmine/issues/4004))
  - Fixed: The packaging appends the Apache DAVLock configuration at
    every package installation / upgrade
    ([\#4003](http://www.rudder-project.org/redmine/issues/4003))
  - Fixed: Backup process of /etc//rudder-agent
    in preinst of rudder-agent RPM should not be made a first install bu
    during upgrade
    ([\#4000](http://www.rudder-project.org/redmine/issues/4000))
  - Fixed: The script check-rudder-agent does not repair the Rudder UUID
    since the add of backup of /etc/{init.d,default/rudder-agent
    ([\#3999](http://www.rudder-project.org/redmine/issues/3999))
  - Fixed: Cannot remove rudder-agent package if CFEngine processes are
    not running
    ([\#3992](http://www.rudder-project.org/redmine/issues/3992))
  - Fixed: /etc//rudder-agent is removed if the package
    rudder-agent is upgraded from 2.4.8 on [SuSE](SuSE) or RHEL/CentOS
    ([\#3997](http://www.rudder-project.org/redmine/issues/3997),
    ([\#3998](http://www.rudder-project.org/redmine/issues/3998))
  - Fixed: The file /opt/rudder/bin/check-rudder-agent contains a typo
    which prevent from relaunching CFEngine processes
    ([\#3996](http://www.rudder-project.org/redmine/issues/3996))
  - Fixed: Missing file in the 2.6 migration script
    ([\#4020](http://www.rudder-project.org/redmine/issues/4020))
  - Fixed: /etc//rudder-agent is removed if the
    package rudder-agent is upgraded from 2.6.4, 2.6.5, 2.7.1 or 2.7.2
    on [SuSE](SuSE) or RHEL/CentOS
    ([\#3995](http://www.rudder-project.org/redmine/issues/3995))

#### Techniques

  - Fixed: Fix our CFEngine standard lib to be CFEngine 3.5.\* compliant
    but based on modifications of the latest version of it
    ([\#4005](http://www.rudder-project.org/redmine/issues/4005))
  - Fixed: Remove 'owners' attribute from copy\_from body in the
    update.st file
    ([\#4002](http://www.rudder-project.org/redmine/issues/4002))
  - Fixed: Technique 'User Management' v2.0: It gives no answer on
    password component when removing a user
    ([\#3845](http://www.rudder-project.org/redmine/issues/3845))
  - Fixed: The system Techniques use the wrong logrotate configuration
    on RHEL
    ([\#4012](http://www.rudder-project.org/redmine/issues/4012))
  - Fixed: The logrotate configuration in RHEL does not rotate httpd
    logs ([\#4011](http://www.rudder-project.org/redmine/issues/4011))

#### Documentation

  - Fixed: Missing documentation for LDAP authentication with user
    search (not direct bind)
    ([\#3963](http://www.rudder-project.org/redmine/issues/3963))

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Cédric Cabessa

### Release notes

​This is a bug fix release in the 2.6 series. All installations of 2.6.x
should be upgraded when possible. 
This version of Rudder is in stable and is already in use on several
production platforms with success. You are invited to upgrade all
pre-2.6 installations to it as soon as possible to enjoy the latest
features with a still stable and more polished version.

The previous release (2.6.8) was not publicly annouced as it
unfortunately did not meet our quality and assurance requirements.

## Rudder 2.6.6 (2013-10-03)

### Changes

#### Webapp - Reporting

  - Change rudder sysevents indexes on [PostgreSQL](PostgreSQL)
    ([\#3988](http://www.rudder-project.org/redmine/issues/3988))

#### Techniques

  - Prevent the /etc/cron.d/rudder-agent script from sending
    unsollicited e-mails
    ([\#3944](http://www.rudder-project.org/redmine/issues/3944))
  - Technique "Package management for RHEL / [CentOS](CentOS) /
    ([SuSE](SuSE) / RPM systems" v4.1: Backport from Rudder 2.6 to Rudder
    2.4 ([\#3919](http://www.rudder-project.org/redmine/issues/3919))
  - Technique 'Download a file from a shared folder': Be able to exclude
    files from a folder copy
    ([\#3364](http://www.rudder-project.org/redmine/issues/3364))
  - Technique 'MOTD Configuration': Add an option to append the
    ([MoTD](MoTD) at the beginning or the end of the file
    ([\#3950](http://www.rudder-project.org/redmine/issues/3950))
  - Technique 'Manage files and folders': Add local copy action
    ([\#3398](http://www.rudder-project.org/redmine/issues/3398))

#### Documentation

  - Add Advices to separate partitions in server installation section
    ([\#3932](http://www.rudder-project.org/redmine/issues/3932))

### Bug fixes

#### Packaging

  - Fixed: Since add of a new file to check CFEngine processes and
    Rudder UUID (\#3925), the patch for Debian 5 (about tokyocabinet)
    does not work anymore for debian/rules
    ([\#3976](http://www.rudder-project.org/redmine/issues/3976))
  - Fixed: With [OpenVZ](OpenVZ), cf-agent on the host see all other
    cf-agent execution and kills them
    ([\#3909](http://www.rudder-project.org/redmine/issues/3909))
  - Fixed: Logrotate should use 'delaycompress' option
    ([\#3922](http://www.rudder-project.org/redmine/issues/3922))

#### Webapp - Reporting

  - Fixed: Missing index on DB for "reports by nodes" leads to timeout
    for node list page
    ([\#3674](http://www.rudder-project.org/redmine/issues/3674))

#### Webapp - Administration

  - Fixed: Authorized network field are space-sensitive
    ([\#3927](http://www.rudder-project.org/redmine/issues/3927))
  - Fixed: Missing/incomplete LDAP group support
    ([\#3829](http://www.rudder-project.org/redmine/issues/3829))
  - Fixed: Package rudder-server-root still install
    /etc/init.d/logrotate.d/rudder-server-root on Debian/Ubuntu
    affects Rudder 2.4.8, 2.6.4, 2.6.5, 2.7.1 and 2.7.2)
    ([\#3981](http://www.rudder-project.org/redmine/issues/3981))
  - Fixed: /etc/init.d/rudder-server-root is no more installed on
    Debian/Ubuntu (affects Rudder 2.4.8, 2.6.4, 2.6.5, 2.7.1 and 2.7.2)
    ([\#3980](http://www.rudder-project.org/redmine/issues/3980))
  - Fixed: /opt/rudder/etc/uuid.hive is removed if the package
    rudder-agent is upgrade from 2.4.8, 2.6.4, 2.6.5, 2.7.1 or 2.7.2 on
    ([SuSE](SuSE) or RHEL/CentOS
    ([\#3925](http://www.rudder-project.org/redmine/issues/3925))
  - Fixed: Upgrading to Rudder 2.4.8, 2.6.4, 2.6.5, 2.7.1 or 2.7.2 may
    cause uuid.hive to be removed
    ([\#3915](http://www.rudder-project.org/redmine/issues/3915))
  - Fixed: The rsyslog configuration deployed at install is invalid
    ([\#3914](http://www.rudder-project.org/redmine/issues/3914))
  - Fixed: Migration of eventlogs v1 does not work if eventlogs v2
    exists
    ([\#3906](http://www.rudder-project.org/redmine/issues/3906))
  - Fixed: Postinstall script of rudder-inventory-endpoint display a
    warning about fail of rsyslog restart at first install on
    RHEL/CentOS
    ([\#3900](http://www.rudder-project.org/redmine/issues/3900))
  - Fixed: Change request cannot be accepted: multiline text cause merge
    incompatibility
    ([\#3967](http://www.rudder-project.org/redmine/issues/3967))
  - Fixed: Available options for rudder.batch.reportscleaner.frequency
    are not documented in rudder-web.properties
    ([\#3940](http://www.rudder-project.org/redmine/issues/3940))

#### Webapp - CFEngine integration

  - Fixed: Wrong stringTemplate definition on a Technique result in a
    confusing error in the Rudder UI
    ([\#3210](http://www.rudder-project.org/redmine/issues/3210))

#### Webapp - Node management

  - Fixed: Creating/Modifying a Group to have a criterion of
    Software\>Release Date will display a datepicker but if we change
    the criterion to another one like Software\>Name , the datepicker
    will remain until the use of Button 'Search'
    ([\#3911](http://www.rudder-project.org/redmine/issues/3911))
  - Fixed: When saving a group without doing any modifications, we have
    the dreaded "server cannot be contacted at this time"
    ([\#3904](http://www.rudder-project.org/redmine/issues/3904))
  - Fixed: Rudder returns "Server cannot be contacted" if a group
    criteria is based on a wrong regexp
    ([\#3683](http://www.rudder-project.org/redmine/issues/3683))

#### Techniques

  - Fixed: The promises can't be deployed on Rudder 2.4 (typo in
    promises.st)
    ([\#3968](http://www.rudder-project.org/redmine/issues/3968))
  - Fixed: Remove the comma after the promisers from all Techniques
    ([\#3871](http://www.rudder-project.org/redmine/issues/3871))
  - Fixed: Technique 'Package management for RHEL / [CentOS](CentOS) /
    ([SuSE](SuSE) / RPM systems' v4.1: patch\_commands have been wrongly
    backported to 2.4 branch
    ([\#3982](http://www.rudder-project.org/redmine/issues/3982))
  - Fixed: Rsyslog 5.7.1 drops reports when they come to fast
    ([\#3913](http://www.rudder-project.org/redmine/issues/3913))
  - Fixed: Technique 'Copy file from shared folder': Does not work on
    root server
    ([\#3581](http://www.rudder-project.org/redmine/issues/3581))
  - Fixed: Technique 'Package management for RHEL / [CentOS](CentOS) /
    ([SuSE](SuSE) / RPM systems' v4.1: Reportings are in No Answer state
    ([\#3965](http://www.rudder-project.org/redmine/issues/3965))

#### Documentation

  - Fixed: Documentation is missing some more level 2 headers
    ([\#3961,](http://www.rudder-project.org/redmine/issues/3961)
    ([\#3957,](http://www.rudder-project.org/redmine/issues/3957)
    ([\#3943](http://www.rudder-project.org/redmine/issues/3943))
  - Fixed: Some titles were hidden or partially hidden
    ([\#3956](http://www.rudder-project.org/redmine/issues/3956))
  - Fixed: Update documentation for LDAP integration
    ([\#3949](http://www.rudder-project.org/redmine/issues/3949))
  - Fixed: Install documentation for Red Hat/CentOS ignores GPG
    signatures\!
    ([\#3941](http://www.rudder-project.org/redmine/issues/3941))

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Olivier Mauras
  - Dennis Cabooter
  - Michael Gliwinski (Henderson Group)
  - Fabrice Flore-Thébault
  - Matthew Hall

### Release notes

​This is a bug fix release in the 2.6 series. All installations of 2.6.x
should be upgraded when possible. 
This version of Rudder is in stable and is already in use on several
production platforms with success. You are invited to upgrade all
pre-2.6 installations to it as soon as possible to enjoy the latest
features with a still stable and more polished version.

## Rudder 2.6.5 (2013-09-06)

### Bug fixes

#### Webapp - Node management

  - Fixed: Node management\>Groups screen CSS is broken when opening a
    group ([\#3901](http://www.rudder-project.org/redmine/issues/3901))

#### Packaging

  - Fixed: Postinstall script of rudder-inventory-endpoint display a
    warning about fail of rsyslog restart at first install on
    RHEL/CentOS
    ([\#3900](http://www.rudder-project.org/redmine/issues/3900))

#### Techniques

  - Fixed: /etc/cron.d/rudder-agent is broken after launching cf-agent
    for the first time until a generation of promises by Rudder server
    ([\#3908](http://www.rudder-project.org/redmine/issues/3908))

### Release notes

This is a minor bug fix release in the 2.6 series and all installations
of 2.6.x should be upgraded when possible. 
This version of Rudder is in stable and is already in use on several
production platforms with success. You are invited to upgrade all
pre-2.6 installations to it as soon as possible to enjoy the latest
features with a still stable and more polished version.

## Rudder 2.6.4 (2013-09-03)

### Changes

#### Techniques

  - Technique "Group management": make group creation optional
    ([\#3378](http://www.rudder-project.org/redmine/issues/3378))
  - Technique "Package management for RHEL / [CentOS](CentOS) /
    ([SuSE](SuSE) / RPM systems": Improve performances of the Technique
    ([\#3444](http://www.rudder-project.org/redmine/issues/3444))
  - Technique "Download From A Shared Folder": Add possibility to set
    SUID and SGID to files copied
    ([\#3115](http://www.rudder-project.org/redmine/issues/3115))

#### Documentation

  - Add Documentation about workflow and change requests
    ([\#3577](http://www.rudder-project.org/redmine/issues/3577))
  - Create a Technique library upgrade documentation
    ([\#3084](http://www.rudder-project.org/redmine/issues/3084))
  - Create a usage handbook that summarize common usage scenarios in
    Rudder
    ([\#3009](http://www.rudder-project.org/redmine/issues/3009))
  - Explain how to migrate a server to another machine
    ([\#2958](http://www.rudder-project.org/redmine/issues/2958))
  - Add informations about the rsync modules of rudder-project
    ([\#3831](http://www.rudder-project.org/redmine/issues/3831))

### Bug fixes

#### Webapp - Administration

  - Fixed: In the inventory promises, the local copy of the inventory
    sometimes fails with a message saying it is corrupted
    ([\#3884](http://www.rudder-project.org/redmine/issues/3884))
  - Fixed: Promises are not updated when running agent too often (\< 5
    minutes beteween 2 executions)
    ([\#3849](http://www.rudder-project.org/redmine/issues/3849))
  - Fixed: Backport the git lock erase promise if older than 5 minutes
    from 2.5 to 2.4
    ([\#3531](http://www.rudder-project.org/redmine/issues/3531))
  - Fixed: The limit of the eventlog length (64chars) could lead to SQL
    errors
    ([\#3883](http://www.rudder-project.org/redmine/issues/3883))

#### Webapp - CFEngine integration

  - Fixed: The XML parser which check metadata.xml of the Techniques
    display a wrong error message when the XML is malformed (Talk about
    SECTION when it is due to INPUTS)
    ([\#3781](http://www.rudder-project.org/redmine/issues/3781))

#### Webapp - Node management

  - Fixed: Add display name and search for unknown linux
    ([\#3841](http://www.rudder-project.org/redmine/issues/3841))
  - Fixed: "Rules to be applied" in pending nodes doesn't find Rules on
    system groups
    ([\#3737](http://www.rudder-project.org/redmine/issues/3737))
  - Fixed: Errors when accepting/refusing nodes are ignored
    ([\#3880](http://www.rudder-project.org/redmine/issues/3880))
  - Fixed: Groups screen: Using storage criteria lead to an error caused
    by the Unit format
    ([\#3872](http://www.rudder-project.org/redmine/issues/3872))
  - Fixed: On node search, "OR" and "include policy server" leads to 0
    results
    ([\#3866](http://www.rudder-project.org/redmine/issues/3866))
  - Fixed: Error when deleting category
    ([\#3861](http://www.rudder-project.org/redmine/issues/3861))
  - Fixed: On node search, regex filter on attribute not in node summary
    is broken with "OR"
    ([\#3853](http://www.rudder-project.org/redmine/issues/3853))
  - Fixed: Add correct display name for Scientific Linux and Oracle
    Linux ([\#3839](http://www.rudder-project.org/redmine/issues/3839))

#### Inventory (webapp, Fusion)

  - Fixed: Error when adding and deleting a node several times
    ([\#3887](http://www.rudder-project.org/redmine/issues/3887))
  - Fixed: On unknown Linux, Rudder say Can't merge inventory report in
    LDAP directory, aborting
    ([\#3840](http://www.rudder-project.org/redmine/issues/3840))
  - Fixed: Rudder doesn't support Oracle Linux - Can't merge inventory
    in LDAP
    ([\#3834](http://www.rudder-project.org/redmine/issues/3834),
    ([\#3836](http://www.rudder-project.org/redmine/issues/3836),
    ([\#3837](http://www.rudder-project.org/redmine/issues/3837))
  - Fixed: OS Full name should be queriable
    ([\#3835](http://www.rudder-project.org/redmine/issues/3835))

#### Packaging

  - Fixed: Wrong dependency for rudder-agent package on SLES
    ([\#3882](http://www.rudder-project.org/redmine/issues/3882))
  - Fixed: Rudder cron file contains error until the use of CFEngine and
    will display error into /var/mail for root
    ([\#3654,](http://www.rudder-project.org/redmine/issues/3654)
    ([\#3894](http://www.rudder-project.org/redmine/issues/3894))
  - Fixed: The rudder-agent cron file installed into debian folder by
    Makefile during a build is not remove by "make veryclean localclean"
    ([\#3856](http://www.rudder-project.org/redmine/issues/3856))
  - Fixed: The Rudder agent post installation and removal scripts are
    not cleaning things correctly
    ([\#3634](http://www.rudder-project.org/redmine/issues/3634),
    ([\#3896](http://www.rudder-project.org/redmine/issues/3896))
  - Fixed: rudder-upgrade prints an unnecessary warning: "WARNING: Some
    event log are still based on an old file format (file format 1),
    please upgrade first to 2.6 to make this migration"
    ([\#3865](http://www.rudder-project.org/redmine/issues/3865))
  - Fixed: The logrotate file of Debian and Ubuntu is duplicated since
    the name from the packaging is wrong
    ([\#3864](http://www.rudder-project.org/redmine/issues/3864))
  - Fixed: /opt/rudder/bin/rudder-upgrade requires rsync but no package
    depends on it
    ([\#3813](http://www.rudder-project.org/redmine/issues/3813))
  - Fixed: The properties 'history.inventories.enable' and
    'ldap.inventories.removed.basedn' are missing the
    /opt/rudder/etc/inventory-web after a migration from Rudder 2.3 and
    'history.inventories.enable' is uslessly added into
    /opt/rudder/etc/rudder-web.properties
    ([\#3810](http://www.rudder-project.org/redmine/issues/3810))
  - Fixed: Error on Rudder about lack of RAM memory should be explicit
    ([\#3721](http://www.rudder-project.org/redmine/issues/3721))
  - Fixed: The files written by syslog in /var/log/rudder/reports/\*.log
    and slapd in /var/log/rudder/ldap/slapd.log are still empty after a
    logrotate
    ([\#3603](http://www.rudder-project.org/redmine/issues/3603))

#### Techniques

  - Fixed: Technique "Package management for RHEL / [CentOS](CentOS) /
    ([SuSE](SuSE) / RPM systems: Options could be clearer
    ([\#3793](http://www.rudder-project.org/redmine/issues/3793))
  - Fixed: Technique "Enforce a file content" v3.0: Missing double quote
    broke the generation of promises
    ([\#3811](http://www.rudder-project.org/redmine/issues/3811))
  - Fixed: Techniques "Package management for RHEL / [CentOS](CentOS) /
    ([SuSE](SuSE) / RPM systems" and "Package management for Debian /
    Ubuntu / APT systems": Always report success, even on repair
    ([\#1175](http://www.rudder-project.org/redmine/issues/1175),
    ([\#3816](http://www.rudder-project.org/redmine/issues/3816))
  - Fixed: Technique "Package management for RHEL / [CentOS](CentOS) /
    ([SuSE](SuSE) / RPM systems": Package installation using yum doesn't
    work (RPM based systems like Red Hat / [CentOS](CentOS))
    ([\#3815](http://www.rudder-project.org/redmine/issues/3815))
  - Fixed: Technique "Package management for RHEL / [CentOS](CentOS) /
    ([SuSE](SuSE) / RPM systems" v4.0: Technique uses wrong path for data
    file (3.0/...)
    ([\#3779](http://www.rudder-project.org/redmine/issues/3779))
  - Fixed: Technique "Sudo utility configuration": Technique is not
    correctly reporting when applied by multiple rules
    ([\#3870](http://www.rudder-project.org/redmine/issues/3870))

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Olivier Mauras
  - Dennis Cabooter
  - Michael Gliwinski (Henderson Group)
  - Fabrice Flore-Thébault
  - Jean Remond

### Release notes

​This is a bug fix release in the 2.6 series. All installations of 2.6.x
should be upgraded when possible. 
This version of Rudder is in stable and is already in use on several
production platforms with success. You are invited to upgrade all
pre-2.6 installations to it as soon as possible to enjoy the latest
features with a still stable and more polished
version.

## Rudder 2.6.3 (2013-07-26)

### Bug fixes

#### Techniques - Sys & init promis

  - Use cron.d instead of the crontab to store Rudder cron entry (also
    in initial promises)
    ([\#3731](http://www.rudder-project.org/redmine/issues/3731))
  - Cron on RHEL/CentOS and Ubuntu nodes was not checked with initial
    promises
    ([\#3730](http://www.rudder-project.org/redmine/issues/3730))

#### Logging

  - Non compliant reports flood the Rudder logs on a new installation
    ([\#3655](http://www.rudder-project.org/redmine/issues/3655))
  - Some debug logs informations about concurrent access were wrong
    ([\#3641](http://www.rudder-project.org/redmine/issues/3641))

#### Inventory (webapp, Fusion)

  - Rudder ignores IP aliases on network interfaces
    ([\#3669](http://www.rudder-project.org/redmine/issues/3669))

#### Webapp - Config management

  - The Rudder variables in directive values only work with full value
    ([\#3689](http://www.rudder-project.org/redmine/issues/3689))
  - CFEngine variables name in "CFEngine Generic Variable Definition"
    Directives no more support "dot" and need a migration script to
    "undot" existing ones
    ([\#3642](http://www.rudder-project.org/redmine/issues/3642))
  - Screen "Configuration Policy\>Directives": The buttons are ugly (not
    rounded)
    ([\#3688](http://www.rudder-project.org/redmine/issues/3688))

#### Webapp - Node management

  - "Search nodes" screen: After a first use of the search button, it is
    no more clickable until a change (add/remove/modification) of
    criteria
    ([\#3639](http://www.rudder-project.org/redmine/issues/3639))
  - Debug log when updating dynamic group is not clear
    ([\#3612](http://www.rudder-project.org/redmine/issues/3612))
  - An error is displayed in the
    \[WebUI](WebUI)\
    and the logs when removing a node because of an inefficient current
    action
    ([\#3517](http://www.rudder-project.org/redmine/issues/3517))

#### Webapp - Administration

  - Change Request can't be validated if it concerns groups
    ([\#3644](http://www.rudder-project.org/redmine/issues/3644))
  - Change Request can't be validated if there is trailing spaces in the
    modified object
    ([\#3660](http://www.rudder-project.org/redmine/issues/3660))
  - Screen "Administration\>Policy Server": Buttons are broken after
    first click on them
    ([\#3764](http://www.rudder-project.org/redmine/issues/3764))

#### Webapp - CFEngine integration

  - Change Request could display error in the logs if its directive is
    based on Techniques using fixed regex (IP, Mail)
    ([\#3759](http://www.rudder-project.org/redmine/issues/3759))
  - Remove wrong imports in undot CFEngine variable script
    ([\#3746](http://www.rudder-project.org/redmine/issues/3746))
  - Migration of some Directives version does not work if no
    modification are made in the parameters with the message "There are
    no modification to save"
    ([\#3732](http://www.rudder-project.org/redmine/issues/3732))

#### Miscellaneous

  - Base64 entries are not supported by the migration script for 2.6
    concerning the unescaping of directive contents
    ([\#3780](http://www.rudder-project.org/redmine/issues/3780))
  - Build rudder-agent on SLES 10 is no more possible since the use of
    the 'T' flag with cp in our SOURCES/Makefile
    ([\#3678](http://www.rudder-project.org/redmine/issues/3678))
  - Techniques using reporting based on file edition don't have proper
    reporting for kept status with CFEngine 3.4.x
    ([\#3618](http://www.rudder-project.org/redmine/issues/3618))
  - The rudder-upgrade script could be very long to execute (\>5min)
    ([\#3611](http://www.rudder-project.org/redmine/issues/3611))
  - The script of initialization rudder-init.sh display an error message
    if called with arguments
    ([\#3747](http://www.rudder-project.org/redmine/issues/3747))

#### Architecture - Tests

  - Falacious test error in
    \[TestQuickSearchService](TestQuickSearchService)\
    ([\#3760](http://www.rudder-project.org/redmine/issues/3760))

#### Techniques

  - Technique "Enforce a file content": Outdated comments about escaping
    quotes
    ([\#3787](http://www.rudder-project.org/redmine/issues/3787))
  - Double cron job for Rudder agent when upgrading from 2.5 to 2.6
    ([\#3681](http://www.rudder-project.org/redmine/issues/3681))
  - Deleting packages on Red Hat /
    \[CentOS](CentOS)\
    doesn't work
    ([\#3709](http://www.rudder-project.org/redmine/issues/3709))
  - The reporting of "Common Policies \> Update" could be in a 'No
    Answer' status
    ([\#3620](http://www.rudder-project.org/redmine/issues/3620))
  - Technique "APT package manager configuration": It is very complex to
    use ([\#2277](http://www.rudder-project.org/redmine/issues/2277))

### Changes

#### Techniques - Others

  - Technique "MOTD configuration": Apply best practices
    ([\#3629](http://www.rudder-project.org/redmine/issues/3629))

#### Miscellaneous

  - Add support for rudder-agent on RHEL /
    \[CentOS](CentOS)\
    3 ([\#3648](http://www.rudder-project.org/redmine/issues/3648))

#### Techniques

  - Add new Technique: "Generic CFEngine Command variable definition"
    permitting to initialize CFEngine variables from the result of shell
    commands
    ([\#3214](http://www.rudder-project.org/redmine/issues/3214))

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter

### Release notes

This is a bug fix release in the 2.6 series. All installations of 2.6.x
should be upgraded when possible. 
This version is the new "stable" version and is already in use on
several production platforms with success. You are invited to upgrade
all pre-2.6 installations to it as soon as possible to enjoy the latest
features with a still stable and more polished
version.

## Rudder 2.6.2 (2013-06-07)

### Bug fixes

#### Inventory (webapp, Fusion)

  - When a node has two intefaces with the same IP, it does not appear
    as pending node in Rudder
    \[WebUI](WebUI)\
    and can't be accepted
    ([\#3626](http://www.rudder-project.org/redmine/issues/3626))

#### Miscellaneous

  - Cron on RHEL/CentOS nodes was restarted at every execution of
    CFEngine
    ([\#3609](http://www.rudder-project.org/redmine/issues/3609))
  - The file tools/generate-map.sh to generate the documentation does
    not work with bash
    ([\#3579](http://www.rudder-project.org/redmine/issues/3579))
  - If rsyslog is installed after another syslog, rsyslog is never used
    on SLES and reports will never be caught by Rudder server
    ([\#3569](http://www.rudder-project.org/redmine/issues/3569))
  - During the first installation of rudder-agent, chmod is made on
    nonexistent ppkeys of CFEngine
    ([\#3633](http://www.rudder-project.org/redmine/issues/3633))
  - CFEngine display HTML outputs in shell via syslog
    ([\#3532](http://www.rudder-project.org/redmine/issues/3532))

#### Webapp - Node management

  - Removing a Group don't remove it from its related Rule and lead to
    error messages until a cache clearing
    ([\#3621](http://www.rudder-project.org/redmine/issues/3621))
  - Displaying list of nodes may timeout
    ([\#3617](http://www.rudder-project.org/redmine/issues/3617))
  - It is not possible to add several nodes sharing the same IP from
    their private network interface
    ([\#3625](http://www.rudder-project.org/redmine/issues/3625))
  - Backport translation of datepickers from French (\#3425) to branch
    2.4 ([\#3576](http://www.rudder-project.org/redmine/issues/3576))
  - Persistent error messages using search nodes in Rudder
    \[WebUI](WebUI)\
    ([\#3512](http://www.rudder-project.org/redmine/issues/3512))
  - Searching on Last Inventory Date is not working in Rudder 2.4
    ([\#3404](http://www.rudder-project.org/redmine/issues/3404))
  - Search nodes should accept the "m" notation in memory size
    ([\#3345](http://www.rudder-project.org/redmine/issues/3345))
  - No tooltip on Group page for Statis/Dynamic
    ([\#3597](http://www.rudder-project.org/redmine/issues/3597))

#### Webapp - Administration

  - When restoring latest commit, no commit should be made
    ([\#3593](http://www.rudder-project.org/redmine/issues/3593))
  - Reload latest commit through API is not working
    ([\#3607](http://www.rudder-project.org/redmine/issues/3607))
  - Migration script for 'Archives' entry in ldap is missing
    ([\#3590](http://www.rudder-project.org/redmine/issues/3590))
  - Archives entry is missing in LDAP, leading to error when creating
    Rules ([\#3587](http://www.rudder-project.org/redmine/issues/3587))
  - System Rules/Directives/Groups should not be archivedr
    ([\#3585](http://www.rudder-project.org/redmine/issues/3585))

#### Webapp - Display, home page

  - The notifications related to the Workflow are broken in low
    resolution screens (1024\*768)
    ([\#3601](http://www.rudder-project.org/redmine/issues/3601))
  - Various Fixes
    ([\#3373](http://www.rudder-project.org/redmine/issues/3373))

#### Architecture - Dependencies

  - Rudder is not building with maven2
    ([\#3637](http://www.rudder-project.org/redmine/issues/3637))
  - Not specifying maven default repos lead to inconsistency in download
    ([\#3598](http://www.rudder-project.org/redmine/issues/3598))

#### Techniques

  - Technique
    \[OpenSSH](OpenSSH)\
    Server v2.0: Reporting for SSH port configuration Component Key is
    not functionnal if port are not defined
    ([\#3247](http://www.rudder-project.org/redmine/issues/3247))
  - CFEngine internal database verification should depend on the
    CFEngine version as
    \[BerkeleyDB](BerkeleyDB)\
    is no more used since Rudder 2.6
    ([\#3570](http://www.rudder-project.org/redmine/issues/3570))
  - Technique "Generic Variable Definition": The regexp to check
    variable name doesn't work
    ([\#3599](http://www.rudder-project.org/redmine/issues/3599))
  - Technique "Download a file from the shared folder": Posthook reports
    is missing if the copy fails
    ([\#3583](http://www.rudder-project.org/redmine/issues/3583))
  - When using rsyslog with a version \> 5.7.1 on the server, some
    reports may be dropped, leading to
    \[NoAnswer](NoAnswer)\
    on the server
    ([\#3604](http://www.rudder-project.org/redmine/issues/3604))
  - Technique "Download a file from the shared folder": When error
    happens some logs are duplicated
    ([\#3582](http://www.rudder-project.org/redmine/issues/3582))
  - Technique "Download A File": The inputs of the Technique are not
    checked by regexp to prevent wrong URL or destination format
    ([\#3539](http://www.rudder-project.org/redmine/issues/3539))

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter

### Release notes

This is a bug fix release in the 2.6 series. All installations of 2.6.x
should be upgraded when possible. 
This version is not yet marked "stable" but it is already in use on
several production platforms with success. You are invited to upgrade
all pre-2.6 installations to 2.6 as soon as possible to enjoy the latest
features with a still stable and more polished version.

## Rudder 2.6.1 (2013-05-27)

### Bug fixes

#### Webapp - Administration

  - Display missing information about plugins again
    ([\#3594](http://www.rudder-project.org/redmine/issues/3594))

#### Webapp - Config management

  - Don't try to display pending Change requests when workflows are
    disabled
    ([\#3518](http://www.rudder-project.org/redmine/issues/3518))

#### Miscellaneous

  - LDAP check at webapp start will now correctly check all entries
    ([\#3588](http://www.rudder-project.org/redmine/issues/3588),
    ([\#3589](http://www.rudder-project.org/redmine/issues/3589))
  - rudder-agent package dependencies broken on SLES11 (libtokyocabinet
    is bundled in the package so should not be a dependency)
    ([\#3586](http://www.rudder-project.org/redmine/issues/3586))

#### Techniques

  - The Technique 'userManagement' v1.0 was misconfigured to use
    password hashes, leading to error on upgrade
    ([\#3595](http://www.rudder-project.org/redmine/issues/3595))
  - The Technique 'Copy file from shared folder' v1.3 sends no reports
    ([\#3580](http://www.rudder-project.org/redmine/issues/3580))
  - The Technique 'sshConfiguration' v2.0 is now correctly following
    conventions
    ([\#3236](http://www.rudder-project.org/redmine/issues/3236))

### Changes

### Release notes

This is a bug fix release in the 2.6 series. All installations of 2.6.x
should be upgraded when possible. 
This version is not yet marked "stable" but it is already in use on
several production platforms with success. You are invited to upgrade
all pre-2.6 installations to 2.6 as soon as possible to enjoy the latest
features with a still stable and more polished version.

## Rudder 2.6.0 (2013-04-30)

### Bug fixes

#### Webapp - Config management

  - When workflow and change message are disabled, there is a popup to
    confirm change
    ([\#3504](http://www.rudder-project.org/redmine/issues/3504))

#### Webapp - Administration

  - "Reload Techniques" button should be named more expressively
    ([\#3554](http://www.rudder-project.org/redmine/issues/3554))
  - Change Request event logs created even when change requests are
    disabled
    ([\#3553](http://www.rudder-project.org/redmine/issues/3553))
  - On change request page, no menus are higlighted
    ([\#3508](http://www.rudder-project.org/redmine/issues/3508))

#### Webapp - Node management

  - Descriptions of system and special groups are not up to date
    ([\#3552](http://www.rudder-project.org/redmine/issues/3552))

#### Webapp - Config management

  - Translate selection of date (datepicker) in English
    ([\#3425](http://www.rudder-project.org/redmine/issues/3425))

#### Miscellaneous

  - The new passwordhash types are not usable in Rudder
    ([\#3556](http://www.rudder-project.org/redmine/issues/3556))

#### Techniques

  - The 2.6 cf-lock erasing promise does not work on
    ([TokyoCabinet](TokyoCabinet) databases
    ([\#3564](http://www.rudder-project.org/redmine/issues/3564))
  - The checkGenericFileContent 3.2 Technique is broken
    ([\#3562](http://www.rudder-project.org/redmine/issues/3562))
  - Cron still restarts all the time
    ([\#3561](http://www.rudder-project.org/redmine/issues/3561))
  - Technique "User management": Permit to update /etc/shadow directly
    ([\#3461](http://www.rudder-project.org/redmine/issues/3461))

### Changes

#### Webapp - Administration

  - Add a new default user
    ([\#3519](http://www.rudder-project.org/redmine/issues/3519))

### Release notes

This version of Rudder is a final release. We have tested it thoroughly
on production systems and believe it to be free of any major bugs.
However, this version is not marked "stable" (unlike previous final
versions), since it has not proven to be reliable on production systems
over time yet. The current "stable" release is still 2.4.\*.

## Rudder 2.6.0~rc1 (2013-04-26)

### Bug fixes

#### Webapp - Config management

  - Regenerate now make pending rule change request invalid
    ([\#3548](http://www.rudder-project.org/redmine/issues/3548))
  - System groups are not in the list of target groups
    ([\#3547](http://www.rudder-project.org/redmine/issues/3547))
  - delete a rule after modification
    ([\#3521](http://www.rudder-project.org/redmine/issues/3521))
  - There is some missing code in workflow\!
    ([\#3514](http://www.rudder-project.org/redmine/issues/3514))
  - Add an icon for change requests
    ([\#3511](http://www.rudder-project.org/redmine/issues/3511))
  - Remove 'are you sure you want to X this Y' message
    ([\#3510](http://www.rudder-project.org/redmine/issues/3510))
  - There is no success popup on directive/rule/group creation
    ([\#3509](http://www.rudder-project.org/redmine/issues/3509))
  - Help tooltip in directive form do not work anymore
    ([\#3498](http://www.rudder-project.org/redmine/issues/3498))
  - Missing message warning about a pending change request on an item
    ([\#3483](http://www.rudder-project.org/redmine/issues/3483))
  - "Delete" button in directive forms is not correctly placed
    ([\#3418](http://www.rudder-project.org/redmine/issues/3418))
  - When creating a rule, we can't select the system groups
    ([\#3410](http://www.rudder-project.org/redmine/issues/3410))

#### Webapp - Administration

  - Utilities menu is not shwon without workflow
    ([\#3530](http://www.rudder-project.org/redmine/issues/3530))
  - Choice reset if there is an error in next step popup
    ([\#3507](http://www.rudder-project.org/redmine/issues/3507))
  - when clicking update on a change request, an event is created (and
    logged) even if nothing occurs.
    ([\#3503](http://www.rudder-project.org/redmine/issues/3503))
  - Small corrections on workflow system
    ([\#3484](http://www.rudder-project.org/redmine/issues/3484))
  - Downloading archive is not possible
    ([\#3472](http://www.rudder-project.org/redmine/issues/3472))
  - On popup to change workflow step, cancelling display the success
    popup ([\#3469](http://www.rudder-project.org/redmine/issues/3469))
  - On new Rudder server workflow are enabled
    ([\#3441](http://www.rudder-project.org/redmine/issues/3441))

#### Miscellaneous

  - rudder-agent RPM packages don't require the right 32/64 bit
    dependencies
    ([\#3546](http://www.rudder-project.org/redmine/issues/3546))
  - Use the service utility in the RPM packaging (Prepare systemd /
    Fedora compliance)
    ([\#3544](http://www.rudder-project.org/redmine/issues/3544))
  - chmod on /var/rudder/cfengine-community/ppkeys fails if directory
    does not yet exist
    ([\#3542](http://www.rudder-project.org/redmine/issues/3542))
  - RPM packages: upgrades from one major branch to another don't always
    work because of the Epoch field
    ([\#3535](http://www.rudder-project.org/redmine/issues/3535))
  - During migration from 2.5.1 to 2.6.0 nightly, the LDAP server could
    sometimes not be contacted and the script rudder-upgrade can't be
    properly applied
    ([\#3528](http://www.rudder-project.org/redmine/issues/3528),
    ([\#3550](http://www.rudder-project.org/redmine/issues/3550))
  - The migration script in 2.6 is not convergeant
    ([\#3516](http://www.rudder-project.org/redmine/issues/3516))
  - Upgrading rudder-agent from 2.4.4 to 2.6.0 nightly lead to having an
    error from CFEngine because of permissions of directories
    ([\#3515](http://www.rudder-project.org/redmine/issues/3515))
  - rudder-upgrade.sh uses a broken grep to migrate
    rudder.autoDeployOnModification
    ([\#3513](http://www.rudder-project.org/redmine/issues/3513))
  - The rudder-webapp packages has a broken debian/rules Makefile
    ([\#3506](http://www.rudder-project.org/redmine/issues/3506))
  - rudder-init.sh uses the wrong path for cf-agent on the 2.6 version
    ([\#3496](http://www.rudder-project.org/redmine/issues/3496))
  - Error on migration about escaping directive in migration script
    ([\#3527](http://www.rudder-project.org/redmine/issues/3527))

#### Webapp - Display, home page

  - When popups are too tall or too wide, they are not displayed
    correctly
    ([\#3465](http://www.rudder-project.org/redmine/issues/3465))

#### Webapp - Node management

  - After deleting a group, the form of that group is still open
    ([\#3524](http://www.rudder-project.org/redmine/issues/3524))

#### Architecture - Refactoring

  - Modification of technique library were not registered in LDAP
    anymore
    ([\#3466](http://www.rudder-project.org/redmine/issues/3466))

#### Techniques

  - The PASSWORDHASH metadata entry does not allow to use glibc-like
    SHA/MD hashes
    ([\#3497](http://www.rudder-project.org/redmine/issues/3497))
  - The 1.2 version of aptPackageInstallation should follow the best
    practices for Technique redaction
    ([\#3491](http://www.rudder-project.org/redmine/issues/3491))
  - The userManagement Technique is broken on 2.6
    ([\#3473](http://www.rudder-project.org/redmine/issues/3473))
  - Several Techniques are missing package\_patch\_command
    ([\#3487](http://www.rudder-project.org/redmine/issues/3487))

### Changes

#### Webapp - Administration

  - Prevent workflow self Validation/Deployment
    ([\#3500](http://www.rudder-project.org/redmine/issues/3500))
  - Link Event logs to the change request that generate them
    ([\#3474](http://www.rudder-project.org/redmine/issues/3474))
  - Improve change request owner
    ([\#3455](http://www.rudder-project.org/redmine/issues/3455))
  - Improve User authorization for worklow
    ([\#3440](http://www.rudder-project.org/redmine/issues/3440))

#### Webapp - Node management

  - Add workflow for groups
    ([\#3442](http://www.rudder-project.org/redmine/issues/3442))

#### Miscellaneous

  - Upgrade docs for 2.6
    ([\#3447](http://www.rudder-project.org/redmine/issues/3447))

### Release notes

This version is a release candidate, and contains many bug fixes sinces
2.6.0~beta1. We have tested it and believe it to be free of any critical
bugs. The use on production systems is not encouraged at this time and
is at your own risk. However, we do encourage testing, and welcome all
and any feedback\!

## Rudder 2.6.0~beta1 (2013-04-12)

### Changes

#### Agent

  - Upgrade CFEngine to 3.4.x ( \#2519)
  - Make Rudder agent update its promises only if
    rudder\_promises\_generated file is not up to date in order to save
    resources ( \#3426 , \#3429)

#### Core

  - Update to Scala 2.10.1 ( \#3229 \#3354) and Lift 2.5-rc2 ( \#3355)
  - Automatically escape quotes in directives ( \#2947)

#### UI

  - Add validation workflows for configuration related change request
    \#3231)
  - Be able to have hideable sections in the Directive display ( \#3290)
  - Add a password hashing input field type in Directive ( \#3282)
  - Add a page listing all nodes accepted in Rudder ( \#3303)
  - Added separate columns for OS type, name, version, service pack, and
    last report received in the search node tool ( \#3296)
  - Have a group containing all nodes ( \#3273)
  - Improve directive management display ( \#2950)
  - Rudder 2.6 logo ( \#3408)
  - Inform user that Javascript must be enabled to use Rudder ( \#3184)

#### System integration

  - Log information about registered properties when Rudder starts
    \#3357)

### Release notes

This software is in beta status and contains a lots of new features. We
have tested it and believe it to be free of any critical bugs. The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!

