
# General information

Rudder 4.3 is the next version of Rudder and is currently in release candidate phase.

During this phase we are ensuring that Rudder 4.3 is ready to go to production by checking all features of Rudder (both new and legacy features) and that migration process from older versions to be smooth and easy.

We expect a final version of Rudder 4.3 to be released a few weeks after first rc.

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Main new features in Rudder 4.3:**

  - **Technique Parameters:** You can now add parameters to your Techniques created with the Technique editor. The value of theses parameters will be set in Directives, making your Techniques much more versatile and expressive and them access to feature that were only available to classic Techniques.
  - **Multi version/mode Directives:** You can now apply Directives with different versions and different policy mode. This allow easy migration (to a new version, from Audit to Enforce) that was previously impossible.
  - **Authorization system for API accounts:** Choose between read-only or full access. A plugin will be available soon in order to allow you more finely grained authorization.
  - **Node properties from inventory:** Nodes properties can be automatically provided by the inventory data from the node.
  - **Node lifecycle:** You can define a state for each Node managed by Rudder (provisioning, pending removal, disabled etc.). This can be used to build groups and apply configuration according to the Node current state. Also disabled Nodes are not counted in compliance reports, so you are not bothered by offline Nodes when checking compliance.
  - **Group based on Groups**: You can now define that a Group should contain the Nodes of another Group, making it easier to manage a complex set of Nodes.
  - **IPv6 support by default:** Rudder is now completely compatible with IPv6 on the agent side as well as server side.
  - **Hooks on Techniques:** You can add pre- and post- hooks in your Techniques that will be executed once per Technique, even if you applied it in several directives. Another tool in your hands when you write your own Techniques.
  - **Use system Perl:** On recent systems, rudder-agent does not embed Perl anymore, so it uses an up to date version of Perl more integrated to your system. On a side note, it makes easier to build a rudder-agent package (which size goes down from 12Mb to 4Mb!).
  - **Rudder agent services based on systemd:** On systemd based os, we switched from SysV init system to systemd, to make rudder-agent more integrated to your system.
  - **Time all action made by the agent:** A new option (-T) added to "rudder agent" command line, to display how long an action took and find what makes a run slow.
  - **Renaming of all generic methods:** We changed for a clearer and more logic name scheme in all our generic methods in the Technique editor. 
  - **Simplified logger for Techniques:** We changed the way we do reporting for Techniques from Technique editor with a really simpler way, which should be faster and also fix some reporting issues (ie: when you use variables in your reports).
  - **Plenty of library updates / cleaning / architecture changes**: Either on web app or in rudder-agent we upgraded some dependencies, refactored some code, to provide you a more secure, maintainable and faster Rudder.

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

## <a name="4.3.0.rc2" > </a> Rudder 4.3.0.rc2 (2018-04-03)

### Changes

