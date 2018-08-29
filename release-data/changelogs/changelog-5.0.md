
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

  - Rudder server and Rudder relay: **Debian 8, Debian 9, RHEL/CentOS 6, RHEL/CentOS 7
    (64 bits), SLES 11, SLES 12, Ubuntu 14.04, Ubuntu 16.04**
  - Rudder agent: all of the above plus **Debian 5, Debian 6, Debian 7
    RHEL/CentOS 3, RHEL/CentOS 5, CentOS 7 (32 bits), SLES
    10, SLES 12, Ubuntu 10.04, Ubuntu 12.04, Ubuntu 18.04**
  - Rudder agent (binary packages available from
    ([Normation](http://www.normation.com)): **Windows Server 2008R2-2016,
    AIX 5-6-7**

# Changelogs
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

This is a bug fix release in the 5.0 series and therefore all installations of 5.0.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

