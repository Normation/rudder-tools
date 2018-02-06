
# General information

Rudder 4.3 is currently under development..

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Main new features in Rudder 4.3:**

  - **Technique Parameters:** You can now add parameters to your Techniques created with the technique editor. The value of theses parameters will be set in Directives, making your techniques much more versatile and expressive and them access to feature that were only available to classic techniques.
  - **Multi version/mode Directives:** You can now apply Directives with different versions and diffrent policy mode. This allow easy migration (to a new version, from Audit to Enforce) that was previously impossible.
  - **Autorization system for API accounts:** Choose between read-only or full access. Finely grained authorisation will go in a plugin.
  - **Node properties from inventory:** Nodes properties can be automatically provided by the inventory made on the node.
  - Complete IPv6 support by default.
  - **Node lifecycle:** You can define a state for each Node managed by Rudder (provisionning, pending removal, disabled etc.). This can be used to build groups and apply configuration according to the Node current state. Also disabled Nodes are not counted in compliance reports, so you are not bothered by offline Nodes when checking compliance.
  - **Group based on Groups**: You can now define that a Group should contain the Nodes of another Group, making it easier to manage a complex set of Nodes.
  - **Hooks on techniques:** You can add pre- and post- hooks in your techniques that will be executed once per technique, even if you applied it in several directives. Another tool in your hands when you wrtie your own techniques.
  - **Use system Perl:** On recent systems, rudder-agent does not embed Perl anymore, so it uses an up to date version of Perl more integrated to your system. On a side note, it makes easier to build a rudder-agent package (which size goes down from 12Mb to 4Mb!).
  - **Rudder agent services based on systemd:** On systemd based os, we switched from SysV init system to systemd, to make rudder-agent more integrated to your system.
  - **Time all action made by the agent:** A new option (-T) added to "rudder agent" command line, to display how long an action took and find what makes a run slow.
  - **Renaming of all generic methods:** We changed for a clearer and more logic name scheme in all our generic methods in the technique editor. 
  - **Simplified logger for techniques:** We changed the way we do reporting for techniques from technique editor with a really simpler way, which should be faster and also fix some reporting issues (ie: when you use variables in your reports).
  - **Plenty of library updates / cleaning / architechture changes**: Either on web app or in rudder-agent we upgraded some dependencies, refactor some code, to provide you a more secure, maintenable and faster Rudder.

