# Change logs for Rudder 4.1.\* versions

Rudder 4.1 is currently the beta version of Rudder.

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Main new features in Rudder 4.1:**

  - Add a Relay API:  share files between nodes, launch run on remote run behind relay
  - Import automatically properties to Nodes using http data sources
  - Organize Rules and Directives with tags
  - Implement notifications for different server-side actions and events (hooks)
  - Upgrade CFEngine to 3.10 in Rudder agent 
  - Store node compliance in database
  - Small improvements on UI (properties display, titles, harmonize some form ...)

**Installing, upgrading and testing**

  - Install docs:
    https://www.rudder-project.org/doc-4.1/_install_rudder_server.html
  - Upgrade docs:
    https://www.rudder-project.org/doc-4.1/_upgrade_rudder.html
  - Download links: https://www.rudder-project.org/site/get-rudder/downloads/

We also recommend using the [Rudder
Vagrant](https://github.com/Normation/rudder-vagrant) config if you want
a quick and easy way to get an installation for testing.

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server and Rudder relay: **Debian 7, Debian 8, RHEL/CentOS 6, RHEL/CentOS 7
    (64 bits), SLES 11, SLES 12, Ubuntu 14.04, Ubuntu 16.04**
  - Rudder agent: all of the above plus **Debian 5, Debian 6,
    RHEL/CentOS 3, RHEL/CentOS 5, CentOS 7 (32 bits), Fedora 18, SLES
    10, SLES 12, Ubuntu 10.04, Ubuntu 12.04, Ubuntu 12.10**
  - Rudder agent (binary packages available from
    ([Normation](http://www.normation.com)): **Windows Server 2008-2012,
    AIX 5-6-7**

**Note**: As of Rudder 4.1, the rudder-agent-thin and rudder-server-relay packges are
no longer available in Debian 5, Debian 6, Ubuntu 10.04, Ubuntu 12.10, Fedora 18, 
RHEL/CentOS 3 and RHEL/CentOS 5


## Rudder 4.1.0~beta1 (2017-01-17)

### Changes

#### Web - Config management

  - Add tags in Directive/Rules ([\#9733](http://www.rudder-project.org/redmine/issues/9733))
  - Import node properties from external data sources ([\#9698](http://www.rudder-project.org/redmine/issues/9698))

#### API

  - Add a Relay API:  share files between nodes, launch run on remote run behind relay ([\#9707](http://www.rudder-project.org/redmine/issues/9707))

#### Server components

  - Implement notifications for different server-side actions and events (hooks) ([\#8353](http://www.rudder-project.org/redmine/issues/8353))

#### Web - UI & UX

  - Improve Json display in the Nodes properties tab ([\#9984](http://www.rudder-project.org/redmine/issues/9984))

#### Packaging

  - ncf-api-venv user should not have access to a shell ([\#9993](http://www.rudder-project.org/redmine/issues/9993))
  - Build slapd with lmdb ([\#9839](http://www.rudder-project.org/redmine/issues/9839))
  - Upgrade CFEngine in Rudder agent to 3.10 ([\#9737](http://www.rudder-project.org/redmine/issues/9737))

#### System integration

  - Do not create a temporary cron a postinstall ([\#9860](http://www.rudder-project.org/redmine/issues/9860))

#### Architecture - Refactoring

  - Store node compliance in database ([\#9645](http://www.rudder-project.org/redmine/issues/9645))

#### Architecture - Internal libs

  - Change pom version on master to 4.1 ([\#9686](http://www.rudder-project.org/redmine/issues/9686))

#### Documentation

  - Prepare manual for 4.1 ([\#9887](http://www.rudder-project.org/redmine/issues/9887))
  - Change doc title for 4.1 ([\#9753](http://www.rudder-project.org/redmine/issues/9753))

### Bug fixes

#### Web - UI & UX

  - Fixed: Put in bold rule form's required fields label ([\#9949](http://www.rudder-project.org/redmine/issues/9949))
  - Fixed: Nothing happens when trying to save a Directive ([\#9948](http://www.rudder-project.org/redmine/issues/9948))
  - Fixed: Put in bold "Technique version" label ([\#9935](http://www.rudder-project.org/redmine/issues/9935))

#### Packaging

  - Fixed: build-caching doesn't work ([\#9921](http://www.rudder-project.org/redmine/issues/9921))
  - Fixed: virtualenv doesn't work in the build environment ([\#9824](http://www.rudder-project.org/redmine/issues/9824))

#### Initial promises & sys tech

  - Fixed: FusionInventory --scan-homedirs should not be on by default ([\#7421](http://www.rudder-project.org/redmine/issues/7421))

#### Documentation

  - Fixed: We should disable link tests for the manual on master  ([\#9803](http://www.rudder-project.org/redmine/issues/9803))

#### Web - Config management

  - Fixed: Rule details text can be misleading ([\#6143](http://www.rudder-project.org/redmine/issues/6143))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Florial Heigl 
  - Janos Mattyasovszky

This software is in beta status and contains several new features but we
have tested it and believe it to be free of any critical bugs.¬The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!

