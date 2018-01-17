
# General information

Rudder 4.2 is currently the latest version of Rudder.

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Main new features in Rudder 4.2:**

  - New plugable policy generation, allowing to support new Agent or OS via plugin
  - Internal support for DSC agent type (Inventory, display compatibility of Techniques/methods ...). Policy generation is supported by separated plugin.
  - Relay API: Files from Rudder shared folder can be accessed using the rest api
  - UI improvements on Settings page (Update on style)

**Installing, upgrading and testing**

  - Install docs:
    https://www.rudder-project.org/doc-4.2/_installation.html
  - Upgrade docs:
    https://www.rudder-project.org/doc-4.2/_upgrade_rudder.html
  - Download links: https://www.rudder-project.org/site/get-rudder/downloads/

We also recommend using the [Rudder
Vagrant](https://github.com/Normation/rudder-vagrant) config if you want
a quick and easy way to get an installation for testing.

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server and Rudder relay: **Debian 8, Debian 9, RHEL/CentOS 6, RHEL/CentOS 7
    (64 bits), SLES 11, SLES 12, Ubuntu 14.04, Ubuntu 16.04**
  - Rudder agent: all of the above plus **Debian 5, Debian 6, Debian 7
    RHEL/CentOS 3, RHEL/CentOS 5, CentOS 7 (32 bits), Fedora 18, SLES
    10, SLES 12, Ubuntu 10.04, Ubuntu 12.04, Ubuntu 12.10**
  - Rudder agent (binary packages available from
    ([Normation](http://www.normation.com)): **Windows Server 2008R2-2016,
    AIX 5-6-7**

**Note**: As of Rudder 4.2, the rudder server and relay packages are no longer available on Debian 7
and the rudder-agent-thin and rudder-server-relay packages are
no longer available in Ubuntu 12.04.

# Changelogs

## <a name="4.2.3" > </a> Rudder 4.2.3 (2017-12-11)

### Changes

#### Web - UI & UX

  - Change how Directive priority is displayed
    ([\#11725](https://www.rudder-project.org/redmine/issues/11725))

#### Documentation

  - Update prerequisite and document windows plugin installation on server and agent
    ([\#11754](https://www.rudder-project.org/redmine/issues/11754))

#### Agent

  - Create a command to display system classes
    ([\#11049](https://www.rudder-project.org/redmine/issues/11049))

#### Packaging

  - Upgrade openssl to 1.0.2m
    ([\#11734](https://www.rudder-project.org/redmine/issues/11734))

#### API

  - Add logic to generate ncf Technique files into Rudder
    ([\#11749](https://www.rudder-project.org/redmine/issues/11749))
  - Deprecate API v7 and remove API v5 and v6
    ([\#11753](https://www.rudder-project.org/redmine/issues/11753))

#### Architecture - Dependencies

  - sealerate should be scoped "provided"
    ([\#11781](https://www.rudder-project.org/redmine/issues/11781))

### Bug fixes

#### Web - UI & UX

  - Fixed: Impossible to add authorized network for relay
    ([\#11797](https://www.rudder-project.org/redmine/issues/11797))
  - Fixed: Category name must have 3 caracters
    ([\#11801](https://www.rudder-project.org/redmine/issues/11801))
  - Fixed: CentOS is written "Centos" in the OS graph on the dashboard
    ([\#11652](https://www.rudder-project.org/redmine/issues/11652))

#### Web - Config management

  - Fixed: Missing node id in log message on generaction error
    ([\#11819](https://www.rudder-project.org/redmine/issues/11819))
  - Fixed: Node properties syntax is not the same for Windows agent
    ([\#11445](https://www.rudder-project.org/redmine/issues/11445))

#### Web - Nodes & inventories

  - Fixed: Node (hostname,policyserver,...) modification should trigger promises regeneration
    ([\#1411](https://www.rudder-project.org/redmine/issues/1411))
  - Fixed: Impossible to search or build groups based on JSON values in node properties
    ([\#10599](https://www.rudder-project.org/redmine/issues/10599))

#### Documentation

  - Fixed: Missing doc on syslog daemon
    ([\#11768](https://www.rudder-project.org/redmine/issues/11768))
  - Fixed: Archive REST section outdated for download ZIP archive
    ([\#11650](https://www.rudder-project.org/redmine/issues/11650))
  - Fixed: Document how to merge properties, and not simply merge them
    ([\#11730](https://www.rudder-project.org/redmine/issues/11730))

#### Agent

  - Fixed: cf-* coredumps if policy_server.dat contains empty lines
    ([\#11724](https://www.rudder-project.org/redmine/issues/11724))
  - Fixed: Agent segfaults when merging non-container data variables
    ([\#11620](https://www.rudder-project.org/redmine/issues/11620))
  - Fixed: On update error, the help message is not valid anymore
    ([\#11803](https://www.rudder-project.org/redmine/issues/11803))
  - Fixed: force option in rudder agent factory-reset does not work
    ([\#11769](https://www.rudder-project.org/redmine/issues/11769))
  - Fixed: Impossible to run in house CFEngine and Rudder agent side by side
    ([\#11719](https://www.rudder-project.org/redmine/issues/11719))

#### Packaging

  - Fixed: Rudder installation fails on SLES12
    ([\#11727](https://www.rudder-project.org/redmine/issues/11727))

#### Initial promises & sys tech

  - Fixed: Mismatched report and metadatat in distribute policy
    ([\#11847](https://www.rudder-project.org/redmine/issues/11847))

#### System integration

  - Fixed: rudder-init fails to report memory errors from jetty start
    ([\#8165](https://www.rudder-project.org/redmine/issues/8165))
  - Fixed: When we have a /var full, Rudder LDAP or Postgres can be corrupted
    ([\#11125](https://www.rudder-project.org/redmine/issues/11125))
  - Fixed: rudder-pkg should not preserve owner when extracting plugin
    ([\#11423](https://www.rudder-project.org/redmine/issues/11423))
  - Fixed: Duration of logrotate for /var/log/rudder/  is too long making /var/log too big
    ([\#10912](https://www.rudder-project.org/redmine/issues/10912))
  - Fixed: Allowed network 0.0.0.0/0 is not currently supported by Apache
    ([\#11226](https://www.rudder-project.org/redmine/issues/11226))

#### Architecture - Dependencies

  - Fixed: Lift-webkit has a dependency toward rhino (which conflicts with JS param eval)
    ([\#11777](https://www.rudder-project.org/redmine/issues/11777))
  - Fixed: Update minor version of java dependency library
    ([\#11764](https://www.rudder-project.org/redmine/issues/11764))

#### Web - Maintenance

  - Fixed: Null pointer exception when restoring group archive.
    ([\#11805](https://www.rudder-project.org/redmine/issues/11805))

#### Architecture - Refactoring

  - Fixed: There's an "UTF-8"s in place of "UTF-8" in a method parameter
    ([\#11785](https://www.rudder-project.org/redmine/issues/11785))
  - Fixed: Remove an "unchecked because eliminated by erasure"
    ([\#11784](https://www.rudder-project.org/redmine/issues/11784))

#### Techniques

  - Fixed: Unexpected report for Send inventories to CMDB after #11257
    ([\#11648](https://www.rudder-project.org/redmine/issues/11648))
  - Fixed: The time synchronization technique doesn't work on AIX
    ([\#6964](https://www.rudder-project.org/redmine/issues/6964))
  - Fixed: Time Management Settings cannot set the timezone to UTC
    ([\#6998](https://www.rudder-project.org/redmine/issues/6998))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Janos Mattyasovszky

This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.2.2" > </a> Rudder 4.2.2 (2017-11-09)

### Changes

#### Packaging

  - Change rudder-techniques ncf depdency to a correct version
    ([\#11692](https://www.rudder-project.org/redmine/issues/11692))

#### Web - UI & UX

  - Can't edit a new Directive parameters, message "This directive has no parameters" displayed instead
    ([\#11713](https://www.rudder-project.org/redmine/issues/11713))
  - On Nodes table, put the link to node details on node's name instead of on magnifying glass icon
    ([\#11643](https://www.rudder-project.org/redmine/issues/11643))
  - Add a jumbotron next to Directives list
    ([\#9354](https://www.rudder-project.org/redmine/issues/9354))

#### Architecture - Refactoring

  - Clean-up unused imports in rudder
    ([\#11685](https://www.rudder-project.org/redmine/issues/11685))
  - Make allocated memory for build configurable
    ([\#11688](https://www.rudder-project.org/redmine/issues/11688))

### Bug fixes

#### Web - UI & UX

  - Fixed: Some icons in the interface look pixelized on hidpi screens
    ([\#11237](https://www.rudder-project.org/redmine/issues/11237))
  - Fixed: Fix some CSS issues in Rule's compliance tables
    ([\#11679](https://www.rudder-project.org/redmine/issues/11679))

#### Initial promises & sys tech

  - Fixed: rudder service and thus cf-execd is never restarted / ensure running
    ([\#11303](https://www.rudder-project.org/redmine/issues/11303))

#### System integration

  - Fixed: Fusioninventory task Deploy is missing a dependency to File-Copy-Recursive
    ([\#11701](https://www.rudder-project.org/redmine/issues/11701))
  - Fixed: Update doc of hooks to add DSC mention and remove cfengine-nova
    ([\#11671](https://www.rudder-project.org/redmine/issues/11671))

#### Documentation

  - Fixed: fetch git branch before checkout when building rudder-doc
    ([\#11697](https://www.rudder-project.org/redmine/issues/11697))
  - Fixed: Use new ncf branches in rudder-doc
    ([\#11693](https://www.rudder-project.org/redmine/issues/11693))
  - Fixed: Remove all mention to CFEngine Enterprise in Rudder doc
    ([\#11669](https://www.rudder-project.org/redmine/issues/11669))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.2.1" > </a> Rudder 4.2.1 (2017-10-30)

### Changes

#### Web - UI & UX

  - Display message if there are no parameters in Directive details 
    ([\#11642](https://www.rudder-project.org/redmine/issues/11642))

#### Initial promises & sys tech

  - Do not send inventory if a forwarder/uploader daemon exists
    ([\#11257](https://www.rudder-project.org/redmine/issues/11257))

#### Agent

  - Node properties local override
    ([\#11618](https://www.rudder-project.org/redmine/issues/11618))
  - Add a rudder agent diff command
    ([\#11099](https://www.rudder-project.org/redmine/issues/11099))

#### Techniques

  - UserManagement technique does not allow to change the gid of an existing user
    ([\#11596](https://www.rudder-project.org/redmine/issues/11596))

### Bug fixes

#### Web - UI & UX

  - Fixed: Screen estate in compliance graph
    ([\#10761](https://www.rudder-project.org/redmine/issues/10761))
  - Fixed: Global parameters UI now showing Edit/Delete button on long lines
    ([\#11585](https://www.rudder-project.org/redmine/issues/11585))
  - Fixed: Update Directive popup is broken on firefox 38.6.1esr 
    ([\#11584](https://www.rudder-project.org/redmine/issues/11584))
  - Fixed: The Rudder version graph in the dashboard only display major version for windows nodes
    ([\#11353](https://www.rudder-project.org/redmine/issues/11353))

#### Web - Nodes & inventories

  - Fixed: Groups are not reloaded after restoring from archive
    ([\#11244](https://www.rudder-project.org/redmine/issues/11244))
  - Fixed: Unkown agent version in Windows node details
    ([\#11396](https://www.rudder-project.org/redmine/issues/11396))

#### Web - Config management

  - Fixed: Parameter name requires at least 3 characters
    ([\#11588](https://www.rudder-project.org/redmine/issues/11588))
  - Fixed: There is no way to remove a Directive based on a Technique that no longer exists
    ([\#5203](https://www.rudder-project.org/redmine/issues/5203))
  - Fixed: Search believe that CFEngine agents with "dsc" in their keys are also DSC agent 
    ([\#11168](https://www.rudder-project.org/redmine/issues/11168))
  - Fixed: Rudder creates DSC based group and rules and breaks policy generation
    ([\#11583](https://www.rudder-project.org/redmine/issues/11583))

#### Documentation

  - Fixed: "Quick installation" section on the Rudder doc
    ([\#11668](https://www.rudder-project.org/redmine/issues/11668))
  - Fixed: Manually restoring permissions for NCF after archive import is broken
    ([\#11414](https://www.rudder-project.org/redmine/issues/11414))
  - Fixed: Dead link in doc
    ([\#11579](https://www.rudder-project.org/redmine/issues/11579))

#### Agent

  - Fixed: Xen domU detection issues with pvops kernels.
    ([\#10787](https://www.rudder-project.org/redmine/issues/10787))
  - Fixed: Inventory uploaded multiple times after reinit
    ([\#11580](https://www.rudder-project.org/redmine/issues/11580))

#### Packaging

  - Fixed: rudder-techniques in 4.2 should depend on ncf 1.2
    ([\#11654](https://www.rudder-project.org/redmine/issues/11654))
  - Fixed: Error at installation of Rudder 4.1 on centos 6
    ([\#11628](https://www.rudder-project.org/redmine/issues/11628))
  - Fixed: Build on Deb7 and ubuntu14.04 fails because jdk8u144 is unavalaible
    ([\#11626](https://www.rudder-project.org/redmine/issues/11626))
  - Fixed: We should not try to edit /etc/cron.d/rudder-agent on AIX
    ([\#11595](https://www.rudder-project.org/redmine/issues/11595))
  - Fixed: Warning about zip dependency is at top of installation of plugin
    ([\#11398](https://www.rudder-project.org/redmine/issues/11398))

#### Initial promises & sys tech

  - Fixed: Tidy expected reports does have a too big TTL
    ([\#11591](https://www.rudder-project.org/redmine/issues/11591))

#### Techniques

  - Fixed: Allow variable as directive parameters in regexp validated inputs 
    ([\#11449](https://www.rudder-project.org/redmine/issues/11449))
  - Fixed: generic_variable_definition inserts spaces in multi lined values
    ([\#11613](https://www.rudder-project.org/redmine/issues/11613))
  - Fixed: group management technique doesn't ensure optional user is in group
    ([\#8739](https://www.rudder-project.org/redmine/issues/8739))
  - Fixed: Incomplete description of the behaviour of technique copyGitFile, that may result in broken permissions of whole folder
    ([\#11422](https://www.rudder-project.org/redmine/issues/11422))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Janos Mattyasovszky
 * Florian Heigl

This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.2.0" > </a> Rudder 4.2.0 (2017-09-28)

### Changes

#### Web - Config management

  - Update generation process to make it plugable by agenttype AND by os
    ([\#11431](https://www.rudder-project.org/redmine/issues/11431))

#### Web - UI & UX

  - Highlight techniques that have at least one version compatible with the dsc agent
    ([\#11297](https://www.rudder-project.org/redmine/issues/11297))

#### System integration

  - Add in rudder core apis to display license information from plugins. 
    ([\#11427](https://www.rudder-project.org/redmine/issues/11427))

#### Miscellaneous

  - Refactor policy generation tests
    ([\#11397](https://www.rudder-project.org/redmine/issues/11397))

#### Techniques

  - Add a new syntax for rudder parameters
    ([\#11405](https://www.rudder-project.org/redmine/issues/11405))

### Bug fixes

#### Packaging

  - Fixed: Plugin postint are not run after a rudder upgrade
    ([\#11430](https://www.rudder-project.org/redmine/issues/11430))
  - Fixed: rudder-techniques requires a recent ncf version
    ([\#11411](https://www.rudder-project.org/redmine/issues/11411))

#### Initial promises & sys tech

  - Fixed: Error message on classical windows agent when getting environement variable
    ([\#11435](https://www.rudder-project.org/redmine/issues/11435))

#### Documentation

  - Fixed: Wrong formatting in doc to build agent
    ([\#11274](https://www.rudder-project.org/redmine/issues/11274))

#### API

  - Fixed: Archives API list returns date with wrong format
    ([\#11408](https://www.rudder-project.org/redmine/issues/11408))

#### Techniques

  - Fixed: Wrong report for home directory on windows in audit mode
    ([\#11399](https://www.rudder-project.org/redmine/issues/11399))

### Release Note

This version of Rudder is a final release. We have tested it thoroughly and believe it to be free of any major bugs.
However, this branch is not marked "stable", since it still has to be proven reliable on production systems over a period of several months.


## <a name="4.2.0.rc2" > </a> Rudder 4.2.0.rc2 (2017-09-21)

### Changes

#### Documentation

  - Document debian 9 support for 4.1
    ([\#11382](https://www.rudder-project.org/redmine/issues/11382))
  - Better explain configuration drift reporting
    ([\#11338](https://www.rudder-project.org/redmine/issues/11338))

#### ncf

  - Create a technique to download a file from the server
    ([\#11181](https://www.rudder-project.org/redmine/issues/11181))

#### Techniques

  - Deprecate techniques that have a more recent version and remove deprecated ones
    ([\#11370](https://www.rudder-project.org/redmine/issues/11370))
  - Review parameters text in technique parameters
    ([\#11120](https://www.rudder-project.org/redmine/issues/11120))
  - make a dsc user_technique
    ([\#11308](https://www.rudder-project.org/redmine/issues/11308))
  - Add a dsc version of file_template technique
    ([\#11317](https://www.rudder-project.org/redmine/issues/11317))

### Bug fixes

#### Web - UI & UX

  - Fixed: Cannot select version of directive to create if technique desciption contains curly braces 
    ([\#11393](https://www.rudder-project.org/redmine/issues/11393))
  - Fixed: Allowed networks UI is broken in Chromium
    ([\#11351](https://www.rudder-project.org/redmine/issues/11351))

#### Documentation

  - Fixed: Update doc for 4.2
    ([\#11365](https://www.rudder-project.org/redmine/issues/11365))
  - Fixed: Missing documentation on Directive ordering
    ([\#11289](https://www.rudder-project.org/redmine/issues/11289))

#### Web - Config management

  - Fixed: chars are not escaped correctly in dsc techniques
    ([\#11326](https://www.rudder-project.org/redmine/issues/11326))

#### Miscellaneous

  - Fixed: debug prompt in dsc user_technique
    ([\#11363](https://www.rudder-project.org/redmine/issues/11363))

#### Packaging

  - Fixed: Cannot save plugin status during initial install
    ([\#11395](https://www.rudder-project.org/redmine/issues/11395))
  - Fixed: When ugrading Rudder, the Windows plugins is not enabled anymore
    ([\#11385](https://www.rudder-project.org/redmine/issues/11385))
  - Fixed: PORT in /etc/default/rudder-slapd is ignored
    ([\#11331](https://www.rudder-project.org/redmine/issues/11331))

#### System integration

  - Fixed: ERROR 405 when using "File from shared folder" generic method
    ([\#11358](https://www.rudder-project.org/redmine/issues/11358))

#### Techniques

  - Fixed: Wrong report in users 8.0 on windows
    ([\#11391](https://www.rudder-project.org/redmine/issues/11391))
  - Fixed: Missing report for Unix options in Users 8.0
    ([\#11390](https://www.rudder-project.org/redmine/issues/11390))
  - Fixed: Duplicate description in filesPermissions/2.1
    ([\#11383](https://www.rudder-project.org/redmine/issues/11383))
  - Fixed: File content (key/value format) technique allows white space before separator but not after it
    ([\#11087](https://www.rudder-project.org/redmine/issues/11087))

### Release Note

This software is in "release candidate" status and contains multiple bug fixes since the first release candidate (4.2.0~rc1).
If no major bugs are found, a "final" release of 4.2.0 will be released next week.

## <a name="4.2.0.rc1" > </a> Rudder 4.2.0.rc1 (2017-09-07)

### Changes

#### Packaging

  - Add Debian 9 support 
    (CI/internal changes and [\#11262](https://www.rudder-project.org/redmine/issues/11262))


#### Web - UI & UX

  - Fold automatically Group categories if there are too many of them 
    ([\#11323](https://www.rudder-project.org/redmine/issues/11323))
  - Highlight DSC compatible directives
    ([\#11286](https://www.rudder-project.org/redmine/issues/11286))
  - Improve General Settings page
    ([\#9587](https://www.rudder-project.org/redmine/issues/9587))

#### Miscellaneous

  - New technique to centralize creation Variable 
    ([\#11148](https://www.rudder-project.org/redmine/issues/11148))
  - New technique to read variables from a JSON file
    ([\#11149](https://www.rudder-project.org/redmine/issues/11149))

#### Agent

  - Upgrade openssl to 1.0.2l
    ([\#11279](https://www.rudder-project.org/redmine/issues/11279))

#### Initial promises & sys tech

  - Use port 514 for rsyslog on Ubuntu >= 14.04
    ([\#11015](https://www.rudder-project.org/redmine/issues/11015))

#### System integration

  - Add node-post-acceptance hook 
    ([\#11218](https://www.rudder-project.org/redmine/issues/11218))

#### Relay server or API

  - Share file from shared folder using relay rest api
    ([\#11161](https://www.rudder-project.org/redmine/issues/11161))

### Bug fixes

#### Web - UI & UX

  - Fixed: Node key display differences
    ([\#10852](https://www.rudder-project.org/redmine/issues/10852))
  - Fixed: The description of the group tree mentions drag and drop which does not work
    ([\#11287](https://www.rudder-project.org/redmine/issues/11287))
  - Fixed: If a Rule is enabled but applies no Directive, it is displayed as Disabled
    ([\#11123](https://www.rudder-project.org/redmine/issues/11123))
  - Fixed: Wrong sort on compliance in tables
    ([\#11229](https://www.rudder-project.org/redmine/issues/11229))
  - Fixed: Disabled Rules status is invisible
    ([\#11205](https://www.rudder-project.org/redmine/issues/11205))

#### Web - Nodes & inventories

  - Fixed: Group "All nodes known by Rudder directly connected to the XXXX server" excludes DSC nodes
    ([\#11183](https://www.rudder-project.org/redmine/issues/11183))
  - Fixed: Impossible to delete a node when policy server has been deleted
    ([\#11231](https://www.rudder-project.org/redmine/issues/11231))
  - Fixed: Inventory endpoint info api is reporting saturated off by one
    ([\#11330](https://www.rudder-project.org/redmine/issues/11330))

#### Web - Config management

  - Fixed: Typo in generation error
    ([\#11232](https://www.rudder-project.org/redmine/issues/11232))

#### Documentation

  - Fixed: Update documentation on 4.2 to describe the Windows DSC agent
    ([\#11304](https://www.rudder-project.org/redmine/issues/11304))
  - Fixed: Missing doc about latest hooks in the manual
    ([\#11305](https://www.rudder-project.org/redmine/issues/11305))
  - Fixed: Put warnings (about dependencies for example) before install/upgrade instructions
    ([\#11162](https://www.rudder-project.org/redmine/issues/11162))
  - Fixed: Missing change in doc title for 4.2
    ([\#11204](https://www.rudder-project.org/redmine/issues/11204))
  - Fixed: Update doc for 4.2
    ([\#11198](https://www.rudder-project.org/redmine/issues/11198))

#### Miscellaneous

  - Fixed: "compliance" user role is broken
    ([\#11185](https://www.rudder-project.org/redmine/issues/11185))
  - Fixed: service technique
    ([\#11224](https://www.rudder-project.org/redmine/issues/11224))

#### Web - Compliance & node report

  - Fixed: Missing agent reports after Rudder server restart
    ([\#11037](https://www.rudder-project.org/redmine/issues/11037))
  - Fixed: "no report" explanation is not correct in node details
    ([\#11270](https://www.rudder-project.org/redmine/issues/11270))
  - Fixed: Reporting on old technique fails in audit mode
    ([\#11152](https://www.rudder-project.org/redmine/issues/11152))
  - Fixed: /var/log/webapp/compliance/non-compliant-reports does not contain non-compliant (audit) report
    ([\#11223](https://www.rudder-project.org/redmine/issues/11223))

#### Packaging

  - Fixed: Pre/post upgrade scripts do not correctly save and restore plugins status with rudder-plugin
    ([\#11278](https://www.rudder-project.org/redmine/issues/11278))
  - Fixed: Jdk is not installed at build on debian 9
    ([\#11262](https://www.rudder-project.org/redmine/issues/11262))
  - Fixed: Remove rudder.8.gz from rudder-packages preventing build of man pages
    ([\#11258](https://www.rudder-project.org/redmine/issues/11258))
  - Fixed: Configuration of database password fails after install
    ([\#11253](https://www.rudder-project.org/redmine/issues/11253))
  - Fixed: Backup of apache vhost by rudder-server-relay created in bad directory
    ([\#10860](https://www.rudder-project.org/redmine/issues/10860))

#### Initial promises & sys tech

  - Fixed: When running "rudder agent inventory", all other reports are missing on the server
    ([\#11285](https://www.rudder-project.org/redmine/issues/11285))

#### System integration

  - Fixed: Non normalize hooks env var names for node info
    ([\#11213](https://www.rudder-project.org/redmine/issues/11213))
  - Fixed: Non normalize hooks env var names for node info
    ([\#11213](https://www.rudder-project.org/redmine/issues/11213))
  - Fixed: reports/all.log logs everything, not just rudder logs
    ([\#6501](https://www.rudder-project.org/redmine/issues/6501))

#### Agent

  - Fixed: Upgrade agent to CFEngine 3.10.2
    ([\#11288](https://www.rudder-project.org/redmine/issues/11288))
  - Fixed: Do not display components summary in non-full-compliance modes
    ([\#11324](https://www.rudder-project.org/redmine/issues/11324))
  - Fixed: 'rudder agent info' should report compliance mode (full-compliance / changes-only / reports-disabled)
    ([\#10649](https://www.rudder-project.org/redmine/issues/10649))
  - Fixed: When in changes only mode, with no heartbeat, 'rudder agent run' outputs 'error: Rudder agent was interrupted during execution by a fatal error.'
    ([\#9807](https://www.rudder-project.org/redmine/issues/9807))
  - Fixed: rudder agent factory-reset bugs
    ([\#10766](https://www.rudder-project.org/redmine/issues/10766))

#### Web - Maintenance

  - Fixed: Node compliances table is never archived
    ([\#11314](https://www.rudder-project.org/redmine/issues/11314))

#### Techniques

  - Fixed: Technique "Package sources and settings (APT)" does not support stretch
    ([\#11336](https://www.rudder-project.org/redmine/issues/11336))
  - Fixed: Aix group technique
    ([\#11235](https://www.rudder-project.org/redmine/issues/11235))
  - Fixed: Aix group technique
    ([\#11235](https://www.rudder-project.org/redmine/issues/11235))
  - Fixed: "Package management" technique missing "allow untrusted" switch
    ([\#10241](https://www.rudder-project.org/redmine/issues/10241))
  - Fixed: sudo management isn't update-safe
    ([\#9347](https://www.rudder-project.org/redmine/issues/9347))

### Release Note

This software is in "release candidate" status and contains multiple bug fixes since last beta (4.2.0~beta3).
If no major bugs are found, a "final" release of 4.2.0 will be released next week.


## <a name="4.2.0.beta3" > </a> Rudder 4.2.0.beta3 (2017-08-08)

### Changes

#### Architecture - Internal libs

  - Upgrade to Scala 2.12.3 to improve compilation time
    ([\#11192](https://www.rudder-project.org/redmine/issues/11192))

#### Documentation

  - Update screenshot for interface usage page 
    ([\#11143](https://www.rudder-project.org/redmine/issues/11143))
  - Adapt run schedule documentation and add screenshots
    ([\#11139](https://www.rudder-project.org/redmine/issues/11139))
  - Add diagram and screenshots in documentation
    ([\#11137](https://www.rudder-project.org/redmine/issues/11137))
  - Compliance logfile parsing regex
    ([\#11107](https://www.rudder-project.org/redmine/issues/11107))
  - Warn on risk of updating file format
    ([\#11155](https://www.rudder-project.org/redmine/issues/11155))

#### Miscellaneous

  - filetemplate technique posthook
    ([\#11142](https://www.rudder-project.org/redmine/issues/11142))

#### Techniques

  - Create a file template technique
    ([\#9078](https://www.rudder-project.org/redmine/issues/9078))

### Bug fixes

#### Web - Nodes & inventories

  - Fixed: Add a post-node-acceptance hook
    ([\#11191](https://www.rudder-project.org/redmine/issues/11191))
  - Fixed: When we manage a Windows 2016, we don't have the proper Windows version displayed
    ([\#11172](https://www.rudder-project.org/redmine/issues/11172))

#### Web - Config management

  - Fixed: Typo in unauthorized acces message
    ([\#11182](https://www.rudder-project.org/redmine/issues/11182))
  - Fixed: Cannot add a directive with a " in its name in Rule
    ([\#10754](https://www.rudder-project.org/redmine/issues/10754))

#### Documentation

  - Fixed: Typo in rudder-setup usage in documentation
    ([\#11136](https://www.rudder-project.org/redmine/issues/11136))
  - Fixed: Wrong doc for restore of Rudder ldap on 4.1
    ([\#11127](https://www.rudder-project.org/redmine/issues/11127))

#### Miscellaneous

  - Fixed: Error when trying to remove a node
    ([\#11171](https://www.rudder-project.org/redmine/issues/11171))
  - Fixed: Unrecognized Windows agent version in webapp
    ([\#11186](https://www.rudder-project.org/redmine/issues/11186))

#### Packaging

  - Fixed: /var/rudder/share is not readable by rudder-policy-reader
    ([\#11176](https://www.rudder-project.org/redmine/issues/11176))

#### Initial promises & sys tech

  - Fixed: Check permissions on /var/rudder files, particularly modified-files
    ([\#11110](https://www.rudder-project.org/redmine/issues/11110))
  - Fixed: Wrong stderr / stdout redirection of logs from rudder agent check in 4.1
    ([\#11044](https://www.rudder-project.org/redmine/issues/11044))

#### Security

  - Fixed: JSESSION cookie should be "secure"
    ([\#11159](https://www.rudder-project.org/redmine/issues/11159))

#### Techniques

  - Fixed: No new line between two certificates in ca.cert, breaking apache when there is more than one node with a certificate
    ([\#11151](https://www.rudder-project.org/redmine/issues/11151))

### Release Note

This software is in beta status and contains several new features but we have tested it and believe it to be free of any critical bugs.
The use on production systems is not encouraged at this time and is at your own risk. However, we do encourage testing, and welcome all and any feedback!


## Rudder 4.2.0.beta2 (2017-07-12)

### Changes

#### System integration

  - Use uuid to authenticate windows agents
    ([\#11033](https://www.rudder-project.org/redmine/issues/11033))

#### Architecture - Refactoring

  - Move out dsc code into the plugin part
    ([\#11072](https://www.rudder-project.org/redmine/issues/11072))

#### Web - Compliance & node report

  - We are identifying agent runs based on hasPolicyServer-*, which is inefficient, and invalid
    ([\#11027](https://www.rudder-project.org/redmine/issues/11027))

### Bug fixes

#### Web - UI & UX

  - Fixed: In Directive details, tags input is broken on Iceweasel
    ([\#11118](https://www.rudder-project.org/redmine/issues/11118))
  - Fixed: Wrong XML identation in event log
    ([\#10951](https://www.rudder-project.org/redmine/issues/10951))
  - Fixed: Wrong XML identation in event log
    ([\#10951](https://www.rudder-project.org/redmine/issues/10951))
  - Fixed: Keep (open/folded) menu state in cache
    ([\#10955](https://www.rudder-project.org/redmine/issues/10955))
  - Fixed: Add a margin between the filters and the table in Technical logs tab
    ([\#11083](https://www.rudder-project.org/redmine/issues/11083))
  - Fixed: Repaired does not appear as yellow anymore
    ([\#11028](https://www.rudder-project.org/redmine/issues/11028))

#### Web - Config management

  - Fixed: Missing included list of ps1 in rudder-directive.ps1
    ([\#11076](https://www.rudder-project.org/redmine/issues/11076))

#### Miscellaneous

  - Fixed: Generated technique name for dsc technique in rudder-directives.ps1 contains forbiden chars
    ([\#11071](https://www.rudder-project.org/redmine/issues/11071))

#### Agent

  - Fixed: rudder agent update -q bad exit code
    ([\#11047](https://www.rudder-project.org/redmine/issues/11047))

#### Packaging

  - Fixed: When upgrading 4.2 server, system techniques from plugin are purged
    ([\#11045](https://www.rudder-project.org/redmine/issues/11045))
  - Fixed: if plugin is broken, we cannot upgrade it
    ([\#11064](https://www.rudder-project.org/redmine/issues/11064))
  - Fixed: When installing Rudder-Webapp, postinst script runs rudder-upgrade before initializing the git, and it can fail
    ([\#10990](https://www.rudder-project.org/redmine/issues/10990))
  - Fixed: Do not show instructions for rudder-node-to-relay on root setup
    ([\#10859](https://www.rudder-project.org/redmine/issues/10859))
  - Fixed: ca.cert file is empty, prevent apache2 to start
    ([\#11114](https://www.rudder-project.org/redmine/issues/11114))

#### Techniques

  - Fixed: Directive: Services Management doesn't support AIX
    ([\#8752](https://www.rudder-project.org/redmine/issues/8752))

### Release Note

This software is in beta status and contains several new features but we have tested it and believe it to be free of any critical bugs.
The use on production systems is not encouraged at this time and is at your own risk. However, we do encourage testing, and welcome all and any feedback!


## Rudder 4.2.0.beta1 (2017-06-26)

### Changes

#### Web - Nodes & inventories

  - Add option in search engine to search for DSC agent
    ([\#10911](https://www.rudder-project.org/redmine/issues/10911))
  - Display rudder-agent dsc version on Dashboard
    ([\#10836](https://www.rudder-project.org/redmine/issues/10836))
  - Adapt inventory processor so it can read agent certificate
    ([\#10879](https://www.rudder-project.org/redmine/issues/10879))
  - Parse AGENT_KEY instead of CFENGINE_KEY in inventory
    ([\#10824](https://www.rudder-project.org/redmine/issues/10824))
  - Parse and store agent type: dsc
    ([\#10738](https://www.rudder-project.org/redmine/issues/10738))

#### Web - Config management

  - Create system variables for apache authentication
    ([\#10927](https://www.rudder-project.org/redmine/issues/10927))
  - Add system groups/rules/directives for windows dsc agent
    ([\#10953](https://www.rudder-project.org/redmine/issues/10953))
  - Generate a "rudder.json" file containting system variables
    ([\#10936](https://www.rudder-project.org/redmine/issues/10936))
  - Select system techniques and generate correct policies based on agent type
    ([\#10823](https://www.rudder-project.org/redmine/issues/10823))
  - Zip promises post generation for dsc agent
    ([\#10905](https://www.rudder-project.org/redmine/issues/10905))

#### Packaging

  - Add ssl based authentication to policies
    ([\#10958](https://www.rudder-project.org/redmine/issues/10958))
  - /var/rudder/share must be readable by rudder-policy-reader
    ([\#10885](https://www.rudder-project.org/redmine/issues/10885))
  - Rename technique editor hooks to have a better way to organize them and create reload hook
    ([\#10843](https://www.rudder-project.org/redmine/issues/10843))

#### Initial promises & sys tech

  - Accept logs reports which don't start by "R: "
    ([\#10829](https://www.rudder-project.org/redmine/issues/10829))

#### Architecture - Dependencies

  - Bad version in pom.xml for 4.2
    ([\#10975](https://www.rudder-project.org/redmine/issues/10975))

#### Architecture - Refactoring

  - Normalize agent names (cfengine-community, cfengine-nova, dsc)
    ([\#10931](https://www.rudder-project.org/redmine/issues/10931))

#### Server components

  - Share promises for windows agents in https
    ([\#10776](https://www.rudder-project.org/redmine/issues/10776))

### Bug fixes

#### Web - Config management

  - Fixed: Generation error "bad algorithm" with DSC nodes
    ([\#11014](https://www.rudder-project.org/redmine/issues/11014))
  - Fixed: Bad query for all-dsc-node
    ([\#10996](https://www.rudder-project.org/redmine/issues/10996))
  - Fixed: Audit only flag does not take parameter rudder-directives.ps1
    ([\#10974](https://www.rudder-project.org/redmine/issues/10974))
  - Fixed: Unhelpful error message when applying a tehcnique with invalid agent type to a node
    ([\#10969](https://www.rudder-project.org/redmine/issues/10969))
  - Fixed: Audit only flag does not take parameter rudder-directives.ps1
    ([\#10974](https://www.rudder-project.org/redmine/issues/10974))
  - Fixed: Unhelpful error message when applying a tehcnique with invalid agent type to a node
    ([\#10969](https://www.rudder-project.org/redmine/issues/10969))

#### Web - Nodes & inventories

  - Fixed: Invalid agent name for dsc agent
    ([\#10909](https://www.rudder-project.org/redmine/issues/10909))

#### Documentation

  - Fixed: Style broken in documention: upgrade_from_rudder_3_1_3_2_or_4_0
    ([\#11002](https://www.rudder-project.org/redmine/issues/11002))

#### Miscellaneous

  - Fixed: Invalid name for dsc agent type in hooks
    ([\#11001](https://www.rudder-project.org/redmine/issues/11001))
  - Fixed: Error in template
    ([\#11004](https://www.rudder-project.org/redmine/issues/11004))
  - Fixed: Error at node list display/deployement status on fresh Rudder 4.2 install
    ([\#10994](https://www.rudder-project.org/redmine/issues/10994))
  - Fixed: webapp can't start after upgrade to 4.2
    ([\#10986](https://www.rudder-project.org/redmine/issues/10986))

#### Packaging

  - Fixed: SSLUserName should be in directory specific configuration in apache
    ([\#11009](https://www.rudder-project.org/redmine/issues/11009))
  - Fixed: Missing configuration file for Apache2 when installing 4.2
    ([\#10989](https://www.rudder-project.org/redmine/issues/10989))

#### Initial promises & sys tech

  - Fixed: nodeslist.json is not generated into the right file
    ([\#11007](https://www.rudder-project.org/redmine/issues/11007))
  - Fixed: Missing template distributePolicy/1.0,apache_acl during generation
    ([\#10997](https://www.rudder-project.org/redmine/issues/10997))

#### System integration

  - Fixed: Bad semantic for system error on hooks
    ([\#11010](https://www.rudder-project.org/redmine/issues/11010))

### Release Note

This software is in beta status and has several known bugs
(particularly [\#11027](https://www.rudder-project.org/redmine/issues/11027), [\#10961](https://www.rudder-project.org/redmine/issues/10961), [\#10990](https://www.rudder-project.org/redmine/issues/10990) and [\#11051](https://www.rudder-project.org/redmine/issues/11051)).
You should hence not use it in production.
However, we do encourage testing, and welcome all and any
feedback\!

To be able to finish the installation (on ubuntu), after `apt-get install rudder-server-root` fails, you will need to:

- workaround #10990

```
cd /var/rudder/configuration-repository/
git init
git add .
git commit -q -m "initial commit"
```

- workaround #11051

```
touch /opt/rudder/etc/rudder-share-acl-24.conf /opt/rudder/etc/rudder-share-acl.conf
cp /opt/rudder/etc/ssl/rudder.crt /opt/rudder/etc/ssl/ca.cert
```

- finish installation:

```
apt-get install -f
```

- reset git repos (because it is in a bad state)

```
cd /var/rudder/configuration-repository/
rm -rf .git
git init
git add .
git commit -q -m "initial commit"
```