**Installing, upgrading and testing**

  - Install docs:
    https://www.rudder-project.org/doc-4.3/_installation.html
  - Upgrade docs:
    https://www.rudder-project.org/doc-4.3/_upgrade_rudder.html
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
    10, SLES 12, Ubuntu 10.04, Ubuntu 12.04**
  - Rudder agent (binary packages available from
    ([Normation](http://www.normation.com)): **Windows Server 2008R2-2016,
    AIX 5-6-7**

**Note**: As of Rudder 4.3, the rudder agent packages are no longer available on Fedora 18
and Ubuntu 12.10.

# Changelogs

## <a name="4.3.0.beta1" > </a> Rudder 4.3.0.beta1 (2018-02-05)

### Changes

#### Technique editor - UI/UX

  - Change max field length from 2k to 16k
    ([\#11859](https://www.rudder-project.org/redmine/issues/11859))

#### Web - UI & UX

  - add margin to the magnifying glass icon in the Nodes table
    ([\#11849](https://www.rudder-project.org/redmine/issues/11849))

#### Technique editor - API

  - Use a fixed size font in the technique editor parameters
    ([\#11895](https://www.rudder-project.org/redmine/issues/11895))
  - no reporting if value to report contains a variable
    ([\#11913](https://www.rudder-project.org/redmine/issues/11913))
  - Add support to parameters in ncf techniques written with ncf builder
    ([\#5673](https://www.rudder-project.org/redmine/issues/5673))

#### Web - Nodes & inventories

  - Be able to create a groups containing Nodes list from an other group
    ([\#6982](https://www.rudder-project.org/redmine/issues/6982))
  - Remove the skipidentify variable and settings page entry
    ([\#10719](https://www.rudder-project.org/redmine/issues/10719))
  - Node lifecycle: add a node state
    ([\#11748](https://www.rudder-project.org/redmine/issues/11748))

#### Web - Config management

  - Add common pre- and post- agent run action triggered by technique logic
    ([\#11858](https://www.rudder-project.org/redmine/issues/11858))
  - Don't merge directive from same technique on generation
    ([\#10625](https://www.rudder-project.org/redmine/issues/10625))

#### Generic methods - File Management

  - Use built-in function and remove dumpdatastate usage in ncf
    ([\#11816](https://www.rudder-project.org/redmine/issues/11816))

#### Documentation

  - Update doc for 4.3
    ([\#12049](https://www.rudder-project.org/redmine/issues/12049))

#### Generic methods

  - Add a method to unset all the classes of a prefix
    ([\#11903](https://www.rudder-project.org/redmine/issues/11903))
  - Implement a push / pop mechanism for audit mode
    ([\#11732](https://www.rudder-project.org/redmine/issues/11732))
  - Standardize generic methods name
    ([\#11812](https://www.rudder-project.org/redmine/issues/11812))
  - Synchronize stdlib from masterfiles
    ([\#11716](https://www.rudder-project.org/redmine/issues/11716))

#### Agent

  - Use system Perl instead of embedding into rudder-agent if possible
    ([\#11741](https://www.rudder-project.org/redmine/issues/11741))
  - Remove multiline output option from "rudder agent" command
    ([\#11897](https://www.rudder-project.org/redmine/issues/11897))
  - Add an option to add timing information to the agent run
    ([\#9163](https://www.rudder-project.org/redmine/issues/9163))
  - Only rudder version needs to be displayed in "rudder agent info"
    ([\#10706](https://www.rudder-project.org/redmine/issues/10706))
  - Cleanup agent check
    ([\#11723](https://www.rudder-project.org/redmine/issues/11723))

#### Packaging

  - Upgrade openssl to 1.0.2n
    ([\#11967](https://www.rudder-project.org/redmine/issues/11967))
  - Replace rudder-agent init script by systemd units on compatible OSes
    ([\#11684](https://www.rudder-project.org/redmine/issues/11684))
  - Automatically package fusion dependencies
    ([\#11855](https://www.rudder-project.org/redmine/issues/11855))
  - Add a subjectaltname to server certificate
    ([\#11790](https://www.rudder-project.org/redmine/issues/11790))
  - Add a curl dependency in the agent
    ([\#11752](https://www.rudder-project.org/redmine/issues/11752))
  - Add checksum verification of the agent sources
    ([\#11742](https://www.rudder-project.org/redmine/issues/11742))
  - Upgrade lmdb to 0.9.21 in the agent
    ([\#11736](https://www.rudder-project.org/redmine/issues/11736))
  - Upgrade openldap to 2.4.45
    ([\#11733](https://www.rudder-project.org/redmine/issues/11733))
  - Upgrade to Jetty9
    ([\#11647](https://www.rudder-project.org/redmine/issues/11647))
  - Create a rudder server upgrade-techniques commands
    ([\#11059](https://www.rudder-project.org/redmine/issues/11059))

#### Initial promises & sys tech

  - Remove old package promises from system techniques
    ([\#11717](https://www.rudder-project.org/redmine/issues/11717))

#### API

  - Readonly API or otherwise restrictable API Accounts
    ([\#5627](https://www.rudder-project.org/redmine/issues/5627))

#### Architecture - Refactoring

  - Remove most scala compilation warning
    ([\#11955](https://www.rudder-project.org/redmine/issues/11955))
  - Use scheduledJob logger for scheduledJob
    ([\#11800](https://www.rudder-project.org/redmine/issues/11800))
  - Clean-up trivial warnings
    ([\#11786](https://www.rudder-project.org/redmine/issues/11786))
  - Move all API v1 into their own package
    ([\#11760](https://www.rudder-project.org/redmine/issues/11760))
  - Remove dead code in AuthorizationType
    ([\#11756](https://www.rudder-project.org/redmine/issues/11756))
  - Remove remaining use of spring-jdbc
    ([\#11667](https://www.rudder-project.org/redmine/issues/11667))
  - Extract Rest API from Rudder-web project into a new Scala project
    ([\#11677](https://www.rudder-project.org/redmine/issues/11677))
  - Switch to cats ecosystem
    ([\#11763](https://www.rudder-project.org/redmine/issues/11763))
  - Autumn cleaning before 4.3 (parent-pom)
    ([\#11637](https://www.rudder-project.org/redmine/issues/11637))

#### Techniques

  - Add multiversion support to some Techniques 
    ([\#11687](https://www.rudder-project.org/redmine/issues/11687))

### Bug fixes

#### Web - UI & UX

  - Fixed: Javascript error on every pages, preventing usage of file explorer
    ([\#11991](https://www.rudder-project.org/redmine/issues/11991))
  - Fixed: Directives tree is not filtered after saving changes
    ([\#11670](https://www.rudder-project.org/redmine/issues/11670))
  - Fixed: Input text for repository in apt repository management is too small
    ([\#11841](https://www.rudder-project.org/redmine/issues/11841))
  - Fixed: "Agent policy mode" should be "Node policy mode" 
    ([\#11837](https://www.rudder-project.org/redmine/issues/11837))

#### Technique editor - API

  - Fixed: If change message is mandatory, we cannot update technique with technique editor
    ([\#12008](https://www.rudder-project.org/redmine/issues/12008))
  - Fixed: Saving a technique in the technique editor in IE11 fails
    ([\#11894](https://www.rudder-project.org/redmine/issues/11894))

#### Web - Config management

  - Fixed: Audit mode flag is not correctly set on DSC Techniques
    ([\#10974](https://www.rudder-project.org/redmine/issues/10974))
  - Fixed: Unhelpful error message when applying a tehcnique with invalid agent type to a node
    ([\#10969](https://www.rudder-project.org/redmine/issues/10969))

#### Technique editor - Techniques

  - Fixed: rudder_reporting file is invalid on nodes if it contains '&&' in one of its parameter
    ([\#11870](https://www.rudder-project.org/redmine/issues/11870))

#### Generic methods - Package Management

  - Fixed: Wrong detection of package provider on debian for package_* method
    ([\#11999](https://www.rudder-project.org/redmine/issues/11999))
  - Fixed: Zypper hangs on dialogs / issues due to open tty
    ([\#6291](https://www.rudder-project.org/redmine/issues/6291))

#### Web - Technique editor

  - Fixed: Set flag to reload ncf technique through Rudder during update
    ([\#12005](https://www.rudder-project.org/redmine/issues/12005))

#### Web - Nodes & inventories

  - Fixed: When a network interface is deleted from a node, it is not removed on the Rudder server
    ([\#12026](https://www.rudder-project.org/redmine/issues/12026))
  - Fixed: Incorrect detection of architecture on Ubuntu 14.04 32 bits
    ([\#11918](https://www.rudder-project.org/redmine/issues/11918))

#### Documentation

  - Fixed: Missing documentation about InputTCPMaxSessions and when to change its value in rsyslog
    ([\#8613](https://www.rudder-project.org/redmine/issues/8613))
  - Fixed: Merge "Migration" and "Server migration" subsections in the doc
    ([\#11062](https://www.rudder-project.org/redmine/issues/11062))
  - Fixed: Restore backup documentation is not correct
    ([\#11177](https://www.rudder-project.org/redmine/issues/11177))
  - Fixed: Redirect FAQ to faq.rudder-project.org
    ([\#11905](https://www.rudder-project.org/redmine/issues/11905))

#### Generic methods

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

#### Agent

  - Fixed: Autocompletion for rudder commands doesn't work on RHEL and SLES
    ([\#11885](https://www.rudder-project.org/redmine/issues/11885))
  - Fixed: Errors are not diplayed when running agent without -i
    ([\#9181](https://www.rudder-project.org/redmine/issues/9181))
  - Fixed: The agent moves obstructions regardless of policy mode
    ([\#11866](https://www.rudder-project.org/redmine/issues/11866))
  - Fixed: When rudder agent disable fails it prints a success message
    ([\#11936](https://www.rudder-project.org/redmine/issues/11936))
  - Fixed: Agent process detection is wrong in rudder agent check on AIX
    ([\#11921](https://www.rudder-project.org/redmine/issues/11921))

#### Packaging

  - Fixed: rudder-pkg 4.3 belives it is rudder 4.2
    ([\#12074](https://www.rudder-project.org/redmine/issues/12074))
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
  - Fixed: Remove old migration scripts
    ([\#11743](https://www.rudder-project.org/redmine/issues/11743))

#### Initial promises & sys tech

  - Fixed: Rudder server installation fails if apache cannot resolve server hostname
    ([\#11983](https://www.rudder-project.org/redmine/issues/11983))
  - Fixed: Use rudder agent check in aix crontab
    ([\#11920](https://www.rudder-project.org/redmine/issues/11920))
  - Fixed: Inventory from a node on Xen dom0 is missing UUID and is invalid
    ([\#11902](https://www.rudder-project.org/redmine/issues/11902))
  - Fixed: remote execution is cut at 30 secondes
    ([\#11416](https://www.rudder-project.org/redmine/issues/11416))

#### System integration

  - Fixed: Configuration file of Rudder mention that we may change "LDAP DIT configuration", which is wrong
    ([\#10664](https://www.rudder-project.org/redmine/issues/10664))

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

#### Architecture - Refactoring

  - Fixed: Remove scripts folder from rudder repo
    ([\#12047](https://www.rudder-project.org/redmine/issues/12047))

#### Server components

  - Fixed: There is a /var/cfengine/inputs on a Rudder server
    ([\#8625](https://www.rudder-project.org/redmine/issues/8625))

#### Techniques

  - Fixed: The technique file copy from shared folder reports file source instead of file destination
    ([\#6564](https://www.rudder-project.org/redmine/issues/6564))
  - Fixed: Group management technique silently changes the group gid
    ([\#11863](https://www.rudder-project.org/redmine/issues/11863))
  - Fixed: Typo in services technique preventing persisting post-hook
    ([\#11861](https://www.rudder-project.org/redmine/issues/11861))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Janos Mattyasovszky
 * Florian Heigl
 * Dennis Cabooter

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

