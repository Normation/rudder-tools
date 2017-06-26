
# Change logs for Rudder 4.2.\* versions

Rudder 4.2 is currently the developement version of Rudder.
You can test it using development builds, but not use it in production.

**Main new features in Rudder 4.2:**

**Installing, upgrading and testing**

  - Install docs:
    https://www.rudder-project.org/doc-4.2/_install_rudder_server.html
  - Upgrade docs:
    https://www.rudder-project.org/doc-4.2/_upgrade_rudder.html
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
    ([Normation](http://www.normation.com)): **Windows Server 2008R2-2016,
    AIX 5-6-7**

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

### Release notes

This software is in beta status and has several known bugs
(particularly [\#11027](https://www.rudder-project.org/redmine/issues/11027) and [\#10961](https://www.rudder-project.org/redmine/issues/10961)).
You should hence not use it in production.
However, we do encourage testing, and welcome all and any
feedback\!
