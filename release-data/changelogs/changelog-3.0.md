# Change logs for Rudder 3.0.\* versions

Rudder 3.0 is currently the **old-latest** version of Rudder. This
version is codenamed "Galleon". End of life has been scheduled for 10th
June 2016.

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Main new features in Rudder 3.0:**

  - Global redesign of Rudder web interface (menu, directive/group page
    organization)
  - More precise Rule reporting ( progress bar with different states, a
    'per Node' view ...)
  - Add a dashboard on Home page
  - Add a command line interface for Rudder-agent
  - Add RHEL/ Centos 7 Support
  - Support for systemd services system
  - Add a 'changes-only' compliance mode, with lower bandwidth usage
  - Aggent run interval can be defined by nodes, overriding global param
  - Add a Relay server package
  - Possibility to add custom attributes to Nodes
  - Environment variables can used as parameters in Directives and
    Techniques
  - ncf Technique will now be added automatically
  - Add possibility to deprecated Techniques
  - Accept or not to send anonymous metrics to help Rudder development

**Installing, upgrading and testing**

Documentation:

  - Install:
    https://www.rudder-project.org/doc-3.0/_install_rudder_server.html
  - Upgrade:
    https://www.rudder-project.org/doc-3.0/_upgrade_rudder.html

The Download Links are available here:
https://www.rudder-project.org/site/get-rudder/downloads/.

