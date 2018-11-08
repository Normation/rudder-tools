
# General information

Rudder 5.0 is currently a maintained version of Rudder.

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Warning**: The following features are now provided as plugins and no more available as part of default Rudder
installation starting from 5.0:

* LDAP-based authentication
* Relay servers
* Changes validation workflow (change requests)

If you were using them, upgrade will disable them and you will have to install
the plugin.
Read the [plugins page on our website](http://rudder.io/plugins) for more information.

The initial RUDDER model consisting of a single software block which includes all features,
thus imposing a greater and greater complexity on all of our users, has reached its limits.
We have now reached a sufficient understanding of the domain, its challenges, and the way
RUDDER is used, to make us realize that this all-in-one model is not, or is no longer, the
best suited.

*New plugin ecosystem*: Version 5.0 introduces a plugin ecosystem that gathers RUDDER’s most
specific features. This way, only essential features have to be installed by default and
advanced features can be used on a case by case basis. So what is essential and what is not?
The basic rule is that the essential experience must contain the features used by 80% or more
of users, whatever the scale of use. In other words, we keep as core features everything that
delivers on RUDDER’s initial promise: enabling users to continuously audit and enforce
configurations with an easy to use webapp providing visual reporting. The remaining 20%
solve needs that are no less important, only less common (PDF compliance reports, UI branding,
scale-out relay servers, validation workflow…). To know everything about the impact of this
evolution, you can read the detailed dedicated article:

http://www.normation.com/en/blog/2018/09/26/rudder-5-new-modular-version-thanks-ecosystem-plugins/


*Integration*: We provide integration with third party tools as plugins, making RUDDER more
integrated with tools like Ansible, Centreon, Zabbix, GLPI or Vault.
Except for a few (ie. managing AIX and Windows host), plugins are open source and source
code is available here: https://github.com/normation/rudder-plugins/

*New documentation*: Welcome to our brand new documentation website 
[docs.rudder.io](https://docs.rudder.io)! Beyond its fresh look (both on the online website
and in the embedded version), this new documentation includes updated content and new resources,
like a “getting started” guide and examples of use-cases.

*System API*: We built a new REST API that allows to manage some advanced settings and perform
maintenance operations in RUDDER, like triggering policy generations, updating dynamic groups
and managing report archives. This was previously available in the now deprecated V1 API
(https://docs.rudder.io/history/4.3/rest-api.html#rest-api) which will be removed in the next major version (5.1).

*Debugging information script*: We created a script to gather basic information about a
RUDDER setup when you want to debug or understand RUDDER’s behavior. This script fetches
log files and executes various commands, either to get information from databases or directly
from the system (package versions, etc)

*Automatic Technique upgrade*: Techniques provided with RUDDER can now be automatically upgraded
when you update RUDDER. This process used to be manual because you might have modified the
base Technique Library and we thought you may want to have more control about the content
of your Technique Library. But it appears that this process was forgotten by a majority of 
our users and so many bug fixes and new versions were not available after an upgrade. 
By default this feature is enabled on new RUDDER 5.0 installations but is disabled on
upgrades from older versions, to prevent any accidental damage.

*Support policy*: Our general policy is to maintain major releases until 3 months after
the next major version is released to give some time for upgrading. The ESR tag was
previously given to major releases that were maintained 6 months after the next ESR
version was announced. Rudder 4.1 is the last ESR release.
For a slower major upgrade pace, Rudder subscription provides long-term maintenance
up to 24 months after release (depending on the subscription level) for Rudder versions.
Read the FAQ page for more information: http://faq.rudder-project.org/forums/2-knowledge-base/topics/9-when-are-versions-published-and-how-long-are-they-maintained/

*Packaging*: *Relay server support is now part of an open-source plugin*, pre-compiled packages are available as part of the Rudder subscription.

The agent package is now more modular: instead of embedding all dependencies,
we are using system libraries on maintained operating systems,
to allow for a better system integration. As a consequence, the
experimental rudder-agent-thin (which had this exact goal) package is not built anymore.

*New repositories*: https://repository.rudder.io/
We are using new repositories for versions starting from 5.0. We also provide all
previous releases in these new repos. We improved our build system, files hierarchy,
and added more gpg signatures on distributed files (Rudder sources, etc.)

**Installing, upgrading and testing**

  - Install docs:
    https://www.rudder-project.org/doc-5.0/_installation.html
  - Upgrade docs:
    https://www.rudder-project.org/doc-5.0/_upgrade_rudder.html
  - Download links: https://www.rudder-project.org/site/get-rudder/downloads/

We also recommend using the [Rudder
Vagrant](https://github.com/Normation/rudder-vagrant) config if you want
a quick and easy way to get an installation for testing.

**Supported operating systems**

This version provides packages for these operating systems:

  - Rudder server and Rudder relay: **Debian 8-9, RHEL/CentOS 7
    (64 bits), SLES 12-15, Ubuntu 16.04 LTS-18.04 LTS**
  - Rudder agent: all of the above plus **RHEL/CentOS 6, Ubuntu 14.04 LTS**
  - Rudder agent (binary packages available from
    ([Normation](http://www.normation.com)): **Debian 5-7, RHEL/CentOS 3-5, SLES 10-11, Ubuntu 10.04 LTS-12.04 LTS, Windows Server 2008R2-2016,
    AIX 5-6-7, Slackware 14**

Read more in https://docs.rudder.io/reference/5.0/installation/operating_systems.html

# Known issues

## Communication between agents built with 1.1.0 vs. 1.0.x openssl versions <a name="openssl-bug"></a>

We have found a communication problem between some versions of rudder agent and server due to a bug in OpenSSL library.

The problem occurs when a client (resp. server) using OpenSSL 1.0 tries to communicate with a server (resp. client) using OpenSSL 1.1.0.
It is [corrected](https://github.com/openssl/openssl/issues/7134) in newly released OpenSSL 1.1.1. The Rudder corresponding bug is [traced on Rudder bug tracker](https://www.rudder-project.org/redmine/issues/13690).

Rudder versions from 5.0.0 to 5.0.2 on Ubuntu 18.04, Debian 9, and SLES 15 use OpenSSL 1.1.0.
Any previous version of Rudder on these OS or any version of Rudder in any other OS use OpenSSL 1.0.
If you have in your environment a Rudder server in one group and agents in the other group, these agents won't be able to communicate with the server any more.

The most likely case where it could happen is if you upgrade a Rudder server on Ubuntu 18.04 or on Debian 9 from version 4.3 to 5.0. In such a case, a partial workaround is to also upgrade Debian 9/Ubuntu 18.04 agents to Rudder 5.0, but agents in other OS will still be impacted by the communication problem.
A safer and simpler solution, if available, is to delay such on upgrade until a patch is available.

We are working on the patch to replace the buggy OpenSSL 1.1.0 and we will release a new version of Rudder 5.0 with it as soon as possible.

We are sorry for any inconvenience resulting from this problem. If you need more information or help, please don't hesitate to contact us by email or other means of communication like [gitter](https://gitter.im/normation/rudder) or irc (#rudder on freenode).

# Changelogs

## <a name="5.0.2" > </a> Rudder 5.0.2 (2018-11-06)

### Changes

#### Generic methods

  - Add condition_once and execute_once generic methods
    ([\#13667](https://www.rudder-project.org/redmine/issues/13667))

#### Documentation

  - Document zypper pattern usage in the "Package state" generic method documentation
    ([\#13725](https://www.rudder-project.org/redmine/issues/13725))

### Bug fixes

#### Web - UI & UX

  - Fixed: We have no way to know that a Technique is disabled when editing a Directive
    ([\#12829](https://www.rudder-project.org/redmine/issues/12829))
  - Fixed: Broken display of popup to delete node property in Rudder 5.0.1
    ([\#13694](https://www.rudder-project.org/redmine/issues/13694))

#### Generic methods

  - Fixed: Generic method "Sharedfile to node" always return repaired status
    ([\#13753](https://www.rudder-project.org/redmine/issues/13753))
  - Fixed: Unit tests for generic method "File from a Jinja2 template" fail on Ubuntu12 on Rudder 4.1
    ([\#13747](https://www.rudder-project.org/redmine/issues/13747))
  - Fixed: Time lib may not work when the first non-loopback interface has no ip adress
    ([\#13744](https://www.rudder-project.org/redmine/issues/13744))
  - Fixed: Remove comment about classes_generic_two being deprecated
    ([\#13286](https://www.rudder-project.org/redmine/issues/13286))
  - Fixed: Style test nbsp_is_not_allowed.sh always fails, missing 4.1 version of 13637
    ([\#13722](https://www.rudder-project.org/redmine/issues/13722))
  - Fixed: Missing report when using default value in Generic method parameters
    ([\#13704](https://www.rudder-project.org/redmine/issues/13704))
  - Fixed: Add more tests for the schedule lib in ncf
    ([\#13668](https://www.rudder-project.org/redmine/issues/13668))
  - Fixed: Zypper patterns tests should not be executed on non sles os
    ([\#13638](https://www.rudder-project.org/redmine/issues/13638))

#### Web - Nodes & inventories

  - Fixed: Group of group is empty if we use the AND combinator
    ([\#13424](https://www.rudder-project.org/redmine/issues/13424))

#### Plugins integration

  - Fixed: Authentication providers are not loaded before authentication is initialized
    ([\#13695](https://www.rudder-project.org/redmine/issues/13695))

#### Generic methods - File Management

  - Fixed: Change the detection of curl path in ncf to use rudder_curl if available
    ([\#13745](https://www.rudder-project.org/redmine/issues/13745))
  - Fixed: Missing report in "Manage keys-values in file" technique
    ([\#13715](https://www.rudder-project.org/redmine/issues/13715))
  - Fixed: Missing reporting in "Permisisons recurse" method
    ([\#13683](https://www.rudder-project.org/redmine/issues/13683))
  - Fixed: Generic Method "File copy from remote source" does not report when copying a directory
    ([\#13634](https://www.rudder-project.org/redmine/issues/13634))
  - Fixed: Missing status when I use "File copy from Rudder shared folder" Technique
    ([\#13669](https://www.rudder-project.org/redmine/issues/13669))

#### Web - Config management

  - Fixed: In directive, change input for parameter from technique editor from text to textarea 
    ([\#12824](https://www.rudder-project.org/redmine/issues/12824))

#### Generic methods - Package Management

  - Fixed: Missing report when using the "Package state" generic method with default value for the "state" parameter
    ([\#13703](https://www.rudder-project.org/redmine/issues/13703))

#### Agent

  - Fixed: Redhat Openstack Nova compute QEMU virtual machines are seen as physical
    ([\#10265](https://www.rudder-project.org/redmine/issues/10265))
  - Fixed: Mustache templating in audit mode always considers destination compliant once it exists
    ([\#13664](https://www.rudder-project.org/redmine/issues/13664))

#### Packaging

  - Fixed: rudder-cf-execd and rudder-cf-serverd are not enabled nor running after a server install on debian 8
    ([\#13774](https://www.rudder-project.org/redmine/issues/13774))
  - Fixed: Rudder agent uninstall may fail to to systemd unit
    ([\#13762](https://www.rudder-project.org/redmine/issues/13762))
  - Fixed: can't upgrade debian package if /bin/systemd exist but sysv is used
    ([\#13174](https://www.rudder-project.org/redmine/issues/13174))
  - Fixed: rudder.conf is not removed from /etc/ld.so.conf.d
    ([\#12554](https://www.rudder-project.org/redmine/issues/12554))
  - Fixed: Fusioninventory error about unitialized value $FQDN
    ([\#13739](https://www.rudder-project.org/redmine/issues/13739))
  - Fixed:  Embedded openssl does not build on Ubuntu 15.10
    ([\#13712](https://www.rudder-project.org/redmine/issues/13712))
  - Fixed: "type: systemctl : not found" appears in rudder-agent installation logs
    ([\#13693](https://www.rudder-project.org/redmine/issues/13693))
  - Fixed: Script rudder-support-info is too chatty when looking for time (branch 5.0)
    ([\#13670](https://www.rudder-project.org/redmine/issues/13670))
  - Fixed: Rudder syslog port is reset after upgrade on Ubuntu (< 14) Servers
    ([\#12714](https://www.rudder-project.org/redmine/issues/12714))

#### Generic methods - Service Management

  - Fixed: Broken variable in "Service restart" method report
    ([\#13713](https://www.rudder-project.org/redmine/issues/13713))

#### Documentation

  - Fixed: Broken doc build
    ([\#13734](https://www.rudder-project.org/redmine/issues/13734))

#### System techniques

  - Fixed: Use embedded curl when available
    ([\#13687](https://www.rudder-project.org/redmine/issues/13687))

#### Performance and scalability

  - Fixed: LDAP IO error on generation with a lot of nodes
    ([\#13256](https://www.rudder-project.org/redmine/issues/13256))

#### Techniques

  - Fixed: Sharing files with "root" does not work
    ([\#10605](https://www.rudder-project.org/redmine/issues/10605))
  - Fixed: Add option for Zypper Patterns in Technique "Packages"
    ([\#13721](https://www.rudder-project.org/redmine/issues/13721))
  - Fixed: Add a bigger warning about full path in "Download a file" technique
    ([\#13647](https://www.rudder-project.org/redmine/issues/13647))
  - Fixed: Add a bigger warning about full path in "Download a file" technique
    ([\#13646](https://www.rudder-project.org/redmine/issues/13646))
  - Fixed: Fix some typo in "rudder server directive upgrade" help output
    ([\#13765](https://www.rudder-project.org/redmine/issues/13765))
  - Fixed: "directive-upgrade" rudder command does not work
    ([\#13681](https://www.rudder-project.org/redmine/issues/13681))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * tim c
 * Matthew Frost
 * Ilan COSTA
 * Jérémy HOCDÉ
 * Janos Mattyasovszky
 * Thomas CAILHE

This is a bug fix release in the 5.0 series and therefore all installations of 5.0.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="5.0.1" > </a> Rudder 5.0.1 (2018-10-19)

### Changes

#### Packaging

  - Embed dependencies on ubuntu 15
    ([\#13677](https://www.rudder-project.org/redmine/issues/13677))

#### Generic methods

  - Add a flag library
    ([\#13622](https://www.rudder-project.org/redmine/issues/13622))
  - Add a flag library
    ([\#13622](https://www.rudder-project.org/redmine/issues/13622))

#### Generic methods - Package Management

  - Add a package provider for zypper patterns
    ([\#12164](https://www.rudder-project.org/redmine/issues/12164))

### Bug fixes

#### Generic methods

  - Fixed: Allow to report on same reporting parameters 
    ([\#13632](https://www.rudder-project.org/redmine/issues/13632))
  - Fixed: style test nbsp_is_not_allowed.sh always fails
    ([\#13637](https://www.rudder-project.org/redmine/issues/13637))
  - Fixed: rudder agent log files content in user facility
    ([\#13175](https://www.rudder-project.org/redmine/issues/13175))
  - Fixed: 4.3+ version of 12164
    ([\#13621](https://www.rudder-project.org/redmine/issues/13621))
  - Fixed: still some typos in package tests
    ([\#13591](https://www.rudder-project.org/redmine/issues/13591))
  - Fixed: some ncf test are failing on SLES because they are trying to deal with packages that are not available
    ([\#13573](https://www.rudder-project.org/redmine/issues/13573))

#### Web - Nodes & inventories

  - Fixed: Node group with 'OR' multi criteria fails
    ([\#13649](https://www.rudder-project.org/redmine/issues/13649))

#### Web - Config management

  - Fixed: Change request must not be saved when no validation is needed
    ([\#13609](https://www.rudder-project.org/redmine/issues/13609))

#### Documentation

  - Fixed: rudder-doc embedeed doesn't work anymore
    ([\#13659](https://www.rudder-project.org/redmine/issues/13659))
  - Fixed: Document Amazon Linux compatibility
    ([\#13624](https://www.rudder-project.org/redmine/issues/13624))
  - Fixed: Add sles 15 in 5.0 supported OS
    ([\#13533](https://www.rudder-project.org/redmine/issues/13533))
  - Fixed: Bad explanation for generic variable overide priority cause people making the opposite of what is needed
    ([\#13615](https://www.rudder-project.org/redmine/issues/13615))

#### Technique editor - UI/UX

  - Fixed: Rename "bundle name" in the technique details
    ([\#12847](https://www.rudder-project.org/redmine/issues/12847))

#### Agent

  - Fixed: rudder server command states that "Warning: Long arguments are not supported, you probably tried to use one!" - but it does support it
    ([\#13505](https://www.rudder-project.org/redmine/issues/13505))

#### Packaging

  - Fixed: Ubuntu 13.04 package tries to use systemd
    ([\#13676](https://www.rudder-project.org/redmine/issues/13676))
  - Fixed: Debian package cannot build in 4.1 because of docs.rudder.io
    ([\#13594](https://www.rudder-project.org/redmine/issues/13594))
  - Fixed: cebtos7 install_package_existant should be skipped
    ([\#13596](https://www.rudder-project.org/redmine/issues/13596))

#### Security

  - Fixed: StackOverflowError during policy generation in JavascriptEngine - debian 9.5 with jdk 1.8.0_181
    ([\#13014](https://www.rudder-project.org/redmine/issues/13014))
  - Fixed: In Rudder 5.0, user password encoding is broken for some passwords. 
    ([\#13643](https://www.rudder-project.org/redmine/issues/13643))
  - Fixed: Api User Account doesn't have User role
    ([\#13629](https://www.rudder-project.org/redmine/issues/13629))
  - Fixed: file enforce content log file content which can have private info
    ([\#13608](https://www.rudder-project.org/redmine/issues/13608))

#### Performance and scalability

  - Fixed: Hikari pool autocomit configuration is incorrect, which can impact performance
    ([\#13582](https://www.rudder-project.org/redmine/issues/13582))
  - Fixed: Policy generation fails definitively when postgresql is shut down during policy generation
    ([\#13517](https://www.rudder-project.org/redmine/issues/13517))

#### Techniques

  - Fixed: SudoParameter technique version 3.2 returns a report that is not parsable by the CLI
    ([\#13350](https://www.rudder-project.org/redmine/issues/13350))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Jeremy CHAMPEL
 * tim c
 * Marco Kirchhoff

This is a bug fix release in the 5.0 series and therefore all installations of 5.0.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="5.0.0" > </a> Rudder 5.0.0 (2018-09-27)

### Changes

#### Packaging

  - Require Postgresql 9.2 for rudder server
    ([\#13545](https://www.rudder-project.org/redmine/issues/13545))
  - rename "support info" script to "debug info" script and change store debug info in a standard path
    ([\#13443](https://www.rudder-project.org/redmine/issues/13443))

#### Documentation

  - Rudder by example cleanup
    ([\#13452](https://www.rudder-project.org/redmine/issues/13452))
  - Add a rudder-by-example to replace line in a file
    ([\#13404](https://www.rudder-project.org/redmine/issues/13404))

### Bug fixes

#### Web - UI & UX

  - Fixed: Blue text color in node details tabs
    ([\#13168](https://www.rudder-project.org/redmine/issues/13168))
  - Fixed: fields are not correctly aligned in group page
    ([\#13417](https://www.rudder-project.org/redmine/issues/13417))
  - Fixed: Dual scrolling bars on the right of group details in Rudder 5
    ([\#13428](https://www.rudder-project.org/redmine/issues/13428))
  - Fixed: Tooltip on the source of property is not dislpayed in Rudder 5.0
    ([\#13456](https://www.rudder-project.org/redmine/issues/13456))
  - Fixed: JS error when loading Rules pages
    ([\#13469](https://www.rudder-project.org/redmine/issues/13469))
  - Fixed: In Rudder 5.0, Password fields in directive is empty
    ([\#13446](https://www.rudder-project.org/redmine/issues/13446))
  - Fixed: Rudder web login page shows 5 instead of 5.0 in the right bottom corner
    ([\#13472](https://www.rudder-project.org/redmine/issues/13472))

#### Generic methods

  - Fixed: Some old tests are failing on centos
    ([\#13535](https://www.rudder-project.org/redmine/issues/13535))
  - Fixed: there is still a trailing new line in the jinja result test file
    ([\#13529](https://www.rudder-project.org/redmine/issues/13529))
  - Fixed: variable_string and variable_string_default GM are failing in rudder 5.0
    ([\#13523](https://www.rudder-project.org/redmine/issues/13523))
  - Fixed: Some tests are failing on ubuntu distros
    ([\#13514](https://www.rudder-project.org/redmine/issues/13514))
  - Fixed: add a method to set reportiing_context from within a technique
    ([\#13351](https://www.rudder-project.org/redmine/issues/13351))

#### Generic methods - File Management

  - Fixed: Missing report on Permissions (non recursive)
    ([\#13536](https://www.rudder-project.org/redmine/issues/13536))

#### Documentation

  - Fixed: Update download link in documentation
    ([\#13534](https://www.rudder-project.org/redmine/issues/13534))
  - Fixed: Fix appearance of titles
    ([\#13502](https://www.rudder-project.org/redmine/issues/13502))

#### Packaging

  - Fixed: rudder-jetty cannot extract java version on sles15 
    ([\#13552](https://www.rudder-project.org/redmine/issues/13552))
  - Fixed: rudder-agent service is not removed when removing rudder-agent
    ([\#13549](https://www.rudder-project.org/redmine/issues/13549))
  - Fixed: add insserv-compat dependency on SLES15 packages
    ([\#13550](https://www.rudder-project.org/redmine/issues/13550))
  - Fixed: Use openjdk 10 on sles 15
    ([\#13543](https://www.rudder-project.org/redmine/issues/13543))
  - Fixed: Use new man page URL after doc URL redirect
    ([\#13537](https://www.rudder-project.org/redmine/issues/13537))
  - Fixed: Error at install of Rudder Server Root 5.0 on Sles 12 
    ([\#13527](https://www.rudder-project.org/redmine/issues/13527))
  - Fixed: rudder-agent 4.1 install hangs on Debian 7 
    ([\#13525](https://www.rudder-project.org/redmine/issues/13525))
  - Fixed: Doc download in webapp package does not work anymore
    ([\#13499](https://www.rudder-project.org/redmine/issues/13499))
  - Fixed: rudder server upgrade-techniques --autoupdate-technique-library fails when run during Rudder upgrade
    ([\#13458](https://www.rudder-project.org/redmine/issues/13458))

#### API

  - Fixed: Harmonize URLs of system API
    ([\#13471](https://www.rudder-project.org/redmine/issues/13471))

#### Techniques

  - Fixed: deprecate old version of techniques for Rudder 5.0
    ([\#13487](https://www.rudder-project.org/redmine/issues/13487))
  - Fixed: Package management technique fails to check if a package is absent in the "latest" version
    ([\#12939](https://www.rudder-project.org/redmine/issues/12939))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 5.0 series and therefore all installations of 5.0.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="5.0.0.rc1" > </a> Rudder 5.0.0.rc1 (2018-09-12)

### Changes

#### Architecture - Internal libs

  - We need to be able to decide what workflow to use based on the change request
    ([\#13396](https://www.rudder-project.org/redmine/issues/13396))

### Bug fixes

#### API

  - Fixed: POST/PUT/DELETE API requests gives 403
    ([\#13426](https://www.rudder-project.org/redmine/issues/13426))
  - Fixed: Rudder system api token only have RO access
    ([\#13416](https://www.rudder-project.org/redmine/issues/13416))

#### Generic methods

  - Fixed: " error: List or container parameter 'args' not found while constructing scope 'log_rudder' - use @(scope.variable) in calling reference"  when running Rudder 4.3
    ([\#13430](https://www.rudder-project.org/redmine/issues/13430))

#### Performance and scalability

  - Fixed: On error on nodecompliance SQL, logs are huge
    ([\#13427](https://www.rudder-project.org/redmine/issues/13427))

#### Architecture - Refactoring

  - Fixed: Git merge issue between Rudder 4.3 and Rudder 5.0
    ([\#13432](https://www.rudder-project.org/redmine/issues/13432))

#### Agent

  - Fixed: remove unessecary patch that remove truncation of line in inventory
    ([\#13403](https://www.rudder-project.org/redmine/issues/13403))
  - Fixed: Upgrade perl to latest minor version in 5.0 for fusion inventory
    ([\#13402](https://www.rudder-project.org/redmine/issues/13402))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 5.0 series and therefore all installations of 5.0.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="5.0.0.beta2" > </a> Rudder 5.0.0.beta2 (2018-09-06)

### Changes

#### Packaging

  - Remove rudder agent thin in 5.0
    ([\#13377](https://www.rudder-project.org/redmine/issues/13377))
  - Upgrade python related dependencies
    ([\#13371](https://www.rudder-project.org/redmine/issues/13371))
  - Remove apache 2.2 support
    ([\#13325](https://www.rudder-project.org/redmine/issues/13325))
  - keep only systemd on server packages
    ([\#13320](https://www.rudder-project.org/redmine/issues/13320))
  - Upgrade jetty to 9.4.11
    ([\#13323](https://www.rudder-project.org/redmine/issues/13323))
  - Remove support for old system on rudder server builds
    ([\#13315](https://www.rudder-project.org/redmine/issues/13315))
  - Update agent dependencies
    ([\#13314](https://www.rudder-project.org/redmine/issues/13314))
  - Upgrade openssl
    ([\#13316](https://www.rudder-project.org/redmine/issues/13316))
  - Upgrade python related dependencies
    ([\#13373](https://www.rudder-project.org/redmine/issues/13373))

#### Web - UI & UX

  - Update main menu: plugin at top level, techique editor in configuration policy
    ([\#13067](https://www.rudder-project.org/redmine/issues/13067))

#### Documentation

  - Use repository.rudder.io in 5.0 doc
    ([\#13382](https://www.rudder-project.org/redmine/issues/13382))

#### Plugins integration

  - Make user/role management a plugin
    ([\#13030](https://www.rudder-project.org/redmine/issues/13030))

#### Architecture - Dependencies

  - Update all rudder dependencies
    ([\#13313](https://www.rudder-project.org/redmine/issues/13313))

### Bug fixes

#### Web - UI & UX

  - Fixed: Fonts changed in Rudder 5.0
    ([\#13364](https://www.rudder-project.org/redmine/issues/13364))
  - Fixed: Save button in group page is not readable in Rudder 5.0
    ([\#13368](https://www.rudder-project.org/redmine/issues/13368))
  - Fixed: In directives pages, Text selector and input field are not correctly allligned in Rudder 5.0
    ([\#13372](https://www.rudder-project.org/redmine/issues/13372))
  - Fixed: Clicking on Status/Details leads to a disabled screen in Rudder 5.0
    ([\#13362](https://www.rudder-project.org/redmine/issues/13362))

#### Generic methods

  - Fixed: user_primary_group tests are failing on suse
    ([\#13282](https://www.rudder-project.org/redmine/issues/13282))
  - Fixed: Some ncf tests are too old and fails on many distributions
    ([\#13249](https://www.rudder-project.org/redmine/issues/13249))

#### Architecture - Internal libs

  - Fixed: Spring Security error - leading to random unlogging in Rudder 5
    ([\#13365](https://www.rudder-project.org/redmine/issues/13365))

#### Technique editor - API

  - Fixed: Error message is not correctly treated when an exception occurs in when authenticating to Rudder authentication API
    ([\#13219](https://www.rudder-project.org/redmine/issues/13219))

#### Packaging

  - Fixed: libxml 2.9.8 doesn't compile on aix
    ([\#13363](https://www.rudder-project.org/redmine/issues/13363))
  - Fixed: libxml fails to build with old compiler
    ([\#13337](https://www.rudder-project.org/redmine/issues/13337))
  - Fixed: Use correct version when building Slackware packages
    ([\#13329](https://www.rudder-project.org/redmine/issues/13329))
  - Fixed: Use https everywhere to download server sources
    ([\#13324](https://www.rudder-project.org/redmine/issues/13324))
  - Fixed: parallel build on rpmbuild hides build error
    ([\#13300](https://www.rudder-project.org/redmine/issues/13300))

#### Generic methods - Service Management

  - Fixed: Service test do not use any service to test on suse
    ([\#13278](https://www.rudder-project.org/redmine/issues/13278))
  - Fixed: 4.3+ version of 13278
    ([\#13279](https://www.rudder-project.org/redmine/issues/13279))
  - Fixed:  services GM are not working anymore due to typo
    ([\#13258](https://www.rudder-project.org/redmine/issues/13258))

#### Security

  - Fixed: "//" in rudder-web/secure/api//settings/global_policy_mode cause browser/spring error
    ([\#13356](https://www.rudder-project.org/redmine/issues/13356))
  - Fixed: Bad mime type for our js files: application/js
    ([\#13334](https://www.rudder-project.org/redmine/issues/13334))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 5.0 series and therefore all installations of 5.0.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="5.0.0.beta1" > </a> Rudder 5.0.0.beta1 (2018-08-29)

### Changes

#### API

  - Create system Rest API to replace V1 API
    ([\#12516](https://www.rudder-project.org/redmine/issues/12516))

#### Generic methods

  - Add a generic method to test variable existence
    ([\#12986](https://www.rudder-project.org/redmine/issues/12986))

#### Plugins integration

  - Remove the need for Spring in plugin
    ([\#13036](https://www.rudder-project.org/redmine/issues/13036))

#### Documentation

  - Change version of documentation on rudder-doc
    ([\#13019](https://www.rudder-project.org/redmine/issues/13019))
  - Build a centralized place for doc: docs.rudder.io
    ([\#12907](https://www.rudder-project.org/redmine/issues/12907))
  - Use a rudder-specific theme
    ([\#12875](https://www.rudder-project.org/redmine/issues/12875))
  - Add DSC content to Rudder by example
    ([\#12584](https://www.rudder-project.org/redmine/issues/12584))
  - Add a "Rudder by example" guide to the documentation
    ([\#12383](https://www.rudder-project.org/redmine/issues/12383))

#### Technique editor - API

  - Remove expected reports.csv logic
    ([\#11915](https://www.rudder-project.org/redmine/issues/11915))

#### Agent

  - Use CFEngine 3.12 in Rudder agent
    ([\#12856](https://www.rudder-project.org/redmine/issues/12856))
  - Add a package techniques migration script
    ([\#12710](https://www.rudder-project.org/redmine/issues/12710))
  - Update technique migration technique with 12614 review
    ([\#12676](https://www.rudder-project.org/redmine/issues/12676))

#### Packaging

  - Add sles 15 support to rudder-packages
    ([\#13295](https://www.rudder-project.org/redmine/issues/13295))
  - Disable HTTPs for sources download on old OSes
    ([\#13197](https://www.rudder-project.org/redmine/issues/13197))
  - Download sources from repository.rudder.io instead of www.normation.com
    ([\#13172](https://www.rudder-project.org/redmine/issues/13172))
  - Download man on docs.rudder.io
    ([\#13170](https://www.rudder-project.org/redmine/issues/13170))

#### Generic methods - Service Management

  - Remove unused _service_check_running_smf and _service_check_running_src in branch 5.0
    ([\#13245](https://www.rudder-project.org/redmine/issues/13245))

#### System integration

  - Bundle support info script into Rudder
    ([\#13213](https://www.rudder-project.org/redmine/issues/13213))

#### Architecture - Refactoring

  - Make scale-out (relay) server a plugin
    ([\#12885](https://www.rudder-project.org/redmine/issues/12885))
  - Make third-party authentication a plugin
    ([\#12906](https://www.rudder-project.org/redmine/issues/12906))
  - Make validation workflow a plugin
    ([\#12904](https://www.rudder-project.org/redmine/issues/12904))

#### Generic methods - Package Management

  - Use the new class_prefix for package methods
    ([\#12427](https://www.rudder-project.org/redmine/issues/12427))

### Bug fixes

#### Web - UI & UX

  - Fixed: Remove the "tw-bs" css hack
    ([\#13022](https://www.rudder-project.org/redmine/issues/13022))

#### Generic methods

  - Fixed: Incomplete management of disabled/reenable reporting
    ([\#13209](https://www.rudder-project.org/redmine/issues/13209))
  - Fixed: file_check_special tests are failing on debian
    ([\#13243](https://www.rudder-project.org/redmine/issues/13243))
  - Fixed: Huge agent logs when we define an new class_prefix that is longer than 1024 chars
    ([\#13155](https://www.rudder-project.org/redmine/issues/13155))

#### Plugins integration

  - Fixed: Missing real-time check of license capabilities for api and others plugins
    ([\#13073](https://www.rudder-project.org/redmine/issues/13073))

#### Generic methods - File Management

  - Fixed: Error when using 2 or more File from a jinja2 template
    ([\#13183](https://www.rudder-project.org/redmine/issues/13183))

#### Documentation

  - Fixed: Wrong version displayed on the login page for plugin branding
    ([\#13274](https://www.rudder-project.org/redmine/issues/13274))
  - Fixed: Update screenshot for Rudder Branding
    ([\#13270](https://www.rudder-project.org/redmine/issues/13270))
  - Fixed: Typos in rudder-by-example
    ([\#12611](https://www.rudder-project.org/redmine/issues/12611))
  - Fixed: Add a favicon for Rudder by example
    ([\#12490](https://www.rudder-project.org/redmine/issues/12490))
  - Fixed: Build rudder man page using asciidoctor
    ([\#12977](https://www.rudder-project.org/redmine/issues/12977))

#### Miscellaneous

  - Fixed: Removing workflow comet leads to missing user information and session is destroyed
    ([\#13026](https://www.rudder-project.org/redmine/issues/13026))

#### Agent

  - Fixed: Broken agent build on linux platforms
    ([\#13311](https://www.rudder-project.org/redmine/issues/13311))
  - Fixed: rudder technique-migrate is not documented nor properly named
    ([\#13146](https://www.rudder-project.org/redmine/issues/13146))

#### Packaging

  - Fixed: Purge of rudder-webapp should not fail
    ([\#13210](https://www.rudder-project.org/redmine/issues/13210))
  - Fixed: Fix bdb download link from repository.rudder.io
    ([\#13198](https://www.rudder-project.org/redmine/issues/13198))
  - Fixed: slackware should not build its package into /tmp
    ([\#13194](https://www.rudder-project.org/redmine/issues/13194))
  - Fixed: Download rudder.8 for new man page url
    ([\#12982](https://www.rudder-project.org/redmine/issues/12982))
  - Fixed: Add back missing migration script in 5.0
    ([\#13084](https://www.rudder-project.org/redmine/issues/13084))
  - Fixed: Makefile fails if a symbolink link /usr/bin/ncf already exists
    ([\#13277](https://www.rudder-project.org/redmine/issues/13277))

#### Generic methods - Service Management

  - Fixed: service_started_start.cf test fails on redhat
    ([\#13257](https://www.rudder-project.org/redmine/issues/13257))
  - Fixed: service_started_path.cf does not generate classes anymore since 13220
    ([\#13254](https://www.rudder-project.org/redmine/issues/13254))

#### API

  - Fixed: Compilation warnings in master
    ([\#13028](https://www.rudder-project.org/redmine/issues/13028))

#### Generic methods - Package Management

  - Fixed: old packages generic methods are failing on old debian
    ([\#13305](https://www.rudder-project.org/redmine/issues/13305))

#### Techniques

  - Fixed: Package repository keys Technique in Audit Mode : Missing Reports
    ([\#13065](https://www.rudder-project.org/redmine/issues/13065))
  - Fixed: Package repository keys Technique in Audit Mode : Missing Reports
    ([\#13065](https://www.rudder-project.org/redmine/issues/13065))
  - Fixed: Rudder SNMP technique has a component failing on first run
    ([\#13159](https://www.rudder-project.org/redmine/issues/13159))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Mikaël Mantel
 * Pierre HAY
 * Guillaume Terrier

This software is in beta status and contains several new features but we have tested it and believe it to be free of any critical bugs.
The use on production systems is not encouraged at this time and is at your own risk. However, we do encourage testing, and welcome all and any feedback!
