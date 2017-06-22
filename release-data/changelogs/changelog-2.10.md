# Change logs for Rudder 2.10.\* versions

Rudder 2.10 has reached End of Life the 5th December 2015.
This version is codenamed "**Catamaran**".

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Main new features in Rudder 2.10:**

  - Lots of performance and scalability improvements:
      - Promises generation is **much** faster
      - Removed unnecessary commits to database
      - Overloaded Inventory endpoint does not impact Web Interface
        anymore
      - Improve CFEngine server promises
      - Do not keep redundant logs
  - Configure agent run interval (from 5 minutes to 6 hours) directly
    from webapp
  - More flexibility when selecting Rule targets, you can now exclude
    some groups
  - Get all inventory datas from a node using the REST API
  - Rudder agent is now supported on AIX 5.3+
  - Various improvements on packaging, refactoring and small UI fixes

A blog post (only in French for now) about all these features is
available here: http://blog.normation.com/fr/2014/05/18/rudder-2-10/

**Installing, upgrading and testing**

Documentation to Install and Upgrade is available online. The Download
page sums up URLs. We also recommend using the Rudder Vagrant config if
you want a quick and easy way to get an installation for testing.

**If you upgrade from 2.8x, 2.9.x or 2.10..x to 2.10.5, there is a
specific upgrade procedure:**

