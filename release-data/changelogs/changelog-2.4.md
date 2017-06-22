# Change logs for Rudder 2.4.\* "Drakkar" versions

Rudder 2.4 has reached End of Life the in December 2012. This branch is
codenamed "Drakkar".

The initial version was 2.4.0, released on 14th December 2012.

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Installing, upgrading and testing**

Documentation to
[Install](http://www.rudder-project.org/rudder-doc-2.4/rudder-doc.html#_install_rudder_server)
and
[Upgrade](http://www.rudder-project.org/rudder-doc-2.4/rudder-doc.html#_upgrade_rudder)
is available online. The [Download](../../Download/WebHome) page sums up
URLs. We also recommend using the [Rudder Vagrant
config](https://github.com/normation/rudder-vagrant/) if you want a
quick and easy way to get an installation for testing.

**Operating systems supported**

This version also provides packages for several new operating systems:

  - Rudder server: **RHEL 6**, **Ubuntu 11.10**, **Ubuntu 12.04**,
    **Ubuntu 12.10** as well as **Debian 5**, **Debian 6, Debian 7** and
    **SLES 11**
  - Rudder agent: all of the above as well as **RHEL 5** and **SLES 10**

## Rudder 2.4.12 (2013-11-20)

### Changes

#### Techniques

  - New Technique added: Partition monitoring
    ([\#3984](http://www.rudder-project.org/redmine/issues/3984))

### Bug fixes

#### Webapp - Administration

  - Fixed: Correct English in "change message" pop-ups
    ([\#4151](http://www.rudder-project.org/redmine/issues/4151))
  - Fixed: Rudder cannot load several plugins at the same time
    ([\#3314](http://www.rudder-project.org/redmine/issues/3314))

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

#### Documentation

  - Fixed: User manual doesn't mention Debian wheezy support
    ([\#4124](http://www.rudder-project.org/redmine/issues/4124))

#### Techniques

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

This is a maintenance release, part of the "old stable" 2.4 branch. 
It is recommended to upgrade all pre-2.6 installations to 2.6 as soon as
possible to enjoy the latest features and improvements of a more mature
and stable version. 
 
When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. This
release is marked as 'old-stable' since a subsequent release (branch
2.6) has proven itself to be 'stable'. 'Old-stable' also means that this
release has been assigned an 'end-of-life' date, in this case January
2014. 
See our FAQ for details, on
http://www.rudder-project.org/foswiki/FAQ/#What_is_the_versioning_policy_63.

## Rudder 2.4.11 (2013-10-09)

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

#### Techniques

  - Fixed: The system Techniques use the wrong logrotate configuration
    on RHEL
    ([\#4012](http://www.rudder-project.org/redmine/issues/4012))
  - Fixed: The logrotate configuration in RHEL does not rotate httpd
    logs ([\#4011](http://www.rudder-project.org/redmine/issues/4011))
  - Fixed: Fix our CFEngine standard lib to be CFEngine 3.5.\* compliant
    but based on modifications of the latest version of it
    ([\#4005](http://www.rudder-project.org/redmine/issues/4005))
  - Fixed: Remove 'owners' attribute from copy\_from body in the
    update.st file
    ([\#4002](http://www.rudder-project.org/redmine/issues/4002))

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

This is a maintenance release, part of the "old stable" 2.4 branch. You
are invited if using this branch to upgrade to 2.6 as soon as possible
to enjoy the latest features with a still stable and more polished
version. See our FAQ for details, on
http://www.rudder-project.org/foswiki/FAQ/#What_is_the_versioning_policy_63.
2.4.\* versions will be maintained until January 2014.

The previous release (2.4.10) was not publicly annouced as it
unfortunately did not meet our quality and assurance requirements.

## Rudder 2.4.9 (2013-10-03)

### Changes

#### Techniques

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

#### Webapp - CFEngine integration

  - Fixed: Wrong stringTemplate definition on a Technique result in a
    confusing error in the Rudder UI
    ([\#3210](http://www.rudder-project.org/redmine/issues/3210))

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

#### Packaging

  - Fixed: Logrotate should use 'delaycompress' option
    ([\#3922](http://www.rudder-project.org/redmine/issues/3922))

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

This is a maintenance release, part of the "old stable" 2.4 branch. You
are invited if using this branch to upgrade to 2.6 as soon as possible
to enjoy the latest features with a still stable and more polished
version. See our FAQ for details, on
http://www.rudder-project.org/foswiki/FAQ/#What_is_the_versioning_policy_63.
2.4.\* versions will be maintained until January 2014.

## Rudder 2.4.8 (2013-09-03)

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

#### Inventory (webapp, Fusion)

  - Fixed: Rudder doesn't support Oracle Linux - Can't merge inventory
    in LDAP
    ([\#3834](http://www.rudder-project.org/redmine/issues/3834),
    ([\#3836](http://www.rudder-project.org/redmine/issues/3836),
    ([\#3837](http://www.rudder-project.org/redmine/issues/3837))
  - Fixed: OS Full name should be queriable
    ([\#3835](http://www.rudder-project.org/redmine/issues/3835))

#### Webapp - Administration

  - Fixed: Backport the git lock erase promise if older than 5 minutes
    from 2.5 to 2.4
    ([\#3531](http://www.rudder-project.org/redmine/issues/3531))
  - Fixed: The limit of the eventlog length (64chars) could lead to SQL
    errors
    ([\#3883](http://www.rudder-project.org/redmine/issues/3883))

#### Webapp - Display, home page

  - Fixed: On Node 'Management\>Groups' Screen modifying a group let the
    "Save" button masked and let believe it as not clickable (which is
    not true)
    ([\#3842](http://www.rudder-project.org/redmine/issues/3842))

#### Webapp - CFEngine integration

  - Fixed: The XML parser which check metadata.xml of the Techniques
    display a wrong error message when the XML is malformed (Talk about
    SECTION when it is due to INPUTS)
    ([\#3781](http://www.rudder-project.org/redmine/issues/3781))

#### Webapp - Node management

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

#### Packaging

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

This is a maintenance release, part of the "old stable" 2.4 branch. You
are invited if using this branch to upgrade to 2.6 as soon as possible
to enjoy the latest features with a still stable and more polished
version. See our FAQ for details, on
http://www.rudder-project.org/foswiki/FAQ/#What_is_the_versioning_policy_63.
2.4.\* versions will be maintained until January 2014.

## Rudder 2.4.7 (2013-07-30)

### Bug fixes

#### Webapp - Config management

  - The Rudder variables in directive values only work with full value
    ([\#3689](http://www.rudder-project.org/redmine/issues/3689))
  - CFEngine variables name in "CFEngine Generic Variable Definition"
    Directives no more support "dot" and need a migration script to
    "undot" existing ones
    ([\#3642](http://www.rudder-project.org/redmine/issues/3642))

#### Webapp - Administration

  - Restoring Rules with old fileFormat version does not work
    ([\#3768](http://www.rudder-project.org/redmine/issues/3768))

#### Webapp - Node management

  - "Search nodes" screen: After a first use of the search button, it is
    no more clickable until a change (add/remove/modification) of
    criteria
    ([\#3639](http://www.rudder-project.org/redmine/issues/3639))
  - Debug log when updating dynamic group is not clear
    ([\#3612](http://www.rudder-project.org/redmine/issues/3612))
  - An error is displayed in the [WebUI](WebUI) and the logs when
    removing a node because of an inefficient current action
    ([\#3517](http://www.rudder-project.org/redmine/issues/3517))

#### Inventory (webapp, Fusion)

  - Rudder ignores IP aliases on network interfaces
    ([\#3669](http://www.rudder-project.org/redmine/issues/3669))

#### Techniques

  - Deleting packages on Red Hat / [CentOS](CentOS) doesn't work
    ([\#3709](http://www.rudder-project.org/redmine/issues/3709))
  - The reporting of "Common Policies \> Update" could be in a 'No
    Answer' status
    ([\#3620](http://www.rudder-project.org/redmine/issues/3620))
  - Technique "APT package manager configuration": It is very complex to
    use ([\#2277](http://www.rudder-project.org/redmine/issues/2277))

#### Techniques - Sys & init promis

  - Cron on RHEL/CentOS and Ubuntu nodes was not checked with initial
    promises
    ([\#3730](http://www.rudder-project.org/redmine/issues/3730))

#### Architecture - Tests

  - Falacious test error in
    ([TestQuickSearchService](TestQuickSearchService)
    ([\#3760](http://www.rudder-project.org/redmine/issues/3760))

#### Logging

  - Some debug logs informations about concurrent access were wrong
    ([\#3641](http://www.rudder-project.org/redmine/issues/3641))

#### Miscellaneous

  - The script of initialization rudder-init.sh display an error message
    if called with arguments
    ([\#3747](http://www.rudder-project.org/redmine/issues/3747))

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter

### Release notes

This is a maintenance release, part of the "old stable" 2.4 branch. You
are invited if using this branch to upgrade to 2.6 as soon as possible
to enjoy the latest features with a still stable and more polished
version. See our FAQ for details, on
http://www.rudder-project.org/foswiki/FAQ/#What_is_the_versioning_policy_63.
2.4.\* versions will be maintained until January
2014.

## Rudder 2.4.6 (2013-06-07)

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

#### Webapp - Node management

  - It is not possible to add several nodes sharing the same IP from
    their private network interface
    ([\#3625](http://www.rudder-project.org/redmine/issues/3625))
  - Backport translation of datepickers from French (\#3425) to branch
    2.4 ([\#3576](http://www.rudder-project.org/redmine/issues/3576))
  - Persistent error messages using search nodes in Rudder
    \[WebUI](WebUI)\
    ([\#3512](http://www.rudder-project.org/redmine/issues/3512))
  - Searching on Last Inventory Date is not working
    ([\#3404](http://www.rudder-project.org/redmine/issues/3404))
  - Search nodes should accept the "m" notation in memory size
    ([\#3345](http://www.rudder-project.org/redmine/issues/3345))
  - No tooltip on Group page for Statis/Dynamic
    ([\#3597](http://www.rudder-project.org/redmine/issues/3597))

#### Webapp - Administration

  - Reload latest commit through API is not working
    ([\#3607](http://www.rudder-project.org/redmine/issues/3607))
  - Migration script for 'Archives' entry in ldap is missing
    ([\#3590](http://www.rudder-project.org/redmine/issues/3590))
  - Archives entry is missing in LDAP, leading to error when creating
    Rules ([\#3587](http://www.rudder-project.org/redmine/issues/3587))
  - System Rules/Directives/Groups should not be archived
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

This is a maintenance release, part the the current "stable" 2.4 branch.
You are invited to upgrade to this version if you want to enjoy the
latest bug fixes and a more polished version.

## Rudder 2.4.5 (2013-05-03)

### Bug fixes

#### Agent

  - Prevent cf\_lock.db to grow out of control on the server side
    ([\#3481](http://www.rudder-project.org/redmine/issues/3481))
  - Fix errors when stopping Rudder agent daemon with the init script if
    its pid file is empty
    ([\#3457](http://www.rudder-project.org/redmine/issues/3457))

#### Core

  - Cannot disable dynamic group update
    ([\#3264](http://www.rudder-project.org/redmine/issues/3264))
  - Technique library batch is not working and logs are not correct
    ([\#3563](http://www.rudder-project.org/redmine/issues/3563))
  - Prevent [PostgreSQL](PostgreSQL) to display errors when running
    rudder-init.sh
    ([\#3397](http://www.rudder-project.org/redmine/issues/3397))
  - Fix System Techniques
    ([\#3555](http://www.rudder-project.org/redmine/issues/3555),
    ([\#3467](http://www.rudder-project.org/redmine/issues/3467))
  - Simplify contributions with an IDE by adding source jar with maven
    compilation
    ([\#3400](http://www.rudder-project.org/redmine/issues/3400))

#### UI

  - Fix pop-up which were broken when a rule has inconsistancy errors
    ([\#3565](http://www.rudder-project.org/redmine/issues/3565))
  - Prevent from having empty error messages when a deployment fails
    ([\#3538](http://www.rudder-project.org/redmine/issues/3538))
  - Fix rule appearing several time in the confirmation pop-up when it
    has been disabled if it contained several targets
    ([\#3468](http://www.rudder-project.org/redmine/issues/3468))
  - Fix slowness of displaying details of a Directive when having a lots
    of them
    ([\#3387](http://www.rudder-project.org/redmine/issues/3387))
  - Modification of archives name to be more descriptive
    ([\#3392](http://www.rudder-project.org/redmine/issues/3392))
  - Prevent Chrome browser to fail to display the loading page after too
    many reload
    ([\#2401](http://www.rudder-project.org/redmine/issues/2401))
  - Various Fixes
    ([\#3411](http://www.rudder-project.org/redmine/issues/3411))

#### System integration

  - Allow to install a latest version of rudder-techniques
    ([\#3405](http://www.rudder-project.org/redmine/issues/3405))
  - Make rudder-server-root package depend on headless version of
    ([OpenJDK](OpenJDK)
    ([\#3395](http://www.rudder-project.org/redmine/issues/3395))
  - Fix continuous restarting of cron on Ubuntu
    ([\#3436](http://www.rudder-project.org/redmine/issues/3436))
  - Fix Rudder status check and send of inventories which failed if a
    proxy was defined in the environment
    ([\#3383](http://www.rudder-project.org/redmine/issues/3383)
    ([\#3401](http://www.rudder-project.org/redmine/issues/3401))
  - Various Fixes
    ([\#3551](http://www.rudder-project.org/redmine/issues/3551))

#### Techniques

  - Improve CFEngine performances
    ([\#3424](http://www.rudder-project.org/redmine/issues/3424)
    ([\#3439](http://www.rudder-project.org/redmine/issues/3439)
    ([\#3444](http://www.rudder-project.org/redmine/issues/3444)
    ([\#3454](http://www.rudder-project.org/redmine/issues/3454)
    ([\#3463](http://www.rudder-project.org/redmine/issues/3463)
    ([\#3485](http://www.rudder-project.org/redmine/issues/3485))
  - Technique "Process management": version 1.1 was not functionnal
    ([\#2801](http://www.rudder-project.org/redmine/issues/2801))
  - All Techniques: Permit CFEngine to edit files of 1MB
    ([\#3385](http://www.rudder-project.org/redmine/issues/3385))
  - Technique "Cron daemon configuration":Fix the cron binary path
    checked for Ubuntu to prevent to restart it every CFEngine execution
    ([\#3438](http://www.rudder-project.org/redmine/issues/3438))
  - Technique "APT package manager configuration": Handle Ubuntu 12.04
    and later
    ([\#3375](http://www.rudder-project.org/redmine/issues/3375))
  - Technique "Time settings": Fix errors if /etc/localtime is a
    symbolic link
    ([\#3437](http://www.rudder-project.org/redmine/issues/3437))
  - Technique "Package management for Debian / Ubuntu / APT systems":
    Support "allow untrusted" (optionnally)
    ([\#3396](http://www.rudder-project.org/redmine/issues/3396))
  - Technique "Download a file": Fix reports
    ([\#3346](http://www.rudder-project.org/redmine/issues/3346))

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Michael Gliwinski (Henderson Group)

### Release notes

This is a bug fix release in the 2.4 series. All installations of 2.4.x
should be upgraded when possible. 
This version of Rudder is in stable status. It has been thoroughly tests
for stability to be highly reliable, and is already in use on several
production platforms.

## Rudder 2.4.4 (2013-04-05)

### Bug fixes

#### Web application

  - When a deployment fails, there are no log in the application log
    telling so
    ([\#3333](http://www.rudder-project.org/redmine/issues/3333))
  - Node query with OR and regexp doesn't OR the result
    ([\#3340](http://www.rudder-project.org/redmine/issues/3340))
  - Using parametrized variables based on Rules values fails
    ([\#3332](http://www.rudder-project.org/redmine/issues/3332))
  - System Rules/Directives/Groups can be cloned/deleted/disabled
    ([\#3286](http://www.rudder-project.org/redmine/issues/3286))
  - Links in event log line are not correctly used
    ([\#3328](http://www.rudder-project.org/redmine/issues/3328))
  - Rudder can not start if a Technique has a Constraint error
    ([\#3356](http://www.rudder-project.org/redmine/issues/3356))
  - When a deployment fails, there are no log in the application log
    telling so
    ([\#3333](http://www.rudder-project.org/redmine/issues/3333))

#### Techniques

  - Techniques "Process Management" and "Set permissions on files":
    Wrong merge resulting in "policyInstanceId" variables in "Process
    Management" and "Set permissions on files"
    ([\#3245](http://www.rudder-project.org/redmine/issues/3245))
  - Detection of last promise update seems to be broken
    ([\#3244](http://www.rudder-project.org/redmine/issues/3244))
  - sudoParameters produces an invalid sudoers file when command is
    specified
    ([\#3324](http://www.rudder-project.org/redmine/issues/3324))
  - sudoParameters technique may insert env\_reset setting multiple
    times ([\#3323](http://www.rudder-project.org/redmine/issues/3323))
  - checkGenericFileContent should also execute a posthook command after
    line deletion or replacement
    ([\#3322](http://www.rudder-project.org/redmine/issues/3322))
  - \!ManageFileAndFolder: No reporting for the creation component are
    made when deleting files
    ([\#3246](http://www.rudder-project.org/redmine/issues/3246))
  - Techniques 'Zypper Package Manager Configuration' and 'RUG / \!YaST
    package manager configuration (ZMD)': Broken Reporting when
    configuration more than one repository which should not be added
    ([\#3170](http://www.rudder-project.org/redmine/issues/3170))
  - The filePermissions Technique can not load large permlists
    ([\#3257](http://www.rudder-project.org/redmine/issues/3257))
  - Apache 2 HTTP Server: receiving unexpected reports for component
    "SELinux context"
    ([\#2837](http://www.rudder-project.org/redmine/issues/2837))
  - Re-creation of the \!OpenSSH startup scripts failed on Debian/Ubuntu
    in the \!OpenSSH server Technique
    ([\#3368](http://www.rudder-project.org/redmine/issues/3368))
  - The distributePolicy is broken on RHEL based machines
    ([\#3260](http://www.rudder-project.org/redmine/issues/3260))
  - checkGenericFileContent 2.1 and 3.0 have desynchronized code between
    metadata and promises, leading to inconsistencies or uncorrected
    bugs ([\#3338](http://www.rudder-project.org/redmine/issues/3338))

#### Documentation

  - Rudder installation doc says that we should use "main contrib
    non-free" APT components on Debian and should be "main" only
    ([\#3344](http://www.rudder-project.org/redmine/issues/3344))

### Release notes

This is a maintenance release in the 2.4 series. All installations of
2.4.x should be upgraded when possible. This version of Rudder is in
stable status. It has been thoroughly tested for stability to be highly
reliable, and is already in use on several production platforms.

## Rudder 2.4.3 (2013-02-04)

### Bug fixes

#### Core

  - When updating Technique library, Directives modified due to
    Technique changes are not saved in the configuration repository on
    disk ([\#3212](http://www.rudder-project.org/redmine/issues/3212))
  - Migrating a Directive to a new Technique version can lead to
    ([EventLog](EventLog) generation error
    ([\#3129](http://www.rudder-project.org/redmine/issues/3129),
    ([\#3189](http://www.rudder-project.org/redmine/issues/3189))
  - The debug message listing the query executed by an archiving of
    reports is invalid
    ([\#3193](http://www.rudder-project.org/redmine/issues/3193))
  - Inventory from Centos 5.7 node on Xen domU missing UUID
    ([\#3138](http://www.rudder-project.org/redmine/issues/3138))
  - Fix compatibility with JDK 1.7
    ([\#3207](http://www.rudder-project.org/redmine/issues/3207))

#### UI

  - Deleted node is still marked as accepted in "Accept new
    nodes/History" panel
    ([\#3181](http://www.rudder-project.org/redmine/issues/3181))
  - The rule list doesn't complain when a rule refers to a non existing
    group ([\#3179](http://www.rudder-project.org/redmine/issues/3179))
  - Diff in modify directive event log is not correct
    ([\#3162](http://www.rudder-project.org/redmine/issues/3162))
  - When cloning a group, the parent category selected by default is not
    the one of the group we wish to clone
    ([\#3174](http://www.rudder-project.org/redmine/issues/3174))
  - Reports containing CFEngine variables aren't displayed in the
    ([WebUI](WebUI)
    ([\#3126](http://www.rudder-project.org/redmine/issues/3126))
  - Display 80 col for "Content of the file" fields in Directive
    configuration
    ([\#3109](http://www.rudder-project.org/redmine/issues/3109))
  - In Directive configuration, "path" and "file content" boxes could be
    more readable
    ([\#3095](http://www.rudder-project.org/redmine/issues/3095))
  - Cloning directives is not intuitive in the UI
    ([\#3082](http://www.rudder-project.org/redmine/issues/3082))
  - The database management displays an error when no database archive
    has ever been made
    ([\#3159](http://www.rudder-project.org/redmine/issues/3159))
  - The "close" button when there is a deployment failure is too big
    ([\#3173](http://www.rudder-project.org/redmine/issues/3173))
  - Modification message notification typo
    ([\#3088](http://www.rudder-project.org/redmine/issues/3088))
  - In the reporting drill-down, the button to open/close the lines are
    not following the guidelines
    ([\#3085](http://www.rudder-project.org/redmine/issues/3085))
  - Fix links to nodes in reporting detail
    ([\#3223](http://www.rudder-project.org/redmine/issues/3223))
  - When cloning a directive, the button on the popup to clone says
    "Configure" rather than "Clone"
    ([\#3206](http://www.rudder-project.org/redmine/issues/3206))

#### Packaging

  - rsyslog "reload" no longer exists on debian wheezy, making Rudder
    server 2.4/2.5 is not installable from packages
    ([\#3176](http://www.rudder-project.org/redmine/issues/3176))

#### Documentation

  - Section about known bugs is not up to date
    ([\#3216](http://www.rudder-project.org/redmine/issues/3216))
  - Server installation section is quite messy
    ([\#3168](http://www.rudder-project.org/redmine/issues/3168))

### Release notes

This is a maintenance release in the 2.4 series. All installations of
2.4.x should be upgraded when possible. 
This version of Rudder is in stable status. It has been thoroughly
tested for stability to be highly reliable, and is already in use on
several production platforms.

## Rudder 2.4.2 (2013-01-04)

### Changes

#### Core

  - Improve group historisation to store nodes on each group change
    ([\#3031](http://www.rudder-project.org/redmine/issues/3031))

#### UI

  - Make Group page extendable (using tabs)
    ([\#3042](http://www.rudder-project.org/redmine/issues/3042))

#### Techniques

  - Technique "Manage files and folders": Add possibility to force
    creation of symlink in case of already existing file, folder or
    link. ([\#3113](http://www.rudder-project.org/redmine/issues/3113))

### Bug fixes

#### Core

  - Fix system Technique 'DistributePolicy' which didn't have reports
    from the server when updating promises and was in a "No Answer"
    state ([\#3106](http://www.rudder-project.org/redmine/issues/3106))

#### UI

  - Fix popup stuck in invalid state when disabling/deleting a directive
    and omitting the change message when set as mandatory
    ([\#3086](http://www.rudder-project.org/redmine/issues/3086))
  - Prevent 'Enter' to do any action when focus is in filter input box
    of Directive
    ([\#3047](http://www.rudder-project.org/redmine/issues/3047))
  - Add 'change message' box in the new rule screen
    ([\#3083](http://www.rudder-project.org/redmine/issues/3083))
  - Various fixes
    ([\#2168](http://www.rudder-project.org/redmine/issues/2168),
    ([\#3081](http://www.rudder-project.org/redmine/issues/3081))

### Release notes

This is a maintenance release in the 2.4 series. All installations of
2.4.x should be upgraded when possible. 
This version of Rudder is in stable status. It has been thoroughly
tested for stability to be highly reliable, and is already in use on
several production platforms.

## Rudder 2.4.1 (2012-12-28)

### Bug fixes

#### Core

  - Allow unknown and future virtual machine types in the Node
    Inventories (\#3103)
  - Moving a group to a new category does not generate a commit in
    configuration repository then is not traceable (\#3101)
  - Various Fixes (\#3066)

#### System integration

  - Nodes using syslog-ng had their syslog-ng configuration corrupted,
    preventing it from starting, and preventing the node from sending
    its report to the Rudder server (\#3107)

#### Techniques

  - Technique "OpenSSH Server": Fix installation of openSSH server on
    ([SuSE](SuSE) and its reporting (\#3104)

#### UI

  - Various Fixes (\#2995)

### Release notes

This is a bug fix release in the 2.4 series. All installations of 2.4.0
should be upgraded when possible. 
This version of Rudder is in stable status. It has been thoroughly tests
for stability to be highly reliable, and is already in use on several
production platforms.

## Rudder 2.4.0 (2012-12-14)

### Bug fixes

#### Agent

  - Prevent aptitude "autoremove" feature from removing packages not
    explicitly requested (Debian and Ubuntu only) (\#2949)

#### System integration

  - Fix disturbing output during migration to 2.4.0~rc2 when LDAP needs
    to be reindexed or when the file logback.xml doesn't need to be
    upgraded (\#3075)

#### Techniques

  - Technique "OpenSSH Server": Fix 'Unknown' state in the compliance
    about the SSH process when changing a parameter (\#2873)

### Release notes

This version of Rudder is in stable status. It has been thoroughly tests
for stability to be highly reliable, and is already in use on several
production platforms. We recommend that all users upgrade to this
version as soon as possible.

## Rudder 2.4.0~rc2 (2012-12-07)

### Changes

#### Documentation

  - Add a note about making a VACUUM FULL in the database in case of a
    massive report archiving (\#2989)
  - Various documentation changes (\#3059, \#2983)

### Bug fixes

#### Agent

  - Service Pack was not recognized in the inventory of a SLES 11 SP2
    node if lsb\_release was installed on it (\#3035)
  - Add a more explicit error message when nodes can't get their
    promises from the server (\#2642)

#### Core

  - Avoid one error in copying from server breaking all following copies
    from server (\#3052)
  - Prevent to display LDAP errors in the [WebUI](WebUI) (\#2907)
  - Detect and provide logs and a workaround for occasional errors
    during upgrade of Techniques (Techniques need to be readded and
    reloaded to be functional) (\#3039)

#### UI

  - Reports table in Node details and Rules compliance details were not
    displayed properly if there were more than 10 rules applied to the
    node (\#3051, \#3054)
  - Various UI fixes (\#3036, \#3050)

#### System integration

  - Reports from Debian nodes using syslog-ng were not received by
    Rudder (\#3020)
  - Various system integration fixes (\#3037)

#### Techniques

  - Technique "Apache 2 HTTP Server": Fix incomplete and invalid
    reporting (\#3025)
  - Technique "OpenSSH Server": Specifying "Don't change" to the
    parameter "Address family used by sshd" broke the [OpenSSH](OpenSSH)
    server configuration (\#2987)
  - Technique "User Management": Could set the user password if the
    password field was filled even if the action to do was to only check
    the user (\#2552)
  - Technique "Enforce a file content": Version 3.1 didn't appear in
    Rudder 2.4 (\#3027)

### Release notes

This version of Rudder is in release candidate status. This version was
focused on stabilization and system integration to be highly reliable.
While we have tested it thoroughly and believe it to be free of any
major bugs, use on mission-critical systems is not encouraged at this
time and is at your own risk. We are however running it on several
production systems with success.

## Rudder 2.4.0~rc1 (2012-11-22)

### Changes

#### System integration

  - This version of Rudder adds support for Debian Wheezy (7)

#### Techniques

  - Technique "User Management": Take into account network users
    (special thanks to Michael Gliwinski\!) (\#2944)
  - Test suite improvement (\#2933)

#### Documentation

  - Add information on how to migrate a Rudder server to another one
    (\#2958)
  - Various documentation fixes (\#2340, \#2942)

### Bug fixes

#### Core

  - Fix reporting when the only node of a Rule has been deleted (\#2937)
  - Fix download of Directives/Rules/Groups as zip from Rudder UI
    (\#2990)
  - Fix system Technique common: The Technique used an unsupported
    parameter on Windows (\#2954)
  - Various code fixes (\#2934)

#### UI

  - Fix IE9 Compatibility (\#2027, \#2028, \#2029)
  - Various UI Fixes (\#1957, \#2936, \#2979, \#2980, \#2981, \#2982,
    \#2991, \#2992, \#3010)

#### System integration

  - Prevent Rudder agent from writing many logs to local syslog
    (/var/log/syslog or /var/log/messages on each node) (\#2993)
  - Save disk space by compressing big log files - copy of reports on
    server (\#2962)
  - Save disk space by compressing big log files - autoclean LDAP
    database transaction logs (\#2963)
  - Fix broken Java dependencies on [CentOS](CentOS) (\#2941)
  - Fix reporting on nodes with syslogd (not syslog-ng nor rsyslog)
    which never communicated back to Rudder server (\#2943)
  - Add check to avoid any more than 5 cf-agents running simulataneously
    (\#3012)
  - Fix cron check to relaunch CFEngine to detect cf-execd and cf-agent
    too (\#3013)
  - Fix timestamp format in agent logs generated by the "failsafe"
    mechanism (\#2994)
  - Prevent Jetty from hanging indefinitely when restart script fails
    (\#2846)

#### Techniques

  - Fix Technique "Job Scheduler": Job was never launched if start time
    was between 0:00 and 9:00 AM (\#2940)
  - Fix Technique "Time Settings": Installation of NTP didn't work on
    RHEL/CentOS (\#2384)
  - Fix Technique "Enforce a file content" version 2.0: this version was
    not functional (\#3022)
  - Fix Technique "Package management for Debian / Ubuntu / APT
    systems": avoid the package manager blocking on pre-existing
    configuration files during package installation (\#2946)

#### Known issues

There is one known issue with this release of Rudder:

  - Technique "Enforce a file content" version 3.1 is rejected by Rudder
    (\#3027), causing the following bug fixes to be unavailable:
      - Technique "Enforce a file content": Option to choose if the file
        to edit should be created or not if it doesn't already exist
        (\#2945)
      - Technique "Enforce a file content": line remplacement didn't
        work if the replacement was empty and only one Directive from
        this Technique was applied on a node (\#2819)

This can be worked around by downloading and installing a nightly build
of the rudder-techniques package, from our nightly build APT repo
(http://www.rudder-project.org/apt-2.4-nightly/) or RPM repo
(http://www.rudder-project.org/rpm-2.4-nightly/).

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Benoît Peccatte
  - [François Bayart aka A-Kaser](https://twitter.com/frbayart) (Look a
    box)
  - Michael Gliwinski (Henderson Group)

### Release notes

This version of Rudder is in release candidate status. This version was
focused on stabilization and system integration to be highly reliable.
While we have tested it thoroughly and believe it to be free of any
major bugs, use on mission-critical systems is not encouraged at this
time and is at your own risk. We are however running it on several
production systems with success.

## Rudder 2.4.0~beta5 (2012-10-29)

### Changes

#### UI

  - Rename "Configuration Management" section to "Configuration Policy"
    (\#2864)
  - Display drill-down view of compliance with configuration policy
    (\#2838)
  - Enhance the eventlogs view by adding a colored diff view (\#2782)
  - Display CFEngine errors in Rudder [WebUI](WebUI) (\#2877)
  - Many UI and cosmetic improvements (\#2354 \#2825 \#2851 \#2859
    \#2865 \#2871 \#2893 \#2902 \#2906 \#2903 \#2912 \#2921 \#2922
    \#2924 \#2925 \#2926 \#2918 \#618 \#2332 \#2904 \#2916 \#2874 \#2869
    \#2866 \#2896 \#2915)

#### Core

  - Add the possibilty to disable rudder-agent by creating
    /opt/rudder/etc/disable-agent (\#2884)
  - Change path of Rudder webapp core log from
    /var/log/rudder/webapp-opslog to /var/log/rudder/core/ (\#2799)
  - Fixed Rudder server on Ubuntu 12.04 by adding the possibility to
    specify an alternate port for syslog (\#2768)
  - No need to specify the hostname in rudder-web.properties anymore to
    access the Rudder [WebUI](WebUI) (\#2282)
  - Prevent Rudder from adding nodes with an already known IP or
    hostname (leading to have nodes which couldn't access their
    promises) (\#2791)
  - Various code improvements (\#2812 \#2892 \#2917 \#2765 \#2829 \#2927
    \#2845)

#### Documentation

  - Various improvements (\#2836 \#2839 \#2863 \#2886 \#2358 \#2402
    \#2885)

### Bug fixes

#### Upgrading from 2.3

  - Some upgrades could cause groups, directives and rules to
    "disappear" from the UI (\#2900)
  - Some eventlogs were not correctly displayed because of failed
    migrations (\#2894)
  - Rudder users migrated from Rudder 2.3.x were missing role entries,
    leaving them with no right access to Rudder (\#2822)
  - When upgrading from 2.3.x, the Rudder server inventory data was
    missing until the nightly inventory was sent (\#2745)

#### UI

  - If the node details view is in a popup, the delete button had no
    effect (\#2856)
  - Fixed an error when trying to display Node details for the first
    time for a node after application startup (\#2826)
  - When creating or cloning a node group, no reason message popup was
    displayed (\#2719)
  - When restarting Rudder with a deployment status in error, the
    display of the error message was broken: "Failure(...) objects"
    (\#2913)
  - Various UI fixes (\#2928 \#2909)

#### Core

  - Some BDB databases could get corrupted and lead the Rudder agent to
    fail (\#2607)
  - Rudder agent would not run on newly installed nodes (\#2729)
  - Priorities on multi-instance Techniques were broken (\#2860)
  - Warn about errors when several Directives use a Technique with
    different versions (\#2041)
  - Removed misleading warning message about non-existent file
    /opt/rudder/etc/rudder-passwords.conf on nodes (\#2848)
  - The Red button functionality was no more usable leading to not be
    able to automatically stop the agent (\#2923)
  - Having several folders containing Techniques in
    /var/rudder/configuration-repositories could lead to errors (\#2855)
  - Reloading an archive made before the eventlog format migration was
    not working (\#2895)
  - Machines without a valid UUID (such as Xen VMs) couldn't be added to
    Rudder (\#1845 \#2898 \#2899)
  - Archive functionality failed if Techniques have been deleted and
    LDAP still contains inconsistent data referencing them (\#2656)
  - Various code fixes (\#2920 \#2321)

#### System integration

  - Jetty could not be started if Java was located in /usr/java/,
    JAVA\_HOME was not defined and Java was not in /usr/bin/java
    (\#2842)
  - Rudder webapp core log (/var/log/rudder/core/rudder-webapp.log) may
    have had its locale changed after a restart (\#2844)
  - Various packaging fixes (\#2747 \#2831 \#2858 \#2751 \#2293 \#2792
    \#2739 \#2850 \#2862 \#2807)

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - [François Bayart aka A-Kaser](https://twitter.com/frbayart) (Look a
    box)
  - Michael Gliwinski (Henderson Group)
  - [Gonéri Le Bouder](https://twitter.com/goneri) (Teclib)

### Release notes

This version of Rudder is in beta status, but the 2.4 branch is very
near release candidate status. The most noteworthy changes for the users
should be the cosmetic improvements in the UI that make Rudder more
enjoyable to use. While we have tested it thoroughly and believe it to
be free of any major bugs, use on production systems is not encouraged
at this time and is at your own risk. We are however running it on our
internal production system with success.

## Rudder 2.4.0~beta4 (2012-09-05)

### Changes

  - Various UI improvements (\#2824, \#2746, \#2776, \#2832, \#2847,
    \#2752)
  - Various code improvements (\#2762, \#2773, \#2771, \#2808, \#1971)
  - Add logrotate configuration for
    /var/log/rudder/core/rudder-webapp.log (\#2800)

### Bug fixes

  - IP addresses are now updated from incoming inventories again
    (\#2811)
  - Adding group criteria no longer resets the existing criteria
    (\#2841)
  - Users with read-only access can no longer add new Techniques to the
    Techniques User Library (\#2796)
  - Users with read-only access can no longer clone Groups and
    update/delete Group categories (\#2849)
  - Reporting was incomplete for the system Technique "distribute
    policy" used on the root server (\#2755)
  - Installing the rudder-reports package could fail with an error about
    "Is the server running locally and accepting connections on Unix
    domain socket" (\#2835)
  - /etc/init.d/rudder-server-root failed to start/stop/restart Apache
    on RHEL/CentOS systems (\#2852)
  - Upgrading Rudder from an older version would fail if the rootpw in
    slapd.conf was hashed (\#2821)
  - The logrotate script installed on SLES 11 Rudder server's was
    incorrect (\#2820)
  - Upgrading a Rudder server from 2.3.x to 2.4.x on RPM systems didn't
    remove the rudder-cfengine-community package (\#2806)

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Ade Bradshaw
  - Michael Gliwinski

### Release notes

This version of Rudder is in beta status. While we have tested it
thoroughly and believe it to be free of any majors bugs, use on
production systems is not encouraged at this time and is at your own
risk. We are however running it on our internal production system with
success.

## Rudder 2.4.0~beta3 (2012-08-21)

### Changes

It is impossible to list every change here (check out the [Redmine
roadmap](../../../redmine/projects/rudder/roadmap?completed=1) for
that), but here is an overview of the major changes:

  - Core concepts renamed for clarity – Configuration Rules, Policy
    Instances and Policy Templates are now Rules, Directives and
    Techniques
  - REST API
  - Basic authorization management
  - Drill down information about configuration status for Rules,
    Directives, Components and Values is available in the UI
  - New “ops log” targeted at sysadmins who need to analyze the
    application in production
  - Inventory information now includes environment variables, running
    processes and virtual machines
  - Nodes can now be deleted
  - The Rudder server can now manage itself (the server is “just another
    node”)
  - Rudder server now checks it’s own configuration via CFEngine (aka
    “eat your own dogfood”)
  - All configurations (groups, Rules, Directives & Techniques) can now
    be exported to a local git repository, a ZIP archive and imported
    similarly
  - A change message can be requested on each change for documentation
    (visible in Event Logs and as a git commit message)
  - Automatic configuration deployment can be disabled to allow for
    manual change validation
  - Groups and Directives can now be cloned
  - Many UI improvements

### Release notes

Please note that this beta3 version contains significantly more new
features that the beta1 and beta2 versions (available on
rudder-project.org but not officially announced). This decision was made
to include features from another branch that were reaching maturity
almost at the same time as this release was prepared. This decision is
the cause for the delay in this release, and can be seen as uncommon,
but we are confident about the quality of this release.

This version of Rudder is in beta status. While we have tested it
thoroughly and believe it to be free of any majors bugs, use on
production systems is not encouraged at this time and is at your own
risk. We are however running it on our internal production system with
success.

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make Rudder a better tool:

  - [Fabrice Flore-Thébault](https://twitter.com/themr0c)
  - [François Bayart aka A-Kaser](https://twitter.com/frbayart) (Look a
    box)
  - [Gonéri Le Bouder](https://twitter.com/goneri) (Teclib)
  - [Jean Rémond](https://twitter.com/jean_remond_) (Savoir Faire Linux)
  - Matt Ungaro
  - Michael Gliwinski (Henderson Group)
  - Michael Linder (Arcellor Mittal)
  - [Olivier Li Kiang Cheong aka lkco](http://lkco.gezen.fr/)
  - And of course the whole team at Normation who have worked through
    ice cold and blazing heat, mud, sweat and tears to make this
    happen\!

See the full announcement online on Normation's blog:
http://blog.normation.com/2012/08/21/rudder-2-4-0-beta-available/.