We also recommend using the [Rudder
Vagrant](https://github.com/Normation/rudder-vagrant) config if you want
a quick and easy way to get an installation for testing.

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server: **Debian 7, Debian 8, RHEL/CentOS 6, RHEL/CentOS 7,
    SLES 11, Ubuntu 12.04, Ubuntu 14.04**
  - Rudder agent: all of the above plus **Debian 5, Debian 6,
    RHEL/CentOS 3, RHEL/CentOS 5, Fedora 18, SLES 10, Ubuntu 10.04,
    Ubuntu 12.10**
  - Rudder agent (non-free):  **Windows Server 2008-2012** ,  **AIX
    5-6-7**

## Rudder 3.0.17 (2016-06-08)

### Changes

#### Documentation

  - Add tests for doc syntax
    ([\#8443](http://www.rudder-project.org/redmine/issues/8443))

### Bug fixes

#### Web - Compliance & node report

  - Fixed: Parallel traversal of new promises directories causes some
    nodes promises to not be updated
    ([\#8427](http://www.rudder-project.org/redmine/issues/8427))
  - Fixed: Not possible to switch details for time period on rule recent
    changes on Chromium
    ([\#8408](http://www.rudder-project.org/redmine/issues/8408))

#### Web - Nodes & inventories

  - Fixed: Change in group may be overwritten by dynamic group update
    ([\#8453](http://www.rudder-project.org/redmine/issues/8453))

#### Web - Config management

  - Fixed: Many WARN messages after upgrade about JSON deserialisation
    error ([\#8288](http://www.rudder-project.org/redmine/issues/8288))

#### Techniques

  - Fixed: Invalidation of previous package state and of package status
    cache does not work on rpmPackageInstallation 5.0 5.1 6.0 6.1 7.0
    ([\#8421](http://www.rudder-project.org/redmine/issues/8421))
  - Fixed: rpmPackageInstallation 7.0 uses the wrong version number for
    it's data file
    ([\#8419](http://www.rudder-project.org/redmine/issues/8419))
  - Fixed: Missing reports in file and zypper techniques due to a syntax
    error in reporting
    ([\#8403](http://www.rudder-project.org/redmine/issues/8403))

#### Initial promises & sys tech

  - Fixed: On Centos6.6, rsyslog is always restarted
    ([\#8451](http://www.rudder-project.org/redmine/issues/8451))
  - Fixed: failsafe sometimes produce rudder reports
    ([\#8422](http://www.rudder-project.org/redmine/issues/8422))
  - Fixed: Reference to \&TRACKINGKEY& in initial promises
    ([\#8415](http://www.rudder-project.org/redmine/issues/8415))
  - Fixed: Remove unused variable in cf-serverd
    ([\#8392](http://www.rudder-project.org/redmine/issues/8392))
  - Fixed: The component "Check Technique library reloading file" is
    sometime a log and sometime a result
    ([\#8380](http://www.rudder-project.org/redmine/issues/8380))
  - Fixed: Launching twice in a row a disabled agent make the agent runs
    ([\#7100](http://www.rudder-project.org/redmine/issues/7100))
  - Fixed: The uuid in the promises and the uuid in
    /opt/rudder/etc/uuid.hive may be out of sync, and chaos and sadness
    follows
    ([\#7091](http://www.rudder-project.org/redmine/issues/7091))

#### Documentation

  - Fixed: Unclear message in the upgrade doc
    ([\#8440](http://www.rudder-project.org/redmine/issues/8440))
  - Fixed: The SLES upgrade section has a broken title syntax
    ([\#8439](http://www.rudder-project.org/redmine/issues/8439))

#### Packaging

  - Fixed: stty does not handle no-tty input
    ([\#8426](http://www.rudder-project.org/redmine/issues/8426))
  - Fixed: When updating a Rudder install,
    changes\_executionTimeStamp\_idx index is not created
    ([\#8423](http://www.rudder-project.org/redmine/issues/8423))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Janos Mattyasovszky
  - Daniel Stan

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. The current "esr"
release is now 3.1.\* and there we advice to upgrade to the latest
3.1.\* version. When we release a new version of Rudder, it needs to be
thoroughly tested, and we consider the release enterprise-ready for
deployment only after it has been proven to run in production reliably
for several months.

## Rudder 3.0.16 (2016-06-01, Not announced)

That version was not announced due to several bugs:
[\#8423](http://www.rudder-project.org/redmine/issues/8423),
[\#8427](http://www.rudder-project.org/redmine/issues/8427),
[\#8430](http://www.rudder-project.org/redmine/issues/8430)

### Changes

#### Web - Nodes & inventories

  - Make page node details/search node less confusing
    ([\#7642](http://www.rudder-project.org/redmine/issues/7642))

#### Web - UI & UX

  - Augment default number of lines displayed in tables and add more
    options
    ([\#8107](http://www.rudder-project.org/redmine/issues/8107))

#### Documentation

  - Create an installation section in the documentation
    ([\#8233](http://www.rudder-project.org/redmine/issues/8233))
  - Homogenize OS names in the doc
    ([\#8224](http://www.rudder-project.org/redmine/issues/8224))
  - How to: Ensure a line is present in a file (and only one time\!)
    ([\#8169](http://www.rudder-project.org/redmine/issues/8169))
  - Integrate ncf generic methods reference into the doc
    ([\#7844](http://www.rudder-project.org/redmine/issues/7844))
  - Add "Troubleshooting" section
    ([\#7711](http://www.rudder-project.org/redmine/issues/7711))
  - Move man pages into the reference section
    ([\#8332](http://www.rudder-project.org/redmine/issues/8332))
  - Move Relay doc to the install section
    ([\#7889](http://www.rudder-project.org/redmine/issues/7889))

### Bug fixes

#### Web - UI & UX

  - Fixed: Typo in directive migration message "an other"
    ([\#8289](http://www.rudder-project.org/redmine/issues/8289))
  - Fixed: Broken links in the "Support Desk" box of the home page
    ([\#8110](http://www.rudder-project.org/redmine/issues/8110))
  - Fixed: Some messages in the Settings page end with a comma
    ([\#8044](http://www.rudder-project.org/redmine/issues/8044))
  - Fixed: Show seconds in Execution date at Technical Logs of Node
    Details
    ([\#7981](http://www.rudder-project.org/redmine/issues/7981))
  - Fixed: Prevent red color usage in inventory graphs
    ([\#8262](http://www.rudder-project.org/redmine/issues/8262))
  - Fixed: Change audit message is not checked in the "Clone Directive"
    popup ([\#8213](http://www.rudder-project.org/redmine/issues/8213))
  - Fixed: Priority field in Directive form does not show it has a
    tooltip and has wrong description
    ([\#8201](http://www.rudder-project.org/redmine/issues/8201))
  - Fixed: Fix display issues on IE11
    ([\#8136](http://www.rudder-project.org/redmine/issues/8136))
  - Fixed: Add a left margin to the Rudder search box
    ([\#7825](http://www.rudder-project.org/redmine/issues/7825))

#### Web - Compliance & node report

  - Fixed: "All the last execution reports for this server are ok"
    displayed when no report received
    ([\#8400](http://www.rudder-project.org/redmine/issues/8400))
  - Fixed: Misleading message on node compliance detail when run's
    configID is unknown
    ([\#8399](http://www.rudder-project.org/redmine/issues/8399))
  - Fixed: "repaired" are counted as "required attention" on node
    compliance details
    ([\#8396](http://www.rudder-project.org/redmine/issues/8396))
  - Fixed: Compliance is not correctly computed if we receive run agent
    right after generation
    ([\#8051](http://www.rudder-project.org/redmine/issues/8051))
  - Fixed: OOM in Rudder when there are too many repaired reports
    ([\#7735](http://www.rudder-project.org/redmine/issues/7735))

#### Web - Config management

  - Fixed: Node configuration cache is invalidated too often
    ([\#8246](http://www.rudder-project.org/redmine/issues/8246))
  - Fixed: Directive detail don't show the OS compatibility version
    ([\#7042](http://www.rudder-project.org/redmine/issues/7042))

#### API

  - Fixed: Better document Node Api: include detail always returns
    "default"
    ([\#8192](http://www.rudder-project.org/redmine/issues/8192))

#### Agent

  - Fixed: rudder agent update doesn't always update policy
    ([\#8346](http://www.rudder-project.org/redmine/issues/8346))
  - Fixed: "rudder agent enable -s" doesn't return an error code if it
    can't start the agent
    ([\#8317](http://www.rudder-project.org/redmine/issues/8317))

#### Techniques

  - Fixed: permissions technique tries to set a group even when we do
    not ask for it
    ([\#8198](http://www.rudder-project.org/redmine/issues/8198))
  - Fixed: It is not possible to use quotes in generic variable
    definition values
    ([\#8188](http://www.rudder-project.org/redmine/issues/8188))
  - Fixed: Clear package caches when repairing a package repository
    ([\#8121](http://www.rudder-project.org/redmine/issues/8121))
  - Fixed: The start at boot does not work in the openssh technique on
    systemd OSes
    ([\#8108](http://www.rudder-project.org/redmine/issues/8108))
  - Fixed: Double reporting for group creation
    ([\#8100](http://www.rudder-project.org/redmine/issues/8100))
  - Fixed: Avoid waiting on lock when calling yum
    ([\#6487](http://www.rudder-project.org/redmine/issues/6487))
  - Fixed: applications/aptPackageManagerSettings/3.1 missing from list
    of maintained techniques
    ([\#8395](http://www.rudder-project.org/redmine/issues/8395))
  - Fixed: Document usage of line replacement in Enforce a file content
    technique
    ([\#8162](http://www.rudder-project.org/redmine/issues/8162))

#### System integration

  - Fixed: Rudder jetty init script broken on CentOS 7
    ([\#8369](http://www.rudder-project.org/redmine/issues/8369))
  - Fixed: rudder-slapd may break on upgrade when restarting on openVZ
    ([\#8210](http://www.rudder-project.org/redmine/issues/8210))
  - Fixed: check-rudder-agent complains about not existing
    policy-server.dat backup file
    ([\#8202](http://www.rudder-project.org/redmine/issues/8202))
  - Fixed: ACL Posix on Git repos
    ([\#8065](http://www.rudder-project.org/redmine/issues/8065))
  - Fixed: Disable ldap logging on non existing indexes
    ([\#7667](http://www.rudder-project.org/redmine/issues/7667))
  - Fixed: Messages can be dropped on the node, resulting in Unknown
    reports on the Web Interface
    ([\#6421](http://www.rudder-project.org/redmine/issues/6421))
  - Fixed: promises can become invalid if copies fail rendering the
    agent unusable
    ([\#5650](http://www.rudder-project.org/redmine/issues/5650))
  - Fixed: rudder-jetty initialisation should not support Java 6
    ([\#7348](http://www.rudder-project.org/redmine/issues/7348))

#### Server components

  - Fixed: Apache config does not get cleaned up after removal of
    rudder-webapp
    ([\#8232](http://www.rudder-project.org/redmine/issues/8232))
  - Fixed: rudder-apache gets added multiple times to apache config
    ([\#8231](http://www.rudder-project.org/redmine/issues/8231))

#### Packaging

  - Fixed: Spurious message "grep: /etc/sysconfig/apache2: No such file
    or directory" in RPM install for rudder-webapp
    ([\#8371](http://www.rudder-project.org/redmine/issues/8371))
  - Fixed: ncf package asks about replacing dist config file during
    upgrade
    ([\#8286](http://www.rudder-project.org/redmine/issues/8286))
  - Fixed: When we install rudder-agent after having removing it, the
    uuid is not restored on RPM-based systems
    ([\#6468](http://www.rudder-project.org/redmine/issues/6468))
  - Fixed: Makefile missing in rudder-server-relay package
    ([\#8370](http://www.rudder-project.org/redmine/issues/8370))

#### Initial promises & sys tech

  - Fixed: Can't stat file '/opt/rudder/bin/cf-hub' on 'localhost' in
    files.copy\_from promise
    ([\#8397](http://www.rudder-project.org/redmine/issues/8397))
  - Fixed: check-techniques script doesn't properly exit non-zero on
    errors
    ([\#8386](http://www.rudder-project.org/redmine/issues/8386))
  - Fixed: Error in cf-serverd for allowing remote access to cf-agent
    binary
    ([\#8374](http://www.rudder-project.org/redmine/issues/8374))
  - Fixed: logrotate promise for CFEngine Enterprise agents
    ([\#8340](http://www.rudder-project.org/redmine/issues/8340))
  - Fixed: Invalid path for rudder\_ncf in Windows
    ([\#8338](http://www.rudder-project.org/redmine/issues/8338))
  - Fixed: Duplicate lines in body classes success in update.cf in
    initial promises
    ([\#8309](http://www.rudder-project.org/redmine/issues/8309))
  - Fixed: Use variables for path to cf-agent in system Techniques to
    work on Windows
    ([\#8307](http://www.rudder-project.org/redmine/issues/8307))
  - Fixed: Disable Repeated message reduction or reports may be lost on
    the relay
    ([\#8264](http://www.rudder-project.org/redmine/issues/8264))
  - Fixed: Error message about setgid on ncf.conf
    ([\#8181](http://www.rudder-project.org/redmine/issues/8181))
  - Fixed: Missing reporting in "check postgresql process" on rudder-db
    role ([\#8178](http://www.rudder-project.org/redmine/issues/8178))
  - Fixed: Crontab promise with the Windows agent
    ([\#8161](http://www.rudder-project.org/redmine/issues/8161))
  - Fixed: Rudder agent connect at each runs to its policy server to get
    its server uuid
    ([\#7638](http://www.rudder-project.org/redmine/issues/7638))
  - Fixed: Extra carriage return in policy\_server.dat inventory failure
    ([\#7328](http://www.rudder-project.org/redmine/issues/7328))
  - Fixed: In case of error in logrotate check, there is no report
    ([\#8382](http://www.rudder-project.org/redmine/issues/8382))
  - Fixed: Error on windows: agent tries to check if /usr/bin/env
    supports the -0 option
    ([\#8336](http://www.rudder-project.org/redmine/issues/8336))
  - Fixed: Using Rudder server 3.x + rudder agent 2.11.x, a node doesn't
    properly detect its change of relay server
    ([\#8045](http://www.rudder-project.org/redmine/issues/8045))

#### Architecture - Internal libs

  - Fixed: Examples in ldap-inventory are not real life examples
    ([\#8236](http://www.rudder-project.org/redmine/issues/8236))

#### Documentation

  - Fixed: Documentation wrongly states default report TTL is 30 days
    ([\#8297](http://www.rudder-project.org/redmine/issues/8297))
  - Fixed: Documentation no longer clearly tells user to upgrade
    Techniques
    ([\#8294](http://www.rudder-project.org/redmine/issues/8294))
  - Fixed: Invalid documentation on how to use rudder global parameters
    in Technique editor
    ([\#8278](http://www.rudder-project.org/redmine/issues/8278))
  - Fixed: Make clearer what the goal of Scala-ldap is in readme
    ([\#8275](http://www.rudder-project.org/redmine/issues/8275))
  - Fixed: rudder doc can be misleading on the repo to use for
    Centos/RHEL
    ([\#7976](http://www.rudder-project.org/redmine/issues/7976))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alexandre Anriot
  - Jean Cardona
  - Janos Mattyasovszky
  - David Svejda

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. The current "esr"
release is now 3.1.\* and there we advice to upgrade to the latest
3.1.\* version. When we release a new version of Rudder, it needs to be
thoroughly tested, and we consider the release enterprise-ready for
deployment only after it has been proven to run in production reliably
for several months.

## Rudder 3.0.15 (2016-04-18)

### Changes

#### Web - Nodes & inventories

  - Exit sending inventory to rudder-webapp if the queue is full
    ([\#7291](http://www.rudder-project.org/redmine/issues/7291))

### Bug fixes

#### Web - UI & UX

  - Fixed: API account table broken when empty
    ([\#8144](http://www.rudder-project.org/redmine/issues/8144))
  - Fixed: Double arrow in Pending Nodes list
    ([\#8078](http://www.rudder-project.org/redmine/issues/8078))

#### Web - Maintenance

  - Fixed: web interface login: able to log in with valid ldap account
    but no matching rudder-users.xml entry
    ([\#8085](http://www.rudder-project.org/redmine/issues/8085))

#### Techniques

  - Fixed: Missing reporting in UserManagement 6.0 when creating a user
    ([\#8079](http://www.rudder-project.org/redmine/issues/8079))

#### Performance and scalability

  - Fixed: Java OOM during Java's log migration
    ([\#7524](http://www.rudder-project.org/redmine/issues/7524))

#### Windows agent

  - Fixed: On Windows, a file c:\\Program is created
    ([\#8149](http://www.rudder-project.org/redmine/issues/8149))
  - Fixed: Environement variable fail to load on windows
    ([\#8146](http://www.rudder-project.org/redmine/issues/8146))

#### Packaging

  - Fixed: Error in rudder-server-relay post install script on debian
    ([\#8117](http://www.rudder-project.org/redmine/issues/8117))

#### Server components

  - Fixed: node-to-relay fails to reload policy when proxy is set
    ([\#8054](http://www.rudder-project.org/redmine/issues/8054))
  - Fixed: Compress ldif backups
    ([\#6714](http://www.rudder-project.org/redmine/issues/6714))\]\[\#7900\]\])

#### Initial promises & sys tech

  - Fixed: Do not backup modified promise files and encrypt ncf/local
    transfer
    ([\#8159](http://www.rudder-project.org/redmine/issues/8159))

#### Architecture - Internal libs

  - Fixed: java.util.regex.PatternSyntaxException: Unexpected internal
    error near index 1 on windows
    ([\#7935](http://www.rudder-project.org/redmine/issues/7935))

#### Architecture - Refactoring

  - Remove trailing space in code file that make merge conflicts
    ([\#8126](http://www.rudder-project.org/redmine/issues/8126))
  - Fixed: Typo in tests
    ([\#8116](http://www.rudder-project.org/redmine/issues/8116))
  - Fixed: Bad logs for event log migration since \#8085
    ([\#8124](http://www.rudder-project.org/redmine/issues/8124))

#### Documentation

  - Fixed: API documentation for compliance needs JSON prettified
    ([\#7900](http://www.rudder-project.org/redmine/issues/7900))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Florian Heigl
  - Janos Mattyasovszky

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. The current "esr"
release is now 3.1.\* and there we advice to upgrade to the latest
3.1.\* version. When we release a new version of Rudder, it needs to be
thoroughly tested, and we consider the release enterprise-ready for
deployment only after it has been proven to run in production reliably
for several months.

## Rudder 3.0.14 (2016-03-24)

### Changes

#### Packaging

  - Put a makefile inside each directory of rudder-packages
    ([\#7718](http://www.rudder-project.org/redmine/issues/7718))

#### Web - Nodes & inventories

  - The Motherboard UUID doesn't appear on the inventory on a Node
    ([\#3749](http://www.rudder-project.org/redmine/issues/3749))

#### Documentation

  - Mark 3.1 as ESR in the doc header
    ([\#8059](http://www.rudder-project.org/redmine/issues/8059))
  - Import doc from foswiki about parametrized variable in the doc
    ([\#7836](http://www.rudder-project.org/redmine/issues/7836))
  - Reorganize the introduction
    ([\#7818](http://www.rudder-project.org/redmine/issues/7818))

#### Techniques

  - Add an option for MOTD Technique to display MOTD before login
    ([\#7983](http://www.rudder-project.org/redmine/issues/7983))
  - New Technique to import a GPG Key into RPM
    ([\#6756](http://www.rudder-project.org/redmine/issues/6756))

### Bug fixes

#### API

  - Fixed: Changing Directive version via API does not set default
    values, and return wrong parameters
    ([\#7979](http://www.rudder-project.org/redmine/issues/7979))

#### Web - UI & UX

  - Fixed: Typo in webapp message when policy generation failed
    ([\#8094](http://www.rudder-project.org/redmine/issues/8094))
  - Fixed: Tooltip on Rule categories may display after selecting Rule
    ([\#8086](http://www.rudder-project.org/redmine/issues/8086))
  - Fixed: Typo in webapp warn message "sendind"
    ([\#7990](http://www.rudder-project.org/redmine/issues/7990))
  - Fixed: Legend for node breakdown is not readable
    ([\#7969](http://www.rudder-project.org/redmine/issues/7969))
  - Fixed: Sorting is broken in tables after sorting by compliance
    ([\#7653](http://www.rudder-project.org/redmine/issues/7653))

#### Web - Nodes & inventories

  - Fixed: Missing error message in node acceptation when there is a
    problem with getting authorized networks
    ([\#8016](http://www.rudder-project.org/redmine/issues/8016))
  - Fixed: Debian Jessie, on VMWare, are wrongly considered as
    "Physical" machine
    ([\#7204](http://www.rudder-project.org/redmine/issues/7204))
  - Fixed: Rudder doesn't store and display the IPV6 of the nodes
    ([\#7136](http://www.rudder-project.org/redmine/issues/7136))
  - Fixed: Order of button on "accept nodes in rudder" is the exact
    opposite of the rest of the webapp
    ([\#6722](http://www.rudder-project.org/redmine/issues/6722))
  - Fixed: Allow to make a group with only 32bits or 64bits nodes
    ([\#2543](http://www.rudder-project.org/redmine/issues/2543))

#### Documentation

  - Fixed: Broken link in the manual
    ([\#7817](http://www.rudder-project.org/redmine/issues/7817))
  - Fixed: Document that when we reduce the run interval of nodes, "no
    data" may be wrongly reported
    ([\#6231](http://www.rudder-project.org/redmine/issues/6231))

#### Packaging

  - Fixed: rudder-upgrade takes too long
    ([\#7987](http://www.rudder-project.org/redmine/issues/7987))
  - Fixed: Backup and restore policy\_server.dat like we do with
    uuid.hive file
    ([\#7901](http://www.rudder-project.org/redmine/issues/7901))
  - Fixed: Rudder agent tries sending an inventory during update
    ([\#7881](http://www.rudder-project.org/redmine/issues/7881))
  - Fixed: rudder-upgrade does not make some check on remote sql in case
    of distributed setup
    ([\#7849](http://www.rudder-project.org/redmine/issues/7849))
  - Fixed: Rudder init script kill all agent on Open VZ (or similar
    system)
    ([\#4499](http://www.rudder-project.org/redmine/issues/4499))
  - Fixed: Default vhost is not disabled on rudder-relay
    ([\#7846](http://www.rudder-project.org/redmine/issues/7846))

#### Initial promises & sys tech

  - Fixed: gzip can stop rudder agent when compressing log files
    ([\#7985](http://www.rudder-project.org/redmine/issues/7985))
  - Fixed: System technique cannot compress inventories
    ([\#7930](http://www.rudder-project.org/redmine/issues/7930))
  - Fixed: Unexpected reports on "Check jetty process" component of
    system techniques
    ([\#7821](http://www.rudder-project.org/redmine/issues/7821))
  - Fixed: Rudder inventory don't produce error report
    ([\#7785](http://www.rudder-project.org/redmine/issues/7785))
  - Fixed: date of report may be invalid on windows
    ([\#7741](http://www.rudder-project.org/redmine/issues/7741))
  - Fixed: Reporting in server-components missing when restarting some
    services (ie jetty)
    ([\#7813](http://www.rudder-project.org/redmine/issues/7813))

#### System integration

  - Fixed: rudder-init broken on SLES
    ([\#7991](http://www.rudder-project.org/redmine/issues/7991))
  - Fixed: Missing usefull logger in logger file
    ([\#7910](http://www.rudder-project.org/redmine/issues/7910))
  - Fixed: Errors with apache on ubuntu 12.04
    ([\#6763](http://www.rudder-project.org/redmine/issues/6763))

#### Server components

  - Fixed: Rudder password are not properly protected
    ([\#8096](http://www.rudder-project.org/redmine/issues/8096))
  - Fixed: Allow disable of git-autocommit of system policy on Update
    ([\#7222](http://www.rudder-project.org/redmine/issues/7222))
  - Fixed: Node not included in dynamic group due to openldap bug with
    modrdn not showing node children
    ([\#6780](http://www.rudder-project.org/redmine/issues/6780))

#### Techniques

  - Fixed: When we manage twice a same package in rpm package
    management, we don't get the second report
    ([\#8034](http://www.rudder-project.org/redmine/issues/8034))
  - Fixed: Incomplete reporting in service management
    ([\#8032](http://www.rudder-project.org/redmine/issues/8032))
  - Fixed: Script check-techniques.sh fails on first error
    ([\#8012](http://www.rudder-project.org/redmine/issues/8012))
  - Fixed: The script check-techniques.sh checks old techniques when the
    parent directory contains a version number
    ([\#8010](http://www.rudder-project.org/redmine/issues/8010))
  - Fixed: Fix invalid metadata.xml statement in clockSettings 3.1
    ([\#8009](http://www.rudder-project.org/redmine/issues/8009))
  - Fixed: Wrong reporting in servicesManagement 3.0
    ([\#7975](http://www.rudder-project.org/redmine/issues/7975))
  - Fixed: "Download a file from shared folder" technique doesn't have
    an explicit default value for "Compare method" (was mtime, now
    digest)
    ([\#7962](http://www.rudder-project.org/redmine/issues/7962))
  - Fixed: Missing Timezones from clockConfiguration
    ([\#7489](http://www.rudder-project.org/redmine/issues/7489))
  - Fixed: Missing "don't change" password hash type in userManagement
    ([\#6493](http://www.rudder-project.org/redmine/issues/6493))
  - Fixed: Support for more Debian / Ubuntu repository components
    ([\#8073](http://www.rudder-project.org/redmine/issues/8073))
  - Fixed: Technique jobScheduler v2.0 doesn't schedule
    ([\#8068](http://www.rudder-project.org/redmine/issues/8068))

#### Performance and scalability

  - Fixed: Queries on expected reports are really slow with more than
    2000 nodes
    ([\#8057](http://www.rudder-project.org/redmine/issues/8057))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alexandre Anriot
  - Dennis Cabooter
  - Janos Mattyasovszky

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. The current "esr"
release is now 3.1.\* and there we advice to upgrade to the latest
3.1.\* version. When we release a new version of Rudder, it needs to be
thoroughly tested, and we consider the release enterprise-ready for
deployment only after it has been proven to run in production reliably
for several months.

## Rudder 3.0.13 (2016-01-21)

### Changes

#### Web - UI & UX

  - Add last promise generation date in generation policy menu entry
    ([\#7661](http://www.rudder-project.org/redmine/issues/7661))
  - Clicking on recent changes graph should show detail graph in rule
    details
    ([\#7640](http://www.rudder-project.org/redmine/issues/7640))
  - Add an option to disable display changes graphes if they are slow
    ([\#7618](http://www.rudder-project.org/redmine/issues/7618))

#### Agent

  - rudder-agent should trigger a new inventory after upgrade
    ([\#7620](http://www.rudder-project.org/redmine/issues/7620))

#### Techniques

  - Add test for rudder-techniques to ensure removed deprecated
    techniques don't come back in an erroneous merge
    ([\#7504](http://www.rudder-project.org/redmine/issues/7504))

#### Documentation

  - Document the zypper segfault when installing Rudder packages locally
    ([\#7652](http://www.rudder-project.org/redmine/issues/7652))
  - Document AIX support in Rudder manual
    ([\#7650](http://www.rudder-project.org/redmine/issues/7650))
  - Document nofiles dependency for syslog/tcp on master and relays
    ([\#7220](http://www.rudder-project.org/redmine/issues/7220))

#### Architecture - Refactoring

  - Remove deprecated package rudder-policy-templates
    ([\#7723](http://www.rudder-project.org/redmine/issues/7723))
  - Make NodeInfo more dependant on Node
    ([\#7634](http://www.rudder-project.org/redmine/issues/7634))
  - Change AGPL to GPL in rudder-plugin-external-node-information
    ([\#7576](http://www.rudder-project.org/redmine/issues/7576))

### Bug fixes

#### Web - Config management

  - Fixed: Promise generation never finishes if jetty is restarted
    mid-generation
    ([\#7814](http://www.rudder-project.org/redmine/issues/7814))
  - Fixed: Too long directive name breaks directive serialization
    ([\#7766](http://www.rudder-project.org/redmine/issues/7766))
  - Fixed: Error on promise generation after accepting a node
    ([\#7689](http://www.rudder-project.org/redmine/issues/7689))

#### Web - UI & UX

  - Fixed: Filter keeps applied between Rules Tables within Directives
    page ([\#7754](http://www.rudder-project.org/redmine/issues/7754))
  - Fixed: Typo in AGENT RUN SCHEDULE description
    ([\#7749](http://www.rudder-project.org/redmine/issues/7749))
  - Fixed: Blue colour in "Nodes by overall compliance" chart is
    confusingly the same as "No report" blue
    ([\#7757](http://www.rudder-project.org/redmine/issues/7757))
  - Fixed: The directive tree filter should not be reset when we click
    on a directive
    ([\#7656](http://www.rudder-project.org/redmine/issues/7656))
  - Fixed: Remove one pixel 'border' in Rudder menu
    ([\#7641](http://www.rudder-project.org/redmine/issues/7641))
  - Fixed: No auto scroll since rudder 3.0
    ([\#7617](http://www.rudder-project.org/redmine/issues/7617))
  - Fixed: Open external links of the webapp in another tab
    ([\#6628](http://www.rudder-project.org/redmine/issues/6628))

#### Web - Compliance & node report

  - Fixed: When several directives value have a CFEngine var, we get
    "unexpected" due to bad regex matching
    ([\#7758](http://www.rudder-project.org/redmine/issues/7758))
  - Fixed: Compliance take into account expired run
    ([\#7743](http://www.rudder-project.org/redmine/issues/7743))
  - Fixed: Not accepted node reports trigger compliance processing
    ([\#7625](http://www.rudder-project.org/redmine/issues/7625))

#### Web - Nodes & inventories

  - Fixed: Only one system group is displayed in node details
    ([\#7061](http://www.rudder-project.org/redmine/issues/7061))

#### Web - Maintenance

  - Fixed: Jetty cache files in /tmp directory are removed by the OS
    tmpwatch cron job, preventing access to the application
    ([\#4473](http://www.rudder-project.org/redmine/issues/4473))

#### Agent

  - Fixed: rudder-agent does not stop on network error during file copy,
    which can lead to file deletions when purging is enabled
    ([\#7629](http://www.rudder-project.org/redmine/issues/7629))
  - Fixed: rudder CLI commands should print their expected options with
    -h / --help
    ([\#7742](http://www.rudder-project.org/redmine/issues/7742))
  - Fixed: Add a "quiet" option to rudder agent run to only display
    errors
    ([\#7608](http://www.rudder-project.org/redmine/issues/7608))

#### Techniques

  - Fixed: Invalid reporting on windows for clockconfiguration if
    Hardware Clock is not set
    ([\#7739](http://www.rudder-project.org/redmine/issues/7739))
  - Fixed: Technique copyGitFile can send success AND error reports on
    post-hook execution and lead to unexpected reports
    ([\#7624](http://www.rudder-project.org/redmine/issues/7624))
  - Fixed: Unexpected reports using "rpmPackageInstallation" technique
    ([\#7623](http://www.rudder-project.org/redmine/issues/7623))
  - Fixed: Technique "Name resolution": Regexp to check value of
    Nameserver does not allow the use of variable
    ([\#3741](http://www.rudder-project.org/redmine/issues/3741))
  - Fixed: Package management for RHEL / CentOS / SuSE / RPM systems:
    The number of reports about ZMD is uncorrect
    ([\#3478](http://www.rudder-project.org/redmine/issues/3478))
  - Fixed: syslog-ng's loghost regex does not match with set line
    ([\#7635](http://www.rudder-project.org/redmine/issues/7635))
  - Fixed: The "Ignore file or directory if it does not exist" parameter
    in filesPermission is ignored
    ([\#7607](http://www.rudder-project.org/redmine/issues/7607))

#### Documentation

  - Fixed: Fix use links containing emphasized keywords in manual
    ([\#7812](http://www.rudder-project.org/redmine/issues/7812))
  - Fixed: The size of one image is not correctly recognized in the doc
    ([\#7713](http://www.rudder-project.org/redmine/issues/7713))
  - Fixed: Some titles broken in the documentation
    ([\#7551](http://www.rudder-project.org/redmine/issues/7551))
  - Fixed: Wrong anchors in Rudder API doc
    ([\#6694](http://www.rudder-project.org/redmine/issues/6694))
  - Fixed: Document the use of port 5310 for rudder server debug
    ([\#7712](http://www.rudder-project.org/redmine/issues/7712))
  - Fixed: Update documentation to use rudder-server-relay package
    instead of manual configuration
    ([\#7266](http://www.rudder-project.org/redmine/issues/7266))

#### System integration

  - Fixed: Firefox stalls after TLS handshake on self signed certificate
    with a missing contact email
    ([\#7800](http://www.rudder-project.org/redmine/issues/7800))

#### Packaging

  - Fixed: Test for non-applying patches on rudder-jetty and
    rudder-agent-thin is broken
    ([\#7803](http://www.rudder-project.org/redmine/issues/7803))
  - Fixed: Backport fixes for openldap memory leak in our package
    ([\#7801](http://www.rudder-project.org/redmine/issues/7801))
  - Fixed: rudder-upgrade edits the wrong ncf.conf file causing
    transitory invalid promises during upgrades
    ([\#7794](http://www.rudder-project.org/redmine/issues/7794))
  - Fixed: rudder-init overwrite its logs
    ([\#7776](http://www.rudder-project.org/redmine/issues/7776))
  - Fixed: rudder-server-relay rpm package should require rudder-agent
    ([\#7593](http://www.rudder-project.org/redmine/issues/7593))

#### Initial promises & sys tech

  - Fixed: initial promises don't create
    /var/rudder/configuration-repository/ncf/ncf.conf
    ([\#7810](http://www.rudder-project.org/redmine/issues/7810))
  - Fixed: inventory sent file timestamp not updated in normal run
    (system techniques)
    ([\#7782](http://www.rudder-project.org/redmine/issues/7782))
  - Fixed: Fix permissions of the rudder tools in the repo
    ([\#7697](http://www.rudder-project.org/redmine/issues/7697))
  - Fixed: check-rsyslog-version is missing on the nodes
    ([\#7680](http://www.rudder-project.org/redmine/issues/7680))
  - Fixed: Non quiet curl calls on root and relay servers
    ([\#7678](http://www.rudder-project.org/redmine/issues/7678))
  - Fixed: Permissions of rudder tools are not preserved on relays
    ([\#7644](http://www.rudder-project.org/redmine/issues/7644))
  - Fixed: Unexpected reports on "Log system for reports" component of
    system techniques
    ([\#7619](http://www.rudder-project.org/redmine/issues/7619))
  - Fixed: Rudder agent simulates an aptitude full-upgrade during each
    run ([\#7141](http://www.rudder-project.org/redmine/issues/7141))
  - Fixed: Error in environment-variables.cf on Centos 5
    ([\#7761](http://www.rudder-project.org/redmine/issues/7761))

#### Architecture - Refactoring

  - Fixed: Change AGPL to GPL in rudder-plugin-itop
    ([\#7577](http://www.rudder-project.org/redmine/issues/7577))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Florian Heigl
  - Janos Mattyasovszky
  - Alex Tkachenko

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "esr" release is still 2.11.\*. When we release a new version of
Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.0.12 (2015-12-10)

### Changes

#### Packaging

  - Update OpenSSL version to latest release
    ([\#7368](http://www.rudder-project.org/redmine/issues/7368))

### Bug fixes

#### API

  - Fixed: API Parameters create "overridable" boolean check doesn't
    work ([\#6695](http://www.rudder-project.org/redmine/issues/6695))

#### Web - Config management

  - Fixed: Read technique access does not give access to techniques
    ([\#7514](http://www.rudder-project.org/redmine/issues/7514))
  - Fixed: Promises are not regenerated during upgrade
    ([\#7557](http://www.rudder-project.org/redmine/issues/7557))
  - Fixed: Make possible to delete ANY active technique
    ([\#7536](http://www.rudder-project.org/redmine/issues/7536))
  - Fixed: duplicate key value error on Rudder
    ([\#7316](http://www.rudder-project.org/redmine/issues/7316))

#### Web - Nodes & inventories

  - Fixed: Tag FULL\_NAME missing from SLES12 inventory
    ([\#7559](http://www.rudder-project.org/redmine/issues/7559))
  - Fixed: Inventory \ content differs from hostname --fqdn and
    may lead to unauthorised nodes
    ([\#7031](http://www.rudder-project.org/redmine/issues/7031))
  - Fixed: Test inventories are out of date since the addition of
    \
    ([\#7325](http://www.rudder-project.org/redmine/issues/7325))
  - Fixed: Accepting two nodes seems to only accept one
    ([\#7024](http://www.rudder-project.org/redmine/issues/7024))

#### Web - UI & UX

  - Fixed: Clone rule window too small
    ([\#7397](http://www.rudder-project.org/redmine/issues/7397))
  - Fixed: Links to Node in event logs still contains an extra rudder
    ([\#7323](http://www.rudder-project.org/redmine/issues/7323))
  - Fixed: Policy server url in node details is broken
    ([\#7462](http://www.rudder-project.org/redmine/issues/7462))
  - Fixed: Compliance detail and compliance summary use different
    colours
    ([\#7416](http://www.rudder-project.org/redmine/issues/7416))
  - Fixed: Dashboard incorrectly says "0 node" (should be nodes, in
    plural)
    ([\#7406](http://www.rudder-project.org/redmine/issues/7406))
  - Fixed: Improve Rule compliance details loading
    ([\#7383](http://www.rudder-project.org/redmine/issues/7383))

#### Server components

  - Fixed: promises are not regenerated when a node is transformed into
    a relay
    ([\#7301](http://www.rudder-project.org/redmine/issues/7301))
  - Fixed: slapd core dumps on 1TB RAM
    ([\#7295](http://www.rudder-project.org/redmine/issues/7295))

#### Agent

  - Fixed: rudder-agent repository on GitHub does not have a license
    ([\#7394](http://www.rudder-project.org/redmine/issues/7394))
  - Fixed: If using proxmox, process management fails due to bad options
    used on vzps
    ([\#7423](http://www.rudder-project.org/redmine/issues/7423))
  - Fixed: check-rudder-agent silently fails if namespaces are not
    supported
    ([\#7335](http://www.rudder-project.org/redmine/issues/7335))
  - Fixed: 'rudder agent reset' doesn't cause ncf and tools to be
    updated
    ([\#7481](http://www.rudder-project.org/redmine/issues/7481))
  - Fixed: Agent processes parts of the environment (multiline bash
    variables)
    ([\#7094](http://www.rudder-project.org/redmine/issues/7094))

#### Performance and scalability

  - Fixed: Major performance hit in promise generation for unused
    inventories fetch
    ([\#7541](http://www.rudder-project.org/redmine/issues/7541))
  - Fixed: Improve graph perf by upgrade javascript libraries
    ([\#7512](http://www.rudder-project.org/redmine/issues/7512))

#### Documentation

  - Fixed: Add a section about ncf-builder and its integration wihin
    Rudder
    ([\#6305](http://www.rudder-project.org/redmine/issues/6305))
  - Fixed: Doc build is broken because of missing Makefile dependencies
    ([\#7339](http://www.rudder-project.org/redmine/issues/7339))

#### Techniques

  - Fixed: Technique "Clock settings" uses Europe/Paris as China's
    timezone (technique version 3.0)
    ([\#7501](http://www.rudder-project.org/redmine/issues/7501))
  - Fixed: OpenSSH server configuration does not reload configurations
    ([\#7479](http://www.rudder-project.org/redmine/issues/7479))
  - Fixed: Create a new version of download file from the shared folder
    that would allow to set the suid and gid to multiple file
    ([\#7379](http://www.rudder-project.org/redmine/issues/7379))

#### Initial promises & sys tech

  - Fixed: Use whole path to binaries in cron from check-rudder-agent on
    AIX ([\#7525](http://www.rudder-project.org/redmine/issues/7525))
  - Fixed: Use of nonexistant class cfengine\_community makes
    failsafe.cf not copy CFEngine binaries to /var/rudder
    ([\#7499](http://www.rudder-project.org/redmine/issues/7499))
  - Fixed: "Update" component of common technique sometimes return
    unexpected status and has incomplete reporting
    ([\#6648](http://www.rudder-project.org/redmine/issues/6648))
  - Fixed: Syslog fails to restart due bad line in syslog-ng.conf
    ([\#7389](http://www.rudder-project.org/redmine/issues/7389))
  - Fixed: Initial promises and techniques set group to "root" rather
    than 0, breaking non-Linux OSes
    ([\#7476](http://www.rudder-project.org/redmine/issues/7476))
  - Fixed: New version of ncf\_conf.cache may not be properly updated on
    nodes after an upgrade
    ([\#7452](http://www.rudder-project.org/redmine/issues/7452))
  - Fixed: internal security check always assume that the node is a
    community one
    ([\#7430](http://www.rudder-project.org/redmine/issues/7430))
  - Fixed: Agent cannot replace file per folder when copying promises,
    and it may lock agent with invalid promises
    ([\#7190](http://www.rudder-project.org/redmine/issues/7190))
  - Fixed: svcadm does not exist - so syslog is never restarted on
    Solaris
    ([\#7464](http://www.rudder-project.org/redmine/issues/7464))
  - Fixed: Unexpected reports on "cron daemon" component of system
    techniques
    ([\#7176](http://www.rudder-project.org/redmine/issues/7176))

#### System integration

  - Fixed: The rudder-agent cron on AIX uses if then, which makes some
    security test fails
    ([\#7508](http://www.rudder-project.org/redmine/issues/7508))
  - Fixed: JVM 8.0: warning about "Ignoring option PermSize=128m;
    support was removed in 8.0"
    ([\#7345](http://www.rudder-project.org/redmine/issues/7345))
  - Fixed: rudder-agent and rudder-slapd init scripts may fail to stop
    services if killall is missing or misbehaving
    ([\#7515](http://www.rudder-project.org/redmine/issues/7515))
  - Fixed: /etc/init.d/rudder-jetty fails to stop jetty if it's PID file
    is missing
    ([\#7469](http://www.rudder-project.org/redmine/issues/7469))
  - Fixed: cf-execd is running twice after a reboot or after running
    rudder-agent twice
    ([\#7420](http://www.rudder-project.org/redmine/issues/7420))
  - Fixed: Initial git commit during package installation is too verbose
    ([\#7419](http://www.rudder-project.org/redmine/issues/7419))
  - Fixed: Rudder OpenLDAP Authentication sans ipv4 localhost
    ([\#4922](http://www.rudder-project.org/redmine/issues/4922))
  - Fixed: Missing debuging information for explain\_compliance
    ([\#7353](http://www.rudder-project.org/redmine/issues/7353))

#### Packaging

  - Fixed: Some patches silently fail to apply
    ([\#7556](http://www.rudder-project.org/redmine/issues/7556))
  - Fixed: Modify the copy of ncf.conf instead of the original
    ([\#7445](http://www.rudder-project.org/redmine/issues/7445))
  - Fixed: After a fresh install on Centos, the Rudder server web
    interface does not work
    ([\#7395](http://www.rudder-project.org/redmine/issues/7395))
  - Fixed: mvn --quiet is too quiet
    ([\#7371](http://www.rudder-project.org/redmine/issues/7371))
  - Fixed: make wget quiet during build
    ([\#7370](http://www.rudder-project.org/redmine/issues/7370))
  - Fixed: Make maven quiet during build
    ([\#7317](http://www.rudder-project.org/redmine/issues/7317))
  - Fixed: rudder-inventory-ldap and rudder-jetty don't stop their
    services on uninstall and rudder-slapd can fail to restart on
    upgrade
    ([\#7516](http://www.rudder-project.org/redmine/issues/7516))
  - Fixed: rudder-upgrade fails when \*re\*installing Rudder
    ([\#7510](http://www.rudder-project.org/redmine/issues/7510))
  - Fixed: Script never terminate when they run rudder-jetty init script
    ([\#7492](http://www.rudder-project.org/redmine/issues/7492))
  - Fixed: The package leave a temporary directory mehind
    ([\#7391](http://www.rudder-project.org/redmine/issues/7391))
  - Fixed: All reports are missing (totally orange) for a node due to
    multiple cf-execd processes
    ([\#7338](http://www.rudder-project.org/redmine/issues/7338))
  - Fixed: Error when installing rudder :
    /opt/rudder/bin/rudder-upgrade: line 573: /opt/rudder/bin/rpmvercmp:
    No such file or directory
    ([\#7470](http://www.rudder-project.org/redmine/issues/7470))

#### Techniques - Tests

  - Fixed: rudder-techniques test script "technique-files" doesn't list
    promises.cf and failsafe.cf in initial-promises
    ([\#7496](http://www.rudder-project.org/redmine/issues/7496))
  - Fixed: rudder-techniques test script "technique-files" lists files
    in .git
    ([\#7495](http://www.rudder-project.org/redmine/issues/7495))

#### Architecture - Refactoring

  - Fixed: Correct a warning in rudder compilation
    ([\#7356](http://www.rudder-project.org/redmine/issues/7356))
  - Fixed: We are using AGPL in place of GPL
    ([\#7546](http://www.rudder-project.org/redmine/issues/7546))
  - Fixed: Inventory query test are not passing anymore in Rudder 3.0
    ([\#7357](http://www.rudder-project.org/redmine/issues/7357))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Layne Breitkreutz
  - Dennis Cabooter
  - Steeve Chailloux
  - David Durieux
  - Fabrice Flore-Thébault
  - Greg fr
  - Florian Heigl
  - Olivier Mauras
  - Janos Mattyasovszky

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "esr" release is still 2.11.\*. When we release a new version of
Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.0.11 (2015-10-27)

### Changes

#### System & initial promises

 \* Touch local file on inventory upload
[\#7206](http://www.rudder-project.org/redmine/issues/7206))

### Bug fixes

#### Web - Config management

  - Fixed: Change request list page, link to Rules are invalids (extra
    rudder)
    ([\#7244](http://www.rudder-project.org/redmine/issues/7244))

#### Web - Nodes & inventories

  - Fixed: Link from node/directive list to node detail is broken on
    Firefox/chrome
    ([\#7286](http://www.rudder-project.org/redmine/issues/7286))

#### Packaging

  - Fixed: Maven never uses internal mirror
    ([\#7300](http://www.rudder-project.org/redmine/issues/7300))
  - Fixed: Temporary files are not cleaned up after build
    ([\#7293](http://www.rudder-project.org/redmine/issues/7293))

#### System integration

  - Fixed: zypper --version outputs on stderr
    ([\#7289](http://www.rudder-project.org/redmine/issues/7289))

#### Performance and scalability

  - Fixed: RuleTargetTest.scala takes \>40s where it should take 2s
    ([\#7303](http://www.rudder-project.org/redmine/issues/7303))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Florian Heigl
  - Janos Mattyasovszky

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "esr" release is still 2.11.\*. When we release a new version of
Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.0.10 (2015-10-20)

#### Web - Nodes & inventories

  - Fixed: No service pack is reported when lsb\_release is installed on
    SLES ([\#7205](http://www.rudder-project.org/redmine/issues/7205))

#### Techniques

  - Fixed: Ssh key distribution cannot distibute several keys on one
    user ([\#7254](http://www.rudder-project.org/redmine/issues/7254))

#### Agent

  - Fixed: Agent should be enabled after reinit
    ([\#7201](http://www.rudder-project.org/redmine/issues/7201))

#### Initial promises & sys tech

  - Fixed: Network list for apache 2.4 is invalidly generated
    ([\#7268](http://www.rudder-project.org/redmine/issues/7268))
  - Fixed: The daily cf-execd and cf-serverd restart should use SRC on
    AIX ([\#7274](http://www.rudder-project.org/redmine/issues/7274))
  - Fixed: System technique's curl should follow redirects
    ([\#7211](http://www.rudder-project.org/redmine/issues/7211))

#### System integration

  - Fixed: check-rudder-agent faisl on an error while checking processes
    ([\#7243](http://www.rudder-project.org/redmine/issues/7243))

#### Packaging

  - Fixed: Rudder agent doesn't build with hardening flags
    ([\#7257](http://www.rudder-project.org/redmine/issues/7257))
  - Fixed: Patch not applied on fusion inventory
    ([\#7241](http://www.rudder-project.org/redmine/issues/7241))

#### Server components

  - Fixed: Root server's apache config does not honor \< 2.4 for webdav
    ([\#7267](http://www.rudder-project.org/redmine/issues/7267))

#### Performance and scalability

  - Fixed: Writing promises should be parallelized
    ([\#7265](http://www.rudder-project.org/redmine/issues/7265))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Florian Heigl
  - Janos Mattyasovszky

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "esr" release is still 2.11.\*. When we release a new version of
Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.0.9 (2015-09-24)

### Changes

#### Techniques

  - Fixed: Add an option to ignore non existent file in the file
    permission technique
    ([\#7228](http://www.rudder-project.org/redmine/issues/7228))

#### Documentation

  - Split the html documentation to improve readability and navigability
    ([\#6604](http://www.rudder-project.org/redmine/issues/6604))
  - Improve rudder server requirements formatting
    ([\#7081](http://www.rudder-project.org/redmine/issues/7081))
  - Improve the readability of the server installation section of the
    manual
    ([\#6603](http://www.rudder-project.org/redmine/issues/6603))
  - Fixed: Document clearly technique upgrades
    ([\#7077](http://www.rudder-project.org/redmine/issues/7077))

### Bug fixes

#### Initial promises & sys tech

  - Fixed: The rudder server tries to send "uuid.hive" as an inventory
    ([\#6987](http://www.rudder-project.org/redmine/issues/6987))
  - Fixed: System technique distributePolicy is not system and has two
    system var section
    ([\#7138](http://www.rudder-project.org/redmine/issues/7138))
  - Fixed: Promise copy is not convergent: if the copy is interupted, it
    will never recover
    ([\#7086](http://www.rudder-project.org/redmine/issues/7086))
  - Fixed: If the agent schedule is not every 5 minutes, inventory may
    not be sent anymore
    ([\#6718](http://www.rudder-project.org/redmine/issues/6718))
  - Fixed: Environnement variables cannot be used on windows
    ([\#7150](http://www.rudder-project.org/redmine/issues/7150))

#### System integration

  - Fixed: Error starting apache on SLES11 relay
    ([\#7097](http://www.rudder-project.org/redmine/issues/7097))

#### Web - Config management

  - Fixed: Rules are not serialized correctly anymore
    ([\#7108](http://www.rudder-project.org/redmine/issues/7108))

#### Web - Compliance & node report

  - Fixed: Agent schedule is not historised, so we can't know what was
    the agent run interval in the past
    ([\#7154](http://www.rudder-project.org/redmine/issues/7154))

#### Web - Technique editor

  - Fixed: Read only role is not correctly interpreted in technique
    editor.
    ([\#7199](http://www.rudder-project.org/redmine/issues/7199))

#### Techniques

  - Fixed: motd technique wrongly reports that it is incompatible with
    windows
    ([\#7153](http://www.rudder-project.org/redmine/issues/7153))

#### Packaging

  - Fixed: issues with process management on physical hosting LXC
    containers
    ([\#7189](http://www.rudder-project.org/redmine/issues/7189))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Libra Linux

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.11.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.0.8 (2015-08-19)

### Bug fixes

#### Web - Config management

  - Fixed: System object (techniques, directives, rules, groups) must be
    always enabled
    ([\#7064](http://www.rudder-project.org/redmine/issues/7064))
  - Fixed: Editing a rule category remove it from Git - rule categories
    disapear\! (Ranärok ensues)
    ([\#6840](http://www.rudder-project.org/redmine/issues/6840))
  - Fixed: Clear cache doesn't regenerate expected reports
    ([\#7080](http://www.rudder-project.org/redmine/issues/7080))

#### Web - Compliance & node report

  - Fixed: Reporting cannot be used when there is several component with
    the same value and several messages
    ([\#7037](http://www.rudder-project.org/redmine/issues/7037))

#### Web - Maintenance

  - Fixed: When accessing event logs page, it stays empty until jetty is
    restarted
    ([\#6939](http://www.rudder-project.org/redmine/issues/6939))

#### Web - Nodes & inventories

  - Fixed: If domain name is not set in resolv.conf, the inventory
    generated is invalid
    ([\#7001](http://www.rudder-project.org/redmine/issues/7001))
  - Fixed: Xen list parsed badly by FusionInventory, causing VCPU to be
    counted badly
    ([\#6754](http://www.rudder-project.org/redmine/issues/6754))
  - Fixed: FusionInventory doesn't provide the Rudder extension on other
    platform than Linux
    ([\#6747](http://www.rudder-project.org/redmine/issues/6747))

#### Agent

  - Fixed: If we ask to install a package in a version at least equal to
    another, we get no report if the version installed is \> than the
    one requested
    ([\#6996](http://www.rudder-project.org/redmine/issues/6996))
  - Fixed: Migration from 2.10.x to 2.11.x on Debian may disable the
    agent ([\#7099](http://www.rudder-project.org/redmine/issues/7099)
    )

#### Techniques

  - Fixed: aptPackageManagerSetting technique doesn't work on Ubuntu
    ([\#6999](http://www.rudder-project.org/redmine/issues/6999))
  - Fixed: Reporting on openssh server configuration technique is not
    correct for port edition
    ([\#6942](http://www.rudder-project.org/redmine/issues/6942))
  - Fixed: ntp Technique does not report when repairing
    ([\#6941](http://www.rudder-project.org/redmine/issues/6941))

#### Initial promises & sys tech

  - Fixed: Bad regexp in the cron for Rudder nova
    ([\#7014](http://www.rudder-project.org/redmine/issues/7014))
  - Fixed: A report is missing on system techniques when cron needs to
    be restartd
    ([\#6660](http://www.rudder-project.org/redmine/issues/6660))
  - Fixed: On Windows, Rudder specific inventories is not be added to
    inventory with most version of CFEngine Enterprise
    ([\#7057](http://www.rudder-project.org/redmine/issues/7057))
  - Fixed: When promises could have been updated, we still have the
    error messages saying we couldn't update promises
    ([\#7038](http://www.rudder-project.org/redmine/issues/7038))
  - Fixed: When the nxlog configuration is changed on windows, service
    is not restarted
    ([\#7012](http://www.rudder-project.org/redmine/issues/7012))
  - Fixed: System techniques on systemd based system do not handle boot
    script correctly
    ([\#6988](http://www.rudder-project.org/redmine/issues/6988))

#### Packaging

  - Fixed: Some code is duplicated in debian postinst
    ([\#7073](http://www.rudder-project.org/redmine/issues/7073))

#### System integration

  - Fixed: Rsyslog problem on Ubuntu 14.04 fresh install
    ([\#6127](http://www.rudder-project.org/redmine/issues/6127))

#### Architecture - Refactoring

  - Fixed: Remove scala compiler warning about comparing values of type
    Null ([\#7072](http://www.rudder-project.org/redmine/issues/7072))

#### Architecture - Internal libs

  - Fixed: A test is not compiling on branch 2.11 since \#6729 was
    merged
    ([\#7056](http://www.rudder-project.org/redmine/issues/7056))
  - Fixed: Exception thrown when debug\_timer is set on Rule pages
    ([\#7071](http://www.rudder-project.org/redmine/issues/7071))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Remi Debay
  - Janos Mattyasovszky
  - Christophe Nowicki

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.11.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.0.7 (2015-07-09)

### Changes

#### Packaging

  - Add a caching system to rudder build system
    ([\#6713](http://www.rudder-project.org/redmine/issues/6713))

### Bug fixes

#### Web - UI & UX

  - Fixed: More coherent informations on dashboard
    ([\#6777](http://www.rudder-project.org/redmine/issues/6777))
  - Fixed: Broken down stats by agent version is completely out of it
    ([\#6491](http://www.rudder-project.org/redmine/issues/6491))

#### Web - Config management

  - Fixed: After a partial promise generation, some nodes being a relay
    may have their promises stored in a non reachable location
    ([\#6729](http://www.rudder-project.org/redmine/issues/6729))

#### Web - Nodes & inventories

  - Fixed: Heartbeat bad interval time calcul on node
    ([\#6746](http://www.rudder-project.org/redmine/issues/6746))

#### Agent

  - Fixed: Cf-agent writes incorrect files when the server answers too
    slowly during recursive copy
    ([\#6915](http://www.rudder-project.org/redmine/issues/6915))

#### Initial promises & sys tech

  - Fixed: Rudder relay rsyslog configuration still have AllowedSender
    directives
    ([\#6907](http://www.rudder-project.org/redmine/issues/6907))
  - Fixed: Ubuntu trusty does not have an /etc/motd by default
    ([\#6904](http://www.rudder-project.org/redmine/issues/6904))
  - Fixed: We can't use cf-runagent because port is not taken into
    account in the body runagent control
    ([\#6916](http://www.rudder-project.org/redmine/issues/6916))
  - Fixed: Nodes using syslogd coninue to report to their old server
    when changing their policy server
    ([\#6845](http://www.rudder-project.org/redmine/issues/6845))
  - Fixed: Editing non-existent /etc/rsyslog.d/pgsql.conf in initial
    promises
    ([\#6784](http://www.rudder-project.org/redmine/issues/6784))

#### System integration

  - Fixed: Bad handling of pid file on OpenVZ
    ([\#6928](http://www.rudder-project.org/redmine/issues/6928))
  - Fixed: Rudder-jetty init script fails to get openjdk version
    ([\#6765](http://www.rudder-project.org/redmine/issues/6765))
  - Fixed: Sometimes, promises get corrupted to the point they can't be
    automatically repaired on a node
    ([\#6768](http://www.rudder-project.org/redmine/issues/6768))

#### Server components

  - Fixed: Update OpenLDAP to 2.4.41
    ([\#6931](http://www.rudder-project.org/redmine/issues/6931))

#### Techniques

  - Fixed: No reporting in dnsConfiguration 3.0
    ([\#6775](http://www.rudder-project.org/redmine/issues/6775))
  - Fixed: Openssh technique is missing reports
    ([\#6611](http://www.rudder-project.org/redmine/issues/6611))
  - Fixed: Unexpected status for fileAlterationMonitoring
    ([\#6771](http://www.rudder-project.org/redmine/issues/6771))

#### Documentation

  - Fixed: Wrong hierachy in archives section of the manual
    ([\#6909](http://www.rudder-project.org/redmine/issues/6909))
  - Fixed: Broken asciidoc list formatting
    ([\#6778](http://www.rudder-project.org/redmine/issues/6778))
  - Fixed: Outdated download link in the manual
    ([\#6764](http://www.rudder-project.org/redmine/issues/6764))
  - Fixed: Broken link and misplaced page in documentation
    ([\#6757](http://www.rudder-project.org/redmine/issues/6757))

#### Packaging

  - Fixed: AIX installations output errors due to "cp -a" usage
    ([\#6830](http://www.rudder-project.org/redmine/issues/6830))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Dennis Cabooter
  - Olivier Mauras

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. The current "esr"
release is still 2.11.\*. When we release a new version of Rudder, it
needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.0.6 (2015-06-18)

### Changes

#### Agent

  - Add an option to run cf-agent with -v to rudder agent run
    ([\#6731](http://www.rudder-project.org/redmine/issues/6731))
  - Man pages for the rudder command
    ([\#6659](http://www.rudder-project.org/redmine/issues/6659))

### Bug fixes

#### Web - Config management

  - Fixed: When we accept a new node, we have two promises generation
    instead of one
    ([\#6575](http://www.rudder-project.org/redmine/issues/6575))
  - Fixed: When we regenerate promises via 'Update' button, all promises
    are regenerated even if not needed
    ([\#6518](http://www.rudder-project.org/redmine/issues/6518))

#### Web - Compliance & node report

  - Fixed: Compliance in dashboard and rule page are not consistant
    ([\#6663](http://www.rudder-project.org/redmine/issues/6663))
  - Fixed: The Global compliance is buggy when there is no data
    ([\#6633](http://www.rudder-project.org/redmine/issues/6633))
  - Fixed: Blue for no report in bar charts doesn't make sense
    ([\#6489](http://www.rudder-project.org/redmine/issues/6489))
  - Fixed: Compliance in dashboard and rule page are not consistant
    ([\#6663](http://www.rudder-project.org/redmine/issues/6663))
  - Fixed: When we add a node in a rule, we lose all compliance info on
    this rule applied on it, and we change promises of all the nodes of
    the rule
    ([\#6519](http://www.rudder-project.org/redmine/issues/6519))
  - Fixed: No reporting on agents on ncf directives on SLES
    ([\#6673](http://www.rudder-project.org/redmine/issues/6673))

#### Web - UI & UX

  - Fixed: No rules displayed in firefox
    ([\#6490](http://www.rudder-project.org/redmine/issues/6490))
  - Fixed: Bad RegEx in Groups causes Server to not respond
    ([\#6680](http://www.rudder-project.org/redmine/issues/6680))

#### Web - Nodes & inventories

  - Fixed: Error 500 when sending multiple files to inventory endpoint
    ([\#6508](http://www.rudder-project.org/redmine/issues/6508))
  - Fixed: Search results grayed out
    ([\#6277](http://www.rudder-project.org/redmine/issues/6277))

#### Web - Technique editor

  - Fixed: Cannot save technique with ncf builder - error during the API
    call to the technique librairy reload
    ([\#6724](http://www.rudder-project.org/redmine/issues/6724))
  - Fixed: ncf post-hooks fails when there is nothing to commit
    ([\#6617](http://www.rudder-project.org/redmine/issues/6617))

#### API

  - Fixed: In group API, attribute and comparator names are case
    sensitive
    ([\#6577](http://www.rudder-project.org/redmine/issues/6577))

#### System integration

  - Fixed: rudder-server-root init script is not compatible with systemd
    ([\#6760](http://www.rudder-project.org/redmine/issues/6760))
  - Fixed: RHEL7 does not initialise postgresql db
    ([\#6702](http://www.rudder-project.org/redmine/issues/6702))
  - Fixed: ncf init fails in webapp postinst
    ([\#6698](http://www.rudder-project.org/redmine/issues/6698))
  - Fixed: rudder-reports does not find correct postgresql service when
    using systemctl
    ([\#6699](http://www.rudder-project.org/redmine/issues/6699))
  - Fixed: Startup links for rudder-server-root on Ubuntu are not
    correct - before 3.1
    ([\#6263](http://www.rudder-project.org/redmine/issues/6263))
  - Fixed: Error about ldconfig during rudder-agent installation on AIX
    ([\#6703](http://www.rudder-project.org/redmine/issues/6703))

#### Server components

  - Fixed: Webdav allow connection from any network, not only allowed
    network
    ([\#6540](http://www.rudder-project.org/redmine/issues/6540))
  - Fixed: Messages forwarded from AIX agent are not dropped on
    relay/server root after being consumed
    ([\#6522](http://www.rudder-project.org/redmine/issues/6522))
  - Fixed: Log rotation on distributed install is not functionnal
    \[\[http://www.rudder-project.org/redmine/issues/6521\]\[\#6521
  - Fixed: Syslog accept reports from non-accepted nodes
    ([\#6428](http://www.rudder-project.org/redmine/issues/6428))
  - Fixed: rudder-reports has not sufficient dependency to postgresql's
    version
    ([\#6662](http://www.rudder-project.org/redmine/issues/6662))
  - Fixed: When a node is promoted to relay, the old rsyslog conf is
    never replaced
    ([\#6721](http://www.rudder-project.org/redmine/issues/6721))

#### Performance and scalability

  - Fixed: Do not check dns when checking promises
    ([\#6616](http://www.rudder-project.org/redmine/issues/6616))

#### Techniques

  - Fixed: Typo in Technique "zypper settings"
    ([\#6677](http://www.rudder-project.org/redmine/issues/6677))
  - Fixed: Zypper is called without --non-interactive when filling
    available updates cache
    ([\#6588](http://www.rudder-project.org/redmine/issues/6588))
  - Fixed: Technique "Clock settings" uses Europe/Paris as China's
    timezone
    ([\#6450](http://www.rudder-project.org/redmine/issues/6450))
  - Fixed: MaxSessions parameter is supported on RedHat 6.3 (at least),
    but Technique SSHConfiguration prevent from configuring it on this
    system
    ([\#6527](http://www.rudder-project.org/redmine/issues/6527))
  - Fixed: Promises.st can't load ncf on windows
    ([\#6700](http://www.rudder-project.org/redmine/issues/6700))

#### Initial promises & sys tech

  - Fixed: Create a rudder variable containing all IP of agents
    ([\#6481](http://www.rudder-project.org/redmine/issues/6481))\]\])

#### Agent

  - Fixed: cfengine context is not updated properly when doing multiple
    indivudual package actions
    ([\#6587](http://www.rudder-project.org/redmine/issues/6587))

#### Packaging

  - Fixed: The detect\_os.sh script is not valid
    ([\#6486](http://www.rudder-project.org/redmine/issues/6486))

#### Documentation

  - Fixed: Add Debian 8 support in the specs for Rudder nodes
    ([\#6704](http://www.rudder-project.org/redmine/issues/6704))
  - Fixed: HashcodeCaching.scala typo error WRNING =\> WARNING
    ([\#6734](http://www.rudder-project.org/redmine/issues/6734))
  - Fixed: Restore procedures has service name mistyped
    ([\#6664](http://www.rudder-project.org/redmine/issues/6664))
  - Fixed: Old Normation logo in the manual
    ([\#6643](http://www.rudder-project.org/redmine/issues/6643))
  - Fixed: Broken link in the demo section of rudder README
    ([\#6610](http://www.rudder-project.org/redmine/issues/6610))
  - Fixed: Bibliography links are out of date
    ([\#6609](http://www.rudder-project.org/redmine/issues/6609))
  - Fixed: Broken links in the manual
    ([\#6607](http://www.rudder-project.org/redmine/issues/6607))
  - Fixed: Check spelling and grammar of the manual
    ([\#6599](http://www.rudder-project.org/redmine/issues/6599))
  - Fixed: Remove references to the Big Red Button in the manual
    ([\#6596](http://www.rudder-project.org/redmine/issues/6596))
  - Fixed: Fix asciidoc list formatting
    ([\#6595](http://www.rudder-project.org/redmine/issues/6595))
  - Fixed: Rudder Documentation typo
    ([\#6559](http://www.rudder-project.org/redmine/issues/6559))
  - Fixed: Update command on centos is missing "ncf-api-virtualenv"
    package
    ([\#6503](http://www.rudder-project.org/redmine/issues/6503))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Dennis Cabooter
  - Florian Heigl
  - Janos Mattyasovszky
  - Olivier Mauras

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. The current "esr"
release is still 2.11.\*.

## Rudder 3.0.5 (2015-06-02)

Not released due to a major bug
[\#6507](http://www.rudder-project.org/redmine/issues/6507)

## Rudder 3.0.4 (2015-04-13)

### Changes

### Bug fixes

#### Web - Compliance & node report

  - Fixed: Promises are generated when a directive is created
    ([\#6452](http://www.rudder-project.org/redmine/issues/6452))

#### Web - Nodes & inventories

  - Fixed: Missing error message when trying to accept a node with an
    already existing hostname
    ([\#6451](http://www.rudder-project.org/redmine/issues/6451))

#### API

  - Fixed: Node API cannot get pending and refused node details
    ([\#6482](http://www.rudder-project.org/redmine/issues/6482))

#### Web - Maintenance

  - Fixed: Plugin name are not displayed
    ([\#6484](http://www.rudder-project.org/redmine/issues/6484))

#### Techniques

  - Fixed: Document usage of line replacement in Enforce a file content
    technique
    ([\#5979](http://www.rudder-project.org/redmine/issues/5979))
  - Fixed: MOTD directive has 2 different technique versions
    ([\#6272](http://www.rudder-project.org/redmine/issues/6272))

#### Server components

  - Fixed: networks.conf missing on relay servers
    ([\#6454](http://www.rudder-project.org/redmine/issues/6454))

#### Agent

  - Fixed: Agent may not work after a reinit
    ([\#6441](http://www.rudder-project.org/redmine/issues/6441))

#### Initial promises & sys tech

  - Fixed: No reports for Propagate promises component on relay
    ([\#6404](http://www.rudder-project.org/redmine/issues/6404))

#### System integration

  - Fixed: rudder-agent is stuck, waiting for user input during log
    compression
    ([\#6439](http://www.rudder-project.org/redmine/issues/6439))
  - Fixed: rudder-jetty init script may fail on success
    ([\#5653](http://www.rudder-project.org/redmine/issues/5653))

#### Documentation

  - Fixed: Improve documentation of archives management
    ([\#6485](http://www.rudder-project.org/redmine/issues/6485))
  - Fixed: Badly explain minimum requierement for Rudder in
    documentation
    ([\#6453](http://www.rudder-project.org/redmine/issues/6453))
  - Fixed: Outdated chapter: Disable automatic regeneration of promises
    ([\#6312](http://www.rudder-project.org/redmine/issues/6312))

#### Packaging

  - Fixed: Remove python dependency for rudder-agent
    ([\#6424](http://www.rudder-project.org/redmine/issues/6424))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Florian Heigl
  - Peter Keresztes
  - Lionel Le Folgoc

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.10.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.0.3 (2015-03-24)

### Changes

### Bug fixes

#### Web - Technique editor

  - Fixed: Command execution generic method does not send compliance
    report because rudder\_expected\_reports.csv is empty
    ([\#6419](http://www.rudder-project.org/redmine/issues/6419))

#### Techniques

  - Fixed: Enforce file content Technique doesn't properly migrate lines
    from outside the zone to the zone
    ([\#6389](http://www.rudder-project.org/redmine/issues/6389))

#### Agent

  - Fixed: Using parsestringarrayidx on AIX leads to agent hanging up or
    promises validation errors (only on 2.11)
    ([\#6396](http://www.rudder-project.org/redmine/issues/6396))

#### System integration

  - Fixed: Rudder login page doesn't appear just after the webapp has
    been started
    ([\#6402](http://www.rudder-project.org/redmine/issues/6402))
  - Fixed: File /var/log/rudder/{compliance/non-compliant-reports.log,
    core/rudder-webapp.log} are not correctly rotated
    ([\#6381](http://www.rudder-project.org/redmine/issues/6381))

#### Packaging

  - Fixed: AIX rudder-agent SPECfile fails to build due to a macro
    expansion error
    ([\#6380](http://www.rudder-project.org/redmine/issues/6380))
  - Fixed: The Ubuntu 14.04 default apache vhosts are not removed
    properly and ncf-api-virtualenv is not put at the right place
    ([\#6392](http://www.rudder-project.org/redmine/issues/6392))

#### Architecture - Dependencies

  - Fixed: Upgrade Liftweb to v2.5.2 (security issue)
    ([\#6426](http://www.rudder-project.org/redmine/issues/6426))

### Release notes

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.10.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.0.2 (2015-03-09)

### Changes

#### System integration

  - Rudder-update need to check for the PostgreSQL version
    ([\#6289](http://www.rudder-project.org/redmine/issues/6289))

### Bug fixes

#### Webapp - Display, home page

  - Fixed: rule and group category ID are not displayed
    ([\#6323](http://www.rudder-project.org/redmine/issues/6323))
  - Fixed: Display UUIDs in rudder web interface in lowercase so they
    can be used directly.
    ([\#6297](http://www.rudder-project.org/redmine/issues/6297))

#### Webapp - Config management

  - Fixed: "+" and "-" buttons to add a group to a Rule redirects to the
    group edition page instead of adding the group to the Rule
    ([\#6276](http://www.rudder-project.org/redmine/issues/6276))

#### Webapp - Node management

  - Fixed: List of impacted rules when accepting nodes or modifing
    directives is not accurate
    ([\#5764](http://www.rudder-project.org/redmine/issues/5764))
  - Fixed: Cannot remove node properties when setting value to ""
    ([\#6282](http://www.rudder-project.org/redmine/issues/6282))

#### API

  - Fixed: Wrong default category set when creating a Rule
    ([\#6314](http://www.rudder-project.org/redmine/issues/6314))

#### Techniques

  - Fixed: it's not possible to define variables with " in them in
    generic variable definition
    ([\#6279](http://www.rudder-project.org/redmine/issues/6279))
  - Fixed: Wrong reporting in Technique Enforce a file content if the
    file is not present
    ([\#6237](http://www.rudder-project.org/redmine/issues/6237))
  - Fixed: OpenSSH server technique tries to configure MaxSession on AIX
    5.3, but this parameter is invalid on this OS
    ([\#6374](http://www.rudder-project.org/redmine/issues/6374))
  - Fixed: The fileManagement Technique does not report on AIX
    ([\#6362](http://www.rudder-project.org/redmine/issues/6362))

#### Documentation

  - Fixed: SuSE upgrade procedure is missing a ncf upgrade, and the
    documentation references no-more-present init scripts
    ([\#6288](http://www.rudder-project.org/redmine/issues/6288))
  - Fixed: documentation states that 'Workflow' needs to be set in the
    config file, but now in rudder web interface
    ([\#6283](http://www.rudder-project.org/redmine/issues/6283))
  - Fixed: Documentation to upgrade Rudder Server on Debian/Ubuntu is
    incomplete
    ([\#6109](http://www.rudder-project.org/redmine/issues/6109))
  - Fixed: The migration to 2.11 procedure is misleading
    ([\#5794](http://www.rudder-project.org/redmine/issues/5794))

#### System integration

  - Fixed: The rudder-agent package should remove the inittab entry and
    subsystem on AIX, and should not run ldconfig
    ([\#6364](http://www.rudder-project.org/redmine/issues/6364))
  - Fixed: SLES 11 SP1 requires an older version of Python virtualenv
    ([\#6365](http://www.rudder-project.org/redmine/issues/6365))
  - Fixed: ncf-api-virtualenv fails to build due to and outdated version
    of virtualenv
    ([\#6347](http://www.rudder-project.org/redmine/issues/6347))
  - Fixed: Rudder agent fails to build on Ubuntu 10.04 due to a buggy
    dh\_shlibdeps
    ([\#6337](http://www.rudder-project.org/redmine/issues/6337))
  - Fixed: Remove SASL support from rudder-inventory-ldap
    ([\#6229](http://www.rudder-project.org/redmine/issues/6229))
  - Fixed: Upgrade rudder-agent can't find/install man pages
    ([\#6016](http://www.rudder-project.org/redmine/issues/6016))

#### ncf-builder integration

  - Fixed: rudderify ncf-hook does not work on first run
    ([\#6249](http://www.rudder-project.org/redmine/issues/6249))

#### Packaging

  - Fixed: When I want to upgrade Rudder to latest version, ncf is NOT
    updated on SLES11
    ([\#6286](http://www.rudder-project.org/redmine/issues/6286))
  - Fixed: Unable to install Rudder agent if there is no rsync nor
    libpcre3 installed on the system on Debian
    ([\#6239](http://www.rudder-project.org/redmine/issues/6239))

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Jean Cardona
  - Florian Heigl
  - Maxime Longuet

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.10.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.0.1 (2015-02-23)

### Changes

### Bug fixes

#### Techniques

  - Fixed: Fatal error in rpmPackageInstallation v7.0, cannot generate
    policies
    ([\#6273](http://www.rudder-project.org/redmine/issues/6273))

#### Documentation

  - Fixed: Adapt Rudder documentation for 3.0 release
    ([\#6241](http://www.rudder-project.org/redmine/issues/6241))
  - Fixed: Add missing 'properties' in rudder-api doc
    ([\#6280](http://www.rudder-project.org/redmine/issues/6280))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter

This is a bug fix release in the 3.0 series and therefore all
installations of 3.0 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.10.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.0.0 (2015-02-16)

### Changes

#### Webapp - Node management

  - Have the possibility to bookmark search queries
    ([\#5774](http://www.rudder-project.org/redmine/issues/5774))

#### Webapp - Display, home page

  - Rudder 3.0 logo
    ([\#6084](http://www.rudder-project.org/redmine/issues/6084))

### Bug fixes

#### Webapp - Config management

  - Fixed: Cannot apply a Directive to all visible Rules
    ([\#6260](http://www.rudder-project.org/redmine/issues/6260))
  - Fixed: First access to rule page leads to "server can not be
    contacted at this time"
    ([\#6255](http://www.rudder-project.org/redmine/issues/6255))
  - Fixed: If a run is not completed, compliance computation goes mad
    ([\#6211](http://www.rudder-project.org/redmine/issues/6211))
  - Fixed: Server cannot be contacted at this time when deleting a
    Directive
    ([\#6198](http://www.rudder-project.org/redmine/issues/6198))
  - Fixed: Refreshing rules grid make them all disappear
    ([\#6190](http://www.rudder-project.org/redmine/issues/6190))
  - Fixed: In rule details-\>compliance, reload should reload all
    graphes at once
    ([\#6165](http://www.rudder-project.org/redmine/issues/6165))
  - Fixed: Sorting Rule tables on "Compliance" and "Recent Changes" sort
    by name
    ([\#6162](http://www.rudder-project.org/redmine/issues/6162))
  - Fixed: Rule details and Directive not accessible if technique
    version is missing
    ([\#6161](http://www.rudder-project.org/redmine/issues/6161))
  - Fixed: Tooltip on Directive tree does not appear after refresh/click
    on a element
    ([\#6148](http://www.rudder-project.org/redmine/issues/6148))
  - Fixed: Button to migrate to last version when a Technique is
    deprecated is disabled
    ([\#6147](http://www.rudder-project.org/redmine/issues/6147))

#### Webapp - Node management

  - Fixed: The quick search input does not works on search page
    ([\#6261](http://www.rudder-project.org/redmine/issues/6261))
  - Fixed: When you delete a Node it stays in the Node list
    ([\#6242](http://www.rudder-project.org/redmine/issues/6242))
  - Fixed: JsError when opening a node details
    ([\#6233](http://www.rudder-project.org/redmine/issues/6233))
  - Fixed: IE bug: groups cannot be saved nor deleted
    ([\#6116](http://www.rudder-project.org/redmine/issues/6116))
  - Fixed: Accept new node screen has some minor display issue
    ([\#6114](http://www.rudder-project.org/redmine/issues/6114))
  - Fixed: List of impacted rules when accepting nodes or modifing
    directives is not accurate
    ([\#5764](http://www.rudder-project.org/redmine/issues/5764))

#### Webapp - Administration

  - Fixed: Event log table cannot be opened on other pages than first
    one ([\#6214](http://www.rudder-project.org/redmine/issues/6214))
  - Fixed: In eventlogs, the "Raw Technical Details" is not underlined,
    and so we don't know that it is clickable
    ([\#5994](http://www.rudder-project.org/redmine/issues/5994))

#### Webapp - Display, home page

  - Fixed: Rudder stores too much or too big cookies, causing white page
    with HTTP status: 413: FULL head
    ([\#6160](http://www.rudder-project.org/redmine/issues/6160))
  - Fixed: IE bug: charts not displayed
    ([\#6115](http://www.rudder-project.org/redmine/issues/6115))
  - Fixed: Sometimes, there is glitch in display of homepage charts
    ([\#6091](http://www.rudder-project.org/redmine/issues/6091))
  - Fixed: Node breakdown pie chart on homepage may be of different size
    ([\#6090](http://www.rudder-project.org/redmine/issues/6090))
  - Fixed: Some buttons does not work correctly with IE9
    ([\#6077](http://www.rudder-project.org/redmine/issues/6077))
  - Fixed: Add missing logger when there is an error when dsplaying
    compliance
    ([\#6053](http://www.rudder-project.org/redmine/issues/6053))
  - Fixed: Save message notification misplaced for global agent run
    preference
    ([\#6022](http://www.rudder-project.org/redmine/issues/6022))
  - Fixed: Display of legend in the dashboard is not really readable
    ([\#5996](http://www.rudder-project.org/redmine/issues/5996))
  - Fixed: Title bar take twice its size in 1280x1024
    ([\#5964](http://www.rudder-project.org/redmine/issues/5964))

#### ncf-builder integration

  - Fixed: URL for the ncf-builder call is misunderstood by IE9 (bad
    html5 support)
    ([\#6130](http://www.rudder-project.org/redmine/issues/6130))
  - Fixed: rudderify ncf-hook does not work on first run
    ([\#6249](http://www.rudder-project.org/redmine/issues/6249))

#### Webapp - Reporting

  - Fixed: Some heartbeat are skipped in change only mode
    ([\#6209](http://www.rudder-project.org/redmine/issues/6209))
  - Fixed: On policy server, we do override the run interval, and the
    expected frequency for reports, but the generated promises don't
    override the heartbeat frequency, causing non answer in the webapp
    ([\#6206](http://www.rudder-project.org/redmine/issues/6206))
  - Fixed: Compliance computation on home page dashboard charts is
    incoherent regarding pending nodes
    ([\#6205](http://www.rudder-project.org/redmine/issues/6205))
  - Fixed: If I create a rule, the Rules table is not correctly
    refreshed, and I get a neverending "loading"
    ([\#6203](http://www.rudder-project.org/redmine/issues/6203))
  - Fixed: Cleanup databases
    ([\#6156](http://www.rudder-project.org/redmine/issues/6156),
    ([\#6050](http://www.rudder-project.org/redmine/issues/6050))
  - Fixed: Pending state is not managed as user could expect in changes
    only mode
    ([\#6021](http://www.rudder-project.org/redmine/issues/6021))

#### Techniques

  - Fixed: Wrong reporting in Technique Enforce a file content if the
    file is not present
    ([\#6238](http://www.rudder-project.org/redmine/issues/6238))
  - Fixed: Reporting errors in fstab Technique v4.0
    ([\#6218](http://www.rudder-project.org/redmine/issues/6218))
  - Fixed: Reporting errors in sudoParameters Technique v3.0
    ([\#6217](http://www.rudder-project.org/redmine/issues/6217))
  - Fixed: Wrong reporting in Technique Enforce a file content if the
    file is not present
    ([\#6237](http://www.rudder-project.org/redmine/issues/6237))

#### Techniques - System & initial promises

  - Fixed: When we install rudder-agent package, it tries to send
    automatically the node inventory to machine "rudder"
    ([\#6113](http://www.rudder-project.org/redmine/issues/6113))
  - Fixed: Reports on service checks are not correct
    ([\#6057](http://www.rudder-project.org/redmine/issues/6057))
  - Fixed: rudder agent on sles server logs a lot of errors about
    service checking
    ([\#6056](http://www.rudder-project.org/redmine/issues/6056))
  - Fixed: On a freshly installed node, rsyslog is dropping messages
    ([\#5991](http://www.rudder-project.org/redmine/issues/5991))

#### Documentation

  - Fixed: Documentation to upgrade Rudder Server on Debian/Ubuntu is
    incomplete
    ([\#6109](http://www.rudder-project.org/redmine/issues/6109))

#### System integration

  - Fixed: Bad logs at info level
    ([\#6228](http://www.rudder-project.org/redmine/issues/6228))
  - Fixed: rudder-metrics-reporting tries to use a ca file that is a
    directory
    ([\#6058](http://www.rudder-project.org/redmine/issues/6058))
  - Fixed: Upgrading rudder-inventory-ldap between two major OS versions
    makes slapd unable to operate because of BerkeleyDB
    ([\#5741](http://www.rudder-project.org/redmine/issues/5741))

#### Packaging

  - Fixed: Error log when installing rudder-inventory ldap on RHEL6
    ([\#6032](http://www.rudder-project.org/redmine/issues/6032))
  - Fixed: Bundled OpenSSL patches in rudder-agent 3.0 are not up to
    date ([\#6227](http://www.rudder-project.org/redmine/issues/6227))
  - Fixed: Add a patch in CFEngine to support FORTIFY\_SOURCE
    ([\#6117](http://www.rudder-project.org/redmine/issues/6117))
  - Fixed: CFLAGS/CXXFLAGS definition in rudder-agent SPEC file does not
    work on RHEL7
    ([\#6112](http://www.rudder-project.org/redmine/issues/6112))
  - Fixed: Rudder agent build fails on RHEL5 / SLES 10
    ([\#6095](http://www.rudder-project.org/redmine/issues/6095))
  - Fixed: Building rudder-agent fails on Ubuntu 10.04
    ([\#6093](http://www.rudder-project.org/redmine/issues/6093))
  - Fixed: Rudder Debian 8 support patches conflict with
    rudder-agent-thin packages
    ([\#6076](http://www.rudder-project.org/redmine/issues/6076))
  - Fixed: Remove SASL support from rudder-inventory-ldap
    ([\#6229](http://www.rudder-project.org/redmine/issues/6229))
  - Fixed: Unable to install Rudder agent if there is no rsync nor
    libpcre3 installed on the system on Debian
    ([\#6239](http://www.rudder-project.org/redmine/issues/6239))

#### Performance and scalability

  - Fixed: Add a cache for compliance by node
    ([\#6194](http://www.rudder-project.org/redmine/issues/6194))
  - Fixed: Add a cache for recent changes
    ([\#6184](http://www.rudder-project.org/redmine/issues/6184))
  - Fixed: Compliance is computed several time to display Rule grid
    ([\#6135](http://www.rudder-project.org/redmine/issues/6135))
  - Fixed: Performance issue for Accept new nodes \> history of
    acceptation
    ([\#6078](http://www.rudder-project.org/redmine/issues/6078))
  - Fixed: Improve rule page loading by having asynchronous complianced
    loading
    ([\#6073](http://www.rudder-project.org/redmine/issues/6073))
  - Fixed: Performance of retrieving last node run reports time impact
    both compliance and list of node screen
    ([\#6063](http://www.rudder-project.org/redmine/issues/6063))
  - Fixed: Graphs in home page take ages to display
    ([\#6059](http://www.rudder-project.org/redmine/issues/6059))
  - Fixed: Charts in homepage must be lazy loaded
    ([\#6052](http://www.rudder-project.org/redmine/issues/6052))
  - Fixed: Performance issue for node list
    ([\#5452](http://www.rudder-project.org/redmine/issues/5452))

#### Architecture - Dependencies

  - Fixed: Missing war plugin ° attach source for rudder plugin
    ([\#6072](http://www.rudder-project.org/redmine/issues/6072))

#### Architecture - Refactoring

  - Fixed: Remove dead code
    ([\#6062](http://www.rudder-project.org/redmine/issues/6062),
    ([\#6060](http://www.rudder-project.org/redmine/issues/6060))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Lionel Le Folgoc
  - Maxime Longuet

This version of Rudder is a final release. We have tested it thoroughly
and believe it to be free of any major bugs. However, this branch is not
marked "stable", since it still has to be proven reliable on production
systems over a period of several months. The current "stable" release is
2.10.\*.

## Rudder 3.0.0~rc1 (2014-12-31)

### Changes

### Bug fixes

#### Webapp - Config management

  - Fixed: Cannot open reporting details for directive in both table at
    the same time
    ([\#6036](http://www.rudder-project.org/redmine/issues/6036))
  - Fixed: Status of Rule is displayed as "N/A"
    ([\#5888](http://www.rudder-project.org/redmine/issues/5888))

#### Webapp - Reporting

  - Fixed: If the end reports message contains special characters, like
    carriage returns, the reporting fails
    ([\#6047](http://www.rudder-project.org/redmine/issues/6047))
  - Fixed: If i update or create a rule, all nodes that are in the
    target of this rule get the "pending" state
    ([\#6040](http://www.rudder-project.org/redmine/issues/6040))
  - Fixed: The expected reports of other rules are not correctly updated
    when we create a new rule
    ([\#6039](http://www.rudder-project.org/redmine/issues/6039))
  - Fixed: Wrong reporting after execution of migration script to change
    the way reports are used from the database
    ([\#6038](http://www.rudder-project.org/redmine/issues/6038))

#### Webapp - Administration

  - Fixed: Do not display send metrics popup directly after 'ask later'
    was clicked
    ([\#6045](http://www.rudder-project.org/redmine/issues/6045))

#### Webapp - Display, home page

  - Fixed: Header menu css is not displayed in IE9
    ([\#6049](http://www.rudder-project.org/redmine/issues/6049))
  - Fixed: No popup displayed in IE9
    ([\#6048](http://www.rudder-project.org/redmine/issues/6048))
  - Fixed: The interface is unsusable under some versions of firefox
    ([\#5962](http://www.rudder-project.org/redmine/issues/5962))

#### System integration

  - Fixed: Missing installation of migration script for database
    ([\#6044](http://www.rudder-project.org/redmine/issues/6044))
  - Fixed: The Debian 8 patch to use the system LMDB instance is
    outdated
    ([\#6033](http://www.rudder-project.org/redmine/issues/6033))

### Release notes

This software is in "release candidate" status and contains multiple bug
fixes since the first release candidate (2.8.0~rc1). If no major bugs
are found, a "final" release of 2.8.0 will be released next week.

## Rudder 3.0.0~beta2 (2014-12-19)

### Changes

#### ncf-builder integration

  - Integrate ncf-builder in an iframe within the main Rudder interface
    ([\#5917](http://www.rudder-project.org/redmine/issues/5917))

#### Webapp - Config management

  - Add always visible save button for Rules
    ([\#4331](http://www.rudder-project.org/redmine/issues/4331))

#### Webapp - Administration

  - Display a popup when 'metrics' property is not set
    ([\#6003](http://www.rudder-project.org/redmine/issues/6003))
  - Make event log table asynchronous
    ([\#5960](http://www.rudder-project.org/redmine/issues/5960))
  - Make change request table asynchronous
    ([\#5957](http://www.rudder-project.org/redmine/issues/5957))

#### Utilities

  - New rudder utility command: agent version
    ([\#5908](http://www.rudder-project.org/redmine/issues/5908))

#### System integration

  - Update to CFEngine 3.6.3 final
    ([\#5939](http://www.rudder-project.org/redmine/issues/5939))
  - Ease rudder-agent installation by setting default values
    ([\#4900](http://www.rudder-project.org/redmine/issues/4900))

#### Performance and scalability

  - Don't generate promises when there are no change that change the
    generated promises
    ([\#6012](http://www.rudder-project.org/redmine/issues/6012))

#### Architecture - Refactoring

  - Delete no more used test files in rudder-core
    ([\#5990](http://www.rudder-project.org/redmine/issues/5990))

### Bug fixes

#### API

  - Fixed: With the API, it is possible to set a Group with no criteria
    ([\#3767](http://www.rudder-project.org/redmine/issues/3767))

#### Techniques - Sys & init promis

  - Fixed: Rudder crons sends too much mails
    ([\#5922](http://www.rudder-project.org/redmine/issues/5922))
  - Fixed: Rudder agent refuses to update promises when its hostname is
    uppercase
    ([\#5772](http://www.rudder-project.org/redmine/issues/5772))
  - Fixed: Policy Server UUID in /var/rudder/tmp
    ([\#2443](http://www.rudder-project.org/redmine/issues/2443))
  - Fixed: Inventory file name never change
    ([\#725](http://www.rudder-project.org/redmine/issues/725))

#### Logging

  - Fixed: Eventlogs to track node modification are missing
    ([\#5986](http://www.rudder-project.org/redmine/issues/5986))
  - Fixed: Eventlogs for global frequency modification are missing
    ([\#5985](http://www.rudder-project.org/redmine/issues/5985))
  - Fixed: Eventlogs to track global hearbeat change is missing
    ([\#5837](http://www.rudder-project.org/redmine/issues/5837))

#### Webapp - Config management

  - Fixed: Change request are not migrated to fileformat 6
    ([\#6001](http://www.rudder-project.org/redmine/issues/6001))
  - Fixed: Recent changes graphe is too wide the first time rule details
    is opened
    ([\#5904](http://www.rudder-project.org/redmine/issues/5904))
  - Fixed: Directive stays selected in Directives tree even after other
    item has been selected and displayed
    ([\#5887](http://www.rudder-project.org/redmine/issues/5887))
  - Fixed: A warning should be displayed when migrating directive
    ([\#5708](http://www.rudder-project.org/redmine/issues/5708))
  - Fixed: The directive form error handling is broken
    ([\#5560](http://www.rudder-project.org/redmine/issues/5560))

#### Vagrant integration

  - Fixed: Improve rudder-vagrant README
    ([\#5131](http://www.rudder-project.org/redmine/issues/5131))

#### Documentation

  - Fixed: The screenshots in 3.0 documentation are not up to date
    anymore
    ([\#5927](http://www.rudder-project.org/redmine/issues/5927))

#### Miscellaneous

  - Fixed: Typo in node API documentation titles
    ([\#5953](http://www.rudder-project.org/redmine/issues/5953))
  - Fixed: The available api versions are not listed
    ([\#5737](http://www.rudder-project.org/redmine/issues/5737))
  - Fixed: Add missing include parameter for node API
    ([\#5502](http://www.rudder-project.org/redmine/issues/5502))
  - Fixed: Demo data is deprecated
    ([\#5202](http://www.rudder-project.org/redmine/issues/5202))
  - Fixed: Add missing examples on Node and Parameters
    ([\#4082](http://www.rudder-project.org/redmine/issues/4082))

#### Webapp - Administration

  - Fixed: Frequency displayed for agent run schedule is missing leading
    0s (ex: 4:0 instead of 04:00)
    ([\#5789](http://www.rudder-project.org/redmine/issues/5789))
  - Fixed: It is not possible to add API account in Rudder 3.0
    ([\#5784](http://www.rudder-project.org/redmine/issues/5784))

#### Webapp - Display, home page

  - Fixed: Typo in "Sucess" in new reporting
    ([\#5886](http://www.rudder-project.org/redmine/issues/5886))

#### Techniques

  - Fixed: Missing ; in rpmPackageInstallation V7.0
    ([\#5932](http://www.rudder-project.org/redmine/issues/5932))
  - Fixed: filesPermissions recursion applied although not configured
    ([\#5747](http://www.rudder-project.org/redmine/issues/5747))
  - Fixed: Add missing changelogs for motd and ssh techniques
    ([\#5433](http://www.rudder-project.org/redmine/issues/5433))
  - Fixed: The 'Hosts settings' Technique should validate the IP address
    ([\#1925](http://www.rudder-project.org/redmine/issues/1925))

#### System integration

  - Fixed: Tests on rudder-techniques are (wrongly) failing on
    rudder\_stdlib\_core.st
    ([\#5999](http://www.rudder-project.org/redmine/issues/5999))
  - Fixed: Synchronize rudder-agent-thin patches with rudder-agent
    ([\#5941](http://www.rudder-project.org/redmine/issues/5941))
  - Fixed: URL in rudder-metrics-reporting points to a redirect
    ([\#5906](http://www.rudder-project.org/redmine/issues/5906))
  - Fixed: rudder-metrics-reporting is relying on local CA bundles to
    validate https
    ([\#5903](http://www.rudder-project.org/redmine/issues/5903))

#### Architecture - Dependencies

  - Fixed: Update build pluing to support Java 7
    ([\#6010](http://www.rudder-project.org/redmine/issues/6010))

#### Webapp - Config management

  - Fixed: The command to reload the server after promises generation
    fails when killall is not available
    ([\#5825](http://www.rudder-project.org/redmine/issues/5825))

#### Webapp - Reporting

  - Fixed: If a node had a date in the future, but returned to current
    time, the reporting will always be invalid (until it catches up with
    the future date)
    ([\#6005](http://www.rudder-project.org/redmine/issues/6005))
  - Fixed: Javascript alert when trying to see the reports details
    ([\#5993](http://www.rudder-project.org/redmine/issues/5993))

#### Webapp - Node management

  - Fixed: Null pointer exception when displaying the inventory of a
    pending node
    ([\#5933](http://www.rudder-project.org/redmine/issues/5933))
  - Fixed: In the query based search in multi-server excluding policy
    server only exclude the web server
    ([\#5648](http://www.rudder-project.org/redmine/issues/5648))
  - Fixed: Search Nodes: Search button grayed-out after search
    ([\#4643](http://www.rudder-project.org/redmine/issues/4643))

#### Architecture - Refactoring

  - Fixed: SQL definition file uses varchar, but it should use only text
    ([\#6026](http://www.rudder-project.org/redmine/issues/6026))

### Release notes

This software is in beta status and contains several new features but we
have tested it and believe it to be free of any critical bugs. The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!

## Rudder 3.0.0~beta1 (2014-12-01)

### Changes

#### Webapp - Display, home page

  - Global redesign of Rudder web interface
    ([\#5537](http://www.rudder-project.org/redmine/issues/5537))
  - Replace Rudder 'home page' by an informative dashboard
    ([\#1212](http://www.rudder-project.org/redmine/issues/1212))

#### Webapp - Config management

  - Add a 'changes only' compliance mode, only reporting changes on
    systems
    ([\#5293](http://www.rudder-project.org/redmine/issues/5293))
  - Do not display reporting on overriden 'unique' Directives
    ([\#5899](http://www.rudder-project.org/redmine/issues/5899))

#### Rudder agent CLI

  - Add a command line interface for Rudder agent
    ([\#5690](http://www.rudder-project.org/redmine/issues/5690))

#### Webapp - Node management

  - Customize Nodes by adding attribute on them
    ([\#5506](http://www.rudder-project.org/redmine/issues/5506))
  - Add a filter on group tree
    ([\#5833](http://www.rudder-project.org/redmine/issues/5833))

#### Techniques

  - Rewrite techniques so they all use ncf report methods
    ([\#5305](http://www.rudder-project.org/redmine/issues/5305))
  - Make environment variables accessible as parameter in all Techniques
    ([\#5449](http://www.rudder-project.org/redmine/issues/5449))
  - Add a "deprecated" attribute and notice for Technique version
    ([\#5610](http://www.rudder-project.org/redmine/issues/5610))
  - Adapt Techniques so they use available init system on each Node
    ([\#3828](http://www.rudder-project.org/redmine/issues/3828))

#### Packaging

  - Update to CFEngine 3.6.3 rc
    ([\#5858](http://www.rudder-project.org/redmine/issues/5858))
  - RHEL/CentOS 7 packages
    ([\#5469](http://www.rudder-project.org/redmine/issues/5469))
  - Relay server package
    ([\#1858](http://www.rudder-project.org/redmine/issues/1858))

#### System integration

  - Cleanup send\_clean.sh in Rudder agent tools
    ([\#5691](http://www.rudder-project.org/redmine/issues/5691))
  - Replace complex cron one-liner with one script call
    ([\#4711](http://www.rudder-project.org/redmine/issues/4711))

#### Inventory (webapp, Fusion)

  - Report "Docker" machine type in inventory
    ([\#5897](http://www.rudder-project.org/redmine/issues/5897))

#### ncf-builder integration

  - Enhance detection of ncf based techniques in Rudder
    ([\#5895](http://www.rudder-project.org/redmine/issues/5895))
  - Auto add/remove ncf Technique to Rudder techniques
    ([\#5670](http://www.rudder-project.org/redmine/issues/5670))

#### Webapp - CFEngine integration

  - Optionnal variables should not be nulled (if they are not system
    variables)
    ([\#3014](http://www.rudder-project.org/redmine/issues/3014))

#### Logging

  - Add a logger to trace webapp bootstrap actions
    ([\#5894](http://www.rudder-project.org/redmine/issues/5894))

#### Documentation

  - Update rudder documentation version to 3.0
    ([\#5896](http://www.rudder-project.org/redmine/issues/5896))

#### Performance and scalability

  - Remove default webapp from rudder-jetty
    ([\#5898](http://www.rudder-project.org/redmine/issues/5898))
  - Send anonymous metrics
    ([\#5809](http://www.rudder-project.org/redmine/issues/5809))

#### Architecture - Refactoring

  - Normalize our SQL definition file
    ([\#5893](http://www.rudder-project.org/redmine/issues/5893))
  - Clean up all sources to use a double-space indentation convention
    ([\#5362](http://www.rudder-project.org/redmine/issues/5362))

#### Architecture - Dependencies

  - Drop support for Java 6
    ([\#5664](http://www.rudder-project.org/redmine/issues/5664))
  - Update dependencies and version to 3.0.0
    ([\#5249](http://www.rudder-project.org/redmine/issues/5249))

### Bug fixes

#### Packaging

  - Fixed: Various packaging fixes
    ([\#5849](http://www.rudder-project.org/redmine/issues/5849))

#### System integration

  - Fixed: Upgrading rudder-inventory-ldap between two major OS versions
    makes slapd unable to operate because of BerkeleyDB
    ([\#5575](http://www.rudder-project.org/redmine/issues/5575))
  - Fixed: Syslog configuration on agent can conflict with loghosts
    ([\#5773](http://www.rudder-project.org/redmine/issues/5773))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Andrew Cranson
  - Florian Heigl
  - Lionel le Folgoc

This software is in beta status and contains several new features but we
have tested it and believe it to be free of any critical bugs. The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!

