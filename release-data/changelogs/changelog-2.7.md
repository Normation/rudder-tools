# Change logs for Rudder 2.7.\* "Powerboat" versions

Rudder 2.7 is currently the **old-latest** available version of
Rudder.This branch is codenamed "Powerboat".

This page provides a summary of changes for each version.

A blog post about all these features is available here:
http://blog.normation.com/en/2013/09/03/rudder-2-7/

**Installing, upgrading and testing**

Documentation to Install and Upgrade is available online. The Download
page sums up URLs. We also recommend using the Rudder Vagrant config if
you want a quick and easy way to get an installation for testing.

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server: **Debian 5, Debian 6, Debian 7, RHEL/CentOS 6, SLES
    11, Ubuntu 11.10, Ubuntu 12.04 and Ubuntu 12.10**
  - Rudder agent: all of the above plus **RHEL/CentOS 3**, **RHEL/CentOS
    5, SLES 10 and Ubuntu 10.04**

## Rudder 2.7.7 (2014-01-16)

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
    ([\#4156](http://www.rudder-project.org/redmine/issues/4156)) \*
    Fixed: correct some typos is 'sshConfiguration' Technique v3.0
    ([\#4328](http://www.rudder-project.org/redmine/issues/4328))

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
  - Joachim Setzer
  - Alex Tkachenko

This is a bug fix release in the 2.7 series and all installations of
2.7.x should be upgraded when possible. This version is not yet marked
"stable", since it has not yet proven itself to be reliable on
production systems over a period of several months. The current "stable"
release is still 2.6.\*.

When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. To be
declared "stable" we prefer to wait until a version has been available
and running in production for several months. However, since new 2.9.\*
versions has been released, we expect that new version to be declared
stable very soon.

## Rudder 2.7.6 (2013-11-20)

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

  - Fixed: Rudder upgrade script is not launched on installation on RPM
    based systems which could lead to error if Rudder was previously
    removed
    ([\#4121](http://www.rudder-project.org/redmine/issues/4121))
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

#### Webapp - Node management

  - Fixed: A deleted node that is re-added causes appearance of a "No
    Machine Inventory" in the Nodes list
    ([\#4085](http://www.rudder-project.org/redmine/issues/4085))

#### Webapp - Config management

  - Fixed: The check of validity of Rudder parameters within variable
    values is too strict and does not permit spaces
    ([\#4063](http://www.rudder-project.org/redmine/issues/4063))
  - Fixed: The deletion of a Technique version used by a Directive will
    throw an error ' [NoSuchElementError](NoSuchElementError) '
    ([\#3687](http://www.rudder-project.org/redmine/issues/3687))

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

This is a bug fix release in the 2.7 series and all installations of
2.7.x should be upgraded when possible. 
This version is not yet marked "stable", since it has not yet proven
itself to be reliable on production systems over a period of several
months. The current "stable" release is still 2.6.\*. 
 
When we release a new version of Rudder it has been thoroughly tested,
and we consider the release enterprise-ready for deployment. To be
declared "stable" we prefer to wait until a version has been available
and running in production for several months. As such, we expect version
2.7 of Rudder to be declared stable very soon.

## Rudder 2.7.5 (2013-10-09)

### Changes

### Bug fixes

#### Packaging

  - Fixed: Installing rudder-server-root on SLES fails on init script
    ([\#4001](http://www.rudder-project.org/redmine/issues/4001))
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

This is a bug fix release in the 2.7 series and all installations of
2.7.x should be upgraded when possible. We have tested it thoroughly on
production systems and believe it to be free of any major bugs. This
version is not marked "stable", since it has not proven to be reliable
on production systems over time yet. The current "stable" release is
still 2.6.\*.

The previous release (2.7.4) was not publicly annouced as it
unfortunately did not meet our quality and assurance requirements.

## Rudder 2.7.3 (2013-10-03)

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

#### Webapp - Config management

  - Fixed: When we delete a Directive, the tree is not refreshed and we
    can still click on the deleted directive
    ([\#3800](http://www.rudder-project.org/redmine/issues/3800))

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
  - Fixed: The documentation does not mention the V2 of the API
    ([\#3907](http://www.rudder-project.org/redmine/issues/3907))

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

This is a bug fix release in the 2.7 series and all installations of
2.7.x should be upgraded when possible. We have tested it thoroughly on
production systems and believe it to be free of any major bugs. This
version is not marked "stable", since it has not proven to be reliable
on production systems over time yet. The current "stable" release is
still
2.6.\*.

## Rudder 2.7.2 (2013-09-06)

### Bug fixes

#### Webapp - Node management

  - Fixed: Node management\>Groups screen CSS is broken when opening a
    group ([\#3901](http://www.rudder-project.org/redmine/issues/3901))

#### Packaging

  - Fixed: The rudder-upgrade scripts fails during upgrade because of a
    missing SQL migration script for installations of Rudder since
    v2.3.\*
    ([\#3905](http://www.rudder-project.org/redmine/issues/3905))
  - Fixed: Postinstall script of rudder-inventory-endpoint display a
    warning about fail of rsyslog restart at first install on
    RHEL/CentOS
    ([\#3900](http://www.rudder-project.org/redmine/issues/3900))

#### Techniques

  - Fixed: /etc/cron.d/rudder-agent is broken after launching cf-agent
    for the first time until a generation of promises by Rudder server
    ([\#3908](http://www.rudder-project.org/redmine/issues/3908))

### Release notes

This is a minor bug fix release in the 2.7 series and all installations
of 2.7.x should be upgraded when possible. The main reason of this minor
release was to fix an upgrade bug
[\#3905](http://www.rudder-project.org/redmine/issues/3905)) if install
history goes back to 2.3.\*. 
This version is not marked "stable", since it has not proven to be
reliable on production systems over time yet. The current "stable"
release is still 2.6.\*.

## Rudder 2.7.1 (2013-09-03)

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

#### API

  - Fixed: API: Changing pending node status doesn't work
    ([\#3874](http://www.rudder-project.org/redmine/issues/3874))
  - Fixed: X-API-Version header does not support "latest" version
    ([\#3817](http://www.rudder-project.org/redmine/issues/3817))

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

#### Webapp - Node management

  - Fixed: Strange ordering of groups and categories
    ([\#3863](http://www.rudder-project.org/redmine/issues/3863))
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

#### Webapp - Display, home page

  - Fixed: On Webapp User Manual, clicking on PDF link sends ends up in
    404 ([\#3819](http://www.rudder-project.org/redmine/issues/3819),
    ([\#3895](http://www.rudder-project.org/redmine/issues/3895),
    ([\#3898](http://www.rudder-project.org/redmine/issues/3898))

#### Webapp - Config management

  - Fixed: Delete button in parameter table is missing the new delete
    button style
    ([\#3823](http://www.rudder-project.org/redmine/issues/3823))

#### Webapp - CFEngine integration

  - Fixed: The XML parser which check metadata.xml of the Techniques
    display a wrong error message when the XML is malformed (Talk about
    SECTION when it is due to INPUTS)
    ([\#3781](http://www.rudder-project.org/redmine/issues/3781))

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

  - Fixed: Wrong dependencies (imageMagick, graphivz,etc..) of
    rudder-webapp since the documentation is no more builded by the
    packaging
    ([\#3897](http://www.rudder-project.org/redmine/issues/3897))
  - Fixed: The script rudder-upgrade checked a wrong apache config file
    for [SuSE](SuSE) and RHEL/CentOS
    ([\#3862](http://www.rudder-project.org/redmine/issues/3862))
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

This is a bug fix release in the 2.7 series and all installations of
2.7.x should be upgraded when possible. We have tested it thoroughly on
production systems and believe it to be free of any major bugs. This
version is not marked "stable", since it has not proven to be reliable
on production systems over time yet. The current "stable" release is
still 2.6.\*.

## Rudder 2.7.0 (2013-07-31)

### Bug fixes

#### API

  - Fixed: API Account Token can not be regenerated
    ([\#3790](http://www.rudder-project.org/redmine/issues/3790))

#### Webapp - Administration

  - Fixed: The display of multiline Global Parameter is not really great
    ([\#3801](http://www.rudder-project.org/redmine/issues/3801))
  - Fixed: The details of an event log about export of parameters cannot
    be displayed
    ([\#3792](http://www.rudder-project.org/redmine/issues/3792))
  - Fixed: When there is an error in the API acocunt generation, there's
    no error messages appearing in the UI
    ([\#3791](http://www.rudder-project.org/redmine/issues/3791))

#### Packaging

  - Fixed: rudder-agent init script ignores the
    /opt/rudder/etc/disable-agent flag file
    ([\#3803](http://www.rudder-project.org/redmine/issues/3803))
  - Fixed: The migration script rudder-upgrade does not take into
    account the new apache configuration of rudder-default
    ([\#3802](http://www.rudder-project.org/redmine/issues/3802))
  - Fixed: The use of the deprecated API functions should not be able to
    be done with a version number higher than 1
    ([\#3797](http://www.rudder-project.org/redmine/issues/3797))
  - Fixed: "disable-agent" feature does not work as expected (doesn't
    stop **running** agents)
    ([\#3794](http://www.rudder-project.org/redmine/issues/3794))

#### Techniques

  - Fixed: Technique "OpenSSH Server" v3.0: it does not correctly edit
    ssh ports on systems other than RHEL/SLES
    ([\#3758](http://www.rudder-project.org/redmine/issues/3758))
  - Fixed: RPM package installation technique version 4.0 uses wrong
    path for data file (3.0/...)
    ([\#3779](http://www.rudder-project.org/redmine/issues/3779))
  - Fixed: Technique "Group management": make group creation optional
    ([\#3378](http://www.rudder-project.org/redmine/issues/3378))
  - Fixed: Technique "Package management for RHEL / [CentOS](CentOS) /
    ([SuSE](SuSE) / RPM systems: Options could be clearer
    ([\#3793](http://www.rudder-project.org/redmine/issues/3793))

### Changes

#### Packaging

  - rudder-agent init should return non-zero (0) on status operation if
    is not running
    ([\#3805](http://www.rudder-project.org/redmine/issues/3805))

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Michael Gliwinski (Henderson Group)

### Release notes

This version of Rudder is a final release. We have tested it thoroughly
on production systems and believe it to be free of any major bugs. 
However, this version is not marked "stable", since it has not proven to
be reliable on production systems over time yet. The current "stable"
release is still 2.6.\*.

## Rudder 2.7.0~rc1 (2013-07-26)

### Bug fixes

#### API

  - Wrong URL for nodegroup reloading through API
    ([\#3775](http://www.rudder-project.org/redmine/issues/3775))
  - API calls using JSON content instead of parameters are ignored
    ([\#3770](http://www.rudder-project.org/redmine/issues/3770))

#### Techniques - Sys & init promis

  - Use cron.d instead of the crontab to store Rudder cron entry (also
    in initial promises)
    ([\#3731](http://www.rudder-project.org/redmine/issues/3731))
  - Cron on RHEL/CentOS and Ubuntu nodes was not checked with initial
    promises
    ([\#3730](http://www.rudder-project.org/redmine/issues/3730))
  - Double cron job for Rudder agent when upgrading from 2.5 to 2.6
    ([\#3681](http://www.rudder-project.org/redmine/issues/3681))
  - The reporting of "Common Policies \> Update" could be in a 'No
    Answer' status
    ([\#3620](http://www.rudder-project.org/redmine/issues/3620))

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
    ([\#3642](http://www.rudder-project.org/redmine/issues/3642),
    ([\#3746](http://www.rudder-project.org/redmine/issues/3746))
  - Screen "Configuration Policy\>Directives": The buttons are ugly (not
    rounded)
    ([\#3688](http://www.rudder-project.org/redmine/issues/3688))
  - Cannot use Parameters in directive
    ([\#3788](http://www.rudder-project.org/redmine/issues/3788))
  - Migration of some Directives version does not work if no
    modification are made in the parameters with the message "There are
    no modification to save"
    ([\#3732](http://www.rudder-project.org/redmine/issues/3732))
  - Migration of eventlogs and Change Requests at startup lead to errors
    ([\#3772](http://www.rudder-project.org/redmine/issues/3772))

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

#### Webapp - Administration

  - In the API Account page, several [JavaScript](JavaScript) issues
    ([\#3789](http://www.rudder-project.org/redmine/issues/3789),
    ([\#3773](http://www.rudder-project.org/redmine/issues/3773))
  - It is impossible to know who has created or removed an API account
    for Rudder
    ([\#3766](http://www.rudder-project.org/redmine/issues/3766))
  - There is no ID for the API Account
    ([\#3784](http://www.rudder-project.org/redmine/issues/3784),
    ([\#3785](http://www.rudder-project.org/redmine/issues/3785))
  - Change Request can't be validated if it concerns groups
    ([\#3644](http://www.rudder-project.org/redmine/issues/3644))
  - Change Request can't be validated if there is trailing spaces in the
    modified object
    ([\#3660](http://www.rudder-project.org/redmine/issues/3660))
  - Change Request could display error in the logs if its directive is
    based on Techniques using fixed regex (IP, Mail)
    ([\#3759](http://www.rudder-project.org/redmine/issues/3759))
  - Screen "Administration\>Policy Server": Buttons are broken after
    first click on them
    ([\#3764](http://www.rudder-project.org/redmine/issues/3764))

#### Documentation

  - The "User manual" in Rudder 2.7 contains version number of Rudder
    2.6 ([\#3771](http://www.rudder-project.org/redmine/issues/3771))

#### Miscellaneous

  - The output of rudder-upgrade script contains some disappointing
    messages during upgrade
    ([\#3774](http://www.rudder-project.org/redmine/issues/3774))
  - Base64 entries are not supported by the migration script for 2.6
    concerning the unescaping of directive contents
    ([\#3780](http://www.rudder-project.org/redmine/issues/3780))
  - Build rudder-agent on SLES 10 is no more possible since the use of
    the 'T' flag with cp in our SOURCES/Makefile
    ([\#3678](http://www.rudder-project.org/redmine/issues/3678))
  - The rudder-upgrade script could be very long to execute (\>5min)
    ([\#3611](http://www.rudder-project.org/redmine/issues/3611))
  - The script of initialization rudder-init.sh display an error message
    if called with arguments
    ([\#3747](http://www.rudder-project.org/redmine/issues/3747))

#### Architecture - Tests

  - Falacious test error in
    ([TestQuickSearchService](TestQuickSearchService)
    ([\#3760](http://www.rudder-project.org/redmine/issues/3760))

#### Techniques

  - Techniques using reporting based on file edition don't have proper
    reporting for kept status with CFEngine 3.4.x
    ([\#3618](http://www.rudder-project.org/redmine/issues/3618))
  - Technique "Enforce a file content": Outdated comments about escaping
    quotes which is no longer necessary as of Rudder 2.6
    ([\#3787](http://www.rudder-project.org/redmine/issues/3787))
  - Deleting packages on Red Hat / [CentOS](CentOS) doesn't work
    ([\#3709](http://www.rudder-project.org/redmine/issues/3709))
  - Technique "APT package manager configuration" was very complex to
    understand
    ([\#2277](http://www.rudder-project.org/redmine/issues/2277))

### Changes

#### Techniques

  - Add new Technique: "Generic CFEngine Command variable definition"
    permitting to initialize CFEngine variables from the result of shell
    commands
    ([\#3214](http://www.rudder-project.org/redmine/issues/3214))
  - Technique "MOTD configuration": Apply best practices
    ([\#3629](http://www.rudder-project.org/redmine/issues/3629))

#### Miscellaneous

  - Add support for rudder-agent on RHEL / [CentOS](CentOS) 3
    ([\#3648](http://www.rudder-project.org/redmine/issues/3648))

### Release notes

This version is a release candidate, and contains bug fixes sinces
2.7.0~beta1. We have tested it and believe it to be free of any critical
bugs. 
The use on production systems is not encouraged at this time and is at
your own risk. However, we do encourage testing, and welcome all and any
feedback\!

## Rudder 2.7.0~beta1 (2013-07-19)

### Changes

#### API

  - Build a REST API to manage all actions in Rudder (CRUD on Nodes,
    Groups, Directives and Rules)
    ([\#3000](http://www.rudder-project.org/redmine/issues/3000))

#### Webapp - Config management

  - Add global parameters that can be used in Directives
    ([\#3349](http://www.rudder-project.org/redmine/issues/3349))
  - Allow to choose a version of Technique to use when creating a
    directive
    ([\#2797](http://www.rudder-project.org/redmine/issues/2797))

#### Webapp - Node management

  - Add possibility to create a group with a combinaison of matching a
    regex and not matching another regex
    ([\#3613](http://www.rudder-project.org/redmine/issues/3613))

#### Webapp - Administration

  - Move the Technique page in the Administration menu
    ([\#3707](http://www.rudder-project.org/redmine/issues/3707))

#### Miscellaneous

  - Remove all entries in Rudder-upgrade about upgrade from 2.3 to 2.4
    ([\#3711](http://www.rudder-project.org/redmine/issues/3711))

#### Webapp - Display, home page

  - Add Rudder 2.7 logo
    ([\#3728](http://www.rudder-project.org/redmine/issues/3728))
  - Make community and support links on the home page more visible
    ([\#3699](http://www.rudder-project.org/redmine/issues/3699))
  - Rudder documentation available directly on a Rudder server (locally)
    ([\#3692](http://www.rudder-project.org/redmine/issues/3692))
  - Color "Delete this node" button
    ([\#3666](http://www.rudder-project.org/redmine/issues/3666))

#### Webapp - Node management

  - Node management link should send user to the list of nodes screen
    ([\#3697](http://www.rudder-project.org/redmine/issues/3697))

#### Techniques

  - Don't update promises when running the standard promises.cf
    ([\#3722](http://www.rudder-project.org/redmine/issues/3722))

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter

### Release notes

This software is in beta status and contains several new features but we
have tested it and believe it to be free of any critical bugs. 
The use on production systems is not encouraged at this time and is at
your own risk. However, we do encourage testing, and welcome all and any
feedback\!

