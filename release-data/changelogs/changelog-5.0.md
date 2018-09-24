
# General information

Rudder 5.0 is currently the developement version of Rudder.

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Installing, upgrading and testing**

  - Install docs:
    https://www.rudder-project.org/doc-5.0/_installation.html
  - Upgrade docs:
    https://www.rudder-project.org/doc-5.0/_upgrade_rudder.html
  - Download links: https://www.rudder-project.org/site/get-rudder/downloads/

We also recommend using the [Rudder
Vagrant](https://github.com/Normation/rudder-vagrant) config if you want
a quick and easy way to get an installation for testing.

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server and Rudder relay: **Debian 8-9, RHEL/CentOS 7
    (64 bits), SLES 12-15, Ubuntu 16.04-18.04**
  - Rudder agent: all of the above plus **Debian 5, Debian 6, Debian 7
    RHEL/CentOS 3-5-6-7(32 bits), SLES 10-11, Ubuntu 10.04-12.04-14.04**
  - Rudder agent (binary packages available from
    ([Normation](http://www.normation.com)): **Windows Server 2008R2-2016,
    AIX 5-6-7, Slackware 14**

# Changelogs

## <a name="5.0.0" > </a> Rudder 5.0.0 (2018-09-24)

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
