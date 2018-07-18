
# General information

Rudder 4.2 is currently a maintained version of Rudder. An EOL date has been planned to
the 20th July 2018.

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
    10, SLES 12, Ubuntu 10.04, Ubuntu 12.04, Ubuntu 12.10, Ubuntu 18.04**
  - Rudder agent (binary packages available from
    ([Normation](http://www.normation.com)): **Windows Server 2008R2-2016,
    AIX 5-6-7**

**Note**: As of Rudder 4.2, the rudder server and relay packages are no longer available on Debian 7
and the rudder-agent-thin and rudder-server-relay packages are
no longer available in Ubuntu 12.04.

# Changelogs

## <a name="4.2.7" > </a> Rudder 4.2.7 (2018-07-18)

### Changes

#### Generic methods

  - Add the possibility to customize filters and tests for jinja2 templating
    ([\#12761](https://www.rudder-project.org/redmine/issues/12761))
  - Add the possibility to customize filters and tests for jinja2 templating
    ([\#12761](https://www.rudder-project.org/redmine/issues/12761))
  - Add support for BSD-style init scripts services (rc.d) (slackware)
    ([\#12593](https://www.rudder-project.org/redmine/issues/12593))

#### Generic methods - Package Management

  - Synchronize the 'slackpkg' cfengine package module shipped with ncf with the official one
    ([\#12811](https://www.rudder-project.org/redmine/issues/12811))
  - Synchronize package modules from masterfiles
    ([\#10907](https://www.rudder-project.org/redmine/issues/10907))
  - Backport options for yum package provider
    ([\#12127](https://www.rudder-project.org/redmine/issues/12127))
  - Add a package module for cfengine supporting slackware
    ([\#12684](https://www.rudder-project.org/redmine/issues/12684))

#### Documentation

  - Document plugin node-external-reports
    ([\#12864](https://www.rudder-project.org/redmine/issues/12864))
  - Add binary dependency to rpkg format documentation
    ([\#12810](https://www.rudder-project.org/redmine/issues/12810))
  - Change the documentation to tell the user to use the gpg key from the root path
    ([\#12802](https://www.rudder-project.org/redmine/issues/12802))

#### Agent

  - Add a command line option to run the agent in full compliance mode
    ([\#12681](https://www.rudder-project.org/redmine/issues/12681))

#### Packaging

  - Accept external options to rpmbuild calls
    ([\#12973](https://www.rudder-project.org/redmine/issues/12973))

#### System techniques

  - Make the agent resend the inventory if sending failed
    ([\#7490](https://www.rudder-project.org/redmine/issues/7490))

#### Techniques

  - Add testing on sshKeyDistribution
    ([\#12822](https://www.rudder-project.org/redmine/issues/12822))

### Bug fixes

#### API

  - Fixed: Tags in directives are ignored in POST API
    ([\#12355](https://www.rudder-project.org/redmine/issues/12355))
  - Fixed: Archive API always tells "group" even for other objects
    ([\#12705](https://www.rudder-project.org/redmine/issues/12705))

#### Web - UI & UX

  - Fixed: The red cross in case of generation problem is not visible enough
    ([\#11889](https://www.rudder-project.org/redmine/issues/11889))
  - Fixed: loading page and 404 page does not use correct style when redirected by apache
    ([\#12736](https://www.rudder-project.org/redmine/issues/12736))
  - Fixed: Windows node show an empty Certificate Hash field in node details
    ([\#11347](https://www.rudder-project.org/redmine/issues/11347))
  - Fixed: GUI problem with long strings in reporting
    ([\#12283](https://www.rudder-project.org/redmine/issues/12283))

#### Technique editor - API

  - Fixed: On debian 9.4, ncf views.py can not access http://localhost/rudder (but can https://..)
    ([\#12957](https://www.rudder-project.org/redmine/issues/12957))
  - Fixed: Technique Editor may ignores some error when authenticating, leading to unauthorized access
    ([\#12720](https://www.rudder-project.org/redmine/issues/12720))
  - Fixed: Technique Editor may ignores some error when authenticating, leading to unauthorized access
    ([\#12720](https://www.rudder-project.org/redmine/issues/12720))

#### Web - Config management

  - Fixed: When we add a section in the directive editor, it clears the content of the previous section
    ([\#12916](https://www.rudder-project.org/redmine/issues/12916))
  - Fixed: No reports on dsc only techniques on a Linux Node
    ([\#12754](https://www.rudder-project.org/redmine/issues/12754))
  - Fixed: When policies have wrong permissions (660), agent cannot be executed, and reload server fails, it breaks the generation, and prevent correcting the permission
    ([\#12732](https://www.rudder-project.org/redmine/issues/12732))

#### Generic methods - Package Management

  - Fixed: Force using epoch when installing a package with zypper
    ([\#12799](https://www.rudder-project.org/redmine/issues/12799))
  - Fixed: zypper module arch and version specification for zypper commands is not correct
    ([\#12798](https://www.rudder-project.org/redmine/issues/12798))

#### Web - Technique editor

  - Fixed: Broken technique editor if a technique is in the browser cache, but has been removed from the FS
    ([\#12970](https://www.rudder-project.org/redmine/issues/12970))

#### Rudder web app

  - Fixed: wrong text encoding in technique editor
    ([\#12471](https://www.rudder-project.org/redmine/issues/12471))

#### Web - Nodes & inventories

  - Fixed: In inventory, "motherboardid" is not the mother board id but the machine id
    ([\#12893](https://www.rudder-project.org/redmine/issues/12893))
  - Fixed: It's difficult to know if the node property added is valid json 
    ([\#12360](https://www.rudder-project.org/redmine/issues/12360))
  - Fixed: Slackware is not known by Rudder
    ([\#12707](https://www.rudder-project.org/redmine/issues/12707))
  - Fixed: Log with cause for a missing node is swallowed
    ([\#12724](https://www.rudder-project.org/redmine/issues/12724))

#### Documentation

  - Fixed: Invalid ordering of elements in node external reports plugin
    ([\#12901](https://www.rudder-project.org/redmine/issues/12901))
  - Fixed: Move DSC documentation inside the plugins section of Rudder doc
    ([\#12895](https://www.rudder-project.org/redmine/issues/12895))
  - Fixed: Missing support of Ubuntu 18.04 agent in documentation
    ([\#12854](https://www.rudder-project.org/redmine/issues/12854))
  - Fixed: Documentation for dsc ncf GM does not appear in the user manual
    ([\#12750](https://www.rudder-project.org/redmine/issues/12750))
  - Fixed: Documentation should use full path to rudder-pkg for command examples
    ([\#12771](https://www.rudder-project.org/redmine/issues/12771))
  - Fixed: Adding missings informations for Windows plugin installation
    ([\#12748](https://www.rudder-project.org/redmine/issues/12748))

#### Technique editor - UI/UX

  - Fixed: dsc filter in technique editor does not seem to work
    ([\#12468](https://www.rudder-project.org/redmine/issues/12468))

#### Web - Compliance & node report

  - Fixed: During an upgrade of Rudder, if a new generic method appears in ncf, that is also on local method, all is broken
    ([\#12930](https://www.rudder-project.org/redmine/issues/12930))
  - Fixed: Some reports are duplicated between agent and postgres leading to "unexpected" compliance 
    ([\#12719](https://www.rudder-project.org/redmine/issues/12719))

#### Packaging

  - Fixed: Broken windows plugin install in 4.3
    ([\#12922](https://www.rudder-project.org/redmine/issues/12922))
  - Fixed: Rudder-agent provides rudder-agent without a version
    ([\#7777](https://www.rudder-project.org/redmine/issues/7777))
  - Fixed: Error in Plugin section for Node external reports
    ([\#12898](https://www.rudder-project.org/redmine/issues/12898))
  - Fixed: Warn during inventory if sending through http not https
    ([\#11284](https://www.rudder-project.org/redmine/issues/11284))

#### Generic methods - Service Management

  - Fixed: fail to restart certain services on Ubuntu because of incomplete detection of systemd/upstart
    ([\#12887](https://www.rudder-project.org/redmine/issues/12887))

#### System integration

  - Fixed: apache overwrites error response from Rudder
    ([\#12747](https://www.rudder-project.org/redmine/issues/12747))
  - Fixed: Generation gets stuck when cf-serverd is not running
    ([\#12604](https://www.rudder-project.org/redmine/issues/12604))

#### Generic methods

  - Fixed: Wrong bundle name passed in 12154
    ([\#12921](https://www.rudder-project.org/redmine/issues/12921))
  - Fixed: Description of the "user primary group" method is wrong
    ([\#12785](https://www.rudder-project.org/redmine/issues/12785))
  - Fixed: Create a generic method to define environment variable
    ([\#12154](https://www.rudder-project.org/redmine/issues/12154))

#### Plugins

  - Fixed: rudder-pkg must disable plugin during major version Rudder update
    ([\#12331](https://www.rudder-project.org/redmine/issues/12331))
  - Fixed: rudder-pkg should fail installation is a dependency is missing
    ([\#12749](https://www.rudder-project.org/redmine/issues/12749))

#### System techniques

  - Fixed: System Techniques must not be added by reload technique, only updated, else they are duplicated
    ([\#12765](https://www.rudder-project.org/redmine/issues/12765))
  - Fixed: cron is always restarted since #12615
    ([\#12886](https://www.rudder-project.org/redmine/issues/12886))
  - Fixed: When a technique reports several time the exact same text, there is only one report generated
    ([\#6343](https://www.rudder-project.org/redmine/issues/6343))
  - Fixed: Detection of minicurl and https is done in conflicting ways
    ([\#12155](https://www.rudder-project.org/redmine/issues/12155))
  - Fixed: Rudder agent needs 2 updates to work properly
    ([\#12793](https://www.rudder-project.org/redmine/issues/12793))

#### Performance and scalability

  - Fixed: Method copyResourceFile is quite inefficient
    ([\#12702](https://www.rudder-project.org/redmine/issues/12702))
  - Fixed: Unused formatter in policy generation spend a bit of time in policy generation
    ([\#12735](https://www.rudder-project.org/redmine/issues/12735))
  - Fixed: Moving policies to their final position (last step of policies writing) could be improved
    ([\#12730](https://www.rudder-project.org/redmine/issues/12730))
  - Fixed: We are missing a lot of timing measurement in policy generation
    ([\#12725](https://www.rudder-project.org/redmine/issues/12725))

#### Techniques

  - Fixed: Technique userManagement does not change shell
    ([\#6395](https://www.rudder-project.org/redmine/issues/6395))
  - Fixed: Missing support for ubuntu 18_04 in technique aptPackageManagerSettings
    ([\#12884](https://www.rudder-project.org/redmine/issues/12884))
  - Fixed: Clean up the tests for sshKeyDistribution
    ([\#12863](https://www.rudder-project.org/redmine/issues/12863))
  - Fixed: Load modules from local ncf in Rudder policies
    ([\#12774](https://www.rudder-project.org/redmine/issues/12774))
  - Fixed: Process management: stopped sends multiple reports.
    ([\#11683](https://www.rudder-project.org/redmine/issues/11683))
  - Fixed: SSH Configuration Technique on AIX does not reload correctly sshd service when there's been a change
    ([\#12745](https://www.rudder-project.org/redmine/issues/12745))
  - Fixed: Misleading error message in Services technique when range of number of process could not be repaired
    ([\#12713](https://www.rudder-project.org/redmine/issues/12713))
  - Fixed: Add zypper_pattern provider in package technique
    ([\#12700](https://www.rudder-project.org/redmine/issues/12700))
  - Fixed: Typo in generic method File content
    ([\#12507](https://www.rudder-project.org/redmine/issues/12507))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Ilan COSTA
 * Janos Mattyasovszky
 * Dmitry Svyatogorov
 * Florian Heigl

This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.2.7" > </a> Rudder 4.2.7 (2018-07-11)

### Changes

#### Generic methods

  - Add the possibility to customize filters and tests for jinja2 templating
    ([\#12761](https://www.rudder-project.org/redmine/issues/12761))
  - Add the possibility to customize filters and tests for jinja2 templating
    ([\#12761](https://www.rudder-project.org/redmine/issues/12761))
  - Add support for BSD-style init scripts services (rc.d) (slackware)
    ([\#12593](https://www.rudder-project.org/redmine/issues/12593))

#### Generic methods - Package Management

  - Synchronize the 'slackpkg' cfengine package module shipped with ncf with the official one
    ([\#12811](https://www.rudder-project.org/redmine/issues/12811))
  - Synchronize package modules from masterfiles
    ([\#10907](https://www.rudder-project.org/redmine/issues/10907))
  - Backport options for yum package provider
    ([\#12127](https://www.rudder-project.org/redmine/issues/12127))
  - Add a package module for cfengine supporting slackware
    ([\#12684](https://www.rudder-project.org/redmine/issues/12684))

#### Documentation

  - Document plugin node-external-reports
    ([\#12864](https://www.rudder-project.org/redmine/issues/12864))
  - Add binary dependency to rpkg format documentation
    ([\#12810](https://www.rudder-project.org/redmine/issues/12810))
  - Change the documentation to tell the user to use the gpg key from the root path
    ([\#12802](https://www.rudder-project.org/redmine/issues/12802))

#### Agent

  - Add a command line option to run the agent in full compliance mode
    ([\#12681](https://www.rudder-project.org/redmine/issues/12681))

#### System techniques

  - Make the agent resend the inventory if sending failed
    ([\#7490](https://www.rudder-project.org/redmine/issues/7490))

#### Techniques

  - Add testing on sshKeyDistribution
    ([\#12822](https://www.rudder-project.org/redmine/issues/12822))

### Bug fixes

#### API

  - Fixed: Tags in directives are ignored in POST API
    ([\#12355](https://www.rudder-project.org/redmine/issues/12355))
  - Fixed: Archive API always tells "group" even for other objects
    ([\#12705](https://www.rudder-project.org/redmine/issues/12705))

#### Web - UI & UX

  - Fixed: The red cross in case of generation problem is not visible enough
    ([\#11889](https://www.rudder-project.org/redmine/issues/11889))
  - Fixed: loading page and 404 page does not use correct style when redirected by apache
    ([\#12736](https://www.rudder-project.org/redmine/issues/12736))
  - Fixed: Windows node show an empty Certificate Hash field in node details
    ([\#11347](https://www.rudder-project.org/redmine/issues/11347))
  - Fixed: GUI problem with long strings in reporting
    ([\#12283](https://www.rudder-project.org/redmine/issues/12283))

#### Generic methods

  - Fixed: Wrong bundle name passed in 12154
    ([\#12921](https://www.rudder-project.org/redmine/issues/12921))
  - Fixed: Description of the "user primary group" method is wrong
    ([\#12785](https://www.rudder-project.org/redmine/issues/12785))
  - Fixed: Create a generic method to define environment variable
    ([\#12154](https://www.rudder-project.org/redmine/issues/12154))

#### Documentation

  - Fixed: Invalid ordering of elements in node external reports plugin
    ([\#12901](https://www.rudder-project.org/redmine/issues/12901))
  - Fixed: Move DSC documentation inside the plugins section of Rudder doc
    ([\#12895](https://www.rudder-project.org/redmine/issues/12895))
  - Fixed: Missing support of Ubuntu 18.04 agent in documentation
    ([\#12854](https://www.rudder-project.org/redmine/issues/12854))
  - Fixed: Documentation for dsc ncf GM does not appear in the user manual
    ([\#12750](https://www.rudder-project.org/redmine/issues/12750))
  - Fixed: Documentation should use full path to rudder-pkg for command examples
    ([\#12771](https://www.rudder-project.org/redmine/issues/12771))
  - Fixed: Adding missings informations for Windows plugin installation
    ([\#12748](https://www.rudder-project.org/redmine/issues/12748))

#### Generic methods - Package Management

  - Fixed: Force using epoch when installing a package with zypper
    ([\#12799](https://www.rudder-project.org/redmine/issues/12799))
  - Fixed: zypper module arch and version specification for zypper commands is not correct
    ([\#12798](https://www.rudder-project.org/redmine/issues/12798))

#### Rudder web app

  - Fixed: wrong text encoding in technique editor
    ([\#12471](https://www.rudder-project.org/redmine/issues/12471))

#### Web - Nodes & inventories

  - Fixed: In inventory, "motherboardid" is not the mother board id but the machine id
    ([\#12893](https://www.rudder-project.org/redmine/issues/12893))
  - Fixed: It's difficult to know if the node property added is valid json 
    ([\#12360](https://www.rudder-project.org/redmine/issues/12360))
  - Fixed: Slackware is not known by Rudder
    ([\#12707](https://www.rudder-project.org/redmine/issues/12707))
  - Fixed: Log with cause for a missing node is swallowed
    ([\#12724](https://www.rudder-project.org/redmine/issues/12724))

#### Web - Config management

  - Fixed: When we add a section in the directive editor, it clears the content of the previous section
    ([\#12916](https://www.rudder-project.org/redmine/issues/12916))
  - Fixed: No reports on dsc only techniques on a Linux Node
    ([\#12754](https://www.rudder-project.org/redmine/issues/12754))
  - Fixed: When policies have wrong permissions (660), agent cannot be executed, and reload server fails, it breaks the generation, and prevent correcting the permission
    ([\#12732](https://www.rudder-project.org/redmine/issues/12732))

#### Technique editor - API

  - Fixed: Technique Editor may ignores some error when authenticating, leading to unauthorized access
    ([\#12720](https://www.rudder-project.org/redmine/issues/12720))
  - Fixed: Technique Editor may ignores some error when authenticating, leading to unauthorized access
    ([\#12720](https://www.rudder-project.org/redmine/issues/12720))

#### Web - Compliance & node report

  - Fixed: Some reports are duplicated between agent and postgres leading to "unexpected" compliance 
    ([\#12719](https://www.rudder-project.org/redmine/issues/12719))

#### Packaging

  - Fixed: Broken windows plugin install in 4.3
    ([\#12922](https://www.rudder-project.org/redmine/issues/12922))
  - Fixed: Rudder-agent provides rudder-agent without a version
    ([\#7777](https://www.rudder-project.org/redmine/issues/7777))
  - Fixed: Error in Plugin section for Node external reports
    ([\#12898](https://www.rudder-project.org/redmine/issues/12898))
  - Fixed: Warn during inventory if sending through http not https
    ([\#11284](https://www.rudder-project.org/redmine/issues/11284))

#### Generic methods - Service Management

  - Fixed: fail to restart certain services on Ubuntu because of incomplete detection of systemd/upstart
    ([\#12887](https://www.rudder-project.org/redmine/issues/12887))

#### System integration

  - Fixed: apache overwrites error response from Rudder
    ([\#12747](https://www.rudder-project.org/redmine/issues/12747))
  - Fixed: Generation gets stuck when cf-serverd is not running
    ([\#12604](https://www.rudder-project.org/redmine/issues/12604))

#### Plugins

  - Fixed: rudder-pkg should fail installation is a dependency is missing
    ([\#12749](https://www.rudder-project.org/redmine/issues/12749))

#### System techniques

  - Fixed: System Techniques must not be added by reload technique, only updated, else they are duplicated
    ([\#12765](https://www.rudder-project.org/redmine/issues/12765))
  - Fixed: cron is always restarted since #12615
    ([\#12886](https://www.rudder-project.org/redmine/issues/12886))
  - Fixed: When a technique reports several time the exact same text, there is only one report generated
    ([\#6343](https://www.rudder-project.org/redmine/issues/6343))
  - Fixed: Detection of minicurl and https is done in conflicting ways
    ([\#12155](https://www.rudder-project.org/redmine/issues/12155))
  - Fixed: Rudder agent needs 2 updates to work properly
    ([\#12793](https://www.rudder-project.org/redmine/issues/12793))

#### Performance and scalability

  - Fixed: Method copyResourceFile is quite inefficient
    ([\#12702](https://www.rudder-project.org/redmine/issues/12702))
  - Fixed: Unused formatter in policy generation spend a bit of time in policy generation
    ([\#12735](https://www.rudder-project.org/redmine/issues/12735))
  - Fixed: Moving policies to their final position (last step of policies writing) could be improved
    ([\#12730](https://www.rudder-project.org/redmine/issues/12730))
  - Fixed: We are missing a lot of timing measurement in policy generation
    ([\#12725](https://www.rudder-project.org/redmine/issues/12725))

#### Techniques

  - Fixed: Technique userManagement does not change shell
    ([\#6395](https://www.rudder-project.org/redmine/issues/6395))
  - Fixed: Missing support for ubuntu 18_04 in technique aptPackageManagerSettings
    ([\#12884](https://www.rudder-project.org/redmine/issues/12884))
  - Fixed: Clean up the tests for sshKeyDistribution
    ([\#12863](https://www.rudder-project.org/redmine/issues/12863))
  - Fixed: Load modules from local ncf in Rudder policies
    ([\#12774](https://www.rudder-project.org/redmine/issues/12774))
  - Fixed: Process management: stopped sends multiple reports.
    ([\#11683](https://www.rudder-project.org/redmine/issues/11683))
  - Fixed: SSH Configuration Technique on AIX does not reload correctly sshd service when there's been a change
    ([\#12745](https://www.rudder-project.org/redmine/issues/12745))
  - Fixed: Misleading error message in Services technique when range of number of process could not be repaired
    ([\#12713](https://www.rudder-project.org/redmine/issues/12713))
  - Fixed: Add zypper_pattern provider in package technique
    ([\#12700](https://www.rudder-project.org/redmine/issues/12700))
  - Fixed: Typo in generic method File content
    ([\#12507](https://www.rudder-project.org/redmine/issues/12507))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Ilan COSTA
 * Janos Mattyasovszky
 * Dmitry Svyatogorov
 * Florian Heigl

This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.2.6" > </a> Rudder 4.2.6 (2018-05-29)

### Changes

#### Packaging
 
  - Add agent support for Ubuntu 18.04 LTS "Bionic Beaver"
    ([\#12683](https://www.rudder-project.org/redmine/issues/12683))

#### Documentation

  - Add docs about Windows agent logging
    ([\#12393](https://www.rudder-project.org/redmine/issues/12393))

#### Miscellaneous

  - Add tests for sshKeyDistribution technique
    ([\#12455](https://www.rudder-project.org/redmine/issues/12455))

#### Web - Compliance & node report

  - Overriden directives are not listed in reports information
    ([\#7616](https://www.rudder-project.org/redmine/issues/7616))

#### Agent

  - Upgrade to CFEngine 3.10.4 LTS
    ([\#12576](https://www.rudder-project.org/redmine/issues/12576))

#### System techniques

  - Add a way to override report mode in system techniques
    ([\#12680](https://www.rudder-project.org/redmine/issues/12680))
  - rudder-lib.st in the "common" system technique does not identify crond as running when the ps is /usr/sbin/crond -l notice
    ([\#12615](https://www.rudder-project.org/redmine/issues/12615))

#### Performance and scalability

  - Explore alternative format for compliance table
    ([\#12621](https://www.rudder-project.org/redmine/issues/12621))

#### Techniques

  - Add an entry for the slackware package module in the packageManagement technique metadata
    ([\#12687](https://www.rudder-project.org/redmine/issues/12687))
  - Make the 'common' system technique identify crond on a slackware agent
    ([\#12610](https://www.rudder-project.org/redmine/issues/12610))
  - New rudder technique : SNMP configuration to monitor the rudder agent health
    ([\#12501](https://www.rudder-project.org/redmine/issues/12501))

### Bug fixes

#### Web - UI & UX

  - Fixed: Compliance bar appears partially white in some graphes
    ([\#12643](https://www.rudder-project.org/redmine/issues/12643))
  - Fixed: Directive  tree filter is very slow
    ([\#12650](https://www.rudder-project.org/redmine/issues/12650))
  - Fixed: While adding network in General settings CIDR notation validation fails in special cases
    ([\#12629](https://www.rudder-project.org/redmine/issues/12629))
  - Fixed: Delete directive confirmation popup should display the action to confirm
    ([\#12552](https://www.rudder-project.org/redmine/issues/12552))
  - Fixed: Add space between filter and Event logs table
    ([\#12515](https://www.rudder-project.org/redmine/issues/12515))
  - Fixed: CSS of txt/json inputs is broken
    ([\#12514](https://www.rudder-project.org/redmine/issues/12514))
  - Fixed: Add margin between selects and button groups in Archives page
    ([\#12513](https://www.rudder-project.org/redmine/issues/12513))
  - Fixed: Buttons don't follow a straight design
    ([\#12512](https://www.rudder-project.org/redmine/issues/12512))

#### Technique editor - UI/UX

  - Fixed: Broken css when technique name is long
    ([\#12545](https://www.rudder-project.org/redmine/issues/12545))
  - Fixed: The filter field in the technique editor should not be monospace
    ([\#12081](https://www.rudder-project.org/redmine/issues/12081))

#### Web - Config management

  - Fixed: "Safelly" typo in logs
    ([\#12635](https://www.rudder-project.org/redmine/issues/12635))

#### Web - Maintenance

  - Fixed: Java 9 / Java 10 compatibility: security exception for JS VM
    ([\#12548](https://www.rudder-project.org/redmine/issues/12548))
  - Fixed: Java 9 / Java 10 compatibility: javax/xml/bind removed
    ([\#12557](https://www.rudder-project.org/redmine/issues/12557))

#### Web - Technique editor

  - Fixed: Always get "Technique diverges" pop-up when coming back to technique editor
    ([\#12207](https://www.rudder-project.org/redmine/issues/12207))

#### Architecture - Internal libs

  - Fixed: Missing ipv6 constraint regex test
    ([\#12666](https://www.rudder-project.org/redmine/issues/12666))

#### Documentation

  - Fixed: Restricted java security policy breaks Rudder (class configured for Cipher(provider: BC)cannot be found)
    ([\#12606](https://www.rudder-project.org/redmine/issues/12606))
  - Fixed: Typo beeing -> being in rudder manual
    ([\#12506](https://www.rudder-project.org/redmine/issues/12506))
  - Fixed: Fix various typos in ncf doc
    ([\#12570](https://www.rudder-project.org/redmine/issues/12570))

#### Miscellaneous

  - Fixed: Policies regeneration error when using a parameters with " char
    ([\#12674](https://www.rudder-project.org/redmine/issues/12674))
  - Fixed: wrong import in ssh-key-distribution tests
    ([\#12511](https://www.rudder-project.org/redmine/issues/12511))

#### Web - Compliance & node report

  - Fixed: ${const.dollar} in generic method parameter leads to missing report
    ([\#12616](https://www.rudder-project.org/redmine/issues/12616))

#### Packaging

  - Fixed: .pyc file are not cleand up during postinst
    ([\#12634](https://www.rudder-project.org/redmine/issues/12634))
  - Fixed: Fix flask version during build
    ([\#12541](https://www.rudder-project.org/redmine/issues/12541))
  - Fixed: rudder-pkg python3 issue
    ([\#12504](https://www.rudder-project.org/redmine/issues/12504))
  - Fixed: ncf script traceback error
    ([\#12633](https://www.rudder-project.org/redmine/issues/12633))

#### API

  - Fixed: NumberFormatException in NodeAPI 8 (runResponse)
    ([\#12556](https://www.rudder-project.org/redmine/issues/12556))

#### Agent

  - Fixed: jobScheduler does not work when the first non-loopback interface has no ip address
    ([\#12262](https://www.rudder-project.org/redmine/issues/12262))

#### System techniques

  - Fixed: Access rules on Rudder servers/relays prevent in most case the server from downloading/connecting on itself
    ([\#12521](https://www.rudder-project.org/redmine/issues/12521))

#### Performance and scalability

  - Fixed: Rule tree filter is a bit slow
    ([\#12690](https://www.rudder-project.org/redmine/issues/12690))

#### Techniques

  - Fixed: Enforce checkbox tooltip in groupmanagement technique is misleading
    ([\#12670](https://www.rudder-project.org/redmine/issues/12670))
  - Fixed: Missing report if two mountounts with the same target
    ([\#12647](https://www.rudder-project.org/redmine/issues/12647))
  - Fixed: Missing report when we cannot change home directory in users technique
    ([\#12555](https://www.rudder-project.org/redmine/issues/12555))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Daniel Fuleki
 * Janos Mattyasovszky
 * Vincent DAVY

This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.2.5" > </a> Rudder 4.2.5 (2018-04-19)

### Breaking Changes

  - Fixed: In Windows Agent, a '\' in a directive parameter value is escaped but it should not
    ([\#12390](https://www.rudder-project.org/redmine/issues/12390))

### Changes

#### Packaging

  - Oracle jdk url has changed but not in ppa
    ([\#12479](https://www.rudder-project.org/redmine/issues/12479))

#### Relay server or API

  - Make Groups and Rules API accessible for internal use
    ([\#12419](https://www.rudder-project.org/redmine/issues/12419))

#### Miscellaneous

  - Update the techniques tests
    ([\#12346](https://www.rudder-project.org/redmine/issues/12346))

### Bug fixes

#### Generic methods

  - Fixed: Job cheduler methods whith mode are broken
    ([\#12378](https://www.rudder-project.org/redmine/issues/12378))
  - Fixed: Missing report for "Shared file to node"
    ([\#12377](https://www.rudder-project.org/redmine/issues/12377))

#### Web - Config management

  - Fixed: Cannot generate policies when there is a loop in policy server hierharchy (stackoverflow)
    ([\#12359](https://www.rudder-project.org/redmine/issues/12359))
  - Fixed: Typo in agent build error "reource""
    ([\#12314](https://www.rudder-project.org/redmine/issues/12314))

#### Technique editor - Techniques

  - Fixed: Technique editor returning an error when saving
    ([\#12464](https://www.rudder-project.org/redmine/issues/12464))

#### Plugin - API ACL

  - Fixed: API failing on root node
    ([\#12229](https://www.rudder-project.org/redmine/issues/12229))

#### Generic methods - File Management

  - Fixed: Jinja2 templating: Shows error in output even when successful
    ([\#12379](https://www.rudder-project.org/redmine/issues/12379))
  - Fixed: We cannot use file_enforce_content with a list and enforce=true
    ([\#12147](https://www.rudder-project.org/redmine/issues/12147))

#### Documentation

  - Fixed: Remove references to foswiki in the doc
    ([\#12363](https://www.rudder-project.org/redmine/issues/12363))
  - Fixed: Missing configuration instructions at the end of node install documentation
    ([\#11927](https://www.rudder-project.org/redmine/issues/11927))
  - Fixed: Remove doc of class_prefix variable
    ([\#12176](https://www.rudder-project.org/redmine/issues/12176))
  - Fixed: condition_from_expression documentation does not clearly state how to use it
    ([\#12157](https://www.rudder-project.org/redmine/issues/12157))

#### Miscellaneous

  - Fixed: broken reporting for ssh key distribution technique
    ([\#12444](https://www.rudder-project.org/redmine/issues/12444))
  - Fixed: Report missing if no password given in User technique
    ([\#12422](https://www.rudder-project.org/redmine/issues/12422))
  - Fixed: wrong xenstore-read path on (at least) ubuntu
    ([\#12376](https://www.rudder-project.org/redmine/issues/12376))
  - Fixed: Wrong regex in FileTemplate technique
    ([\#12263](https://www.rudder-project.org/redmine/issues/12263))

#### Agent

  - Fixed: if we have syntax error in policies on the Rudder server, rudder agent check says that all is fine
    ([\#12220](https://www.rudder-project.org/redmine/issues/12220))
  - Fixed: agent-health should not require reverse resolution
    ([\#12218](https://www.rudder-project.org/redmine/issues/12218))

#### Packaging

  - Fixed: rudder-jetty should depend on headless jre on centos7
    ([\#12328](https://www.rudder-project.org/redmine/issues/12328))
  - Fixed: Remove invalid comment in rudder-agent spec file
    ([\#12312](https://www.rudder-project.org/redmine/issues/12312))
  - Fixed: rudder-init fails when rudder-server-roles.conf does not exist
    ([\#12247](https://www.rudder-project.org/redmine/issues/12247))

#### Web - Nodes & inventories

  - Fixed: LDAP query checker must succeed when criteria is empty
    ([\#12343](https://www.rudder-project.org/redmine/issues/12343))

#### Plugins

  - Fixed: rudder-pkg does not allow to install/update/remove several plugin at once
    ([\#12330](https://www.rudder-project.org/redmine/issues/12330))

#### Security

  - Fixed: Failed generation with "Could not initialize class javax.crypto.JceSecurity"
    ([\#12448](https://www.rudder-project.org/redmine/issues/12448))
  - Fixed: Bad session counting block user login after three session created
    ([\#12367](https://www.rudder-project.org/redmine/issues/12367))

#### Techniques

  - Fixed: Time settings directive configuration not accessible to non-root users
    ([\#12303](https://www.rudder-project.org/redmine/issues/12303))
  - Fixed: Unsupported key types are silently ignored in ssh key management technique
    ([\#8618](https://www.rudder-project.org/redmine/issues/8618))
  - Fixed: Missing report for component "Post-modification hook" when cleaning files
    ([\#12297](https://www.rudder-project.org/redmine/issues/12297))
  - Fixed: Missing report in Group Management 
    ([\#12214](https://www.rudder-project.org/redmine/issues/12214))
  - Fixed: Invalid call in descriptor of Technique File download (Rudder server) , version 2.2 in branch 4.2 and 4.3
    ([\#12213](https://www.rudder-project.org/redmine/issues/12213))

#### Server components

  - Fixed: Agent components should not try to load failsafe.cf when policies are broken
    ([\#12243](https://www.rudder-project.org/redmine/issues/12243))
  - Fixed: sysconfig/apache2 modifications get removed
    ([\#11153](https://www.rudder-project.org/redmine/issues/11153))

#### System integration

  - Fixed: Promises shared with apache are group executable
    ([\#12169](https://www.rudder-project.org/redmine/issues/12169))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Ilan COSTA
 * Janos Mattyasovszky
 * Florian Heigl
 * Rob Pomeroy

This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.2.4" > </a> Rudder 4.2.4 (2018-02-23)


### Breaking Changes

  - Fixed: Incorrect detection and storage of architecture 32/64 bits
    ([\#11918](https://www.rudder-project.org/redmine/issues/11918))

### Changes

#### Technique editor - UI/UX

  - Change max field length from 2k to 16k
    ([\#11859](https://www.rudder-project.org/redmine/issues/11859))

#### Web - UI & UX

  - add margin to the magnifying glass icon in the Nodes table
    ([\#11849](https://www.rudder-project.org/redmine/issues/11849))

#### Generic methods

  - file_copy_with_check
    ([\#11610](https://www.rudder-project.org/redmine/issues/11610))
  - Add a method to unset all the classes of a prefix
    ([\#11903](https://www.rudder-project.org/redmine/issues/11903))
  - Implement a push / pop mechanism for audit mode
    ([\#11732](https://www.rudder-project.org/redmine/issues/11732))

#### Web - Nodes & inventories

  - Add more information about the inventory in the inventory process reporting
    ([\#10084](https://www.rudder-project.org/redmine/issues/10084))

#### Documentation

  - Remove bibliography from the doc
    ([\#7733](https://www.rudder-project.org/redmine/issues/7733))
  - Document scheduler generic method
    ([\#6946](https://www.rudder-project.org/redmine/issues/6946))

#### Technique editor - API

  - Use a fixed size font in the technique editor parameters
    ([\#11895](https://www.rudder-project.org/redmine/issues/11895))

#### Agent

  - Backport complete variable table performance patch
    ([\#12130](https://www.rudder-project.org/redmine/issues/12130))
  - Update CFEngine to 3.10.3
    ([\#12090](https://www.rudder-project.org/redmine/issues/12090))
  - Add a "rudder agent history" command
    ([\#12053](https://www.rudder-project.org/redmine/issues/12053))

#### Packaging

  - Upgrade openssl to 1.0.2n
    ([\#11967](https://www.rudder-project.org/redmine/issues/11967))
  - Create a rudder server upgrade-techniques commands
    ([\#11059](https://www.rudder-project.org/redmine/issues/11059))

#### Initial promises & sys tech

  - Implement disable-flag for policy server policy copy for nodes
    ([\#11631](https://www.rudder-project.org/redmine/issues/11631))
  - Create a global variable for "shared-files" path
    ([\#6324](https://www.rudder-project.org/redmine/issues/6324))

#### Architecture - Refactoring

  - Remove ListTag workaround when JGit version > 1.2
    ([\#2278](https://www.rudder-project.org/redmine/issues/2278))

#### Techniques

  - Add post-hook to the manage key-value file techniques
    ([\#12124](https://www.rudder-project.org/redmine/issues/12124))

### Bug fixes

#### API

  - Fixed: Api does not fail on bad JSON
    ([\#5931](https://www.rudder-project.org/redmine/issues/5931))

#### Web - UI & UX

  - Fixed: Update / Delete buttons on group Category modification should be separated
    ([\#11782](https://www.rudder-project.org/redmine/issues/11782))
  - Fixed: Javascript error on every pages, preventing usage of file explorer
    ([\#11991](https://www.rudder-project.org/redmine/issues/11991))
  - Fixed: Directives tree is not filtered after saving changes
    ([\#11670](https://www.rudder-project.org/redmine/issues/11670))
  - Fixed: Input text for repository in apt repository management is too small
    ([\#11841](https://www.rudder-project.org/redmine/issues/11841))
  - Fixed: "Agent policy mode" should be "Node policy mode" 
    ([\#11837](https://www.rudder-project.org/redmine/issues/11837))

#### Generic methods

  - Fixed: command_execution_result does not report anything
    ([\#12087](https://www.rudder-project.org/redmine/issues/12087))
  - Fixed: yum is run at each cf-promises, having a massive perf cost, on redhat-like system
    ([\#11937](https://www.rudder-project.org/redmine/issues/11937))
  - Fixed: Add a comment about quotes in file_ensure_key_value parameters documentation
    ([\#11896](https://www.rudder-project.org/redmine/issues/11896))
  - Fixed: Wrong result class in file_enforce_content
    ([\#11880](https://www.rudder-project.org/redmine/issues/11880))
  - Fixed: Abort bundle does not work in dry-run mode
    ([\#11867](https://www.rudder-project.org/redmine/issues/11867))
  - Fixed: "Shared file to node" method does not send file to node if file to send was created during run
    ([\#11869](https://www.rudder-project.org/redmine/issues/11869))

#### Web - Nodes & inventories

  - Fixed: No Machine Inventory in nodes list while the details are complete
    ([\#12041](https://www.rudder-project.org/redmine/issues/12041))
  - Fixed: When a network interface is deleted from a node, it is not removed on the Rudder server
    ([\#12026](https://www.rudder-project.org/redmine/issues/12026))

#### Technique editor - Techniques

  - Fixed: rudder_reporting file is invalid on nodes if it contains '&&' in one of its parameter
    ([\#11870](https://www.rudder-project.org/redmine/issues/11870))

#### Generic methods - Package Management

  - Fixed: Zypper hangs on dialogs / issues due to open tty
    ([\#6291](https://www.rudder-project.org/redmine/issues/6291))

#### Web - Technique editor

  - Fixed: Set flag to reload ncf technique through Rudder during update
    ([\#12005](https://www.rudder-project.org/redmine/issues/12005))
  - Fixed: Broken variable expression when using node properties in the technique editor
    ([\#10304](https://www.rudder-project.org/redmine/issues/10304))

#### Documentation

  - Fixed: Please, legitimate "Priority" usage in multi-instance directives
    ([\#11963](https://www.rudder-project.org/redmine/issues/11963))
  - Fixed: Missing documentation about InputTCPMaxSessions and when to change its value in rsyslog
    ([\#8613](https://www.rudder-project.org/redmine/issues/8613))
  - Fixed: Merge "Migration" and "Server migration" subsections in the doc
    ([\#11062](https://www.rudder-project.org/redmine/issues/11062))
  - Fixed: Restore backup documentation is not correct
    ([\#11177](https://www.rudder-project.org/redmine/issues/11177))
  - Fixed: Redirect FAQ to faq.rudder-project.org
    ([\#11905](https://www.rudder-project.org/redmine/issues/11905))

#### Technique editor - API

  - Fixed: Result class containing {} are not properly canonized
    ([\#11600](https://www.rudder-project.org/redmine/issues/11600))
  - Fixed: If change message is mandatory, we cannot update technique with technique editor
    ([\#12008](https://www.rudder-project.org/redmine/issues/12008))
  - Fixed: Saving a technique in the technique editor in IE11 fails
    ([\#11894](https://www.rudder-project.org/redmine/issues/11894))

#### Agent

  - Fixed: Autocompletion for rudder commands doesn't work on RHEL and SLES
    ([\#11885](https://www.rudder-project.org/redmine/issues/11885))
  - Fixed: The agent moves obstructions regardless of policy mode
    ([\#11866](https://www.rudder-project.org/redmine/issues/11866))
  - Fixed: Agent script argument parsing failure when using non-default locale 
    ([\#12131](https://www.rudder-project.org/redmine/issues/12131))
  - Fixed: rudder remote run cuts down IP of remote host
    ([\#11418](https://www.rudder-project.org/redmine/issues/11418))
  - Fixed: With "rudder agent run", nothing is logged in /var/rudder/cfengine-community/outputs/
    ([\#10801](https://www.rudder-project.org/redmine/issues/10801))
  - Fixed: When rudder agent disable fails it prints a success message
    ([\#11936](https://www.rudder-project.org/redmine/issues/11936))
  - Fixed: Agent process detection is wrong in rudder agent check on AIX
    ([\#11921](https://www.rudder-project.org/redmine/issues/11921))

#### Packaging

  - Fixed: rudder-webapp upgrade doesn't commit updates to ncf hooks
    ([\#6758](https://www.rudder-project.org/redmine/issues/6758))
  - Fixed: rudder-inventory-ldap package provides openldap libraries
    ([\#3377](https://www.rudder-project.org/redmine/issues/3377))
  - Fixed: typo in rudder-server relay package install output
    ([\#12064](https://www.rudder-project.org/redmine/issues/12064))
  - Fixed: Reload of techniques after update throught technique editor should only be done by Rudder, remove reload.sh hook
    ([\#12010](https://www.rudder-project.org/redmine/issues/12010))
  - Fixed: Upgrade Java version used when building webapp on old debian versions, since oracle jvm links has changed
    ([\#11981](https://www.rudder-project.org/redmine/issues/11981))
  - Fixed: Rudder root on SLES12 shows LDAP error during installation
    ([\#10454](https://www.rudder-project.org/redmine/issues/10454))
  - Fixed: Impossible to share policies to DSC Nodes with a SLES11 Server
    ([\#11856](https://www.rudder-project.org/redmine/issues/11856))

#### Initial promises & sys tech

  - Fixed: If we a have generic method command_execution with parameter /bin/true, we get an error on reporting for syslog restart on non-aix nor solaris sytem
    ([\#12139](https://www.rudder-project.org/redmine/issues/12139))
  - Fixed: Rudder server installation fails if apache cannot resolve server hostname
    ([\#11983](https://www.rudder-project.org/redmine/issues/11983))
  - Fixed: Use rudder agent check in aix crontab
    ([\#11920](https://www.rudder-project.org/redmine/issues/11920))
  - Fixed: Inventory from a node on Xen dom0 is missing UUID and is invalid
    ([\#11902](https://www.rudder-project.org/redmine/issues/11902))
  - Fixed: remote execution is cut at 30 secondes
    ([\#11416](https://www.rudder-project.org/redmine/issues/11416))

#### System integration

  - Fixed: Stopping slapd fails if pid file is empty
    ([\#10498](https://www.rudder-project.org/redmine/issues/10498))
  - Fixed: service rudder-* outputs on stderror
    ([\#6429](https://www.rudder-project.org/redmine/issues/6429))
  - Fixed: Cannot run rudder server reload-techniques on RedHat 6.6
    ([\#11907](https://www.rudder-project.org/redmine/issues/11907))
  - Fixed: Configuration file of Rudder mention that we may change "LDAP DIT configuration", which is wrong
    ([\#10664](https://www.rudder-project.org/redmine/issues/10664))
  - Fixed: send-clean.sh blocks on inventory parsing error
    ([\#10019](https://www.rudder-project.org/redmine/issues/10019))

#### Web - Compliance & node report

  - Fixed: Compliance keeps on loading while expected reports are not available for a node or a rule
    ([\#7281](https://www.rudder-project.org/redmine/issues/7281))
  - Fixed: Runaway quotation mark at Node report
    ([\#11834](https://www.rudder-project.org/redmine/issues/11834))

#### Architecture - Dependencies

  - Fixed: ERROR: canceling statement due to user request
    ([\#11973](https://www.rudder-project.org/redmine/issues/11973))
  - Fixed: Update to monix 2.3.3: critical bug corrected
    ([\#12024](https://www.rudder-project.org/redmine/issues/12024))

#### Server components

  - Fixed: There is a /var/cfengine/inputs on a Rudder server
    ([\#8625](https://www.rudder-project.org/redmine/issues/8625))
  - Fixed: Clarify support for SLES12 SP2 as Root Server
    ([\#11854](https://www.rudder-project.org/redmine/issues/11854))
  - Fixed: rudder server refusing nodes after an error in check-rudder-agent
    ([\#11309](https://www.rudder-project.org/redmine/issues/11309))

#### Techniques

  - Fixed: Typo in templating technique
    ([\#12126](https://www.rudder-project.org/redmine/issues/12126))
  - Fixed: Typo in tooltip of File content (from remote template) for path of file
    ([\#12123](https://www.rudder-project.org/redmine/issues/12123))
  - Fixed: The technique file copy from shared folder reports file source instead of file destination
    ([\#6564](https://www.rudder-project.org/redmine/issues/6564))
  - Fixed: Group management technique silently changes the group gid
    ([\#11863](https://www.rudder-project.org/redmine/issues/11863))
  - Fixed: Typo in services technique preventing persisting post-hook
    ([\#11861](https://www.rudder-project.org/redmine/issues/11861))
  - Fixed: sharedfile_to_node reports repaired even if it fails 
    ([\#11836](https://www.rudder-project.org/redmine/issues/11836))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Michael Gliwinski
 * Dennis Cabooter
 * Avit Sidis
 * Dmitry Svyatogorov
 * Janos Mattyasovszky
 * The Ranger
 * Jean Cardona
 * Alexandre BRIANCEAU
 * Alexander Brunhirl
 * Florian Heigl

This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

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
