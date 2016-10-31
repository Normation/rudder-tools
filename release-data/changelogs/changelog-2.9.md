# Change logs for Rudder 2.9.\* versions

Rudder 2.9 is currently the **old-latest** available version of Rudder.
This version is codenamed "Liberty ship".

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**​Main new features in Rudder 2.9:**

  - ncf framework is now included in Rudder
    (https://github.com/Normation/ncf)
  - Rule can now be organized by category, allowing you to order them
  - You can choose to apply a Directive to Rules directly from the
    Directive interface
  - Every table of Rudder web interface will now remember how many
    entries to display
  - You can configure some cf-serverd behavior directly from Rudder web
    interface

A blog post about all these features is available here:
http://blog.normation.com/en/2014/01/09/rudder-2-9/

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

## Rudder 2.9.6 (2014-06-12)

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

This is a maintenance release, part of the "old latest" 2.9 branch. 
It is recommended to upgrade all pre-2.10 installations to 2.10 as soon
as possible to enjoy the latest features and improvements of a more
mature and stable version.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
release is marked as 'old-stable' since a subsequent release (branch
2.10) has proven itself to be 'stable'. 'Old-stable' also means that
this release has been assigned an 'end-of-life' date, in this case 30th
June 2014. 
See our FAQ for details, on
https://www.rudder-project.org/site/documentation/faq/#what_is_the_versioning_policy.

## Rudder 2.9.5 (2014-06-06)

### Changes

### Bug fixes

#### Techniques - Sys & init promis

  - Fixed: cf-agent slowed by users addition into inventory and displays
    a lot of warnings about that
    ([\#4932](http://www.rudder-project.org/redmine/issues/4932))
  - Fixed: Automatic reparation method for cf\_lock. is only
    checked once an hour
    ([\#4812](http://www.rudder-project.org/redmine/issues/4812))
  - Fixed: Reports are not inserted into Rudder because regexp in
    rsyslog is too greedy when matching execuction timestamp
    ([\#4761](http://www.rudder-project.org/redmine/issues/4761))
  - Fixed: The initial promises use a remote copy which does not permit
    the copy of ncf files to /var/rudder/ncf/ and generation of promises
    fails.
    ([\#4894](http://www.rudder-project.org/redmine/issues/4894))
  - Fixed: Copy of ncf files on the Policy Server leave removed files,
    resulting in duplicate promises if we rename or move files
    ([\#4837](http://www.rudder-project.org/redmine/issues/4837))
  - Fixed: CFEngine complains about a Typo in policy\_server initial
    promises
    ([\#4745](http://www.rudder-project.org/redmine/issues/4745))

#### Logging

  - Fixed: A developpment log line is displayed when saving Directive
    edit form
    ([\#4660](http://www.rudder-project.org/redmine/issues/4660))

#### Inventory (webapp, Fusion)

  - Fixed: Process start date are displayed as "bad format" in Rudder
    web interface
    ([\#4742](http://www.rudder-project.org/redmine/issues/4742))

#### Webapp - Config management

  - Fixed: If we select a Rule category (other than top) then reload the
    Rule page, the state of the Rule table is not coherent.
    ([\#4947](http://www.rudder-project.org/redmine/issues/4947))
  - Fixed: Rule category can be deleted after the a Rule was added to
    the category
    ([\#4946](http://www.rudder-project.org/redmine/issues/4946))
  - Fixed: In Rule grid, mouse hover on "Not applied" Rules display a
    wrong tooltip
    ([\#4787](http://www.rudder-project.org/redmine/issues/4787))

#### Webapp - Administration

  - Fixed: Changing server security settings should trigger a promise
    generation
    ([\#4640](http://www.rudder-project.org/redmine/issues/4640))

#### Webapp - Display, home page

  - Fixed: Editing a Directive, after creating/cloning, does not show
    the workflow popup nor redirect to the change request
    ([\#4357](http://www.rudder-project.org/redmine/issues/4357))

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
  - Fixed: Job Scheduler Technique should not use ifelapsed to avoid
    running several time same job
    ([\#4841](http://www.rudder-project.org/redmine/issues/4841))

#### API

  - Fixed: Latest API prefix is not correct
    ([\#4800](http://www.rudder-project.org/redmine/issues/4800))

#### Relay Servers

  - Fixed: Promises generation fails on relay server
    ([\#4716](http://www.rudder-project.org/redmine/issues/4716))

#### Packaging

  - Fixed: Rudder init script may not correctly initialize
    policy\_server.dat file, resulting in a non functionning Rudder
    server
    ([\#4915](http://www.rudder-project.org/redmine/issues/4915))

#### System integration

  - Fixed: rudder-agent may be stucked by tokyo cabinet database
    bloating
    ([\#4769](http://www.rudder-project.org/redmine/issues/4769))
  - Fixed: Default file header should be one liner to prevent header
    repetition.
    ([\#4755](http://www.rudder-project.org/redmine/issues/4755))
  - Fixed: cf\_lock.tcdb is not cleaned by check-rudder-agent script
    when update file is older than 10 minutes
    ([\#4752](http://www.rudder-project.org/redmine/issues/4752))
  - Fixed: Typo in /opt/rudder/bin/check-rudder-agent, prevent cleaning
    of cf-lock and floods with cron mails
    ([\#4686](http://www.rudder-project.org/redmine/issues/4686))
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

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Cédric Cabessa
  - Dennis Cabooter
  - Fabrice Flore-Thébault
  - Mikaël Mantel
  - Olivier Mauras

This is a bug fix release in the 2.9 series and all installations of
2.9.x should be upgraded when possible. This version is not yet marked
"stable", since it has not yet proven itself to be reliable on
production systems over a period of several months. The current "stable"
release is still 2.6.\*.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. To be
declared "stable" we prefer to wait until a version has been available
and running in production for several months. As such, we expect version
2.9 of Rudder to be declared stable very soon.

## Rudder 2.9.4 (2014-03-14)

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

This is a bug fix release in the 2.9 series and all installations of
2.9.x should be upgraded when possible. This version is not yet marked
"stable", since it has not yet proven itself to be reliable on
production systems over a period of several months. The current "stable"
release is still 2.6.\*.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. To be
declared "stable" we prefer to wait until a version has been available
and running in production for several months. As such, we expect version
2.9 of Rudder to be declared stable very soon.

## Rudder 2.9.3 (2014-03-06)

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

  - Fixed: Technique "Package management for RPM systems": Wrong
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
    an invalid character in it
    ([\#4393](http://www.rudder-project.org/redmine/issues/4393))
  - Fixed: When adding a Directive to a Rule from a newly created
    Directives screen, Change Request popup not displayed
    ([\#4383](http://www.rudder-project.org/redmine/issues/4383))
  - Fixed: Rule category tree should have the same size than standard
    rule grid (10 entries)
    ([\#4396](http://www.rudder-project.org/redmine/issues/4396))
  - Fixed: Node compliance detail popup expands outside of the popup
    ([\#4382](http://www.rudder-project.org/redmine/issues/4382))

#### Webapp - Administration

  - Fixed: Rudder max days of archived reports retained cannot be
    configured from properties
    ([\#4401](http://www.rudder-project.org/redmine/issues/4401))
  - Fixed: When opening Change request details page, a useless log is
    added in webapp log
    ([\#4463](http://www.rudder-project.org/redmine/issues/4463))

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
  - Fixed: List of allowed network is not filled on Rudder 2.9
    ([\#4485](http://www.rudder-project.org/redmine/issues/4485))

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
  - Fixed: The csv file for ncf reporting is generated for every
    template on every node
    ([\#4539](http://www.rudder-project.org/redmine/issues/4539))

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
  - Fixed: Missing body in update.cf in system techniques to copy files
    from ncf
    ([\#4555](http://www.rudder-project.org/redmine/issues/4555))
  - Fixed: Rudder should enforce permissions when copying files from
    /usr/share/ncf to avoid permission error
    ([\#4384](http://www.rudder-project.org/redmine/issues/4384))

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
  - Fixed: Update Fedora dependencies on rudder-agent
    ([\#4502](http://www.rudder-project.org/redmine/issues/4502))
  - Fixed: RPM build error on missing file "rudder-root-rename"
    ([\#4421](http://www.rudder-project.org/redmine/issues/4421))

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

This is a bug fix release in the 2.9 series and all installations of
2.9.x should be upgraded when possible. This version is not yet marked
"stable", since it has not yet proven itself to be reliable on
production systems over a period of several months. The current "stable"
release is still 2.6.\*.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. To be
declared "stable" we prefer to wait until a version has been available
and running in production for several months. As such, we expect version
2.9 of Rudder to be declared stable very soon.

## Rudder 2.9.2 (2014-01-16)

### Changes

#### Documentation

  - Explain how to upgrade to Rudder 2.9 from Rudder 2.8
    ([\#4339](http://www.rudder-project.org/redmine/issues/4339))

#### Webapp - Config management

  - Add a demo rule in Rudder new installation
    ([\#4332](http://www.rudder-project.org/redmine/issues/4332))

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
  - Fixed: Importing old archive is not working (fileformat \< 5)
    ([\#4351](http://www.rudder-project.org/redmine/issues/4351))

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
  - Fixed: Exporting groups with same name but in different categories
    to another server Rudder is not working
    ([\#4149](http://www.rudder-project.org/redmine/issues/4149))
  - Fixed: When there are errors in Directive parameters, wrong tab
    (Informations) is displayed
    ([\#4372](http://www.rudder-project.org/redmine/issues/4372))
  - Fixed: Parameters tab is too small in Directive edit form and should
    fit the browser size
    ([\#4362](http://www.rudder-project.org/redmine/issues/4362))
  - Fixed: Directive cannot be saved on Chrome
    ([\#4361](http://www.rudder-project.org/redmine/issues/4361))

#### Webapp - Node management

  - Fixed: When a group is deleted, its edit form is still displayed
    ([\#4366](http://www.rudder-project.org/redmine/issues/4366))

#### Documentation

  - Fixed: Incorrect English grammar
    ([\#4206](http://www.rudder-project.org/redmine/issues/4206))

#### Webapp - Display, home page

  - Fixed: If a popup is too large for a screen, save buttons can't be
    used ([\#3795](http://www.rudder-project.org/redmine/issues/3795))

#### Packaging

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
  - Fixed: It is not possible to add a block content or at a specified
    location of a file using 'Enforce file content' Technique
    ([\#3293](http://www.rudder-project.org/redmine/issues/3293))
  - Fixed: Command to restart rsyslog is not correct on Fedora
    ([\#4156](http://www.rudder-project.org/redmine/issues/4156))
  - Fixed: correct some typos is 'sshConfiguration' Technique v3.0
    ([\#4328](http://www.rudder-project.org/redmine/issues/4328))

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

This is a bug fix release in the 2.9 series and all installations of
2.9.x should be upgraded when possible. This version is not yet marked
"stable", since it has not yet proven itself to be reliable on
production systems over a period of several months. The current "stable"
release is still 2.6.\*.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. To be
declared "stable" we prefer to wait until a version has been available
and running in production for several months. As such, we expect version
2.9 of Rudder to be declared stable very soon.

## Rudder 2.9.1 (2014-01-03)

### Changes

### Bug fixes

#### Packaging

  - Fixed: Upgrade to 2.9.0 fails when upgrading from 2.8/2.7 due to a
    missing script
    ([\#4310](http://www.rudder-project.org/redmine/issues/4310))
  - Fixed: Rudder server cannot be installed on [CentOS](CentOS) and Red
    Hat 6.5 since dependency 'jre' does not exist anymore
    ([\#4290](http://www.rudder-project.org/redmine/issues/4290))

#### Documentation

  - Fixed: Remove unused relay documentation placeholder files
    ([\#4267](http://www.rudder-project.org/redmine/issues/4267))
  - Fixed: Wrong version in 2.9 documentation
    ([\#4312](http://www.rudder-project.org/redmine/issues/4312))
  - Fixed: Specify the modules needed by the relay server installation
    ([\#4266](http://www.rudder-project.org/redmine/issues/4266))

#### Miscellaneous

  - Fixed: Rule modification event logs are not correctly migrated to
    new format
    ([\#4324](http://www.rudder-project.org/redmine/issues/4324))
  - Fixed: Rudder webapp hangs on xml migration if upgrading from
    2.6/2.4
    ([\#4309](http://www.rudder-project.org/redmine/issues/4309))
  - Fixed: A Xen Hypervisor on SLES does not make a valid inventory and
    can't be accepted into Rudder since binary path to xenstore is wrong
    on SLES 11 and does not exist on SLES 10
    ([\#4227](http://www.rudder-project.org/redmine/issues/4227))
  - Fixed: Reports containing a \_ in the "Policy" (human readable
    policy name) are rejected by rsyslog
    ([\#4247](http://www.rudder-project.org/redmine/issues/4247))

#### Webapp - Config management

  - Fixed: In Directive tree, if a Directive name is too long it
    overlaps other elements from the tree
    ([\#4313](http://www.rudder-project.org/redmine/issues/4313))

#### Webapp - Administration

  - Fixed: Size of databases displayed in the web interface are lower
    than they really are
    ([\#4101](http://www.rudder-project.org/redmine/issues/4101))

#### Techniques

  - Fixed: With initial-promises, error message is not displayed when
    policies could not be updated
    ([\#4244](http://www.rudder-project.org/redmine/issues/4244))
  - Fixed: Change the Path statement in 'Enforce a file content'
    Technique (all versions)
    ([\#4311](http://www.rudder-project.org/redmine/issues/4311))
  - Fixed: Rudder 2.8 reports that it couldn't update its promises when
    it could, because it cannot purge directory
    ([\#4173](http://www.rudder-project.org/redmine/issues/4173))
  - Fixed: At each agent run, promises are validated and value of
    $ is invalid
    ([\#4158](http://www.rudder-project.org/redmine/issues/4158))

### Release notes

This is a bug fix release in the 2.9 series and all installations of
2.9.x should be upgraded when possible. This version is not yet marked
"stable", since it has not yet proven itself to be reliable on
production systems over a period of several months. The current "stable"
release is still 2.6.\*.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. To be
declared "stable" we prefer to wait until a version has been available
and running in production for several months. As such, we expect version
2.9 of Rudder to be declared stable very soon.

## Rudder 2.9.0 (2013-12-31)

### Changes

#### Packaging

  - CFEngine binaries in /var/rudder are now part of the PATH
    ([\#4306](http://www.rudder-project.org/redmine/issues/4306))
  - Allow copy of files from Rudder server using ncf
    ([\#4296](http://www.rudder-project.org/redmine/issues/4296))

#### Webapp - Reporting

  - Reduce default maximum days of reports retained
    ([\#4152](http://www.rudder-project.org/redmine/issues/4152))

#### Miscellaneous

  - Add Rudder 2.9 logo: Liberty ship
    ([\#4304](http://www.rudder-project.org/redmine/issues/4304))

#### Webapp - Config management

  - Complete Rule category feature: archive, diff in event log and
    optimizations
    ([\#4305](http://www.rudder-project.org/redmine/issues/4305))

### Bug fixes

#### Packaging

  - Fixed: Wrong link in ncf specfile, making ncf not usable on rpm
    based systems
    ([\#4284](http://www.rudder-project.org/redmine/issues/4284))

#### Webapp - Reporting

  - Fixed: When a Technique is updated, Directives based on that
    Technique are not updated
    ([\#4289](http://www.rudder-project.org/redmine/issues/4289))

#### Webapp - Config management

  - Fixed: Inner categories not correctly displayed in popup
    ([\#4285](http://www.rudder-project.org/redmine/issues/4285))

#### Techniques

  - Fixed: ncf promises may not be correctly updated leading to faulty
    update promises on policy server
    ([\#4288](http://www.rudder-project.org/redmine/issues/4288))

### Release notes

This version of Rudder is a final release. We have tested it thoroughly
and believe it to be free of any major bugs. However, this branch is not
marked "stable", since it still has to be proven reliable on production
systems over a period of several months. The current "stable" release is
2.6.\*.

## Rudder 2.9.0~rc2 (2013-12-16)

### Changes

#### Webapp - Config management

  - Disabled Rules should be clearly distinguished in the web interface
    ([\#4272](http://www.rudder-project.org/redmine/issues/4272))

### Bug fixes

#### Webapp - Config management

  - Fixed: Remove useless [JavaScript](JavaScript) initialisation
    variable
    ([\#4275](http://www.rudder-project.org/redmine/issues/4275))
  - Fixed: Selected Rule category is lost when a Rule is modified
    ([\#4274](http://www.rudder-project.org/redmine/issues/4274))
  - Fixed: On the Target Rules part of the Directive screen, "partial
    application" checkbox is not displayed
    ([\#4271](http://www.rudder-project.org/redmine/issues/4271))
  - Fixed: When saving a Rule, an error popup appears
    ([\#4269](http://www.rudder-project.org/redmine/issues/4269))

### Release notes

This version is a release candidate. We have tested it and believe it to
be free of any critical bugs. The use on production systems is not
encouraged at this time and is at your own risk. However, we do
encourage testing, and welcome all and any feedback\!

## Rudder 2.9.0~rc1 (2013-12-13)

### Changes

#### Webapp - Config management

 

  - Don't display categories with no Groups or Techniques without
    Directives in Rule parameters
    ([\#4224](http://www.rudder-project.org/redmine/issues/4224))
  - Make visible if a Directive is not in use by any Rule
    ([\#4208](http://www.rudder-project.org/redmine/issues/4208))
  - Add tabs to the Directive paremeters, add a tab to assign the
    Directive to multiple Rules
    ([\#4180](http://www.rudder-project.org/redmine/issues/4180))
  - Add category of Rules and simplify Rules list
    ([\#4176](http://www.rudder-project.org/redmine/issues/4176))

#### Webapp - Administration

  - Configure node-server communication security options from
    administration web interface
    ([\#3889](http://www.rudder-project.org/redmine/issues/3889))

#### Webapp - Display, home page

  - Remember number of entries used on each table
    ([\#3632](http://www.rudder-project.org/redmine/issues/3632))

#### Packaging

  - Package ncf framework in Rudder
    ([\#4213](http://www.rudder-project.org/redmine/issues/4213),
    ([\#4221](http://www.rudder-project.org/redmine/issues/4221),
    ([\#4199](http://www.rudder-project.org/redmine/issues/4199))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Olivier Mauras

This version is a release candidate. We have tested it and believe it to
be free of any critical bugs. The use on production systems is not
encouraged at this time and is at your own risk. However, we do
encourage testing, and welcome all and any feedback\!