#### Technique editor - UI/UX

  - Rename class to condition in the interface
    ([\#11766](https://www.rudder-project.org/redmine/issues/11766))

#### Web - UI & UX

  - Missing information/bad UX in API authorization UI 
    ([\#12202](https://www.rudder-project.org/redmine/issues/12202))

#### Technique editor - API

  - typo in name of method used in write_all_techniques
    ([\#12335](https://www.rudder-project.org/redmine/issues/12335))

#### Web - Nodes & inventories

  - Remove modifications made to the inventory by the agent
    ([\#8919](https://www.rudder-project.org/redmine/issues/8919))

#### Web - Config management

  - Add name of the parameter to bundle parameter when generation bundle sequence
    ([\#12310](https://www.rudder-project.org/redmine/issues/12310))
  - Generate dsc technique parameter
    ([\#12289](https://www.rudder-project.org/redmine/issues/12289))
  - Identify in technique metadata if techniques should enable or disable ncf reporting
    ([\#12291](https://www.rudder-project.org/redmine/issues/12291))

#### Generic methods

  - Migrate generic methods towards new loging system
    ([\#12227](https://www.rudder-project.org/redmine/issues/12227))

#### Agent

  - Backport key size option for cf-key
    ([\#12241](https://www.rudder-project.org/redmine/issues/12241))

#### Packaging

  - Change defaults for embedding xml and yaml
    ([\#12285](https://www.rudder-project.org/redmine/issues/12285))
  - Cleanup build options and build results
    ([\#12278](https://www.rudder-project.org/redmine/issues/12278))
  - Add strict version dependency on ncf-api-virtualenv to rudder-webapp
    ([\#12273](https://www.rudder-project.org/redmine/issues/12273))
  - embed libyaml and libxml in cfengine
    ([\#12187](https://www.rudder-project.org/redmine/issues/12187))
  - Epoch should be fixed in packaging
    ([\#12239](https://www.rudder-project.org/redmine/issues/12239))
  - Embed curl in the agent
    ([\#12186](https://www.rudder-project.org/redmine/issues/12186))

#### Initial promises & sys tech

  - An agent run with initial promises should send its inventory more often
    ([\#9676](https://www.rudder-project.org/redmine/issues/9676))

### Bug fixes

#### Web - UI & UX

  - Fixed: JS error when starting Rudder 4.3 with jetty 9
    ([\#12002](https://www.rudder-project.org/redmine/issues/12002))

#### Generic methods

  - Fixed: Broken file_enforce_content  generic method in 4.3 due to upmerge
    ([\#12226](https://www.rudder-project.org/redmine/issues/12226))

#### Web - Config management

  - Fixed: Incomplete "Rules to be applied" summary when accepting a new nodes when using groups of groups
    ([\#12060](https://www.rudder-project.org/redmine/issues/12060))
  - Fixed: Typo in agent build error "reource""
    ([\#12314](https://www.rudder-project.org/redmine/issues/12314))

#### Technique editor - API

  - Fixed: @action tag appears in method description in the editor
    ([\#12080](https://www.rudder-project.org/redmine/issues/12080))

#### Web - Technique editor

  - Fixed: Escaping issue in Users Technique Parameter
    ([\#12101](https://www.rudder-project.org/redmine/issues/12101))

#### Plugin - API ACL

  - Fixed: API failing on root node
    ([\#12229](https://www.rudder-project.org/redmine/issues/12229))

#### Documentation

  - Fixed: Missing configuration instructions at the end of node install documentation
    ([\#11927](https://www.rudder-project.org/redmine/issues/11927))
  - Fixed: Remove doc of class_prefix variable
    ([\#12176](https://www.rudder-project.org/redmine/issues/12176))
  - Fixed: condition_from_expression documentation does not clearly state how to use it
    ([\#12157](https://www.rudder-project.org/redmine/issues/12157))

#### Miscellaneous

  - Fixed: Wrong regex in FileTemplate technique
    ([\#12263](https://www.rudder-project.org/redmine/issues/12263))

#### Agent

  - Fixed: Add capabilities for Rudder agent 4.3
    ([\#12322](https://www.rudder-project.org/redmine/issues/12322))
  - Fixed: if we have syntax error in policies on the Rudder server, rudder agent check says that all is fine
    ([\#12220](https://www.rudder-project.org/redmine/issues/12220))
  - Fixed: agent-health should not require reverse resolution
    ([\#12218](https://www.rudder-project.org/redmine/issues/12218))

#### Packaging

  - Fixed: Missing or invalid migration for techniques generated by technique editor from 4.2 to 4.3
    ([\#12232](https://www.rudder-project.org/redmine/issues/12232))
  - Fixed: rudder-jetty should depend on headless jre on centos7
    ([\#12328](https://www.rudder-project.org/redmine/issues/12328))
  - Fixed: Remove useless files in agent package
    ([\#12320](https://www.rudder-project.org/redmine/issues/12320))
  - Fixed: agent-capabilities file should not be executable
    ([\#12318](https://www.rudder-project.org/redmine/issues/12318))
  - Fixed: Remove invalid comment in rudder-agent spec file
    ([\#12312](https://www.rudder-project.org/redmine/issues/12312))
  - Fixed: Rudder agent service not started in 4.3 after a reboot on Centos7
    ([\#12302](https://www.rudder-project.org/redmine/issues/12302))
  - Fixed: Warning when upgrading from 4.2 to 4.3: No such file or directory
    ([\#12222](https://www.rudder-project.org/redmine/issues/12222))
  - Fixed: rudder-init fails ruding initial policy setup
    ([\#12247](https://www.rudder-project.org/redmine/issues/12247))
  - Fixed: AIX should not depend on curl
    ([\#12245](https://www.rudder-project.org/redmine/issues/12245))
  - Fixed: Wrong dependencies in agent rpm in 4.3
    ([\#12184](https://www.rudder-project.org/redmine/issues/12184))

#### Initial promises & sys tech

  - Fixed: Authorize reports: in techniques/system/common/1.0/hooks.st in qa-test
    ([\#12244](https://www.rudder-project.org/redmine/issues/12244))

#### Server components

  - Fixed: Agent components should not try to load failsafe.cf when policies are broken
    ([\#12243](https://www.rudder-project.org/redmine/issues/12243))
  - Fixed: reload-cf-serverd fails if cf-serverd not running and /sbin not in PATH
    ([\#11824](https://www.rudder-project.org/redmine/issues/11824))

#### Techniques

  - Fixed: Missing report for component "Post-modification hook" when cleaning files
    ([\#12297](https://www.rudder-project.org/redmine/issues/12297))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Ilan COSTA
 * Janos Mattyasovszky

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.3.0.rc1" > </a> Rudder 4.3.0.rc1 (2018-03-15)

### Changes

#### API

  - The compliance API is missing a global compliance target
    ([\#8584](https://www.rudder-project.org/redmine/issues/8584))

#### Web - UI & UX

  -  Rename class to condition in the interface
    ([\#12174](https://www.rudder-project.org/redmine/issues/12174))
  - Make Rudder UI pluggable (login + common layout)
    ([\#12093](https://www.rudder-project.org/redmine/issues/12093))

#### Generic methods

  - file_copy_with_check
    ([\#11610](https://www.rudder-project.org/redmine/issues/11610))

#### Web - Nodes & inventories

  - Allows inventories to be augmented by the user with custom properties
    ([\#4670](https://www.rudder-project.org/redmine/issues/4670))
  - Add more information about the inventory in the inventory process reporting
    ([\#10084](https://www.rudder-project.org/redmine/issues/10084))

#### Documentation

  - Remove bibliography from the doc
    ([\#7733](https://www.rudder-project.org/redmine/issues/7733))
  - Document scheduler generic method
    ([\#6946](https://www.rudder-project.org/redmine/issues/6946))

#### Miscellaneous

  - Make node post-acceptation properties configurable
    ([\#11811](https://www.rudder-project.org/redmine/issues/11811))

#### Agent

  - Backport complete variable table performance patch
    ([\#12130](https://www.rudder-project.org/redmine/issues/12130))
  - Update CFEngine to 3.10.3
    ([\#12090](https://www.rudder-project.org/redmine/issues/12090))
  - Add a "rudder agent history" command
    ([\#12053](https://www.rudder-project.org/redmine/issues/12053))

#### Packaging

  - remove ld.so.conf
    ([\#8969](https://www.rudder-project.org/redmine/issues/8969))
  - Stop providing rudder-policy-templates
    ([\#12120](https://www.rudder-project.org/redmine/issues/12120))
  - Use debconf to configure rudder-agent on debian
    ([\#5919](https://www.rudder-project.org/redmine/issues/5919))
  - Changelog on Rudder rpm hasn't been updated since 2011
    ([\#8609](https://www.rudder-project.org/redmine/issues/8609))

#### Initial promises & sys tech

  - Keep N last inventories generated on the node 
    ([\#7908](https://www.rudder-project.org/redmine/issues/7908))
  - Keep N last inventories generated on the node 
    ([\#7908](https://www.rudder-project.org/redmine/issues/7908))
  - Implement disable-flag for policy server policy copy for nodes
    ([\#11631](https://www.rudder-project.org/redmine/issues/11631))
  - rename cf-served file and cfserved variable
    ([\#12119](https://www.rudder-project.org/redmine/issues/12119))
  - Create a global variable for "shared-files" path
    ([\#6324](https://www.rudder-project.org/redmine/issues/6324))

#### System integration

  - link policy server config to Rudder's config dir
    ([\#10847](https://www.rudder-project.org/redmine/issues/10847))

#### Architecture - Refactoring

  - Remove ListTag workaround when JGit version > 1.2
    ([\#2278](https://www.rudder-project.org/redmine/issues/2278))

#### Techniques

  - Add post-hook to the manage key-value file techniques
    ([\#12124](https://www.rudder-project.org/redmine/issues/12124))

### Bug fixes

#### Technique editor - UI/UX

  - Fixed: Parameters menu arrow does not work as expected
    ([\#12082](https://www.rudder-project.org/redmine/issues/12082))

#### Web - UI & UX

  - Fixed: Update / Delete buttons on group Category modification should be separated
    ([\#11782](https://www.rudder-project.org/redmine/issues/11782))

#### Generic methods

  - Fixed: ncf 4.3 now requires CFEngine >= 3.10
    ([\#12161](https://www.rudder-project.org/redmine/issues/12161))
  - Fixed: command_execution_result does not report anything
    ([\#12087](https://www.rudder-project.org/redmine/issues/12087))

#### Web - Nodes & inventories

  - Fixed: Node details "properties" page broken: js not loading
    ([\#12206](https://www.rudder-project.org/redmine/issues/12206))
  - Fixed: No Machine Inventory in nodes list while the details are complete
    ([\#12041](https://www.rudder-project.org/redmine/issues/12041))

#### Web - Technique editor

  - Fixed: metadata.xml not generated when saving a technique from editor
    ([\#12209](https://www.rudder-project.org/redmine/issues/12209))
  - Fixed: Broken variable expression when using node properties in the technique editor
    ([\#10304](https://www.rudder-project.org/redmine/issues/10304))

#### Technique editor - API

  - Fixed: Result class containing {} are not properly canonized
    ([\#11600](https://www.rudder-project.org/redmine/issues/11600))

#### Generic methods - File Management

  - Fixed: We cannot use file_enforce_content with a list and enforce=true
    ([\#12147](https://www.rudder-project.org/redmine/issues/12147))

#### Documentation

  - Fixed: Please, legitimate "Priority" usage in multi-instance directives
    ([\#11963](https://www.rudder-project.org/redmine/issues/11963))

#### Miscellaneous

  - Fixed: On a fresh Rudder 4.3 centos6 install, error about ncf API in logs
    ([\#12034](https://www.rudder-project.org/redmine/issues/12034))

#### Agent

  - Fixed: Broken "rudder agent check" in 4.3
    ([\#12178](https://www.rudder-project.org/redmine/issues/12178))
  - Fixed: Broken "rudder agent history" in 4.3
    ([\#12177](https://www.rudder-project.org/redmine/issues/12177))
  - Fixed: Agent script argument parsing failure when using non-default locale 
    ([\#12131](https://www.rudder-project.org/redmine/issues/12131))
  - Fixed: rudder remote run cuts down IP of remote host
    ([\#11418](https://www.rudder-project.org/redmine/issues/11418))
  - Fixed: With "rudder agent run", nothing is logged in /var/rudder/cfengine-community/outputs/
    ([\#10801](https://www.rudder-project.org/redmine/issues/10801))

#### Packaging

  - Fixed: Broken rudder-agent 4.1->4.3 upgrade in debian 9
    ([\#12182](https://www.rudder-project.org/redmine/issues/12182))
  - Fixed: Remove suggestion to install cfengine in ncf package
    ([\#12183](https://www.rudder-project.org/redmine/issues/12183))
  - Fixed: On debian, with systemd rudder-agent services are not enabled during postinst
    ([\#12083](https://www.rudder-project.org/redmine/issues/12083))
  - Fixed: On debian, installation is broken
    ([\#12162](https://www.rudder-project.org/redmine/issues/12162))
  - Fixed: rudder-webapp upgrade doesn't commit updates to ncf hooks
    ([\#6758](https://www.rudder-project.org/redmine/issues/6758))
  - Fixed: rudder-inventory-ldap package provides openldap libraries
    ([\#3377](https://www.rudder-project.org/redmine/issues/3377))

#### Initial promises & sys tech

  - Fixed: We have broken reports on a root server in 4.3 beta1
    ([\#12086](https://www.rudder-project.org/redmine/issues/12086))
  - Fixed: If we a have generic method command_execution with parameter /bin/true, we get an error on reporting for syslog restart on non-aix nor solaris sytem
    ([\#12139](https://www.rudder-project.org/redmine/issues/12139))

#### API

  - Fixed: Unathenticated API v1 are not accessible anymore
    ([\#12216](https://www.rudder-project.org/redmine/issues/12216))
  - Fixed: Api does not fail on bad JSON
    ([\#5931](https://www.rudder-project.org/redmine/issues/5931))

#### Techniques

  - Fixed: Missing report in Group Management 
    ([\#12214](https://www.rudder-project.org/redmine/issues/12214))
  - Fixed: Invalid call in descriptor of Technique File download (Rudder server) , version 2.2 in branch 4.2 and 4.3
    ([\#12213](https://www.rudder-project.org/redmine/issues/12213))
  - Fixed: Typo in templating technique
    ([\#12126](https://www.rudder-project.org/redmine/issues/12126))
  - Fixed: Typo in tooltip of File content (from remote template) for path of file
    ([\#12123](https://www.rudder-project.org/redmine/issues/12123))
  - Fixed: sharedfile_to_node reports repaired even if it fails 
    ([\#11836](https://www.rudder-project.org/redmine/issues/11836))

#### Server components

  - Fixed: Clarify support for SLES12 SP2 as Root Server
    ([\#11854](https://www.rudder-project.org/redmine/issues/11854))
  - Fixed: rudder server refusing nodes after an error in check-rudder-agent
    ([\#11309](https://www.rudder-project.org/redmine/issues/11309))

#### System integration

  - Fixed: Stopping slapd fails if pid file is empty
    ([\#10498](https://www.rudder-project.org/redmine/issues/10498))
  - Fixed: service rudder-* outputs on stderror
    ([\#6429](https://www.rudder-project.org/redmine/issues/6429))
  - Fixed: Cannot run rudder server reload-techniques on RedHat 6.6
    ([\#11907](https://www.rudder-project.org/redmine/issues/11907))
  - Fixed: Promises shared with apache are group executable
    ([\#12169](https://www.rudder-project.org/redmine/issues/12169))
  - Fixed: send-clean.sh blocks on inventory parsing error
    ([\#10019](https://www.rudder-project.org/redmine/issues/10019))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Michael Gliwinski
 * Avit Sidis
 * Dmitry Svyatogorov
 * d i
 * Janos Mattyasovszky
 * The Ranger
 * Jean Cardona
 * Alexandre BRIANCEAU
 * Alexander Brunhirl
 * Florian Heigl

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.3.0.beta1" > </a> Rudder 4.3.0.beta1 (2018-02-06)

### Changes

#### Technique editor - UI/UX

  - Change max field length from 2k to 16k
    ([\#11859](https://www.rudder-project.org/redmine/issues/11859))

#### Web - UI & UX

  - add margin to the magnifying glass icon in the Nodes table
    ([\#11849](https://www.rudder-project.org/redmine/issues/11849))

#### Technique editor - API

  - Use a fixed size font in the Technique editor parameters
    ([\#11895](https://www.rudder-project.org/redmine/issues/11895))
  - no reporting if value to report contains a variable
    ([\#11913](https://www.rudder-project.org/redmine/issues/11913))
  - Add support to parameters in ncf Techniques written with ncf builder
    ([\#5673](https://www.rudder-project.org/redmine/issues/5673))

#### Web - Nodes & inventories

  - Be able to create a groups containing Nodes list from an other group
    ([\#6982](https://www.rudder-project.org/redmine/issues/6982))
  - Remove the skipidentify variable and settings page entry
    ([\#10719](https://www.rudder-project.org/redmine/issues/10719))
  - Node lifecycle: add a node state
    ([\#11748](https://www.rudder-project.org/redmine/issues/11748))

#### Web - Config management

  - Add common pre- and post- agent run action triggered by Technique logic
    ([\#11858](https://www.rudder-project.org/redmine/issues/11858))
  - Don't merge directive from same Technique on generation
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
  - Remove our syslog name patch in 4.3
    ([\#11807](https://www.rudder-project.org/redmine/issues/11807))
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

  - Remove old package promises from system Techniques
    ([\#11717](https://www.rudder-project.org/redmine/issues/11717))
  - Enable IPv6 for cf-serverd
    ([\#9693](https://www.rudder-project.org/redmine/issues/9693))
  - Drop old protocol and acl for agents
    ([\#9502](https://www.rudder-project.org/redmine/issues/9502))

#### API

  - Readonly API or otherwise restrictable API Accounts
    ([\#5627](https://www.rudder-project.org/redmine/issues/5627))
  - Add logic to generate ncf Technique files into Rudder
    ([\#11783](https://www.rudder-project.org/redmine/issues/11783))

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

  - Fixed: If change message is mandatory, we cannot update Technique with Technique editor
    ([\#12008](https://www.rudder-project.org/redmine/issues/12008))
  - Fixed: Saving a Technique in the Technique editor in IE11 fails
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

  - Fixed: Set flag to reload ncf Technique through Rudder during update
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
  - Fixed: Escaping variable in a method call fails
    ([\#11795](https://www.rudder-project.org/redmine/issues/11795))

#### Packaging

  - Fixed: rudder-pkg 4.3 belives it is rudder 4.2
    ([\#12074](https://www.rudder-project.org/redmine/issues/12074))
  - Fixed: typo in rudder-server relay package install output
    ([\#12064](https://www.rudder-project.org/redmine/issues/12064))
  - Fixed: Reload of Techniques after update throught Technique editor should only be done by Rudder, remove reload.sh hook
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

  - Fixed: The Technique file copy from shared folder reports file source instead of file destination
    ([\#6564](https://www.rudder-project.org/redmine/issues/6564))
  - Fixed: Group management Technique silently changes the group gid
    ([\#11863](https://www.rudder-project.org/redmine/issues/11863))
  - Fixed: Typo in services Technique preventing persisting post-hook
    ([\#11861](https://www.rudder-project.org/redmine/issues/11861))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Janos Mattyasovszky
 * Alexander Brunhirl
 * Florian Heigl
 * Dennis Cabooter

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