1\. Update the Rudder packages (yum update "rudder-\*" or apt-get
install rudder-server-root

2\. Restart the Web Interface ( /etc/init.d/rudder-jetty restart ), and
wait for it to be fully started, and then click on "Update" on the top
right hand side corner to trigger Policy update

3\. Update the ncf package (yum update ncf or apt-get install ncf)

New installations or upgrades from 2.6.x are not impacted by the issue.

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server: **Debian 5, Debian 6, Debian 7, RHEL/CentOS 6, SLES
    11, Ubuntu 12.04, Ubuntu 12.10**
  - Rudder agent: all of the above plus **RHEL/CentOS 3, RHEL/CentOS 5
    and SLES 10**

## Rudder 2.10.20 (2015-12-10)

### Changes

### Bug fixes

#### API

  - Fixed: API Parameters create "overridable" boolean check doesn't
    work ([\#6695](http://www.rudder-project.org/redmine/issues/6695))

#### Web - Config management

  - Fixed: Read technique access does not give access to techniques
    ([\#7514](http://www.rudder-project.org/redmine/issues/7514))

#### Server components

  - Fixed: promises are not regenerated when a node is transformed into
    a relay
    ([\#7301](http://www.rudder-project.org/redmine/issues/7301))

#### Agent

  - Fixed: rudder-agent repository on GitHub does not have a license
    ([\#7394](http://www.rudder-project.org/redmine/issues/7394))

#### Initial promises & sys tech

  - Fixed: Use whole path to binaries in cron from check-rudder-agent on
    AIX ([\#7525](http://www.rudder-project.org/redmine/issues/7525))
  - Fixed: Erroneous use of "\\&" in initial promises
    ([\#7517](http://www.rudder-project.org/redmine/issues/7517))
  - Fixed: Use of nonexistant class cfengine\_community makes
    failsafe.cf not copy CFEngine binaries to /var/rudder
    ([\#7499](http://www.rudder-project.org/redmine/issues/7499))
  - Fixed: "Update" component of common technique sometimes return
    unexpected status and has incomplete reporting
    ([\#6648](http://www.rudder-project.org/redmine/issues/6648))
  - Fixed: Syslog fails to restart due bad line in syslog-ng.conf
    ([\#7389](http://www.rudder-project.org/redmine/issues/7389))

#### System integration

  - Fixed: The rudder-agent cron on AIX uses if then, which makes some
    security test fails
    ([\#7508](http://www.rudder-project.org/redmine/issues/7508))
  - Fixed: JVM 8.0: warning about "Ignoring option PermSize=128m;
    support was removed in 8.0"
    ([\#7345](http://www.rudder-project.org/redmine/issues/7345))

#### Packaging

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

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Steeve Chailloux
  - David Durieux
  - Fabrice Flore-Thébault
  - Janos Mattyasovszky

This is a maintenance release, part of the 2.10 branch. An end-of-life
date has been scheduled for this release (5th December 2015), See our
FAQ for details, on
[the website](https://www.rudder-project.org/site/documentation/faq/#what_is_the_versioning_policy).
As such, it is recommended to upgrade all pre-2.11 installations to 2.11 as
soon as possible to enjoy the latest features and improvements of a more
mature and stable version.

## Rudder 2.10.19 (2015-10-27)

### Changes

### Bug fixes

#### Web - Nodes & inventories

  - Fixed: Link from node/directive list to node detail is broken on
    Firefox (branch 2.10)
    ([\#7286](http://www.rudder-project.org/redmine/issues/7286))

#### Packaging

  - Fixed: Maven never uses internal mirror
    ([\#7300](http://www.rudder-project.org/redmine/issues/7300))
  - Fixed: Temporary files are not cleaned up after build
    ([\#7293](http://www.rudder-project.org/redmine/issues/7293))

### Release notes

This is a maintenance release, part of the 2.10 branch. An end-of-life
date has been scheduled for this release (5th December 2015), See our
FAQ for details, on
[the website](https://www.rudder-project.org/site/documentation/faq/#what_is_the_versioning_policy).
As such, it is recommended to upgrade all pre-2.11 installations to 2.11 as
soon as possible to enjoy the latest features and improvements of a more
mature and stable version.

## Rudder 2.10.18 (2015-10-20)

### Changes

### Bug fixes

#### Initial promises & sys tech

  - Fixed: The daily cf-execd and cf-serverd restart should use SRC on
    AIX ([\#7274](http://www.rudder-project.org/redmine/issues/7274))

#### Techniques

  - Fixed: Ssh key distribution cannot distibute several keys on one
    user ([\#7254](http://www.rudder-project.org/redmine/issues/7254))

### Release notes

This is a maintenance release, part of the 2.10 branch. An end-of-life
date has been scheduled for this release (5th December 2015), See our
FAQ for details, on
[the website](https://www.rudder-project.org/site/documentation/faq/#what_is_the_versioning_policy).
As such, it is recommended to upgrade all pre-2.11 installations to 2.11 as
soon as possible to enjoy the latest features and improvements of a more
mature and stable version.

## Rudder 2.10.17 (2015-09-24)

### Changes

#### Documentation

  - Split the html documentation to improve readability and navigability
    ([\#6604](http://www.rudder-project.org/redmine/issues/6604))
  - Fixed: Document clearly technique upgrades
    ([\#7077](http://www.rudder-project.org/redmine/issues/7077))

### Bug fixes

#### Initial promises & sys tech

  - Fixed: System technique distributePolicy is not system and has two
    system var section
    ([\#7138](http://www.rudder-project.org/redmine/issues/7138))
  - Fixed: Promise copy is not convergent: if the copy is interupted, it
    will never recover
    ([\#7086](http://www.rudder-project.org/redmine/issues/7086))
  - Fixed: If the agent schedule is not every 5 minutes, inventory may
    not be sent anymore
    ([\#6718](http://www.rudder-project.org/redmine/issues/6718))

#### Web - Config management

  - Fixed: Rules are not serialized correctly anymore
    ([\#7108](http://www.rudder-project.org/redmine/issues/7108))

#### Web - Compliance & node report

  - Fixed: Agent schedule is not historised, so we can't know what was
    the agent run interval in the past
    ([\#7154](http://www.rudder-project.org/redmine/issues/7154))

This is a maintenance release, part of the 2.10 branch. An end-of-life
date has been scheduled for this release (5th December 2015), See our
FAQ for details, on
[the website](https://www.rudder-project.org/site/documentation/faq/#what_is_the_versioning_policy).
As such, it is recommended to upgrade all pre-2.11 installations to 2.11 as
soon as possible to enjoy the latest features and improvements of a more
mature and stable version.

## Rudder 2.10.16 (2015-08-19)

### Bug fixes

#### Web - Config management

  - Fixed: System object (techniques, directives, rules, groups) must be
    always enabled
    ([\#7064](http://www.rudder-project.org/redmine/issues/7064))
  - Fixed: Editing a rule category remove it from Git - rule categories
    disapear\! (Ranärok ensues)
    ([\#6840](http://www.rudder-project.org/redmine/issues/6840))

#### Web - Compliance & node report

  - Fixed: Reporting cannot be used when there is several component with
    the same value and several messages
    ([\#7037](http://www.rudder-project.org/redmine/issues/7037))

#### Techniques

  - Fixed: aptPackageManagerSetting technique doesn't work on Ubuntu
    ([\#6999](http://www.rudder-project.org/redmine/issues/6999))
  - Fixed: Reporting on openssh server configuration technique is not
    correct for port edition
    ([\#6942](http://www.rudder-project.org/redmine/issues/6942))

#### Initial promises & sys tech

  - Fixed: Bad regexp in the cron for Rudder nova
    ([\#7014](http://www.rudder-project.org/redmine/issues/7014))
  - Fixed: A report is missing on system techniques when cron needs to
    be restartd
    ([\#6660](http://www.rudder-project.org/redmine/issues/6660))

#### Architecture - Refactoring

  - Fixed: Remove scala compiler warning about comparing values of type
    Null ([\#7072](http://www.rudder-project.org/redmine/issues/7072))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Janos Mattyasovszky

This is a maintenance release, part of the 2.10 branch. An end-of-life
date has been scheduled for this release (5th December 2015), See our
FAQ for details, on
[the website](https://www.rudder-project.org/site/documentation/faq/#what_is_the_versioning_policy).
As such, it is recommended to upgrade all pre-2.11 installations to 2.11 as
soon as possible to enjoy the latest features and improvements of a more
mature and stable version.

## Rudder 2.10.15 (2015-07-09)

### Changes

### Bug fixes

#### Web - UI & UX

  - Fixed: No rules displayed in firefox
    ([\#6490](http://www.rudder-project.org/redmine/issues/6490))

#### Web - Nodes & inventories

  - Fixed: ldap.attr.networkInterfaceDhcpServer in search node component
    ([\#6785](http://www.rudder-project.org/redmine/issues/6785))

#### Documentation

  - Fixed: Wrong hierachy in archives section of the manual
    ([\#6909](http://www.rudder-project.org/redmine/issues/6909))
  - Fixed: Broken asciidoc list formatting
    ([\#6778](http://www.rudder-project.org/redmine/issues/6778))
  - Fixed: Outdated download link in the manual
    ([\#6764](http://www.rudder-project.org/redmine/issues/6764))
  - Fixed: Broken link and misplaced page in documentation
    ([\#6757](http://www.rudder-project.org/redmine/issues/6757))
  - Fixed: HashcodeCaching.scala typo error WRNING =\> WARNING
    ([\#6734](http://www.rudder-project.org/redmine/issues/6734))

#### Web - Config management

  - Fixed: After a partial promise generation, some nodes being a relay
    may have their promises stored in a non reachable location
    ([\#6729](http://www.rudder-project.org/redmine/issues/6729))

#### Initial promises & sys tech

  - Fixed: Nodes using syslogd coninue to report to their old server
    when changing their policy server
    ([\#6845](http://www.rudder-project.org/redmine/issues/6845))
  - Fixed: Editing non-existent /etc/rsyslog.d/pgsql.conf in initial
    promises
    ([\#6784](http://www.rudder-project.org/redmine/issues/6784))

#### System integration

  - Fixed: Sometimes, promises get corrupted to the point they can't be
    automatically repaired on a node
    ([\#6768](http://www.rudder-project.org/redmine/issues/6768))

#### Server components

  - Fixed: When a node is promoted to relay, the old rsyslog conf is
    never replaced
    ([\#6721](http://www.rudder-project.org/redmine/issues/6721))

#### Techniques

  - Fixed: Unexpected status for fileAlterationMonitoring
    ([\#6771](http://www.rudder-project.org/redmine/issues/6771))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Olivier Mauras

This is a maintenance release, part of the 2.10 branch. An end-of-life
date has been scheduled for this release (5th December 2015), See our
FAQ for details, on
[the website](https://www.rudder-project.org/site/documentation/faq/#what_is_the_versioning_policy).
As such, it is recommended to upgrade all pre-2.11 installations to 2.11 as
soon as possible to enjoy the latest features and improvements of a more
mature and stable version.

## Rudder 2.10.14 (2015-06-02)

### Changes

#### Agent

  - Allow rudder server to remotely run the agent
    ([\#6553](http://www.rudder-project.org/redmine/issues/6553))

### Bug fixes

#### Web - UI & UX

  - Fixed: Bad RegEx in Groups causes Server to not respond
    ([\#6680](http://www.rudder-project.org/redmine/issues/6680))

#### API

  - Fixed: In group API, attribute and comparator names are case
    sensitive
    ([\#6577](http://www.rudder-project.org/redmine/issues/6577))

#### Performance and scalability

  - Fixed: Do not check dns when checking promises
    ([\#6616](http://www.rudder-project.org/redmine/issues/6616))

#### Server components

  - Fixed: Webdav allow connection from any network, not only allowed
    network
    ([\#6540](http://www.rudder-project.org/redmine/issues/6540))
  - Fixed: Messages forwarded from AIX agent are not dropped on
    relay/server root after being consumed
    ([\#6522](http://www.rudder-project.org/redmine/issues/6522))

#### Techniques

  - Fixed: Typo in Technique "zypper settings"
    ([\#6677](http://www.rudder-project.org/redmine/issues/6677))
  - Fixed: Zypper is called without --non-interactive when filling
    available updates cache
    ([\#6588](http://www.rudder-project.org/redmine/issues/6588))
  - Fixed: Technique "Clock settings" uses Europe/Paris as China's
    timezone
    ([\#6450](http://www.rudder-project.org/redmine/issues/6450))

#### Web - Nodes & inventories

  - Fixed: Error 500 when sending multiple files to inventory endpoint
    ([\#6508](http://www.rudder-project.org/redmine/issues/6508))

#### System integration

  - Fixed: The rudder-agent profile configuration may override the
    system MANPATH
    ([\#6548](http://www.rudder-project.org/redmine/issues/6548))
  - Fixed: Log rotation of reports and slapd is not correctly
    functionnal on redhat, as the server continues to write to the move
    file ([\#6526](http://www.rudder-project.org/redmine/issues/6526))

#### Packaging

  - Fixed: The detect\_os.sh script is not valid
    ([\#6486](http://www.rudder-project.org/redmine/issues/6486))

#### Documentation

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

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Janos Mattyasovszky

This is a bug fix release in the 2.10 series and all installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable
version. When we release a new version of Rudder it has been thoroughly
tested, and we consider the release enterprise-ready for deployment.
This version is declared "stable" since it has proven itself to be
stable in production over a period of several months following general
availability of the release.

## Rudder 2.10.13 (2015-04-13)

### Changes

### Bug fixes

#### Techniques

  - Fixed: Please document usage of line replacement in Enforce a file
    content technique
    ([\#5979](http://www.rudder-project.org/redmine/issues/5979))

#### Initial promises & sys tech

  - Fixed: No reports for Propagate promises component on relay
    ([\#6404](http://www.rudder-project.org/redmine/issues/6404))

#### Documentation

  - Fixed: Improve documentation of archives management
    ([\#6485](http://www.rudder-project.org/redmine/issues/6485))
  - Fixed: Badly explain minimum requierement for Rudder in
    documentation
    ([\#6453](http://www.rudder-project.org/redmine/issues/6453))
  - Fixed: Outdated chapter: Disable automatic regeneration of promises
    ([\#6312](http://www.rudder-project.org/redmine/issues/6312))

#### System integration

  - Fixed: rudder-jetty init script may fail on success
    ([\#5653](http://www.rudder-project.org/redmine/issues/5653))

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

This is a bug fix release in the 2.10 series and all installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable
version. When we release a new version of Rudder it has been thoroughly
tested, and we consider the release enterprise-ready for deployment.
This version is declared "stable" since it has proven itself to be
stable in production over a period of several months following general
availability of the release.

## Rudder 2.10.12 (2015-03-24)

### Changes

### Bug fixes

#### Techniques

  - Fixed: Enforce file content Technique doesn't properly migrate lines
    from outside the zone to the zone
    ([\#6389](http://www.rudder-project.org/redmine/issues/6389))

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

#### Architecture - Dependencies

  - Fixed: Upgrade Liftweb to v2.5.2 (security issue)
    ([\#6426](http://www.rudder-project.org/redmine/issues/6426))

### Release notes

This is a bug fix release in the 2.10 series and all installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable
version. When we release a new version of Rudder it has been thoroughly
tested, and we consider the release enterprise-ready for deployment.
This version is declared "stable" since it has proven itself to be
stable in production over a period of several months following general
availability of the release.

## Rudder 2.10.11 (2015-03-09)

### Changes

### Bug fixes

#### Webapp - Display, home page

  - Fixed: rule and group category ID are not displayed
    ([\#6323](http://www.rudder-project.org/redmine/issues/6323))
  - Fixed: Display UUIDs in rudder web interface in lowercase so they
    can be used directly.
    ([\#6297](http://www.rudder-project.org/redmine/issues/6297))

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

#### System integration

  - Fixed: The rudder-agent package should remove the inittab entry and
    subsystem on AIX, and should not run ldconfig
    ([\#6364](http://www.rudder-project.org/redmine/issues/6364))

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

  - Jean Cardona
  - Florian Heigl

This is a bug fix release in the 2.10 series and all installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable
version. When we release a new version of Rudder it has been thoroughly
tested, and we consider the release enterprise-ready for deployment.
This version is declared "stable" since it has proven itself to be
stable in production over a period of several months following general
availability of the release.

## Rudder 2.10.10 (2015-02-06)

### Changes

#### Tools

  - Server side debug for a single agent
    ([\#6180](http://www.rudder-project.org/redmine/issues/6180))

#### Techniques

  - Add post hook commands and working update for rpm package
    installation
    ([\#3857](http://www.rudder-project.org/redmine/issues/3857))

### Bug fixes

#### Webapp - Display, home page

  - Fixed: Rudder stores too much or too big cookies, causing white page
    with HTTP status: 413: FULL head
    ([\#6146](http://www.rudder-project.org/redmine/issues/6146))

#### Webapp - Node management

  - Fixed: Cannot display software informations on accept new Nodes
    ([\#6155](http://www.rudder-project.org/redmine/issues/6155))
  - Fixed: When adding a line of search criteria, the category and field
    from the line above should be the same on the new line
    ([\#5905](http://www.rudder-project.org/redmine/issues/5905))
  - Fixed: Wrong error message when accepted an already accepted node
    ([\#4895](http://www.rudder-project.org/redmine/issues/4895))
  - Fixed: Can not move node groups with the form
    ([\#4571](http://www.rudder-project.org/redmine/issues/4571))

#### Webapp - Administration

  - Fixed: "Server cannot be contacted at this time" when tring to get
    Event Log details
    ([\#6172](http://www.rudder-project.org/redmine/issues/6172))
  - Fixed: Cleanup expected reports
    ([\#6150](http://www.rudder-project.org/redmine/issues/6150))
  - Fixed: Missing login eventlog
    ([\#6008](http://www.rudder-project.org/redmine/issues/6008))
  - Fixed: Deletion of a Rule will lead to a stacktrace into the diff of
    the related Change Request
    ([\#5374](http://www.rudder-project.org/redmine/issues/5374))
  - Fixed: It is overly slow to show the list of Pending Review or
    Pending Deployment even if the number is 0
    ([\#4359](http://www.rudder-project.org/redmine/issues/4359))
  - Fixed: Jetty should compress the files rotated
    (/var/log/rudder/webapp/\*.log)
    ([\#3916](http://www.rudder-project.org/redmine/issues/3916))

#### API

  - Fixed: Creating a directive via the api, makes it disabled by
    default
    ([\#6200](http://www.rudder-project.org/redmine/issues/6200))
  - Fixed: cannot use "enabled" json parameter in Directive API
    ([\#6176](http://www.rudder-project.org/redmine/issues/6176))
  - Fixed: Technique version cannot be specified with Directive API
    ([\#6174](http://www.rudder-project.org/redmine/issues/6174))
  - Fixed: In API/rules include/exclude is ordered for target parameter
   
    ([\#5982](http://www.rudder-project.org/redmine/issues/5982))/redmine/issues/5389\]\[\#5389\]\])

#### Webapp - Reporting

  - Fixed: When two techniques generated with ncf-builder use the same
    generic method with same parameters, reporting cannot dinstinguish
    them, and reports "Unknown"
    ([\#5389](http://www.rudder-project.org/redmine/issues/5389))

#### Performance and scalability

  - Fixed: Performance of RuleCategory repository requests are bad
    ([\#6133](http://www.rudder-project.org/redmine/issues/6133))
  - Fixed: The way software inventories are saved is totally inefficient
    ([\#6075](http://www.rudder-project.org/redmine/issues/6075))
  - Fixed: Error in the reports archiving process cause log explosion
    ([\#6007](http://www.rudder-project.org/redmine/issues/6007))
  - Fixed: Deleting a directive is VERY slow
    ([\#6207](http://www.rudder-project.org/redmine/issues/6207))

#### Techniques

  - Fixed: wrong group set by SSH key distribution
    ([\#6031](http://www.rudder-project.org/redmine/issues/6031))
  - Fixed: Error output on Time settings at first run
    ([\#6000](http://www.rudder-project.org/redmine/issues/6000))

#### Techniques - System & initial promises

  - Fixed: Root server splaytime is always "5" - should be "0"
    ([\#6164](http://www.rudder-project.org/redmine/issues/6164))
  - Fixed: syntax error in promises.st
    ([\#6131](http://www.rudder-project.org/redmine/issues/6131))
  - Fixed: rudder-agent installation may hang infinitely on Centos
    minimal install due to curl installation
    ([\#6035](http://www.rudder-project.org/redmine/issues/6035))
  - Fixed: Tests on rudder-techinques are broken due to $()
    ([\#5987](http://www.rudder-project.org/redmine/issues/5987))

#### System integration

  - Fixed: rudder-agent-thin: missing /var/rudder/share/man
    ([\#6092](http://www.rudder-project.org/redmine/issues/6092))
  - Fixed: Upgrading rudder-inventory-ldap between two major OS versions
    makes slapd unable to operate because of BerkeleyDB
    ([\#5741](http://www.rudder-project.org/redmine/issues/5741))

#### Packaging

 \* Fixed: Error log when installing rudder-inventory ldap on RHEL6
[\#6032](http://www.rudder-project.org/redmine/issues/6032))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alex Bruni
  - Dennis Cabooter
  - Florian Heigl
  - Lionel Le Folgoc
  - Olivier Mauras

This is a bug fix release in the 2.10 series and all installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable
version. When we release a new version of Rudder it has been thoroughly
tested, and we consider the release enterprise-ready for deployment.
This version is declared "stable" since it has proven itself to be
stable in production over a period of several months following general
availability of the
release.

## Rudder 2.10.9 =\> Not released, major bug in debian installation ([\#6232](http://www.rudder-project.org/redmine/issues/6232))

## Rudder 2.10.8 (2014-12-15)

### Bug fixes

#### Webapp - Configuration management

  - Fixed: System rule are modified when trying to delete a directive
    ([\#5923](http://www.rudder-project.org/redmine/issues/5923))
  - Fixed: It should not be possible to delete system directives
    ([\#5875](http://www.rudder-project.org/redmine/issues/5875))
  - Fixed: Correctly display technique removed from source library
    ([\#5808](http://www.rudder-project.org/redmine/issues/5808))
  - Fixed: Description of default Rule "Global configuration for all
    nodes" is missing a space
    ([\#5788](http://www.rudder-project.org/redmine/issues/5788))
  - Fixed: On directive tree, tooltips does not appear anymore after
    directive update
    ([\#4223](http://www.rudder-project.org/redmine/issues/4223))
  - Fixed: Compliance percents are not sorted correctly
    ([\#5714](http://www.rudder-project.org/redmine/issues/5714))

#### Webapp - Node management

  - Fixed: We can't search for "Name =" for an environment variable name
    in node
    ([\#5644](http://www.rudder-project.org/redmine/issues/5644))
  - Fixed: When creating a Group or a Rule, the category should be set
    to the currently selected category
    ([\#4367](http://www.rudder-project.org/redmine/issues/4367))
  - Fixed: When cloning a group, the group Tree doesn't refresh
    ([\#3796](http://www.rudder-project.org/redmine/issues/3796))

#### Webapp - CFEngine integration

  - Fixed: Splaytime duration must be STRICTLY inferior to the agent
    period to avoid random run frequency
    ([\#5806](http://www.rudder-project.org/redmine/issues/5806))
  - Fixed: License of CFengine Enterprise is not mandatory on
    Enterprise, and should not be enforced by the web interface
    ([\#5761](http://www.rudder-project.org/redmine/issues/5761))

#### Webapp - Display, home page

  - Fixed: Missing files on the load page
    ([\#5867](http://www.rudder-project.org/redmine/issues/5867))

#### API

  - Fixed: Error message when trying to delete a system directive is
    horrible
    ([\#5915](http://www.rudder-project.org/redmine/issues/5915))
  - Fixed: You cannot pass 'include' / 'exclude' targets as json for
    Rule API
    ([\#5786](http://www.rudder-project.org/redmine/issues/5786))
  - Fixed: Using json to create directive is not working with API
    ([\#5778](http://www.rudder-project.org/redmine/issues/5778))
  - Fixed: Group category cannot be read from json parameters
    ([\#5123](http://www.rudder-project.org/redmine/issues/5123))

#### Logging

  - Fixed: Rudder agents crons send far too many mails
    ([\#5190](http://www.rudder-project.org/redmine/issues/5190))

#### Documentation

  - Fixed: Rudder readme is totally out of date and irrelevant
    ([\#5926](http://www.rudder-project.org/redmine/issues/5926))
  - Fixed: User manual doesn't explain how to use Parameters
    ([\#5729](http://www.rudder-project.org/redmine/issues/5729))
  - Fixed: Upgrade procedure in reference manual don't upgrade ncf
    ([\#5285](http://www.rudder-project.org/redmine/issues/5285))
  - Fixed: The relay server docs don't mention what do on nodes
    ([\#4365](http://www.rudder-project.org/redmine/issues/4365))
  - Fixed: Database maintenance chapter doesn't mention automatic
    archiving
    ([\#3960](http://www.rudder-project.org/redmine/issues/3960))

#### Techniques

  - Fixed: Build are failing because the normal ordering is not
    respected in technique motdConfiguration v3.1
    ([\#5959](http://www.rudder-project.org/redmine/issues/5959))
  - Fixed: \[motdConfiguration\] REGEX constraint outside of CONSTRAINT
    block ([\#5440](http://www.rudder-project.org/redmine/issues/5440))

#### System integration

  - Fixed: Require latest version of ncf including fixes for reporting
    ([\#5880](http://www.rudder-project.org/redmine/issues/5880))
  - Fixed: dpkg configure error prevents installing rudder-agent due to
    cf-serverd error
    ([\#5785](http://www.rudder-project.org/redmine/issues/5785))
  - Fixed: Use nxlog instead of Centreon E2S, as it has less
    dependencies, and installs on every windows
    ([\#5762](http://www.rudder-project.org/redmine/issues/5762))
  - Fixed: Call ncf configuration bundle from Rudder, to ensure
    configuration used is correct
    ([\#5597](http://www.rudder-project.org/redmine/issues/5597))
  - Fixed: We can configure the Configuration Repository folder in the
    config file of the Web Interface , but the system Techniques are
    enforcing the location /var/rudder/configuration-repository
    ([\#5347](http://www.rudder-project.org/redmine/issues/5347))
  - Fixed: Missing cfengine man pages
    ([\#4903](http://www.rudder-project.org/redmine/issues/4903))

#### Techniques - System & initial promises

  - Fixed: System techniques can only setup log settings **once** on
    syslog-ng
    ([\#5799](http://www.rudder-project.org/redmine/issues/5799))
  - Fixed: Initial promises are calling undefined body u\_bootstart
    ([\#5997](http://www.rudder-project.org/redmine/issues/5997))

#### Windows agent

  - Fixed: Motd technique only work on Unixes, not on windows
    ([\#5890](http://www.rudder-project.org/redmine/issues/5890))
  - Fixed: Process checking for cf-agent on windows suicide itself
    ([\#5619](http://www.rudder-project.org/redmine/issues/5619))
  - Fixed: Promises on Windows try to download perl
    ([\#5948](http://www.rudder-project.org/redmine/issues/5948))

#### AIX agent

  - Fixed: Technique SSHConfiguration don't reports properly on Aix for
    component "SSH start at boot" if it is already correctly defined
    ([\#5902](http://www.rudder-project.org/redmine/issues/5902))
  - Fixed: Technique SSHConfiguration don't reports properly on Aix for
    component "SSH start at boot"
    ([\#5860](http://www.rudder-project.org/redmine/issues/5860))
  - Fixed: Technique SSHConfiguration v4.0 fails on AIX - and stops
    agent execution
    ([\#5836](http://www.rudder-project.org/redmine/issues/5836))
  - Fixed: Messages sent from an AIX machine via a relay are not
    forwarded correctly
    ([\#5775](http://www.rudder-project.org/redmine/issues/5775))

#### Performance and scalability

  - Fixed: Ldap query to get all software by nodes take ages
    ([\#5803](http://www.rudder-project.org/redmine/issues/5803))

#### Miscellaneous

  - Fixed: Null pointer exception on agentTypes class
    ([\#5816](http://www.rudder-project.org/redmine/issues/5816))
  - Fixed: The definition of the current version of XML format is
    duplicated
    ([\#3352](http://www.rudder-project.org/redmine/issues/3352))

#### Vagrant boxes

  - Fixed: Add a link to rudder-vagrant redmine in Readme
    ([\#5228](http://www.rudder-project.org/redmine/issues/5228))
  - Fixed: For without do in node\_centos6.sh
    ([\#5134](http://www.rudder-project.org/redmine/issues/5134))
  - Fixed: /etc/hosts gets messed up by sed commands
    ([\#4142](http://www.rudder-project.org/redmine/issues/4142))
  - Add a test to check boxes source url
    ([\#5130](http://www.rudder-project.org/redmine/issues/5130))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Florian Heigl
  - Lionel Le Folgoc

This is a bug fix release in the 2.10 series and all installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable
version. When we release a new version of Rudder it has been thoroughly
tested, and we consider the release enterprise-ready for deployment.
This version is declared "stable" since it has proven itself to be
stable in production over a period of several months following general
availability of the release.

## Rudder 2.10.7 (2014-11-18)

### Bug fixes

#### Webapp - Config management

  - Fixed: Number of enties displayed in Rule table is not saved
    ([\#5615](http://www.rudder-project.org/redmine/issues/5615))
  - Fixed: No tooltip displayed when you add a new section in a
    Directive
    ([\#5706](http://www.rudder-project.org/redmine/issues/5706))
  - Fixed: No groups directory in /var/rudder/configuration-repository
    ([\#5509](http://www.rudder-project.org/redmine/issues/5509))
  - Fixed: Rule categories list is not sorted
    ([\#5471](http://www.rudder-project.org/redmine/issues/5471))

#### Webapp - Display, home page

  - Fixed: Popups buttons may not be accessible after window is resized
    ([\#5492](http://www.rudder-project.org/redmine/issues/5492))
  - Fixed: White page with HTTP status: 413: FULL head
    ([\#4378](http://www.rudder-project.org/redmine/issues/4378))

#### Webapp - Node management

  - Fixed: Policies are not regenerated when accepting a node
    ([\#5756](http://www.rudder-project.org/redmine/issues/5756))
  - Fixed: Node details is missing plugin extension points
    ([\#5767](http://www.rudder-project.org/redmine/issues/5767))

#### Techniques

  - Fixed: Technique 'rpmPackageInstallation' v6.0 stores a file in the
    wrong directory
    ([\#5697](http://www.rudder-project.org/redmine/issues/5697))
  - Fixed: Permissions may be applied recursively even if not asked to
    by "filesPermissions" Technique
    ([\#5632](http://www.rudder-project.org/redmine/issues/5632))
  - Rudder is unable to compare two package version correctly
    ([\#5587](http://www.rudder-project.org/redmine/issues/5587))
  - Fixed: It's not possible to update package to latest version
    ([\#5609](http://www.rudder-project.org/redmine/issues/5609))
  - Fixed: Packages are not updated correctly on redhat based systems
    ([\#5608](http://www.rudder-project.org/redmine/issues/5608))
  - Fixed: Zypper Management Technique doesn't behave correctly, and
    should be splitted in two separated techniques
    ([\#5662](http://www.rudder-project.org/redmine/issues/5662))
  - Fixed: Multiline header is added at each run on managed files
    ([\#4650](http://www.rudder-project.org/redmine/issues/4650))
  - Fixed: Zypper technique says skipping but returns UNKNOWN.
    ([\#5493](http://www.rudder-project.org/redmine/issues/5493))
  - Fixed: Generic variables definition forbid '&' character usage
    ([\#5605](http://www.rudder-project.org/redmine/issues/5605))
  - Update all techniques to respect normal ordering
    ([\#5306](http://www.rudder-project.org/redmine/issues/5306))
  - Fixed: Acceptance tests are failing on some techniques
    ([\#5752](http://www.rudder-project.org/redmine/issues/5752))
  - Fixed: On 2.11 rudder-agent, "Repair" status is always defined, even
    if nothing is modified
    ([\#5327](http://www.rudder-project.org/redmine/issues/5327))

#### Relay Servers

  - Fixed: Relay servers keeps sending inventories of their managed
    nodes at every run
    ([\#5462](http://www.rudder-project.org/redmine/issues/5462))
  - Fixed: When a node changes its policy server, the groups
    hasPolicyServer are never updated, and so the promises never make
    their way to them
    ([\#5322](http://www.rudder-project.org/redmine/issues/5322))

#### System integration

  - Fixed: "fatal CFEngine error: in built-in FnCall irange-arg: Integer
    is out of range" when using irange on non-linux plateform
    ([\#5719](http://www.rudder-project.org/redmine/issues/5719))
  - Fixed: Compliance to 0 with "no reports" but Technical reports
    correctly arriving + log about integer out of range for
    executionStatus
    ([\#5569](http://www.rudder-project.org/redmine/issues/5569))

#### Documentation

  - Fixed: Technique upgrade documentation is not correct
    ([\#5611](http://www.rudder-project.org/redmine/issues/5611))
  - Fixed: Update screenshots to be Rudder 2.10 compliant
    ([\#5349](http://www.rudder-project.org/redmine/issues/5349))

#### Inventory (webapp, Fusion)

  - Fixed: Non-unique machine UUID mess up collected inventory
    ([\#4490](http://www.rudder-project.org/redmine/issues/4490))
  - Fixed: Having multiple agents on a node breaks the values of the
    node policy server and node administrator user
    ([\#5583](http://www.rudder-project.org/redmine/issues/5583))

#### Webapp - CFEngine integration

  - Fixed: Two techniques with the same ID leads to strange error about
    git tree ids
    ([\#5614](http://www.rudder-project.org/redmine/issues/5614))

#### Packaging

  - Fixed: We should trigger slibclean on AIX during rudder-agent
    upgrades
    ([\#5733](http://www.rudder-project.org/redmine/issues/5733))
  - Fixed: A Rudder upgrade that leads to a different BDB version usage
    in slapd fails
    ([\#5705](http://www.rudder-project.org/redmine/issues/5705))
  - Fixed: We do not depend on apache2 utilities (and need it to use
    htpasswd)
    ([\#5599](http://www.rudder-project.org/redmine/issues/5599))

#### Performance and scalability

  - Fixed: Webapp checking that CFEngine variables used in Directive are
    correct takes too much time at startup
    ([\#5358](http://www.rudder-project.org/redmine/issues/5358))

#### Miscellaneous

  - Fixed: cf-clerk does not compile with Java 8
    ([\#5657](http://www.rudder-project.org/redmine/issues/5657))

#### Windows integration

  - Fixed: list-comptabile-inputs doesn't work on windows
    ([\#5616](http://www.rudder-project.org/redmine/issues/5616))
  - Fixed: executor daemon command needs to be different on windows for
    it to work
    ([\#5594](http://www.rudder-project.org/redmine/issues/5594))
  - Fixed: System technique make cfengine enterprise copy binairies from
    /opt/rudder, killing itself
    ([\#5590](http://www.rudder-project.org/redmine/issues/5590))
  - Fixed: Handling of inventory fails on Windows
    ([\#5588](http://www.rudder-project.org/redmine/issues/5588))
  - Fixed: The repository for modified files is not activated on Windows
    ([\#5581](http://www.rudder-project.org/redmine/issues/5581))
  - Fixed: Ports used for file copy between Client and Server is not
    correct on Windows, preventing copy on Windows
    ([\#5431](http://www.rudder-project.org/redmine/issues/5431))
  - Fixed: remove use of proxy in curl on Windows, as it is an invalid
    option
    ([\#5429](http://www.rudder-project.org/redmine/issues/5429))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Matthieu Ca.
  - Florian Heigl
  - Lionel le Folgoc
  - Olivier Mauras
  - Alex Tkachenko

This is a bug fix release in the 2.10 series and all installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable
version. When we release a new version of Rudder it has been thoroughly
tested, and we consider the release enterprise-ready for deployment.
This version is declared "stable" since it has proven itself to be
stable in production over a period of several months following general
availability of the release.

## Rudder 2.10.6 (2014-09-24)

### Changes

### Bug fixes

#### Techniques - Sys & init promis

  - Fixed: Tools folder are empty\!
    ([\#5564](http://www.rudder-project.org/redmine/issues/5564))
  - Fixed: Cache generated by list-compatible-inputs is cleared by the
    ncf copy, resulting in perpertual repaired state
    ([\#5513](http://www.rudder-project.org/redmine/issues/5513))
  - Fixed: The script list-compatible-inputs, copied from ncf, cannot be
    copied as the path is invalid
    ([\#5512](http://www.rudder-project.org/redmine/issues/5512))
  - Fixed: System techniques on Windows try to schedule a cron task
    ([\#5441](http://www.rudder-project.org/redmine/issues/5441))
  - Fixed: command to run fusion-inventory on windows fails due to
    parsing error in command line
    ([\#5430](http://www.rudder-project.org/redmine/issues/5430))
  - Fixed: Rewrite initial promises to use normal ordering on 2.10
    ([\#5498](http://www.rudder-project.org/redmine/issues/5498))

#### Techniques

  - Fixed: clock management technique always report repair on Windows
    ([\#5341](http://www.rudder-project.org/redmine/issues/5341))
  - Fixed: User Management Techniques don't reports properly on Windows
    ([\#5340](http://www.rudder-project.org/redmine/issues/5340))
  - Fixed: The Rudder logrotate configuration is not in sync between
    regular and initial promises
    ([\#5544](http://www.rudder-project.org/redmine/issues/5544))
  - Fixed: use list-compatible-inputs from ncf, not from tools
    ([\#5527](http://www.rudder-project.org/redmine/issues/5527))
  - Fixed: Call list-comptible-inputs with /bin/sh
    ([\#5519](http://www.rudder-project.org/redmine/issues/5519))
  - Fixed: Rewrite techniques to use normal ordering on 2.10
    ([\#5507](http://www.rudder-project.org/redmine/issues/5507))
  - Fixed: downloadFile.st contains a syntax error
    ([\#5457](http://www.rudder-project.org/redmine/issues/5457))
  - Fixed: SSH Configuration Technique does not make timestamped version
    of all the version of the ssh config file, like other techiques
    ([\#5344](http://www.rudder-project.org/redmine/issues/5344))
  - Fixed: The Rudder logrotate configuration uses the wrong argument to
    reload rsyslog on Debian Wheezy
    ([\#5486](http://www.rudder-project.org/redmine/issues/5486))
  - Fixed: Add a placeholder for new technique on old versions
    ([\#5463](http://www.rudder-project.org/redmine/issues/5463))

#### Inventory (webapp, Fusion)

  - Fixed: Inventories generated on Windows are not accepted by the
    endpoint
    ([\#5191](http://www.rudder-project.org/redmine/issues/5191))
  - Fixed: FusionInventory: Doesn't display (most) disk sizes
    ([\#4197](http://www.rudder-project.org/redmine/issues/4197))

#### System integration

  - Fixed: error in rudder-upgrade are not clear on service check
    ([\#5500](http://www.rudder-project.org/redmine/issues/5500))
  - Fixed: Tools directory is not always correctly updated on nodes
    ([\#5459](http://www.rudder-project.org/redmine/issues/5459))

#### Webapp - Config management

  - Fixed: Correct HTML: badly closed tag
    ([\#5540](http://www.rudder-project.org/redmine/issues/5540))

#### Packaging

  - Fixed: The strict dependency on ncf in rudder-techniques need to be
    updated
    ([\#5545](http://www.rudder-project.org/redmine/issues/5545))
  - Fixed: remove list-compatible-inputs from tools
    ([\#5532](http://www.rudder-project.org/redmine/issues/5532))
  - Fixed: rudder-techniques should require a specific version of ncf
    ([\#5522](http://www.rudder-project.org/redmine/issues/5522))
  - Fixed: Upgrade rudder-agent can fail if cf-serverd/cf-execd fails to
    stop gracefully
    ([\#4387](http://www.rudder-project.org/redmine/issues/4387))

#### API

  - Fixed: promise not generated, when accepting nodes,
    ([\#5530](http://www.rudder-project.org/redmine/issues/5530))
  - Fixed: Accepting Nodes via API does not trigger policy update
    ([\#5511](http://www.rudder-project.org/redmine/issues/5511))

#### Webapp - Node management

  - Fixed: LDAP error when defining group criteria
    ([\#5504](http://www.rudder-project.org/redmine/issues/5504))
  - Fixed: The Rule compliance explanations in Rudder's web UI are not
    clear ([\#5413](http://www.rudder-project.org/redmine/issues/5413))
  - Fixed: We cannot edit only section of the file with enforce file
    content
    ([\#5301](http://www.rudder-project.org/redmine/issues/5301))

#### Documentation

  - Fixed: Do not use contrib and non-free
    ([\#5181](http://www.rudder-project.org/redmine/issues/5181))

### Release notes

This is a bug fix release in the 2.10 series. All installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable version.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
version is declared "stable" since it has proven itself to be stable in
production over a period of several months following general
availability of the release.

## Rudder 2.10.5 (2014-08-28)

### Changes

### Bug fixes

#### Techniques - System & initial promises

  - Fixed: Agent can't run because some ncf promises are CFEngine 3.6
    specific
    ([\#5402](http://www.rudder-project.org/redmine/issues/5402))
  - Fixed: Promises does not run as expected on a Windows agent
    ([\#5339](http://www.rudder-project.org/redmine/issues/5339))
  - Fixed: Agent can't run on Windows as it can't find ncf promises
    ([\#5224](http://www.rudder-project.org/redmine/issues/5224))

### Release notes

**If you upgrade from 2.8x, 2.9.x or 2.10..x to 2.10.5, there is a
specific upgrade procedure:**

1\. Update the Rudder packages (yum update "rudder-\*" or apt-get
install rudder-server-root

2\. Restart the Web Interface ( /etc/init.d/rudder-jetty restart ), and
wait for it to be fully started, and then click on "Update" on the top
right hand side corner to trigger Policy update

3\. Update the ncf package (yum update ncf or apt-get install ncf)

New installations or upgrades from 2.6.x are not impacted by the issue.

This is a bug fix release in the 2.10 series and all installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable version.
When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
version is declared "stable" since it has proven itself to be stable in
production over a period of several months following general
availability of the release.

## Rudder 2.10.4 (2014-08-13)

### Bug fixes

#### Techniques

  - Fixed: The find call used to get all the files to include in the
    CFEngine run is not usable on AIX
    ([\#5292](http://www.rudder-project.org/redmine/issues/5292))
  - Fixed: Inventory are not correctly generated on Windows
    ([\#5342](http://www.rudder-project.org/redmine/issues/5342))
  - Fixed: Agent run may fail on nodes because some promises have not be
    correctly updated
    ([\#5231](http://www.rudder-project.org/redmine/issues/5231))
  - Fixed: fstab Tehcnique empties all options with Rudder 2.11
    ([\#5328](http://www.rudder-project.org/redmine/issues/5328))
  - Fixed: In checkGenericFileContent v5.0, no answer in post
    modification hook
    ([\#5318](http://www.rudder-project.org/redmine/issues/5318))
  - Fixed: In checkGenericFileContent v5.0, reporting on post
    modification hook can be unknown
    ([\#5312](http://www.rudder-project.org/redmine/issues/5312))
  - Fixed: User Management 3.0 reports No Answer for the password
    component if the password is not set
    ([\#5239](http://www.rudder-project.org/redmine/issues/5239))
  - Fixed: CheckGenericFileContent does not send reports for post
    modification hook when we enforce the content of the file only at
    creatio
    ([\#5208](http://www.rudder-project.org/redmine/issues/5208))
  - Fixed: Incorrect use of commands without their full path in Sudo
    Parameter technique
    ([\#5187](http://www.rudder-project.org/redmine/issues/5187))
  - Fixed: We can't set the SUID/SGID in technique Manage file and
    folders
    ([\#5325](http://www.rudder-project.org/redmine/issues/5325))
  - Fixed: Process management technique uses invalid syntax on CFEngine
    3.5+ ([\#5315](http://www.rudder-project.org/redmine/issues/5315))

#### Web application

  - Fixed: Changes in directives are not taken into account if we only
    change the case of characters
    ([\#5317](http://www.rudder-project.org/redmine/issues/5317))
  - Fixed: The table reportsexecution, storing the agent execution on
    every node, is never emptied, and so can get very big
    ([\#5326](http://www.rudder-project.org/redmine/issues/5326))
  - Fixed: When using several times a generic\_method on same file with
    class\_prefix based on filename, reports will be in "Unknown" and
    "No answer" status
    ([\#5330](http://www.rudder-project.org/redmine/issues/5330))
  - Fixed: Popup content can be displayed outside of popup if content
    grow after intiialisation
    ([\#5314](http://www.rudder-project.org/redmine/issues/5314))

#### Packaging

  - Fixed: On AIX, when the crontab is edited to add
    check\_rudder\_agent, the service cron is not reloaded
    ([\#5310](http://www.rudder-project.org/redmine/issues/5310))
  - Fixed: The check-rudder-agent script tries to use the stat command
    on AIX
    ([\#5198](http://www.rudder-project.org/redmine/issues/5198))
  - Fixed: Missing dependency on net-tools for rudder-agent and
    rudder-thin
    ([\#5199](http://www.rudder-project.org/redmine/issues/5199),
    ([\#5380](http://www.rudder-project.org/redmine/issues/5380))

#### System integration

  - Fixed: Apache documentroot for SLES seems misconfigured
    ([\#5370](http://www.rudder-project.org/redmine/issues/5370))
  - Fixed: Authorized network sometimes have invalid values after
    rudder-init if you add more than one network
    ([\#5103](http://www.rudder-project.org/redmine/issues/5103))

#### Performance and scalability

  - Fixed: Group page is really slow when a lot of groups are defined
    ([\#5277](http://www.rudder-project.org/redmine/issues/5277))
  - Fixed: Promise generation is slowed down because
    expected\_reports.csv file is written multiple times per node
    ([\#5240](http://www.rudder-project.org/redmine/issues/5240))

#### Documentation

  - Fixed: Update screenshots to be Rudder 2.6 compliant
    ([\#5348](http://www.rudder-project.org/redmine/issues/5348))
  - Fixed: Incomplete command to force inventory
    ([\#5205](http://www.rudder-project.org/redmine/issues/5205))
  - Fixed: The documentation says there is no Rudder server packages for
    RHEL 6
    ([\#5204](http://www.rudder-project.org/redmine/issues/5204))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Florian Heigl
  - Lionel Le Folgoc

This is a bug fix release in the 2.10 series and all installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable version.
When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
version is declared "stable" since it has proven itself to be stable in
production over a period of several months following general
availability of the release.

## Rudder 2.10.3 (2014-07-01)

### Changes

### Bug fixes

#### Webapp - Config management

  - Fixed: Cannot open Rule details when a Group contains a quote in its
    name ([\#5068](http://www.rudder-project.org/redmine/issues/5068))

#### Techniques

  - Fixed: In User Management Technique v3.0, if the group is not
    defined, the user is not created because it tries to insert it in
    group ""
    ([\#5149](http://www.rudder-project.org/redmine/issues/5149))
  - Fixed: Sudo techniques can fail on Debian 6 if the original files
    defines Command aliases
    ([\#5140](http://www.rudder-project.org/redmine/issues/5140))
  - Fixed: OpenSSH Techniques (debian3, 4, centos3 and 4): typo in class
    names for OS version
    ([\#5136](http://www.rudder-project.org/redmine/issues/5136)), do not
    set invalid parameters
    ([\#5126](http://www.rudder-project.org/redmine/issues/5126),
    ([\#5127](http://www.rudder-project.org/redmine/issues/5127)), cannot
    configure SSH Server on boot
    ([\#5144](http://www.rudder-project.org/redmine/issues/5144))

#### System integration

  - Fixed: Demo data generates nodes with Nova hosts, but no "demo"
    license is set, so promises generation fails
    ([\#5169](http://www.rudder-project.org/redmine/issues/5169))
  - Fixed: Rsyslog conditonnal cannot accept reports from CFEngine 3.6
    ([\#5099](http://www.rudder-project.org/redmine/issues/5099))
  - Fixed: The script /var/rudder/tools/check\_rsyslog\_version will not
    work with versions containg more digits like "5.10.1"
    ([\#4757](http://www.rudder-project.org/redmine/issues/4757))
  - Fixed: Migration script 'rudder-upgrade-database' displays unwanted
    logs ([\#5125](http://www.rudder-project.org/redmine/issues/5125))

#### Relay Servers

  - Fixed: The UUID passed to rudder-node-to-relay is case sensitive,
    and using wrong case renders the node invisible in webapp
    ([\#5053](http://www.rudder-project.org/redmine/issues/5053))

#### Webapp - Reporting

  - Fixed: On reports (Rule,Node) pages, a warning is displayed in
    javascript console
    ([\#5111](http://www.rudder-project.org/redmine/issues/5111))

#### Packaging

  - Fixed: check-rudder-agent fails if an error occurs during sourcing
    /etc/profile
    ([\#5119](http://www.rudder-project.org/redmine/issues/5119))

#### API

  - Fixed: Can't pass correctly json parameter to group API
    ([\#5122](http://www.rudder-project.org/redmine/issues/5122))

#### Documentation

  - Fixed: Documentation for installing a relay server uses a group only
    available on RHEL/CentOS
    ([\#5026](http://www.rudder-project.org/redmine/issues/5026))
  - Fixed: Documentation states that relay servers are not yet
    available\!
    ([\#5005](http://www.rudder-project.org/redmine/issues/5005))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Cédric Jardin
  - Lionel Le Folgoc
  - Daniel Stan

This is a bug fix release in the 2.10 series and all installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable
version. When we release a new version of Rudder it has been thoroughly
tested, and we consider the release enterprise-ready for deployment.
This version is declared "stable" since it has proven itself to be
stable in production over a period of several months following general
availability of the release.

## Rudder 2.10.2 (2014-06-12)

### Bug fixes

#### Techniques

  - Fixed: Technique rpmPackageInstallation: Specified version is not
    taken into account
    ([\#4999](http://www.rudder-project.org/redmine/issues/4999))
  - Fixed: Technique sshKeyDistribution: ssh keys are not added or
    replaced if they don't finish by equal sign
    ([\#4719](http://www.rudder-project.org/redmine/issues/4719))
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
  - Fixed: Initial promises don't fetch new promises anymore on the
    policy server
    ([\#4992](http://www.rudder-project.org/redmine/issues/4992))
  - Fixed: cf-agent complains about removed constraint
    'host\_licenses\_paid'
    ([\#4970](http://www.rudder-project.org/redmine/issues/4970))
  - Fixed: Typo in site.st causes promise generation to fail
    ([\#5004](http://www.rudder-project.org/redmine/issues/5004))

#### System integration

  - Fixed: check-rudder-agent script fails if run\_interval file does
    not exist
    ([\#4997](http://www.rudder-project.org/redmine/issues/4997))
  - Fixed: Fix typo in rudder-webapp postint: "Restrating syslog..."
    ([\#4976](http://www.rudder-project.org/redmine/issues/4976))

#### Packaging

  - Fixed: Package upgrade can fail if
    /etc//rudder-agent are missing
    ([\#5002](http://www.rudder-project.org/redmine/issues/5002))
  - Fixed: rudder-agent build rely too much on CPAN availability
    ([\#4965](http://www.rudder-project.org/redmine/issues/4965))

#### Documentation

  - Fixed: Documented procedure for Relay Server is invalid
    ([\#4722](http://www.rudder-project.org/redmine/issues/4722))
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

This is a bug fix release in the 2.10 series. All installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable version.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
version is declared "stable" since it has proven itself to be stable in
production over a period of several months following general
availability of the release.

## Rudder 2.10.1 (2014-06-06)

### Changes

#### AIX support

  - Reduce number of dependencies needed by rudder-agent on aix
    ([\#4726](http://www.rudder-project.org/redmine/issues/4726))
  - Upgrade FusionInventory to version 2.3.6 (AIX only)
    ([\#4594](http://www.rudder-project.org/redmine/issues/4594))

### Bug fixes

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
  - Fixed: A policy generation may occur when nothing has changed
    ([\#4859](http://www.rudder-project.org/redmine/issues/4859))
  - Fixed: Missing "Unix Crypt Des" algo type for AIX password
    ([\#4785](http://www.rudder-project.org/redmine/issues/4785))

#### Webapp - Administration

  - Fixed: Changing server security settings should trigger a promise
    generation
    ([\#4640](http://www.rudder-project.org/redmine/issues/4640))
  - Fixed: Reloading Technique library doesn't apply changes to
    generated promises
    ([\#4706](http://www.rudder-project.org/redmine/issues/4706))
  - Fixed: Editing a Directive, after creating/cloning, does not show
    the workflow popup nor redirect to the change request
    ([\#4357](http://www.rudder-project.org/redmine/issues/4357))

#### Webapp - Reporting

  - Fixed: Reports cannot be inserted into postgresql due to a limit on
    ids ([\#4831](http://www.rudder-project.org/redmine/issues/4831))

#### Webapp - CFEngine integration

  - Fixed: Unconsistencies on generated promise due to bug on comparison
    logic between them
    ([\#4878](http://www.rudder-project.org/redmine/issues/4878))

#### API

  - Fixed: Latest API prefix is not correct
    ([\#4800](http://www.rudder-project.org/redmine/issues/4800))
  - Fixed: Node API version 4 can only get Node details
    ([\#4796](http://www.rudder-project.org/redmine/issues/4796))
  - Fixed: Detail level passed as parameter is not used in node api
    version 4
    ([\#4729](http://www.rudder-project.org/redmine/issues/4729))

#### Techniques

  - Fixed: CheckGenericFileContent can have several "repaired" status on
    each of the different component, even is the end state is convergent
    ([\#4805](http://www.rudder-project.org/redmine/issues/4805))
  - Fixed: Technique "Package management for Debian / Ubuntu / APT
    systems", typo in the option to install an earlier package
    ([\#4754](http://www.rudder-project.org/redmine/issues/4754))
  - Fixed: Rudder causes RHEL nodes to be blacklisted in RHN due to
    intensive yum usage
    ([\#3855](http://www.rudder-project.org/redmine/issues/3855))
  - Fixed: Job Scheduler Technique should not use ifelapsed to avoid
    running several time same job
    ([\#4841](http://www.rudder-project.org/redmine/issues/4841))
  - Fixed: Technique "APT package manager configuration": Rudder file
    header is not added correctly in repository files
    ([\#4809](http://www.rudder-project.org/redmine/issues/4809))
  - Fixed: Technique "Download a file from the shared folder " fails to
    report correctly on AIX
    ([\#4764](http://www.rudder-project.org/redmine/issues/4764))
  - Fixed: Adapt Techniques to support Android in 2.10
    ([\#4741](http://www.rudder-project.org/redmine/issues/4741))
  - Fixed: On AIX, several techniques try to use the group "root"
    ([\#4705](http://www.rudder-project.org/redmine/issues/4705))

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
  - Fixed: The Techniques should use user crontabs on AIX instead of
    cron.d
    ([\#4907](http://www.rudder-project.org/redmine/issues/4907))
  - Fixed: Add skipidentify cofniguration on Android devices
    ([\#4749](http://www.rudder-project.org/redmine/issues/4749))
  - Fixed: initial promises don't detect basic Rudder inventory
    requirements (machine ID, CFEngine key, CFEngine user, users...) on
    non Linux/Windows/Android systems
    ([\#4696](http://www.rudder-project.org/redmine/issues/4696))
  - Fixed: Reports from AIX nodes don't get parsed due to an erroneous
    date format
    ([\#4703](http://www.rudder-project.org/redmine/issues/4703))
  - Fixed: syslogd support partially broken: "\*" is not always
    supported for priority, and reload command varies on AIX
    ([\#4702](http://www.rudder-project.org/redmine/issues/4702))
  - Fixed: cf-agent fails on systems that don't support "find . -not
    ..." (AIX, in particular)
    ([\#4700](http://www.rudder-project.org/redmine/issues/4700))
  - Fixed: Rudder Techniques try to call miniperl with a wrong
    authenticate argument
    ([\#4825](http://www.rudder-project.org/redmine/issues/4825))
  - Fixed: There are StringTemplate variables in the initial-promises
    ([\#4824](http://www.rudder-project.org/redmine/issues/4824))
  - Fixed: The script /var/rudder/tools/check\_rsyslog\_version will not
    work without absolute path of rsyslogd
    ([\#4758](http://www.rudder-project.org/redmine/issues/4758))
  - Fixed: The initial promises are missing a class definition for
    force\_inventory when /opt/rudder/etc/force\_inventory is here
    ([\#4765](http://www.rudder-project.org/redmine/issues/4765))
  - Fixed: Permit script check\_rsyslog\_version to stop if an error is
    encountered
    ([\#4869](http://www.rudder-project.org/redmine/issues/4869))
  - Fixed: policy\_server.dat file is not read on Nodes if its size
    exceed 40 bytes
    ([\#4921](http://www.rudder-project.org/redmine/issues/4921))

#### Relay Servers

  - Fixed: Promises generation fails on relay server
    ([\#4716](http://www.rudder-project.org/redmine/issues/4716))
  - Fixed: cf-agent -KI doesn't work with relay feature
    ([\#4747](http://www.rudder-project.org/redmine/issues/4747))

#### Packaging

  - Fixed: Rudder init script may not correctly initialize
    policy\_server.dat file, resulting in a non functionning Rudder
    server
    ([\#4915](http://www.rudder-project.org/redmine/issues/4915))
  - Fixed: An AIX selection condition is wrong in rudder-agent SPECfile
    ([\#4957](http://www.rudder-project.org/redmine/issues/4957))
  - Fixed: AIX rudder-agent packages are missing a dependency against
    tokyocabinet
    ([\#4951](http://www.rudder-project.org/redmine/issues/4951))
  - Fixed: The check-rudder-agent fix of cf\_lock uses echo -n, which is
    uncompatible with AIX
    ([\#4925](http://www.rudder-project.org/redmine/issues/4925))
  - Fixed: The rudder-webapp post installation script tries to call
    /etc/init.d/jetty instead of rudder-jetty on Debian based systems
    ([\#4920](http://www.rudder-project.org/redmine/issues/4920))
  - Fixed: check-rudder-agent should source /etc/profile before starting
    ([\#4908](http://www.rudder-project.org/redmine/issues/4908))
  - Fixed: The rudder-agent package tries to use an broken
    pre-installation script on AIX
    ([\#4886](http://www.rudder-project.org/redmine/issues/4886))
  - Fixed: rudder-agent RPM packages do not detect AIX properly in some
    cases ([\#4879](http://www.rudder-project.org/redmine/issues/4879))
  - Fixed: rudder-agent package build fails on debian-type OS because it
    can't find FusionInventory code
    ([\#4830](http://www.rudder-project.org/redmine/issues/4830))
  - Fixed: The rudder-agent postinstall script tries to backup sysV type
    init scripts on AIX
    ([\#4801](http://www.rudder-project.org/redmine/issues/4801))
  - Fixed: AIX service management for rudder-agent has some bugs
    ([\#4704](http://www.rudder-project.org/redmine/issues/4704))
  - Fixed: RPM postinst and check-rudder-agent fail on AIX because our
    "uuidgen" is not executable
    ([\#4698](http://www.rudder-project.org/redmine/issues/4698))
  - Fixed: On AIX, check-rudder-agent script complains uses nonexistant
    options for ps and echo
    ([\#4695](http://www.rudder-project.org/redmine/issues/4695))

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
    is not behaving properly, and node is in NoAnswer state
    ([\#4613](http://www.rudder-project.org/redmine/issues/4613))
  - Fixed: check-rudder-agent does not adapt it's check rate to the
    agent frequency
    ([\#4766](http://www.rudder-project.org/redmine/issues/4766))

#### Inventory (webapp, Fusion)

  - Fixed: Solaris Node are not correctly identified by Rudder inventory
    process
    ([\#4701](http://www.rudder-project.org/redmine/issues/4701))
  - Fixed: Network interface sharing the ip adress are ignored by the
    inventory parser
    ([\#4883](http://www.rudder-project.org/redmine/issues/4883))
  - Fixed: Process start date are displayed as "bad format" in Rudder
    web interface
    ([\#4742](http://www.rudder-project.org/redmine/issues/4742))
  - Fixed: FusionInventory may report duplicated Network interfaces on
    AIX system, causing Rudder to ignore them
    ([\#4882](http://www.rudder-project.org/redmine/issues/4882))
  - Fixed: Get Technology Level and Service pack from AIX inventories
    ([\#4727](http://www.rudder-project.org/redmine/issues/4727))
  - Fixed: Add missing information about microcode version of Power
    system in AIX
    ([\#4725](http://www.rudder-project.org/redmine/issues/4725))
  - Fixed: processes start date in AIX inventory displayed as "Bad
    format'
    ([\#4721](http://www.rudder-project.org/redmine/issues/4721))
  - Fixed: Inventories from AIX machines fail with "invalid structural
    object class chain (aixNode/unixNode)" error
    ([\#4699](http://www.rudder-project.org/redmine/issues/4699))
  - Fixed: Rudder does not report the Virtual Machine type correctly on
    AIX LPARs
    ([\#4826](http://www.rudder-project.org/redmine/issues/4826))

#### Documentation

  - Fixed: The documentation entry concerning the ramdisk state
    directory gives a wrong mount mode
    ([\#4792](http://www.rudder-project.org/redmine/issues/4792))
  - Fixed: The documentation entry concerning the ramdisk state
    directory gives wrong mount options
    ([\#4788](http://www.rudder-project.org/redmine/issues/4788))
  - Fixed: Update documentation for LDAP authentication
    ([\#4680](http://www.rudder-project.org/redmine/issues/4680))

#### Logging

  - Fixed: A developpment log line is displayed when saving Directive
    edit form
    ([\#4660](http://www.rudder-project.org/redmine/issues/4660))

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

This is a bug fix release in the 2.10 series. All installations of
2.10.x should be upgraded when possible. It is recommended to upgrade
all pre-2.10 installations to 2.10 as soon as possible to enjoy the
latest features and improvements of a more mature and stable version.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
version is declared "stable" since it has proven itself to be stable in
production over a period of several months following general
availability of the release.

## Rudder 2.10.0 (2014-03-28)

### Changes

#### Packaging

  - Support for AIX (agent only)
    ([\#4595](http://www.rudder-project.org/redmine/issues/4595))
  - Harmonize the package maintainers of all Rudder packages
    ([\#4667](http://www.rudder-project.org/redmine/issues/4667))

#### Webapp - Administration

  - Harmonize display of new parameters with others in 'Settings' page
    ([\#4668](http://www.rudder-project.org/redmine/issues/4668))

#### Webapp - Display, home page

  - Add Rudder 2.10 logo: Catamaran
    ([\#4676](http://www.rudder-project.org/redmine/issues/4676))
  - Rename "Rule deployment" to "Policy update"
    ([\#4308](http://www.rudder-project.org/redmine/issues/4308))

#### Documentation

  - Fixed: Update refrences in documentation to Rudder 2.10
    ([\#4715](http://www.rudder-project.org/redmine/issues/4715))

### Bug fixes

#### Webapp - Administration

  - Fixed: Changing agent settings (server security, agent
    frequency,...) should launch a new promise generation
    ([\#4661](http://www.rudder-project.org/redmine/issues/4661),
    ([\#4640](http://www.rudder-project.org/redmine/issues/4640))

#### Webapp - Configuration

  - Fixed: Editing a Directive, after creating/cloning, does not show
    the workflow popup nor redirect to the change request
    ([\#4357](http://www.rudder-project.org/redmine/issues/4357))

#### System integration

  - Fixed: Authentication to Rudder from LDAP should not require to
    touch WAR file
    ([\#4403](http://www.rudder-project.org/redmine/issues/4403))
  - Fixed: Missing property 'rudder.debug.nodeconfiguration.path' in
    configuration file
    ([\#4542](http://www.rudder-project.org/redmine/issues/4542))
  - Fixed: A race condition may occur during rudder-server-root
    initialization
    ([\#4635](http://www.rudder-project.org/redmine/issues/4635))
  - Fixed: The script rudder-init.sh should not output CFEngine
    execution, and keep the output of all commands in the log
    ([\#4634](http://www.rudder-project.org/redmine/issues/4634))

#### Logging

  - Fixed: A developpment log line is displayed when saving Directive
    edit form
    ([\#4660](http://www.rudder-project.org/redmine/issues/4660))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Olivier Mauras

This version of Rudder is a final release. We have tested it thoroughly
and believe it to be free of any major bugs. However, this branch is not
marked "stable", since it still has to be proven reliable on production
systems over a period of several months. The current "stable" release is
2.6.\*.

## Rudder 2.10.0~beta1 (2014-03-21)

### Changes

#### Webapp - CFEngine integration

  - Make the agent run schedule configurable from 5 minutes to 6 hours,
    with configurable offset and splay time
    ([\#3679](http://www.rudder-project.org/redmine/issues/3679))
  - Make the retention time for modified-files configurable in the web
    interface
    ([\#4369](http://www.rudder-project.org/redmine/issues/4369)), Change
    default value for outputs from 30 days to 7 days
    ([\#4651](http://www.rudder-project.org/redmine/issues/4651))

#### Webapp - Reporting

  - Add a new kind of reports: report the fact that there was nothing to
    do instead of reporting a success
    ([\#4550](http://www.rudder-project.org/redmine/issues/4550))
  - When a report was not received, call it "No report" instead of "No
    Answer" in compliance details
    ([\#4662](http://www.rudder-project.org/redmine/issues/4662))

#### Webapp - Config management

  - Allow exclusion and composition of groups to gain more flexibility
    in Nodes targeted by a Rule
    ([\#4505](http://www.rudder-project.org/redmine/issues/4505))

#### Performance and scalability

  - When generating promises, use a cache for template file
    ([\#4521](http://www.rudder-project.org/redmine/issues/4521))
  - Avoid useless requests and commits in SQL database
    ([\#4428](http://www.rudder-project.org/redmine/issues/4428))
  - Keep only the LDIF dump of the inventory when we accept/refuse it,
    not every time we receive a new inventory
    ([\#4560](http://www.rudder-project.org/redmine/issues/4560))
  - Don't write execution report in several log files
    ([\#4520](http://www.rudder-project.org/redmine/issues/4520))
  - Rudder agents run times should be splayed a maximum to ensure
    maximum scalability
    ([\#4451](http://www.rudder-project.org/redmine/issues/4451))
  - allowusers is duplicated in cf-served.cf
    ([\#4444](http://www.rudder-project.org/redmine/issues/4444))

#### API

  - Add information from inventory when looking for Nodes through Rest
    API ([\#4578](http://www.rudder-project.org/redmine/issues/4578))
  - Improve API JSON answers prettification
    ([\#4618](http://www.rudder-project.org/redmine/issues/4618))

#### Techniques

  - Unix Support
    ([\#3288](http://www.rudder-project.org/redmine/issues/3288))

#### Webapp - Administration

  - Rename "change message" feature to "change audit log" and add more
    explanations
    ([\#4153](http://www.rudder-project.org/redmine/issues/4153))

#### Inventory (webapp, Fusion)

  - Support \!FusionInventory version 2.3
    ([\#4663](http://www.rudder-project.org/redmine/issues/4663))

#### System integration

  - Rename jetty and slapd init scripts and defaults files to
    rudder-jetty and rudder-slapd
    ([\#4510](http://www.rudder-project.org/redmine/issues/4510))
  - Upgrade version of jetty (7.6.14) in Rudder packages
    ([\#4477](http://www.rudder-project.org/redmine/issues/4477))
  - Rudder 2.10 will not support upgrades from any version older than
    2.6.\*
    ([\#4413](http://www.rudder-project.org/redmine/issues/4413))
  - Support Rudder agent on AIX 5.3+
    ([\#4459](http://www.rudder-project.org/redmine/issues/4459)),
    building less verbose
    ([\#4587](http://www.rudder-project.org/redmine/issues/4587)), reset
    Epoch to 0 by default
    ([\#4563](http://www.rudder-project.org/redmine/issues/4563)), Remove
    deprecated package rudder-cfengine-community
    ([\#4561](http://www.rudder-project.org/redmine/issues/4561))

#### Architecture - Refactoring

  - Ease new REST APIs creation
    ([\#4600](http://www.rudder-project.org/redmine/issues/4600))

### Bug fixes

#### Performance and scalability

  - Fixed: Promise generation takes too long when getting more and more
    nodes ([\#4242](http://www.rudder-project.org/redmine/issues/4242))
  - Fixed: Rudder web UI freezes when too many inventory are received at
    the same time
    ([\#4497](http://www.rudder-project.org/redmine/issues/4497))
  - Fixed: Promise generation process should not lose time by forking to
    run "/bin/true"
    ([\#4475](http://www.rudder-project.org/redmine/issues/4475))
  - Fixed: cf-serverd looks up reverse DNS for ALL nodes at start up
    ([\#4442](http://www.rudder-project.org/redmine/issues/4442))
  - Fixed: Duplicated list of nodes authorized to connect to the policy
    server in the generated promises
    ([\#4642](http://www.rudder-project.org/redmine/issues/4642))

#### Webapp - Node management

  - Fixed: duplicated IP addresses across nodes are not accepted,
    preventing to handle NAT
    ([\#4429](http://www.rudder-project.org/redmine/issues/4429))

#### Techniques - System & initial promises

  - Fixed: Remove unused variables ADMIN, POLICYCHILDREN and CHILDRENID
    from "common" system technique metadata
    ([\#4573](http://www.rudder-project.org/redmine/issues/4573))

#### Packaging

  - Fixed: rudder-jetty does not consider /etc/default/jetty as a
    configuration file and replace it silently during upgrade
    ([\#3929](http://www.rudder-project.org/redmine/issues/3929))
  - Fixed: Missing files to build 'rudder-agent' SRPM as standalone
    ([\#4466](http://www.rudder-project.org/redmine/issues/4466))

### Release notes

This software is in beta status and contains a lots of new features. We
have tested it and believe it to be free of any critical bugs. The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!

