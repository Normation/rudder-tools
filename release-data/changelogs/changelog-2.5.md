# Change logs for Rudder 2.5.\* "Tugboat" versions

Rudder 2.5 is end of life since 31 July 2013. This branch is codenamed
"Tugboat".

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Installing, upgrading and testing**

Documentation to
[Install](http://www.rudder-project.org/rudder-doc-2.5/rudder-doc.html#_install_rudder_server)
and
[Upgrade](http://www.rudder-project.org/rudder-doc-2.5/rudder-doc.html#_upgrade_rudder)
is available online. The [Download](../../Download/WebHome) page sums up
URLs. We also recommend using the [Rudder Vagrant
config](https://github.com/normation/rudder-vagrant/) if you want a
quick and easy way to get an installation for testing.

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server: **Debian 5**, **Debian 6, Debian 7**, **RHEL/CentOS
    6**, **SLES 11**, **Ubuntu 11.10**, **Ubuntu 12.04**, **Ubuntu
    12.10**
  - Rudder agent: all of the above plus **RHEL/CentOS 5** and **SLES
    10**

## Rudder 2.5.5 (2013-07-30)

### Bug fixes

#### Webapp - Config management

  - Screen "Configuration Policy\>Directives": The buttons are ugly (not
    rounded)
    ([\#3688](http://www.rudder-project.org/redmine/issues/3688))
  - The Rudder variables in directive values only work with full value
    ([\#3689](http://www.rudder-project.org/redmine/issues/3689))
  - CFEngine variables name in "CFEngine Generic Variable Definition"
    Directives no more support "dot" and need a migration script to
    "undot" existing ones
    ([\#3642](http://www.rudder-project.org/redmine/issues/3642))

#### Webapp - Administration

  - Screen "Administration\>Policy Server": Buttons are broken after
    first click on them
    ([\#3764](http://www.rudder-project.org/redmine/issues/3764))
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

  - Double cron job for Rudder agent when upgrading from 2.5 to 2.6
    ([\#3681](http://www.rudder-project.org/redmine/issues/3681))
  - Deleting packages on Red Hat / [CentOS](CentOS) doesn't work
    ([\#3709](http://www.rudder-project.org/redmine/issues/3709))
  - The reporting of "Common Policies \> Update" could be in a 'No
    Answer' status
    ([\#3620](http://www.rudder-project.org/redmine/issues/3620))
  - Technique "APT package manager configuration": It is very complex to
    use ([\#2277](http://www.rudder-project.org/redmine/issues/2277))

#### Techniques - Sys & init promis

  - Use cron.d instead of the crontab to store Rudder cron entry (also
    in initial promises)
    ([\#3731](http://www.rudder-project.org/redmine/issues/3731))
  - Cron on RHEL/CentOS and Ubuntu nodes was not checked with initial
    promises
    ([\#3730](http://www.rudder-project.org/redmine/issues/3730))

#### Architecture - Tests

  - Falacious test error in
    ([TestQuickSearchService](TestQuickSearchService)
    ([\#3760](http://www.rudder-project.org/redmine/issues/3760))

#### Logging

  - Non compliant reports flood the Rudder logs on a new installation
    ([\#3655](http://www.rudder-project.org/redmine/issues/3655))
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

This is the final maintenance release of the 2.5 branch. We recommend
that any installations still using 2.5.\* be upgraded as soon as
possible to Rudder 2.6.\* as soon as possible to enjoy the latest
features with a still stable and more polished version. See our FAQ for
details, on
http://www.rudder-project.org/foswiki/FAQ/#What_is_the_versioning_policy_63.

## Rudder 2.5.4 (2013-06-07)

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

  - When restoring latest commit, no commit should be made
    ([\#3593](http://www.rudder-project.org/redmine/issues/3593))
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

This is a maintenance release in the 2.5 series. All installations of
2.5.x should be upgraded when possible. This version is not marked
"stable" but it is already in use on several internal platforms. You are
invited to upgrade to 2.6 as soon as possible to enjoy the latest
features with a still stable and more polished version.

## Rudder 2.5.3 (2013-05-03)

### Bug fixes

#### Agent

  - Fix UUID generated for a node which was not generated for the first
    execution of CFEngine
    ([\#3523](http://www.rudder-project.org/redmine/issues/3523))
  - Prevent cf\_lock.db to grow out of control on the server side
    ([\#3481](http://www.rudder-project.org/redmine/issues/3481))
  - Fix errors when stopping Rudder agent daemon with the init script if
    its pid file is empty
    ([\#3457](http://www.rudder-project.org/redmine/issues/3457))

#### Core

  - Add a promise to remove Git lock file which could prevent to add new
    nodes ([\#3526](http://www.rudder-project.org/redmine/issues/3526)
    ([\#3533](http://www.rudder-project.org/redmine/issues/3533))
  - Fix wrong service name of Apache which cause it to be restarted
    every five minutes on [RedHat](RedHat) /CentOS
    ([\#3537](http://www.rudder-project.org/redmine/issues/3537))
  - Fix broken automatic reload of Techniques when upgrading Rudder 2.5
    to 2.6([\#3545](http://www.rudder-project.org/redmine/issues/3545)
    ([\#3540](http://www.rudder-project.org/redmine/issues/3540))
  - Fix Incomplete reporting in the update of promises
    ([\#3488](http://www.rudder-project.org/redmine/issues/3488))
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

  - Fix 'newest archived report' and 'oldest archived report' which
    displayed no date during archive activity
    ([\#3471](http://www.rudder-project.org/redmine/issues/3471))
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

  - Upgrades RPM packages from one major branch to another don't always
    work because of the Epoch field
    ([\#3558](http://www.rudder-project.org/redmine/issues/3558))
  - rudder-agent RPM packages don't require the right 32/64 bit
    dependencies
    ([\#3549](http://www.rudder-project.org/redmine/issues/3549))
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

### Release notes

This is a maintenance release in the 2.5 series. All installations of
2.5.x should be upgraded when possible. This version is not yet marked
"stable" but it is already in use on several internal platforms. You are
invited to upgrade to 2.6 as soon as possible to enjoy the latest
features with a still stable and more polished version.

## Rudder 2.5.2 (2013-04-17)

### Changes

#### System integration

  - Make rudder-server-root depend on headless version of
    ([OpenJDK](OpenJDK)
    ([\#3395](http://www.rudder-project.org/redmine/issues/3395)
    ([\#3419](http://www.rudder-project.org/redmine/issues/3419))

### Bug fixes

#### Core

  - Fix CFEngine call of bundle *generic\_process\_check\_process* with
    wrong number of arguments (three instead of four)
    ([\#3467](http://www.rudder-project.org/redmine/issues/3467))
  - Fix migration from Rudder 2.4 to 2.5.1 which lead to not having
    generated promises for the nodes
    ([\#3462](http://www.rudder-project.org/redmine/issues/3462))
  - Fix missing jar artifact containing source and dependencies in order
    to simplify contributions
    ([\#3400](http://www.rudder-project.org/redmine/issues/3400))

#### UI

  - Fix Rules appearing several time in the confirmation pop-up when
    disabling a Directive was applied to this a Rule with several target
    ([\#3468](http://www.rudder-project.org/redmine/issues/3468))
  - Fix the display of the detail of a Directive which was slow if there
    were too many directives
    ([\#3387](http://www.rudder-project.org/redmine/issues/3387))
  - Fix errors not displayed when having an invalid error in rule
    creation
    ([\#3411](http://www.rudder-project.org/redmine/issues/3411))

#### System integration

  - Fix Rudder status check which failed if a proxy was defined in the
    environment
    ([\#3383](http://www.rudder-project.org/redmine/issues/3383))
  - Fix send-clean.sh script which failed to send inventories
    ([\#3401](http://www.rudder-project.org/redmine/issues/3401))
  - Prevent Fusion Inventory to hang on some SLES 10 because of lsusb
    ([\#3415](http://www.rudder-project.org/redmine/issues/3415))

#### Techniques

  - Improve CFEngine performances
    ([\#3424](http://www.rudder-project.org/redmine/issues/3424)
    ([\#3439](http://www.rudder-project.org/redmine/issues/3439)
    ([\#3444](http://www.rudder-project.org/redmine/issues/3444)
    ([\#3454](http://www.rudder-project.org/redmine/issues/3454)
    ([\#3463](http://www.rudder-project.org/redmine/issues/3463)
    ([\#3485](http://www.rudder-project.org/redmine/issues/3485))
  - Technique 'Enforce a file content': Increase the size of the files
    to be edited
    ([\#3385](http://www.rudder-project.org/redmine/issues/3385))
  - Technique 'Package management for Debian / Ubuntu / APT systems':
    Fix Debian/Ubuntu packages which couldn't be installed as they were
    'untrusted'
    ([\#3396](http://www.rudder-project.org/redmine/issues/3396))
  - Technique 'Time settings': Fix broken copy of symlink which could
    prevent NTP to set a localtime
    ([\#3437](http://www.rudder-project.org/redmine/issues/3437))

### Contributors

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Michael Gliwinski (Henderson Group)

### Release notes

This is a maintenance release in the 2.5 series. All installations of
2.5.x should be upgraded when possible. This version is not yet marked
"stable" but it is already in use on several internal platforms. We
recommand you to continue to use Rudder 2.4 into production systems.

## Rudder 2.5.1 (2013-04-12)

### Bug fixes

#### Documentation

  - Missing licence header on \!ModificationService.scala
    ([\#3348](http://www.rudder-project.org/redmine/issues/3348))
  - Rudder installation doc says that we should use "main contrib
    non-free" APT components on Debian and should be "main" only
    ([\#3344](http://www.rudder-project.org/redmine/issues/3344))

#### Core

  - Fix Rudder core which was unable to start or to reload Technique
    Library if an error was in constraint tags of metadata.xml of a
    Technique
    ([\#3356](http://www.rudder-project.org/redmine/issues/3356))

#### Webapp - Node management

  - Fix "Select All" box in the "Accept new nodes" page
    ([\#3234](http://www.rudder-project.org/redmine/issues/3234))
  - Node query with OR and regexp doesn't OR the result
    ([\#3340](http://www.rudder-project.org/redmine/issues/3340))
  - When we delete a node, we can't generate promises anymore
    ([\#3420](http://www.rudder-project.org/redmine/issues/3420))

#### Webapp - Config management

  - The pop-up with rule depending of a directive is sometime broken
    ([\#3337](http://www.rudder-project.org/redmine/issues/3337))
  - style.css not found on technique screen
    ([\#3305](http://www.rudder-project.org/redmine/issues/3305))
  - Using parametrized variables based on Rules values fails
    ([\#3332](http://www.rudder-project.org/redmine/issues/3332))
  - System Rules/Directives/Groups can be cloned/deleted/disabled
    ([\#3286](http://www.rudder-project.org/redmine/issues/3286))

#### Webapp - Administration

  - The automatic report log archiving was not launched when enabled
    ([\#3391](http://www.rudder-project.org/redmine/issues/3391))
  - Fix unreadable link and unwantend unfolded line in Event Log view
    ([\#3328](http://www.rudder-project.org/redmine/issues/3328))

#### Techniques

  - Technique 'Enforce a file content': Synchronize bug fixes from
    Enforce a file content between v3.0 and v2.1
    ([\#3338](http://www.rudder-project.org/redmine/issues/3338))
  - Various fixes on "Process Management" and "Set permissions on files"
    ([\#3245](http://www.rudder-project.org/redmine/issues/3245))
  - The detection of the last promise update was broken
    ([\#3244](http://www.rudder-project.org/redmine/issues/3244))
  - sudoParameters produces an invalid sudoers file when command is
    specified
    ([\#3324](http://www.rudder-project.org/redmine/issues/3324))
  - sudoParameters technique may insert env\_reset setting multiple
    times ([\#3323](http://www.rudder-project.org/redmine/issues/3323)
    )
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

### Changes

#### Techniques

  - Technique "HTTP Reverse Proxy (Apache)" added
    ([\#3277](http://www.rudder-project.org/redmine/issues/3277))

#### Documentation

  - Document best practices for Techniques development on Rudder Project
    wiki ([\#3105](http://www.rudder-project.org/redmine/issues/3105))
    =\>
    ([TechniqueBestPractices](bin.view.Development.TechniqueBestPractices)

#### Inventory (webapp, Fusion)

  - Solaris support in the Rudder web interface
    ([\#3309](http://www.rudder-project.org/redmine/issues/3309))

### Release notes

This is a maintenance release in the 2.5 series. All installations of
2.5.x should be upgraded when possible. This version is not yet marked
"stable" but it is already in use on several internal platforms. We
recommand you to continue to use Rudder 2.4 into production systems.

## Rudder 2.5.0 (2013-01-30)

### Changes

#### UI

  - Add Rudder 2.5 logo
    ([\#3227](http://www.rudder-project.org/redmine/issues/3227))

#### Documentation

  - Publishing documentation of Rudder 2.5 on
    http://www.rudder-project.org/rudder-doc-2.5/rudder-doc.html
    ([\#3213](http://www.rudder-project.org/redmine/issues/3213))

### Bug fixes

#### Agent

  - Fix broken cron.d entry of cf-execd which has been modified in
    Rudder 2.5.0~rc1
    ([\#3221](http://www.rudder-project.org/redmine/issues/3221))

#### Core

  - Improve feedback of database cleaning process
    ([\#3222](http://www.rudder-project.org/redmine/issues/3222))
  - Prevent Rudder from writting too much logs in info log level
    ([\#3217](http://www.rudder-project.org/redmine/issues/3217))

#### UI

  - Fix visualisation of reports in the node details page which couldn't
    be completly drop drown
    ([\#3226](http://www.rudder-project.org/redmine/issues/3226))

### Release notes

This version of Rudder is a final release. This version is not marked
"stable" (unlike previous final versions), since it has not proven to be
reliable on production systems. 2.4.0 will remain the "stable" until
then.

## Rudder 2.5.0~rc1 (2013-01-23)

### Changes

#### Core

  - Change the internal Rudder variables syntax from $ to
    $
    ([\#3149](http://www.rudder-project.org/redmine/issues/3149))
  - Add Android support in Rudder
    ([\#3155](http://www.rudder-project.org/redmine/issues/3155))
  - Don't fail when importing Android inventories that don't include
    network, filesystem, memory and video information
    ([\#3200](http://www.rudder-project.org/redmine/issues/3200))

 

#### UI

  - Inform user that Javascript must be enabled to use Rudder
    ([\#3184](http://www.rudder-project.org/redmine/issues/3184))
  - Inform user about the status of reports archiving
    ([\#3194](http://www.rudder-project.org/redmine/issues/3194))

### Bug fixes

#### Core

  - Rule clone event log doesn't always include list of Directives
    ([\#3151](http://www.rudder-project.org/redmine/issues/3151),
    ([\#3161](http://www.rudder-project.org/redmine/issues/3161))
  - Rollbacking a rollback does not work as expected
    ([\#3177](http://www.rudder-project.org/redmine/issues/3177))
  - Using CFEngine variables with "$" syntax (not "$(var)") in
    directives leads to unexpected errors in promises generation
    ([\#3137](http://www.rudder-project.org/redmine/issues/3137))
  - Inventory where memory slot numbers are missing / duplicated should
    be reported with negative value
    ([\#3203](http://www.rudder-project.org/redmine/issues/3203))

#### UI

  - Display of referenced objects in Event Logs is very poor
    ([\#3064](http://www.rudder-project.org/redmine/issues/3064))
  - Make the footer always at the bottom of the page
    ([\#2932](http://www.rudder-project.org/redmine/issues/2932))
  - Various fixes
    ([\#3192](http://www.rudder-project.org/redmine/issues/3192),
    ([\#3187](http://www.rudder-project.org/redmine/issues/3187),
    ([\#3154](http://www.rudder-project.org/redmine/issues/3154),
    ([\#3150](http://www.rudder-project.org/redmine/issues/3150),
    ([\#3080](http://www.rudder-project.org/redmine/issues/3080))

#### System integration

  - Clean the crontab correctly in case of a rudder-agent package
    removal, by using a file in /etc/cron.d/
    ([\#3146](http://www.rudder-project.org/redmine/issues/3146))
  - On a newly installed server Rudder 2.5, some tables are missing,
    leading to numerous error messages
    ([\#3169](http://www.rudder-project.org/redmine/issues/3169))
  - When upgrading Rudder from 2.4 to 2.5~beta1, the logback.xml files
    is not updated with the definition of the non-compliant-reports log
    ([\#3195](http://www.rudder-project.org/redmine/issues/3195))
  - Remove wrong comment in logback.xml
    ([\#3205](http://www.rudder-project.org/redmine/issues/3205))

#### Techniques

  - In some Techniques, some system paths are hardcoded, rather than
    using global variables
    ([\#3201](http://www.rudder-project.org/redmine/issues/3201))

### Release notes

This is a release candidate for Rudder 2.5.0, fixing all known bugs
encountered in 2.5.0~beta1. We still do encourage testing, and welcome
all and any feedback\! This release is not yet production ready, and
production use is at your own risk.

A final release of Rudder 2.5.0 can be expected within roughly a week,
which will be encouraged for production use. This version will not,
however, be marked "stable" (unlike previous final versions), until it
has been available and proven to be reliable on production systems.
2.4.0 will remain the "stable" until then.

## Rudder 2.5.0~beta1 (2013-01-09)

### Changes

#### Core

  - Allow to rollback to a previous configuration policy from the event
    log screen
    ([\#3002](http://www.rudder-project.org/redmine/issues/3002),
    ([\#3142](http://www.rudder-project.org/redmine/issues/3142))
  - Allow to clean reports database by manual or scheduled operation(s)
    ([\#2996](http://www.rudder-project.org/redmine/issues/2996),
    ([\#2997](http://www.rudder-project.org/redmine/issues/2997))
  - Create a Techniques best practices library containing bundles and
    bodies
    ([\#3087](http://www.rudder-project.org/redmine/issues/3087))
  - Using "Import All" is marked as one event in the event log screen
    ([\#3125](http://www.rudder-project.org/redmine/issues/3125))
  - Add commit in the configuration repository when importing archives
    ([\#3102](http://www.rudder-project.org/redmine/issues/3102))
  - Various changes
    ([\#2897](http://www.rudder-project.org/redmine/issues/2897),
    ([\#2985](http://www.rudder-project.org/redmine/issues/2985),
    ([\#2986](http://www.rudder-project.org/redmine/issues/2986),
    ([\#2955](http://www.rudder-project.org/redmine/issues/2955),
    ([\#3003](http://www.rudder-project.org/redmine/issues/3003),
    ([\#3118](http://www.rudder-project.org/redmine/issues/3118),
    ([\#2968](http://www.rudder-project.org/redmine/issues/2968),
    ([\#3028](http://www.rudder-project.org/redmine/issues/3028))

#### UI

  - Allow to make clones of Rules
    ([\#3033](http://www.rudder-project.org/redmine/issues/3033))
  - Add a warning listing Rules that will be impacted by changes when
    updating a Group or a Directive
    ([\#3049](http://www.rudder-project.org/redmine/issues/3049),
    ([\#3074](http://www.rudder-project.org/redmine/issues/3074))
  - Rudder ID (UUID) of Groups, Rules and Directives is now displayed
    all details screens, in uppercase
    ([\#2998](http://www.rudder-project.org/redmine/issues/2998),
    ([\#3133](http://www.rudder-project.org/redmine/issues/3133))
  - Improve Groups view display
    ([(\#2930](http://www.rudder-project.org/redmine/issues/2930))
  - Various improvements
    ([\#3114](http://www.rudder-project.org/redmine/issues/3114))

#### System integration

  - Add a dedicated log file to record non-compliant checks (Repaired,
    Error and Warn) in
    /var/log/rudder/compliance/non-compliant-reports.log
    ([\#2988](http://www.rudder-project.org/redmine/issues/2988))
  - Various fixes
    ([\#2929](http://www.rudder-project.org/redmine/issues/2929),
    ([\#2948](http://www.rudder-project.org/redmine/issues/2948),
    ([\#3096](http://www.rudder-project.org/redmine/issues/3096))

#### Techniques

  - Technique "OpenSSH server": Refactor the Technique to reflect the
    best practices and use Techniques library
    ([\#3099](http://www.rudder-project.org/redmine/issues/3099))

### Release notes

This is the first beta of the Rudder 2.5, including many new features
and bug fixes. The use on production systems is not encouraged at this
time and is at your own risk. However, we do encourage testing, and
welcome all and any feedback\!

