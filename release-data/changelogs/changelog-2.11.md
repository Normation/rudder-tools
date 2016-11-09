# Change logs for Rudder 2.11.\* versions

Rudder 2.11 is currently the **old-esr** of Rudder. This version is
codenamed "**Perahu**". End of life is scheduled for 10 September 2016

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Main new features in Rudder 2.11:**

  - Add a "quick search" box for nodes at the top right of the web
    interface
  - Data in Rudder web interface table can now be refreshed and are now
    treated asynchronously as JSON
  - Allow splitting Rudder server into independent role-based entities
  - ncf-builder, a web interface to edit your techniques based on ncf
    (http://www.ncf.io/)
  - Upgrade rudder-agent versions: CFEngine 3.6, Fusion Inventory 2.3.6
  - Compress inventories before sending to the server using gzip
  - Add links to Directives in the Rule page
  - Add logs of package install actions for debug
  - Make writing reports in all.log configurable from Rudder
    administration page
  - Make promise generation faster: Optimization on variable lookup
  - Default account has changed, now use "admin" with password "admin"
    to connect

**Installing, upgrading and testing**

Documentation:

  - Install:
    https://www.rudder-project.org/doc-2.11/_install_rudder_server.html
  - Upgrade:
    https://www.rudder-project.org/doc-2.11/_upgrade_rudder.html

The Download Links are available here:
https://www.rudder-project.org/site/get-rudder/downloads/.

We also recommend using the [Rudder
Vagrant](https://github.com/Normation/rudder-vagrant) config if you want
a quick and easy way to get an installation for testing.

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server: **Debian 7, RHEL/CentOS 6, SLES 11, Ubuntu 12.04,
    Ubuntu 14.04**
  - Rudder agent: all of the above plus **Debian 5, Debian 6,
    RHEL/CentOS 3, RHEL/CentOS 5, Fedora 18, SLES 10, Ubuntu 10.04,
    Ubuntu 12.10**
  - Rudder agent (non-free):  **Windows Server 2008-2012** ,  **AIX
    5-6-7**

## Rudder 2.11.24 (2016-08-30)

### Changes

#### Web - Technique editor

  - Add 'Windows Server 2012 R2' as OS condition
    ([\#8071](http://www.rudder-project.org/redmine/issues/8071))

#### Documentation

  - Generate a custom index page for the manual
    ([\#8488](http://www.rudder-project.org/redmine/issues/8488))

#### Techniques

  - Download technique-files from Rudder website
    ([\#8853](http://www.rudder-project.org/redmine/issues/8853))

### Bug fixes

#### Web - Config management

  - Fixed: Unable to save/edit a directive via rudder web ui when
    technique use an optionnal SELECT field
    ([\#8874](http://www.rudder-project.org/redmine/issues/8874))
  - Fixed: Typo in cf-clerk logs
    ([\#8823](http://www.rudder-project.org/redmine/issues/8823))
  - Fixed: When there is an error in a directive form, the target rule
    is unchecked
    ([\#8696](http://www.rudder-project.org/redmine/issues/8696))

#### Web - UI & UX

  - Fixed: Cannot see rule details when you have read\_only role
    ([\#8878](http://www.rudder-project.org/redmine/issues/8878))
  - Fixed: When no editing rights are given to Groups, you drag an drop
    them between categories
    ([\#8863](http://www.rudder-project.org/redmine/issues/8863))
  - Fixed: "Update techniques now" button on the techniques screen is
    too small
    ([\#8616](http://www.rudder-project.org/redmine/issues/8616))

#### Web - Technique editor

  - Fixed: New method calls are considered valid, although they are
    empty which leads to error when validated via API
    ([\#8829](http://www.rudder-project.org/redmine/issues/8829))
  - Fixed: Warn when the string length reaches the maximum value
    supported by the agent
    ([\#8261](http://www.rudder-project.org/redmine/issues/8261))
  - Fixed: ncf still loads mp.autofocus module that was deleted\!
    ([\#8793](http://www.rudder-project.org/redmine/issues/8793))

#### Documentation

  - Fixed: Safe setup of the Rudder repo in the manual
    ([\#8864](http://www.rudder-project.org/redmine/issues/8864))

#### Techniques

  - Fixed: ncf template methods do not empty file before editing it
    ([\#8843](http://www.rudder-project.org/redmine/issues/8843))

#### Initial promises & sys tech

  - Fixed: Typo in system techniques reports
    ([\#8841](http://www.rudder-project.org/redmine/issues/8841))

#### Packaging

  - Fixed: Do not depend on pam-devel on AIX
    ([\#8893](http://www.rudder-project.org/redmine/issues/8893))
  - Fixed: Missing BuildRequires for rudder-agent : pam-devel
    ([\#8822](http://www.rudder-project.org/redmine/issues/8822))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alexandre Anriot
  - Avit Sidis

This is a bug fix release in the 2.11 'old-esr' series and therefore all
installations of 2.11.x should be upgraded when possible. The current
"esr" release is now 3.1.\* and there we advice to upgrade to the latest
3.1.\* version. When we release a new version of Rudder it has been
thoroughly tested, and we consider the release enterprise-ready for
deployment.

## Rudder 2.11.23 (2016-07-29)

### Changes

#### Documentation

  - Use release-info to generate the manual header at creation
    ([\#8450](http://www.rudder-project.org/redmine/issues/8450))

### Bug fixes

#### Web - UI & UX

  - Fixed: The API token creation popup is not centered
    ([\#8592](http://www.rudder-project.org/redmine/issues/8592))

#### Web - Nodes & inventories

  - Fixed: Inventory messes up Last logged in user date when last user
    was a reboot
    ([\#8239](http://www.rudder-project.org/redmine/issues/8239))

#### Agent

  - Fixed: command\_execution\_result with undefined code does not
    define any classes on 2.11
    ([\#8723](http://www.rudder-project.org/redmine/issues/8723))

#### Initial promises & sys tech

  - Fixed: Use the list-compatible-input equivalent on Windows system
    ([\#8553](http://www.rudder-project.org/redmine/issues/8553))
  - Fixed: Update promises on Windows complains about setting ownership
    to "root"
    ([\#8532](http://www.rudder-project.org/redmine/issues/8532))

#### Techniques

  - Fixed: technique-files cannot find with a pattern on the whole
    technique name
    ([\#8736](http://www.rudder-project.org/redmine/issues/8736))
  - Fixed: lines after \&endif& in techniques
    ([\#8647](http://www.rudder-project.org/redmine/issues/8647))
  - Fixed: technique-metadata-sample.xml has invalid content
    ([\#8615](http://www.rudder-project.org/redmine/issues/8615))
  - Fixed: UserManagement 6.0 fails to add user if the user's default
    group already exists
    ([\#8599](http://www.rudder-project.org/redmine/issues/8599))
  - Fixed: Reporting for usermanagement in case of Policy to apply to
    this account "check only" is missing the Password component report
    ([\#8585](http://www.rudder-project.org/redmine/issues/8585))
  - Fixed: userManagement technique doesn't do anything on Windows on
    version 5 and 6
    ([\#8566](http://www.rudder-project.org/redmine/issues/8566))
  - Fixed: checkGenericFile missing report when given non absolute path
    ([\#8405](http://www.rudder-project.org/redmine/issues/8405))
  - Fixed: Add a technique check to make sure \&endif& are followed by
    an empty line
    ([\#8646](http://www.rudder-project.org/redmine/issues/8646))

#### API

  - Fixed: Inconsistent directive API parameters at creation
    ([\#8687](http://www.rudder-project.org/redmine/issues/8687))
  - Fixed: NoSuchElementException when querying change request API
    ([\#8686](http://www.rudder-project.org/redmine/issues/8686))

#### Documentation

  - Fixed: Documentation makefile fails to update git repos (git pull
    before changing branch)
    ([\#8788](http://www.rudder-project.org/redmine/issues/8788))
  - Fixed: Display link errors in doc build
    ([\#8727](http://www.rudder-project.org/redmine/issues/8727))
  - Fixed: SLES Documentation has bad package name
    ([\#8624](http://www.rudder-project.org/redmine/issues/8624))
  - Fixed: Left menu is sometimes broken when there is an anchor in the
    link ([\#8569](http://www.rudder-project.org/redmine/issues/8569))
  - Fixed: Fix doc after ncf lib changes (same as \#8522)
    ([\#8524](http://www.rudder-project.org/redmine/issues/8524))
  - Fixed: Add a test for dead links on the doc
    ([\#8548](http://www.rudder-project.org/redmine/issues/8548))

#### Packaging

  - Fixed: There is a non standard test in os detection
    ([\#8760](http://www.rudder-project.org/redmine/issues/8760))
  - Fixed: Packages should remove their temporary files
    ([\#8744](http://www.rudder-project.org/redmine/issues/8744))
  - Fixed: Update openssl to 1.0.1t on 2.11 branch
    ([\#8658](http://www.rudder-project.org/redmine/issues/8658))
  - Fixed: rudder-apache-common.conf is not updated on upgrade with RPM
    packages
    ([\#8641](http://www.rudder-project.org/redmine/issues/8641))
  - Fixed: Do not only build-depend on virtual packages
    ([\#8565](http://www.rudder-project.org/redmine/issues/8565))
  - Fixed: Do not package technique tests
    ([\#8679](http://www.rudder-project.org/redmine/issues/8679))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Janos Mattyasovszky
  - Florian Heigl

This is a bug fix release in the 2.11 'old-esr' series and therefore all
installations of 2.11.x should be upgraded when possible. The current
"esr" release is now 3.1.\* and there we advice to upgrade to the latest
3.1.\* version. When we release a new version of Rudder it has been
thoroughly tested, and we consider the release enterprise-ready for
deployment.

## Rudder 2.11.22 (2016-06-08)

### Changes

#### Documentation

  - Add tests for doc syntax
    ([\#8443](http://www.rudder-project.org/redmine/issues/8443))

### Bug fixes

#### Web - Compliance & node report

  - Fixed: Parallel traversal of new promises directories causes some
    nodes promises to not be updated
    ([\#8427](http://www.rudder-project.org/redmine/issues/8427))

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

#### Packaging

  - Fixed: stty does not handle no-tty input
    ([\#8426](http://www.rudder-project.org/redmine/issues/8426))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Janos Mattyasovszky
  - Daniel Stan

This is a bug fix release in the 2.11 'old-esr' series and therefore all
installations of 2.11.x should be upgraded when possible. The current
"esr" release is now 3.1.\* and there we advice to upgrade to the latest
3.1.\* version. When we release a new version of Rudder it has been
thoroughly tested, and we consider the release enterprise-ready for
deployment.

## Rudder 2.11.21 (2016-06-01, Not announced)

That version was not released due to several bugs:
[\#8423](http://www.rudder-project.org/redmine/issues/8423),
[\#8427](http://www.rudder-project.org/redmine/issues/8427),
[\#8430](http://www.rudder-project.org/redmine/issues/8430)

### Changes

#### Web - Nodes & inventories

  - Make page node details/search node less confusing
    ([\#7642](http://www.rudder-project.org/redmine/issues/7642))

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

#### Web - Config management

  - Fixed: Node configuration cache is invalidated too often
    ([\#8246](http://www.rudder-project.org/redmine/issues/8246))

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

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alexandre Anriot
  - Jean Cardona
  - Janos Mattyasovszky
  - David Svejda

This is a bug fix release in the 2.11 'old-esr' series and therefore all
installations of 2.11.x should be upgraded when possible. The current
"esr" release is now 3.1.\* and there we advice to upgrade to the latest
3.1.\* version. When we release a new version of Rudder it has been
thoroughly tested, and we consider the release enterprise-ready for
deployment.

## Rudder 2.11.20 (2016-04-18)

### Changes

#### Web - Nodes & inventories

  - Exit sending inventory to rudder-webapp if the queue is full
    ([\#7291](http://www.rudder-project.org/redmine/issues/7291))

### Bug fixes

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

#### Server components

  - Fixed: node-to-relay fails to reload policy when proxy is set
    ([\#8054](http://www.rudder-project.org/redmine/issues/8054))
  - Fixed: Compress ldif backups
    ([\#6714](http://www.rudder-project.org/redmine/issues/6714))\]\[\#7900\]\])

#### Initial promises & sys tech

  - Fixed: Do not backup modified promise files and encrypt ncf/local
    transfer
    ([\#8159](http://www.rudder-project.org/redmine/issues/8159))

#### Architecture - Refactoring

  - Fixed: Bad logs for event log migration since \#8085
    ([\#8124](http://www.rudder-project.org/redmine/issues/8124))
  - Remove trailing space in code file that make merge conflicts
    ([\#8126](http://www.rudder-project.org/redmine/issues/8126))

#### Architecture - Internal libs

  - Fixed: java.util.regex.PatternSyntaxException: Unexpected internal
    error near index 1 on windows
    ([\#7935](http://www.rudder-project.org/redmine/issues/7935))

#### Documentation

  - Fixed: API documentation for compliance needs JSON prettified
    ([\#7900](http://www.rudder-project.org/redmine/issues/7900))

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

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Janos Mattyasovszky

This is a bug fix release in the 2.11 'old-esr' series and therefore all
installations of 2.11.x should be upgraded when possible. The current
"esr" release is now 3.1.\* and there we advice to upgrade to the latest
3.1.\* version. When we release a new version of Rudder it has been
thoroughly tested, and we consider the release enterprise-ready for
deployment.

## Rudder 2.11.18 (2016-01-21)

### Changes

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

#### Web - UI & UX

  - Fixed: Filter keeps applied between Rules Tables within Directives
    page ([\#7754](http://www.rudder-project.org/redmine/issues/7754))
  - Fixed: Typo in AGENT RUN SCHEDULE description
    ([\#7749](http://www.rudder-project.org/redmine/issues/7749))

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

#### Documentation

  - Fixed: Fix use links containing emphasized keywords in manual
    ([\#7812](http://www.rudder-project.org/redmine/issues/7812))
  - Fixed: The size of one image is not correctly recognized in the doc
    ([\#7713](http://www.rudder-project.org/redmine/issues/7713))
  - Fixed: Some titles broken in the documentation
    ([\#7551](http://www.rudder-project.org/redmine/issues/7551))
  - Fixed: Wrong anchors in Rudder API doc
    ([\#6694](http://www.rudder-project.org/redmine/issues/6694))

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

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Florian Heigl
  - Alex Tkachenko

This is a bug fix release in the 2.11 'esr' series and therefore all
installations of 2.11.x should be upgraded when possible. When we
release a new version of Rudder it has been thoroughly tested, and we
consider the release enterprise-ready for deployment.

## Rudder 2.11.17 (2015-12-10)

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

#### Web - Nodes & inventories

  - Fixed: Tag FULL\_NAME missing from SLES12 inventory
    ([\#7559](http://www.rudder-project.org/redmine/issues/7559))
  - Fixed: Inventory \ content differs from hostname --fqdn and
    may lead to unauthorised nodes
    ([\#7031](http://www.rudder-project.org/redmine/issues/7031))

#### Web - UI & UX

  - Fixed: Clone rule window too small
    ([\#7397](http://www.rudder-project.org/redmine/issues/7397))

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

#### Documentation

  - Fixed: Add a section about ncf-builder and its integration wihin
    Rudder
    ([\#6305](http://www.rudder-project.org/redmine/issues/6305))

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
  - Janos Mattyasovszky

This is a bug fix release in the 2.11 'esr' series and therefore all
installations of 2.11.x should be upgraded when possible. When we
release a new version of Rudder it has been thoroughly tested, and we
consider the release enterprise-ready for deployment.

## Rudder 2.11.16 (2015-10-27)

### Changes

#### System & initial promises

 \* Touch local file on inventory upload
[\#7206](http://www.rudder-project.org/redmine/issues/7206))

### Bug fixes

#### Web - Nodes & inventories

  - Fixed: Link from node/directive list to node detail is broken on
    Firefox
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

  - Janos Mattyasovszky

This is a bug fix release in the 2.11 'esr' series and therefore all
installations of 2.11.x should be upgraded when possible. When we
release a new version of Rudder it has been thoroughly tested, and we
consider the release enterprise-ready for deployment.

## Rudder 2.11.15 (2015-10-20)

### Changes

### Bug fixes

#### Web - Nodes & inventories

  - Fixed: No service pack is reported when lsb\_release is installed on
    SLES ([\#7205](http://www.rudder-project.org/redmine/issues/7205))

#### Techniques

  - Fixed: Ssh key distribution cannot distibute several keys on one
    user ([\#7254](http://www.rudder-project.org/redmine/issues/7254))

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

  - Fixed: Writting promises should be parallelized
    ([\#7265](http://www.rudder-project.org/redmine/issues/7265))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Florian Heigl
  - Janos Mattyasovszky

This is a bug fix release in the 2.11 'esr' series and therefore all
installations of 2.11.x should be upgraded when possible. When we
release a new version of Rudder it has been thoroughly tested, and we
consider the release enterprise-ready for deployment.

## Rudder 2.11.14 (2015-09-24)

### Changes

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

This is a bug fix release in the 2.11 'esr' series and therefore all
installations of 2.11.x should be upgraded when possible. When we
release a new version of Rudder it has been thoroughly tested, and we
consider the release enterprise-ready for deployment.

## Rudder 2.11.13 (2015-08-19)

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

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Janos Mattyasovszky

This is a bug fix release in the 2.11 'esr' series and therefore all
installations of 2.11.x should be upgraded when possible. When we
release a new version of Rudder it has been thoroughly tested, and we
consider the release enterprise-ready for deployment.

## Rudder 2.11.12 (2015-07-09)

### Changes

#### Packaging

  - Add a caching system to rudder build system
    ([\#6713](http://www.rudder-project.org/redmine/issues/6713))

### Bug fixes

#### Web - UI & UX

  - Fixed: No rules displayed in firefox
    ([\#6490](http://www.rudder-project.org/redmine/issues/6490))

#### Web - Config management

  - Fixed: After a partial promise generation, some nodes being a relay
    may have their promises stored in a non reachable location
    ([\#6729](http://www.rudder-project.org/redmine/issues/6729))

#### Web - Technique editor

  - Fixed: Cannot save technique with ncf builder - error during the API
    call to the technique library reload
    ([\#6724](http://www.rudder-project.org/redmine/issues/6724))

#### Web - Nodes & inventories

  - Fixed: ldap.attr.networkInterfaceDhcpServer in search node component
    ([\#6785](http://www.rudder-project.org/redmine/issues/6785))

#### System integration

  - Fixed: Ncf init fails in webapp postinst
    ([\#6698](http://www.rudder-project.org/redmine/issues/6698))
  - Fixed: Startup links for rudder-server-root on Ubuntu are not
    correct - before 3.1
    ([\#6263](http://www.rudder-project.org/redmine/issues/6263))
  - Fixed: Sometimes, promises get corrupted to the point they can't be
    automatically repaired on a node
    ([\#6768](http://www.rudder-project.org/redmine/issues/6768))

#### Initial promises & sys tech

  - Fixed: We can't use cf-runagent because port is not taken into
    account in the body runagent control
    ([\#6916](http://www.rudder-project.org/redmine/issues/6916))
  - Fixed: Promises.st can't load ncf on windows
    ([\#6700](http://www.rudder-project.org/redmine/issues/6700))
  - Fixed: Nodes using syslogd coninue to report to their old server
    when changing their policy server
    ([\#6845](http://www.rudder-project.org/redmine/issues/6845))
  - Fixed: Editing non-existent /etc/rsyslog.d/pgsql.conf in initial
    promises
    ([\#6784](http://www.rudder-project.org/redmine/issues/6784))

#### Techniques

  - Fixed: Unexpected status for fileAlterationMonitoring
    ([\#6771](http://www.rudder-project.org/redmine/issues/6771))

#### Server components

  - Fixed: When a node is promoted to relay, the old rsyslog conf is
    never replaced
    ([\#6721](http://www.rudder-project.org/redmine/issues/6721))

#### Agent

  - Fixed: Cf-agent writes incorrect files when the server answers too
    slowly during recursive copy
    ([\#6915](http://www.rudder-project.org/redmine/issues/6915))
  - Fixed: Error about ldconfig during rudder-agent installation on AIX
    ([\#6703](http://www.rudder-project.org/redmine/issues/6703))

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

#### Packaging

  - Fixed: AIX installations output errors due to "cp -a" usage
    ([\#6830](http://www.rudder-project.org/redmine/issues/6830))
  - Fixed: Rudder-reports does not find correct postgresql service when
    using systemctl
    ([\#6699](http://www.rudder-project.org/redmine/issues/6699))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Dennis Cabooter
  - Olivier Mauras

This is a bug fix release in the 2.11 'esr' series and therefore all
installations of 2.11.x should be upgraded when possible. When we
release a new version of Rudder it has been thoroughly tested, and we
consider the release enterprise-ready for deployment.

## Rudder 2.11.11 (2015-06-02)

### Changes

#### Agent

  - Allow rudder server to remotely run the agent
    ([\#6553](http://www.rudder-project.org/redmine/issues/6553))

### Bug fixes

#### Web - Config management

  - Fixed: When we accept a new node, we have two promises generation
    instead of one
    ([\#6575](http://www.rudder-project.org/redmine/issues/6575))
  - Fixed: When we regenerate promises via 'Update' button, all promises
    are regenerated even if not needed
    ([\#6518](http://www.rudder-project.org/redmine/issues/6518))

#### Web - Compliance & node report

  - Fixed: When we add a node in a rule, we lose all compliance info on
    this rule applied on it, and we change promises of all the nodes of
    the rule
    ([\#6519](http://www.rudder-project.org/redmine/issues/6519))
  - Fixed: No reporting on agents on ncf directives on SLES
    ([\#6673](http://www.rudder-project.org/redmine/issues/6673))

#### Web - UI & UX

  - Fixed: Bad RegEx in Groups causes Server to not respond
    ([\#6680](http://www.rudder-project.org/redmine/issues/6680))

#### Web - Technique editor

  - Fixed: ncf post-hooks fails when there is nothing to commit
    ([\#6617](http://www.rudder-project.org/redmine/issues/6617))

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
  - Fixed: Log rotation on distributed install is not functionnal
    ([\#6521](http://www.rudder-project.org/redmine/issues/6521))

#### Agent

  - Fixed: cfengine context is not updated properly when doing multiple
    indivudual package actions
    ([\#6587](http://www.rudder-project.org/redmine/issues/6587))

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
  - Fixed: rudder-reports package should use the correct PostgreSQL
    service
    ([\#6546](http://www.rudder-project.org/redmine/issues/6546))

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
  - Fixed: Update command on centos is missing "ncf-api-virtualenv"
    package
    ([\#6503](http://www.rudder-project.org/redmine/issues/6503))

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Janos Mattyasovszky

This is a bug fix release in the 2.11 series and therefore all
installations of 2.11.x should be upgraded when possible. This version
is not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.10.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 2.11.10 (2015-04-13)

### Changes

### Bug fixes

#### Techniques

  - Fixed: Document usage of line replacement in Enforce a file content
    technique
    ([\#5979](http://www.rudder-project.org/redmine/issues/5979))

#### Server components

  - Fixed: networks.conf missing on relay servers
    ([\#6454](http://www.rudder-project.org/redmine/issues/6454))

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

This is a bug fix release in the 2.11 series and therefore all
installations of 2.11.x should be upgraded when possible. This version
is not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.10.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 2.11.9 (2015-03-24)

### Changes

### Bug fixes

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

This is a bug fix release in the 2.11 series and therefore all
installations of 2.11.x should be upgraded when possible. This version
is not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.10.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 2.11.8 (2015-03-09)

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

This is a bug fix release in the 2.11 series and therefore all
installations of 2.11.x should be upgraded when possible. This version
is not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.10.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 2.11.7 (2015-02-06)

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
    ([\#6157](http://www.rudder-project.org/redmine/issues/6157)))

#### Webapp - Config management

  - Fixed: Missing edit link for group in Rule page
    ([\#6061](http://www.rudder-project.org/redmine/issues/6061))

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
  - Fixed: Error in the Web Interface when trying to access inventory
    report, on the node page
    ([\#5592](http://www.rudder-project.org/redmine/issues/5592))

#### Performance and scalability

  - Fixed: Performance of RuleCategory repository requests are bad
    ([\#6133](http://www.rudder-project.org/redmine/issues/6133))
  - Fixed: The way software inventories are saved is totally inefficient
    ([\#6075](http://www.rudder-project.org/redmine/issues/6075))
  - Fixed: Error in the reports archiving process cause log explosion
    ([\#6007](http://www.rudder-project.org/redmine/issues/6007))
  - Fixed: LDAP configuration is not optimized for Rudder use case
    ([\#5965](http://www.rudder-project.org/redmine/issues/5965))

#### Techniques

  - Fixed: wrong group set by SSH key distribution
    ([\#6031](http://www.rudder-project.org/redmine/issues/6031))
  - Fixed: Error output on Time settings at first run
    ([\#6000](http://www.rudder-project.org/redmine/issues/6000))
  - Fixed: sshKeyDistribution creates 0 byte authorized\_keys file
    ([\#5930](http://www.rudder-project.org/redmine/issues/5930))

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
  - Fixed: Support uppercase hostname when updating promises
    ([\#6037](http://www.rudder-project.org/redmine/issues/6037))
  - Fixed: Cannot manage more than 4993 nodes, due to CFEngine
    limitation
    ([\#5621](http://www.rudder-project.org/redmine/issues/5621))

#### System integration

  - Fixed: rudder-agent-thin: missing /var/rudder/share/man
    ([\#6092](http://www.rudder-project.org/redmine/issues/6092))
  - Fixed: Upgrading rudder-inventory-ldap between two major OS versions
    makes slapd unable to operate because of BerkeleyDB
    ([\#5741](http://www.rudder-project.org/redmine/issues/5741))
  - Fixed: If killall is not installed, cf-serverd can not reloaded
    during promise generation
    ([\#6202](http://www.rudder-project.org/redmine/issues/6202))
  - Fixed: The rudder-upgrade script should never use /sbin/service
    ([\#6188](http://www.rudder-project.org/redmine/issues/6188))
  - Fixed: We should not clean DB\_CONFIG and slapd.conf in
    rudder-inventory-ldap package source Makefile
    ([\#6185](http://www.rudder-project.org/redmine/issues/6185))
  - Fixed: Building rudder-agent fails on Ubuntu 10.04, due to failing
    patch ([\#6134](http://www.rudder-project.org/redmine/issues/6134))
  - Fixed: Rudder agent compilation fails to build on AIX
    ([\#6132](http://www.rudder-project.org/redmine/issues/6132))
  - Fixed: Warning after policy generation, /bin/pidof does not exists
    ([\#6051](http://www.rudder-project.org/redmine/issues/6051))

#### ncf-builder integration

  - Fixed: ncf API hooks fails because it uses bashism but declares
    using shell
    ([\#6168](http://www.rudder-project.org/redmine/issues/6168))
  - Fixed: URL for the ncf-builder call is misunderstood by IE9 (bad
    html5 support) - Rudder 2.11
    ([\#6129](http://www.rudder-project.org/redmine/issues/6129))
  - Fixed: ncf API hooks don't always fail on errors
    ([\#5866](http://www.rudder-project.org/redmine/issues/5866))

#### Packaging

  - Fixed: When migrating from 2.10 to 2.11, if BDB need to be upgraded,
    all changes made by rudder-upgrade are reverted
    ([\#6199](http://www.rudder-project.org/redmine/issues/6199))
  - Fixed: Upgrading Rudder from 2.10 to 2.11 nightly fails to properly
    set roles and configures psql password
    ([\#6196](http://www.rudder-project.org/redmine/issues/6196))
  - Fixed: Agent regenerates the list of package available to install
    several time per run, causing massive performance hit
    ([\#6119](http://www.rudder-project.org/redmine/issues/6119))
  - Fixed: Error log when installing rudder-inventory ldap on RHEL6
    ([\#6032](http://www.rudder-project.org/redmine/issues/6032))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alex Bruni
  - Dennis Cabooter
  - Florian Heigl
  - Lionel Le Folgoc
  - Olivier Mauras

This is a bug fix release in the 2.11 series and therefore all
installations of 2.11.x should be upgraded when possible. This version
is not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.10.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several
months.

## Rudder 2.11.6 =\> Not released, major bug in debian installation ([\#6232](http://www.rudder-project.org/redmine/issues/6232))

## Rudder 2.11.5 (2014-12-16)

### Changes

#### Techniques

  - Add an option to allow purge of local directory content in "Copy
    file from shared folder" Technique
    ([\#5754](http://www.rudder-project.org/redmine/issues/5754))

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
  - Fixed: Remove edit link for system directive/rules
    ([\#5916](http://www.rudder-project.org/redmine/issues/5916))

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
  - Fixed: Generating policies failed with "key not found: LICENSESPAID"
    ([\#5961](http://www.rudder-project.org/redmine/issues/5961))

#### Webapp - Display, home page

  - Fixed: Missing files on the load page
    ([\#5867](http://www.rudder-project.org/redmine/issues/5867))
  - Fixed: Calendar used in admisnistration page is in japanese
    ([\#5971](http://www.rudder-project.org/redmine/issues/5971))

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
  - Fixed: We should remove the questions we do not ask anymore during
    rudder-init from the documentation
    ([\#5779](http://www.rudder-project.org/redmine/issues/5779))

#### Techniques

  - Fixed: Build are failing because the normal ordering is not
    respected in technique motdConfiguration v3.1
    ([\#5959](http://www.rudder-project.org/redmine/issues/5959)
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
  - Fixed: Rudder-init can fail on CentOS when the host has no domain
    name ([\#5812](http://www.rudder-project.org/redmine/issues/5812))
  - Fixed: Rudder virtualhosts are missing a 2.4 compatible proxy
    definition
    ([\#5783](http://www.rudder-project.org/redmine/issues/5783))
  - Fixed: rudder-init end summary has typos
    ([\#5780](http://www.rudder-project.org/redmine/issues/5780))

#### Techniques - System & initial promises

  - Fixed: System techniques can only setup log settings **once** on
    syslog-ng
    ([\#5799](http://www.rudder-project.org/redmine/issues/5799))
  - Fixed: Initial promises are calling undefined body u\_bootstart
    ([\#5997](http://www.rudder-project.org/redmine/issues/5997))
  - Fixed: Enforce the content of the local ncf configuration file from
    techniques
    ([\#5937](http://www.rudder-project.org/redmine/issues/5937))

#### Windows agent

  - Fixed: Motd technique only work on Unixes, not on windows
    ([\#5890](http://www.rudder-project.org/redmine/issues/5890))
  - Fixed: Process checking for cf-agent on windows suicide itself
    ([\#5619](http://www.rudder-project.org/redmine/issues/5619))
  - Fixed: Promises on Windows try to download perl
    ([\#5948](http://www.rudder-project.org/redmine/issues/5948))
  - Fixed: Services management technique doesn't work on Windows
    ([\#5938](http://www.rudder-project.org/redmine/issues/5938))

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

#### Packaging

  - Fixed: Debian-like OSes fail to build a bundled OpenSSL when running
    inside pbuilder
    ([\#5818](http://www.rudder-project.org/redmine/issues/5818))
  - Fixed: Building OpenSSL on AIX requires triggering slibclean before
    installing
    ([\#5815](http://www.rudder-project.org/redmine/issues/5815))
  - Fixed: The OpenSSL patches on old Debian rudder-agent packages try
    to use a SPEC file macro
    ([\#5814](http://www.rudder-project.org/redmine/issues/5814))
  - Fixed: The rudder-agent SPEC file does not handle bundled Openssl or
    not conditions properly
    ([\#5811](http://www.rudder-project.org/redmine/issues/5811))
  - Fixed: We should not build Fusion with SSL support as we do not use
    it and it breaks Bundled OpenSSL builds
    ([\#5776](http://www.rudder-project.org/redmine/issues/5776))

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
  - Olivier Mauras

This is a bug fix release in the 2.11 series and therefore all
installations of 2.11.x should be upgraded when possible. This version
is not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.10.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 2.11.4 (2014-11-18)

### Changes

#### Webapp - Config management

  - Permit the nodes access rules to be reloaded automatically after
    each promises generation
    ([\#5571](http://www.rudder-project.org/redmine/issues/5571))

#### Packaging

  - Include our own OpenSSL for non maintained oses in rudder-agent
    package
    ([\#5147](http://www.rudder-project.org/redmine/issues/5147))

#### System integration

  - Make Rudder Apache 2.4 compliant
    ([\#5183](http://www.rudder-project.org/redmine/issues/5183))

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
  - Fixed: Add number of entries selector on Nodes table
    ([\#5388](http://www.rudder-project.org/redmine/issues/5388))
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
  - Fixed: NTP technique has no option to not set hw clock
    ([\#5671](http://www.rudder-project.org/redmine/issues/5671))
  - Fixed: "sshKeyDistribution" Technique keeps adding the same keys for
    ever ([\#5561](http://www.rudder-project.org/redmine/issues/5561))
  - Fixed: Evaluation of promises is not correctly done in CFEngine
    3.6.0 - 3.6.2, preventing some promises evaluation
    ([\#5660](http://www.rudder-project.org/redmine/issues/5660))

#### Techniques - System & initial promises

  - Fixed: Check on age of promises in failsafe doesn't take into
    account specific schedule, nor lmdb database, and should probably be
    remove
    ([\#5582](http://www.rudder-project.org/redmine/issues/5582))

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
  - Fixed: Post modification hooks of ncf are group writable, and it
    makes grsec complains
    ([\#5566](http://www.rudder-project.org/redmine/issues/5566))

#### Documentation

  - Fixed: Technique upgrade documentation is not correct
    ([\#5611](http://www.rudder-project.org/redmine/issues/5611))
  - Fixed: Update screenshots to be Rudder 2.11 compliant
    ([\#5350](http://www.rudder-project.org/redmine/issues/5350))

#### Inventory (webapp, Fusion)

  - Fixed: Non-unique machine UUID mess up collected inventory
    ([\#4490](http://www.rudder-project.org/redmine/issues/4490))
  - Fixed: Having multiple agents on a node breaks the values of the
    node policy server and node administrator user
    ([\#5583](http://www.rudder-project.org/redmine/issues/5583))

#### Webapp - CFEngine integration

  - Fixed: Use of variable starting with 'rudder' in cfengine variable
    is forbidden
    ([\#5743](http://www.rudder-project.org/redmine/issues/5743))
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

This is a bug fix release in the 2.11 series and therefore all
installations of 2.11.x should be upgraded when possible. This version
is not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.10.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 2.11.3 (2014-09-24)

### Changes

#### Agent

  - Let vzps act as ps if no CTID is specified
    ([\#5478](http://www.rudder-project.org/redmine/issues/5478))

#### Documentation

  - Installation procedure for distributed rudder server
    ([\#5178](http://www.rudder-project.org/redmine/issues/5178))

### Bug fixes

#### Techniques - System & initial

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
  - Fixed: Rewrite initial promises to use normal ordering on 2.11
    ([\#5499](http://www.rudder-project.org/redmine/issues/5499))
  - Fixed: The Rudder logrotate configuration uses the wrong argument to
    reload rsyslog on Debian Wheezy
    ([\#5486](http://www.rudder-project.org/redmine/issues/5486))

#### Techniques - Other

  - Fixed: Weird behaviours of partitionMonitoring technique on ZFS on
    2.11 ([\#5468](http://www.rudder-project.org/redmine/issues/5468))
  - Fixed: clock management technique always report repair on Windows
    ([\#5341](http://www.rudder-project.org/redmine/issues/5341))
  - Fixed: User Management Techniques don't reports properly on Windows
    ([\#5340](http://www.rudder-project.org/redmine/issues/5340))
  - Fixed: Rewrite techniques to use normal ordering on 2.11
    ([\#5508](http://www.rudder-project.org/redmine/issues/5508))
  - Fixed: rudder-agent start shows an alert
    ([\#5146](http://www.rudder-project.org/redmine/issues/5146))
  - Fixed: implement openvz support for rudder 2.11
    ([\#5477](http://www.rudder-project.org/redmine/issues/5477))
  - Fixed: oracle server Linux are not recognized anymore by inventory
    ([\#5476](http://www.rudder-project.org/redmine/issues/5476))
  - Fixed: implement openvz support for rudder 2.11
    ([\#5467](http://www.rudder-project.org/redmine/issues/5467))
  - Fixed: FusionInventory version check not handling version number
    correctly
    ([\#5419](http://www.rudder-project.org/redmine/issues/5419))
  - Fixed: The Rudder logrotate configuration is not in sync between
    regular and initial promises
    ([\#5544](http://www.rudder-project.org/redmine/issues/5544))
  - Fixed: use list-compatible-inputs from ncf, not from tools
    ([\#5527](http://www.rudder-project.org/redmine/issues/5527))
  - Fixed: Call list-comptible-inputs with /bin/sh
    ([\#5519](http://www.rudder-project.org/redmine/issues/5519))
  - Fixed: The "Download a file" Technique contains a syntax error
    ([\#5457](http://www.rudder-project.org/redmine/issues/5457))
  - Fixed: SSH Configuration Technique does not make timestamped version
    of all the version of the ssh config file, like other techiques
    ([\#5344](http://www.rudder-project.org/redmine/issues/5344))
  - Fixed: Add a placeholder for new technique on old versions
    ([\#5463](http://www.rudder-project.org/redmine/issues/5463))

#### Inventory

  - Fixed: Inventories generated on Windows are not accepted by the
    endpoint
    ([\#5191](http://www.rudder-project.org/redmine/issues/5191))
  - Fixed: FusionInventory: Doesn't display (most) disk sizes
    ([\#4197](http://www.rudder-project.org/redmine/issues/4197))

#### Webapp - Config management

  - Fixed: Correct HTML: badly closed tag
    ([\#5540](http://www.rudder-project.org/redmine/issues/5540))

#### Webapp - Node management

  - Fixed: LDAP error when defining group criteria
    ([\#5504](http://www.rudder-project.org/redmine/issues/5504))
  - Fixed: The Rule compliance explanations in Rudder's web UI are not
    clear ([\#5413](http://www.rudder-project.org/redmine/issues/5413))
  - Fixed: We cannot edit only section of the file with enforce file
    content
    ([\#5301](http://www.rudder-project.org/redmine/issues/5301))

#### API

  - Fixed: Get system serial number output from inventory though API
    ([\#5528](http://www.rudder-project.org/redmine/issues/5528))
  - Fixed: Accepting Nodes via API does not trigger policy update
    ([\#5511](http://www.rudder-project.org/redmine/issues/5511))

#### System integration

  - Fixed: upgrade on 2.11 does not end correctly
    ([\#5495](http://www.rudder-project.org/redmine/issues/5495))
  - Fixed: Failing upgrade 2.10 \> 2.11 due to rudder-webapp being
    upgraded before rudder-inventory-ldap
    ([\#5387](http://www.rudder-project.org/redmine/issues/5387))
  - Fixed: error in rudder-upgrade are not clear on service check
    ([\#5500](http://www.rudder-project.org/redmine/issues/5500))
  - Fixed: Tools directory is not always correctly updated on nodes
    ([\#5459](http://www.rudder-project.org/redmine/issues/5459))

#### Packaging

  - Fixed: Make the rudder-upgrade script more verbose in case of
    failures
    ([\#5464](http://www.rudder-project.org/redmine/issues/5464))
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

#### Logging

  - Fixed: Do not write into cf3.\[hostname\].runlog files used for
    debug or CFEngine Enterprise edition
    ([\#5488](http://www.rudder-project.org/redmine/issues/5488))

#### Documentation

  - Fixed: Do not use contrib and non-free
    ([\#5181](http://www.rudder-project.org/redmine/issues/5181))
  - Fixed: 2.11+ doc should refer to rudder-init instead of
    rudder-init.sh
    ([\#5447](http://www.rudder-project.org/redmine/issues/5447))

### Release notes

This is a bug fix release in the 2.11 series.

It fixes important issues like: \* Bloating rudder-agent log files \*
Inventory disk detection \* OpenVZ container process detection support

All installations of 2.11.x should be upgraded when possible. This
version is not yet marked "stable", since it has not yet proven itself
to be reliable on production systems over a period of several months.
The current "stable" release is still 2.10.\*. When we release a new
version of Rudder, it needs to be thoroughly tested, and we consider the
release enterprise-ready for deployment only after it has been proven to
run in production reliably for several months.

### Known issues

The update script to switch to BigInt database storage for Rudder
reports (when having a lot of nodes registered reporting) is incomplete.
To switch correctly to BigInt, please use the workaround given in this
ticket: http://www.rudder-project.org/redmine/issues/5569

## Rudder 2.11.2 (2014-08-13)

### Bug fixes

#### Techniques

  - Fixed: We can't set the SUID/SGID in technique Manage file and
    folders
    ([\#5325](http://www.rudder-project.org/redmine/issues/5325))
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
  - Fixed: The find call used to get all the files to include in the
    CFEngine run is not usable on AIX
    ([\#5292](http://www.rudder-project.org/redmine/issues/5292))
  - Fixed: Inventory are not correctly generated on Windows
    ([\#5342](http://www.rudder-project.org/redmine/issues/5342))
  - Fixed: Agent run may fail on nodes because some promises have not be
    correctly updated
    ([\#5231](http://www.rudder-project.org/redmine/issues/5231))
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

#### Performance and scalability

  - Fixed: Group page is really slow when a lot of groups are defined
    ([\#5277](http://www.rudder-project.org/redmine/issues/5277))
  - Fixed: Promise generation is slowed down because
    expected\_reports.csv file is written multiple times per node
    ([\#5240](http://www.rudder-project.org/redmine/issues/5240))

#### Packaging

  - Fixed: After migration to 2.11, no reports are saved since no roles
    are defined on root server
    ([\#5273](http://www.rudder-project.org/redmine/issues/5273))
  - Fixed: On RHEL system, ncf-builder hangs on a page with only ncf
    header with "Unable to connect to WSGI daemon process
    'ncf\_api\_flask\_app'\[...\]" in /var/log/rudder/apache2/error.log
    ([\#5355](http://www.rudder-project.org/redmine/issues/5355))
  - Fixed: ncf replace all files in /usr/share/ncf without exception
    which is non compatible with Rudder
    ([\#5274](http://www.rudder-project.org/redmine/issues/5274))
  - Fixed: rudder-init still waits for 5 arguments, but only needs two
    ([\#5289](http://www.rudder-project.org/redmine/issues/5289))
  - Fixed: The rudder-plugin script uses a wrong definition to enable
    plugins
    ([\#5323](http://www.rudder-project.org/redmine/issues/5323))
  - Fixed: On AIX, when the crontab is edited to add
    check\_rudder\_agent, the service cron is not reloaded
    ([\#5310](http://www.rudder-project.org/redmine/issues/5310))
  - Fixed: The check-rudder-agent script tries to use the stat command
    on AIX
    ([\#5198](http://www.rudder-project.org/redmine/issues/5198))
  - Fixed: A whitespace added in debian/control of rudder-agent prevent
    it to be builded on Debian-like OSes
    ([\#5380](http://www.rudder-project.org/redmine/issues/5380))
  - Fixed: Missing dependency on net-tools for rudder-agent and
    rudder-thin
    ([\#5199](http://www.rudder-project.org/redmine/issues/5199))

#### System integration

  - Fixed: Apache documentroot for SLES seems misconfigured
    ([\#5370](http://www.rudder-project.org/redmine/issues/5370))
  - Fixed: Authorized network sometimes have invalid values after
    rudder-init if you add more than one network
    ([\#5103](http://www.rudder-project.org/redmine/issues/5103))

#### CFEngine

  - Fixed: Using the edit\_template file attribute in CFEngine sometimes
    creates zero length files in 3.6
    ([\#5379](http://www.rudder-project.org/redmine/issues/5379))
  - Fixed: rudder-agent 2.11. ignore duplicate lines in data files
    causing rpmPackageInstallation technique to ignore some
    configurations
    ([\#5386](http://www.rudder-project.org/redmine/issues/5386))

#### Documentation

  - Fixed: Update screenshots to be Rudder 2.6 compliant
    ([\#5348](http://www.rudder-project.org/redmine/issues/5348))
  - Fixed: Incomplete command to force inventory
    ([\#5205](http://www.rudder-project.org/redmine/issues/5205))
  - Fixed: The documentation says there is no Rudder server packages for
    RHEL 6
    ([\#5204](http://www.rudder-project.org/redmine/issues/5204))

### Release notes

This is a bug fix release in the 2.11 series.

It fixes two important issues: \* The migration from a non-2.11 version
to Rudder 2.11 leads to an incorrect syslog configuration, impairing the
compliance display and rule status \* ncf builder did not function
properly on RHEL systems due to a permission issue

All installations of 2.11.x should be upgraded when possible. This
version is not yet marked "stable", since it has not yet proven itself
to be reliable on production systems over a period of several months.
The current "stable" release is still 2.10.\*. When we release a new
version of Rudder, it needs to be thoroughly tested, and we consider the
release enterprise-ready for deployment only after it has been proven to
run in production reliably for several months.

## Rudder 2.11.1 (2014-07-21)

### Changes

### Bug fixes

#### Performance and scalability

  - Fixed: Rule page is really slow when a lot of rules are defined
    ([\#5279](http://www.rudder-project.org/redmine/issues/5279))
  - Fixed: Group page is really slow when a lot of groups are defined
    ([\#5277](http://www.rudder-project.org/redmine/issues/5277))

### Release notes

This is a bug fix release in the 2.11 series. All installations of
2.11.x should be upgraded when possible. This version is not yet marked
"stable", since it has not yet proven itself to be reliable on
production systems over a period of several months. The current "stable"
release is still 2.10.\*.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. To be
declared "stable" we prefer to wait until a version has been available
and running in production for several months.

## Rudder 2.11.0 (2014-07-17)

### Changes

#### Webapp - Node management

  - Add a system group to target all nodes that are not a Rudder server
    component
    ([\#5267](http://www.rudder-project.org/redmine/issues/5267))

#### Webapp - Display, home page

  - Add Rudder 2.11 logo: Peruha
    ([\#5263](http://www.rudder-project.org/redmine/issues/5263))

### Bug fixes

#### Webapp - Reporting

  - Fixed: In compliance popup, report status displayed for each node is
    not correct
    ([\#5241](http://www.rudder-project.org/redmine/issues/5241))

#### Webapp - Node management

  - Fixed: Cannot make group based on server role since the attribute
    "Server role" is missing from search tool
    ([\#5265](http://www.rudder-project.org/redmine/issues/5265))

#### Techniques - Sys & init promis

  - Fixed: Agent run may fail on nodes because some promises have not be
    correctly updated
    ([\#5231](http://www.rudder-project.org/redmine/issues/5231))

### Release notes

This version of Rudder is a final release. We have tested it thoroughly
and believe it to be free of any major bugs. However, this branch is not
marked "stable", since it still has to be proven reliable on production
systems over a period of several months. The current "stable" release is
2.10.\*.

## Rudder 2.11.0~rc2 (2014-07-09)

### Changes

### Bug fixes

#### Webapp - CFEngine integration

  - Fixed: CFEngine is unable to run automatically on Rudder Server
    2.11.0.rc1 since its generated promises have group writable
    permissions
    ([\#5238](http://www.rudder-project.org/redmine/issues/5238))

#### System integration

  - Fixed: Reports cannot be stored in local postgresql on a server
    Rudder in stand alone configuration
    ([\#5237](http://www.rudder-project.org/redmine/issues/5237))

#### Packaging

  - Fixed: An error occurs during upgrade because variable OPT\_RUDDER
    is missing in rudder-upgrade-database script
    ([\#5235](http://www.rudder-project.org/redmine/issues/5235))
  - Fixed: After upgrade to 2.11 on rpm systems, web interface isn't
    started by jetty as rudder.xml file is deleted during upgrade
    ([\#5223](http://www.rudder-project.org/redmine/issues/5223))

#### Techniques

  - Fixed: Nodes which are not part of distributed architecture displays
    an error log on agent execution about missing
    '/opt/rudder/etc/server-roles.d/' directory
    ([\#5200](http://www.rudder-project.org/redmine/issues/5200))

#### Performance and scalability

  - Fixed: Promise generation is slowed down because
    expected\_reports.csv file is written multiple times per node
    ([\#5240](http://www.rudder-project.org/redmine/issues/5240))

### Release notes

This software is in "release candidate" status and contains multiple bug
fixes since last release candidate (2.11.0~rc1)

If no major bugs are found, a "final" release of 2.11.0 will be released
next week.

## Rudder 2.11.0~rc1 (2014-07-07)

### Changes

#### Webapp - Config management

  - Add links to ncf-builder in Directive and Technique page
    ([\#5230](http://www.rudder-project.org/redmine/issues/5230))

### Bug fixes

#### Techniques - Sys & init promis

  - Fixed: System Techniques does not use role rudder-relay-top
    ([\#5189](http://www.rudder-project.org/redmine/issues/5189))

#### Techniques

  - Fixed: CheckGenericFileContent does not send reports for post
    modification hook when we enforce the content of the file only at
    creation
    ([\#5208](http://www.rudder-project.org/redmine/issues/5208))
  - Fixed: Incorrect use of commands without their full path in Sudo
    Parameter technique
    ([\#5187](http://www.rudder-project.org/redmine/issues/5187))

#### System integration

  - Fixed: Remove uncessary question about policy server fqdn in
    rudder-init script
    ([\#5206](http://www.rudder-project.org/redmine/issues/5206))
  - Fixed: Rename properties (rudder-front, rudder-webapp) in
    rudder-webapp configuration file
    ([\#5185](http://www.rudder-project.org/redmine/issues/5185))
  - Fixed: uuid.hive gets overwritten on the root server if rudder-agent
    is installed after rudder-webapp
    ([\#5089](http://www.rudder-project.org/redmine/issues/5089))
  - Fixed: Authorized networks sometimes have invalid values after
    rudder-init if you add more than one network
    ([\#5103](http://www.rudder-project.org/redmine/issues/5103))

#### Inventory (webapp, Fusion)

  - Fixed: If the inventory of Rudder server is not received by
    rudder-webapp, Rudder server has no role then rsyslogd configuration
    is broken
    ([\#5233](http://www.rudder-project.org/redmine/issues/5233))

#### ncf-builder

  - Fixed: ncf-api does not run as root and cannot use command to
    read/write promises
    ([\#5172](http://www.rudder-project.org/redmine/issues/5172))
  - Fixed: The ncf api hooks should not log unneeded things and need
    cleanup
    ([\#5221](http://www.rudder-project.org/redmine/issues/5221))
  - Fixed: ncf post hooks, use http to reload techniques instead of
    https ([\#5210](http://www.rudder-project.org/redmine/issues/5210))
  - Fixed: ncf techniques category.xml is not commited by ncf-builder
    post hook on first technique creation.
    ([\#5197](http://www.rudder-project.org/redmine/issues/5197))

#### Documentation

  - Fixed: Incomplete command to force inventory
    ([\#5205](http://www.rudder-project.org/redmine/issues/5205))
  - Fixed: The documentation says there is no Rudder server packages for
    RHEL 6
    ([\#5204](http://www.rudder-project.org/redmine/issues/5204))

#### Packaging

  - Fixed: check-rudder-agent tries to use the stat command on AIX
    ([\#5198](http://www.rudder-project.org/redmine/issues/5198))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Lionel Le Folgoc

This software is in "release candidate" status and contains multiple bug
fixes since last beta (2.11.0~beta2) .

If no major bugs are found, a "final" release of 2.11.0 will be released
next week.

## Rudder 2.11.0~beta2 (2014-06-30)

### Changes

#### Agent

  - Update to CFEngine 3.6.0 release
    ([\#5077](http://www.rudder-project.org/redmine/issues/5077))

#### Techniques

  - Integrate ncf-builder in Rudder
    ([\#2114](http://www.rudder-project.org/redmine/issues/2114))

#### System integration

  - Add rudder-plugin script to manage Rudder plugins
    ([\#4989](http://www.rudder-project.org/redmine/issues/4989))

#### Techniques

  - Only copy "tools" that are required for each platform
    ([\#5108](http://www.rudder-project.org/redmine/issues/5108))

#### Techniques - Sys & init promis

  - Deprecate Debian 5 support as a Rudder server
    ([\#5104](http://www.rudder-project.org/redmine/issues/5104))

### Bug fixes

#### Packaging

  - Fixed: Use of a wrong conditional to detect if we are building on
    sles in several package specfile
    ([\#5174](http://www.rudder-project.org/redmine/issues/5174))
  - Fixed: rudder-server-root package description is incorrect
    ([\#5159](http://www.rudder-project.org/redmine/issues/5159))
  - Fixed: rudder-agent package fails to backup rudder-server-roles.conf
    to /var/archives during installation
    ([\#5124](http://www.rudder-project.org/redmine/issues/5124))
  - Fixed: Remove an unneeded patch in rudder-jetty
    ([\#5102](http://www.rudder-project.org/redmine/issues/5102))
  - Fixed: Add missing dependencies: which
    ([\#5066](http://www.rudder-project.org/redmine/issues/5066)), bc
    ([\#5064](http://www.rudder-project.org/redmine/issues/5064)),
    postgresql
    ([\#5076](http://www.rudder-project.org/redmine/issues/5076))

#### Techniques - Sys & init promis

  - Fixed: A typo in component-check.cf prevent agent starting on
    initial promises
    ([\#5143](http://www.rudder-project.org/redmine/issues/5143))
  - Fixed: In splitted architecture, the initial promises don't send
    inventories to the proper endpoint
    ([\#5120](http://www.rudder-project.org/redmine/issues/5120))
  - Fixed: Promises generated generated for server roles are not correct
    and are missing from initial promises
    ([\#5117](http://www.rudder-project.org/redmine/issues/5117))
  - Fixed: Authorized networks in splitted environment, does not allow
    inventory sending
    ([\#5087](http://www.rudder-project.org/redmine/issues/5087))

#### System integration

  - Fixed: The 2.11 rudder-webapp package is missing a link on
    rudder-init (rudder-init.sh)
    ([\#5145](http://www.rudder-project.org/redmine/issues/5145))
  - Fixed: rudder-init does not run all required bundles to set up a
    policy server (in particular rsyslog config is not correct)
    ([\#5098](http://www.rudder-project.org/redmine/issues/5098))
  - Fixed: Typo in a sed command in rudder-init
    ([\#5067](http://www.rudder-project.org/redmine/issues/5067))

#### Webapp - Node management

  - Fixed: Rudder role is not displayed in the web interface if a node
    is a server component but neither relay nor root server
    ([\#5092](http://www.rudder-project.org/redmine/issues/5092))
  - Fixed: Typo in server roles display, parenthesis at the end
    ([\#5073](http://www.rudder-project.org/redmine/issues/5073))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Cédric Jardin
  - Lionel Le Folgoc
  - Daniel Stan

We have found a bug in the distributed architecture
(http://www.rudder-project.org/redmine/issues/5189), if you want to use
it you will have to run the following procedure on your 'rudder-web'
server

    cd /var/rudder/configuration-repository/techniques
    wget https://github.com/Normation/rudder-techniques/pull/435.patch 
    patch -p2 < 435.patch
    git commit -am "Fix bug #5189"
    touch /opt/rudder/etc/force_technique_reload
    service rudder-jetty restart

This software is in beta status and contains several new features but we
have tested it and believe it to be free of any critical bugs. The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!

## Rudder 2.11.0~beta1 (2014-06-16)

### Changes

#### Webapp - Display, home page

  - Add a "quick search" box for nodes at the top right of the web
    interface
    ([\#5052](http://www.rudder-project.org/redmine/issues/5052))
  - Data in Rudder web interface table can now be refreshed
    ([\#4793](http://www.rudder-project.org/redmine/issues/4793))
  - Data in Rudder web interface table is transferred asynchronously in
    a more lightweight format (JSON)
    ([\#4770](http://www.rudder-project.org/redmine/issues/4770))
  - Add links to Directives in the Rule page
    ([\#4718](http://www.rudder-project.org/redmine/issues/4718))

#### Agent

  - Upgrade to CFEngine 3.6 in rudder-agent
    ([\#4798](http://www.rudder-project.org/redmine/issues/4798))
  - Upgrade FusionInventory to version 2.3.6 on rudder-agent (all
    platforms)
    ([\#4767](http://www.rudder-project.org/redmine/issues/4767))
  - Compress inventories before sending to the server using gzip
    ([\#4790](http://www.rudder-project.org/redmine/issues/4790))
  - User should be able to use https for agent / server exchange
    (inventories)
    ([\#4746](http://www.rudder-project.org/redmine/issues/4746))
  - Adapt "/bin/date" command to use options available on all OSes in
    system promises
    ([\#4967](http://www.rudder-project.org/redmine/issues/4967))

#### Inventory (webapp, Fusion)

  - Display and use System Manufacturer/Model from nodes inventory in
    Rudder
    ([\#4501](http://www.rudder-project.org/redmine/issues/4501))
  - Make run-inventory able to run using a system instance of fusion
    inventory if no Rudder instance is available
    ([\#4926](http://www.rudder-project.org/redmine/issues/4926))

#### System integration

  - Allow splitting Rudder into independent role-based entities
    ([\#4928](http://www.rudder-project.org/redmine/issues/4928),
    ([\#4628](http://www.rudder-project.org/redmine/issues/4628),
    ([\#4654](http://www.rudder-project.org/redmine/issues/4654),
    ([\#4993](http://www.rudder-project.org/redmine/issues/4993))
  - Add logs of package install actions for debug
    ([\#5018](http://www.rudder-project.org/redmine/issues/5018))
  - Remove /opt/rudder/jetty7/javadoc files
    ([\#4870](http://www.rudder-project.org/redmine/issues/4870))

#### Webapp - Administration

  - Rudder standard installation should only include an admin user by
    default
    ([\#4902](http://www.rudder-project.org/redmine/issues/4902))
  - Make writing reports in all.log configurable from Rudder
    administration page
    ([\#4810](http://www.rudder-project.org/redmine/issues/4810))

#### Performance and scalability

  - Optimize promise generation algorithm: Rudder variables lookup
    ([\#4778](http://www.rudder-project.org/redmine/issues/4778))

#### Architecture - Dependencies

  - Update Specs2 version
    ([\#4854](http://www.rudder-project.org/redmine/issues/4854))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Cédric Cabessa
  - Christope Nowicki

This software is in beta status and contains several new features but we
have tested it and believe it to be free of any critical bugs. The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!

