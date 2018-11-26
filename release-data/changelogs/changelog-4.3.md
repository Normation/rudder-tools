
# General information

Rudder 4.3 is currently a maintained version of Rudder.

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Main new features in Rudder 4.3:**

  - **Technique Parameters:** You can now add parameters to your Techniques created with the Technique editor. The value of theses parameters will be set in Directives, making your Techniques much more versatile and expressive and giving you access to feature that were only available to classic Techniques.
  - **Multi version/mode Directives:** You can now apply Directives with different versions and different policy mode *on the same node*. This allow easy migration (to a new version, from Audit to Enforce) that was previously impossible.
  - **Authorization system for API accounts:** Choose between read-only or full access. A plugin will be available soon in order to allow you more finely grained authorization.
  - **Node properties from inventory:** Node properties can be automatically provided by the inventory data from the node.
  - **Node lifecycle:** You can define a state for each Node managed by Rudder (provisioning, pending removal, disabled etc.). This can be used to build groups and apply configuration according to the Node current state. Also disabled Nodes are not counted in compliance reports, so you are not bothered by offline Nodes when checking compliance.
  - **Group based on Groups**: You can now define that a Group should contain the Nodes of another Group, making it easier to manage a complex set of Nodes.
  - **Graphs on the dashboard are now clickable**: You can access the list of nodes in a category by clicking on parts of the graphs.
  - **Import/Export of techniques in the Technique Editor**: There is now a button to export or import a technique in the Technique Editor, allowing sharing techniques easily. Be careful, this import/export only works between servers running the same Rudder version.
  - **IPv6 support by default:** Rudder is now completely compatible with IPv6 on the agent side as well as server side.
  - **Hooks on Techniques:** When you write a Technique by hand, you can add pre- and post- hooks in it that will be executed once per Technique, even if you applied it in several directives.
  - **Use system Perl:** On recent systems, rudder-agent does not embed Perl anymore, so it uses an up to date version of Perl more integrated to your system. All the needed dependencies are either declared (for the common ones) or still embedded. On a side note, it makes it easier to build a rudder-agent package (which size goes down from 12MB to 4MB!).
  - **Rudder agent services based on systemd:** On systemd based os, we switched from SysV init system to systemd, to make rudder-agent more integrated to your system.
  - **Time all actions made by the agent:** A new option (-T) added to "rudder agent" command line, to display how long an action took and find what makes a run slow.
  - **Renaming of all generic methods:** We changed for a clearer and more logic name scheme in all our generic methods in the Technique editor. 
  - **Simplified logger for Techniques:** We changed the way we do reporting for Techniques from Technique editor with a much simpler way, which should be faster and also fix some reporting issues (ie: when you use variables in your reports).
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
    10, SLES 12, Ubuntu 10.04, Ubuntu 12.04, Ubuntu 18.04**
  - Rudder agent (binary packages available from
    ([Normation](http://www.normation.com)): **Windows Server 2008R2-2016,
    AIX 5-6-7**

**Note**: As of Rudder 4.3, the rudder agent packages are no longer available on Fedora 18
and Ubuntu 12.10.

**Special thanks**

* Thanks to Maxime Longuet from [Itika](https://www.itika.net/) for sponsoring the *node lifecycle* feature!

# Changelogs

## <a name="4.3.7" > </a> Rudder 4.3.7 (2018-11-26)

### Changes

#### API

  - Add rudder server version to the Rest API (system/info endpoint)
    ([\#13654](https://issues.rudder.io/issues/13654))

#### Techniques

  - Provide a rudder.json file with initial policies
    ([\#13805](https://issues.rudder.io/issues/13805))

#### Documentation

  - Cleanup the ncf repo
    ([\#13651](https://issues.rudder.io/issues/13651))

### Bug fixes

#### Plugins integration

  - Fixed: Improve error messsage when path to install a plugin package is not correct
    ([\#13891](https://issues.rudder.io/issues/13891))

#### Packaging

  - Fixed: Rudder agent 4.3 needs libxml-treepp-perl on debian
    ([\#12599](https://issues.rudder.io/issues/12599))
  - Fixed: Slackware agent is not started at boot
    ([\#13850](https://issues.rudder.io/issues/13850))
  - Fixed: Don't create crontab entry at Rudder agent install but during first run
    ([\#13846](https://issues.rudder.io/issues/13846))
  - Fixed: Remove unnecessary conflict dependency with openjdk 9 on debian
    ([\#12664](https://issues.rudder.io/issues/12664))
  - Fixed: Missing _ in slackware package name
    ([\#13839](https://issues.rudder.io/issues/13839))
  - Fixed: Agent should depend on a logging system on SUSE
    ([\#13788](https://issues.rudder.io/issues/13788))
  - Fixed: On rudder-webapp upgrade, ncf.conf file is not commited
    ([\#13679](https://issues.rudder.io/issues/13679))

#### Agent

  - Fixed: Upgrade CFEngine to 3.10.5
    ([\#13851](https://issues.rudder.io/issues/13851))
  - Fixed: "rudder-keys change-key" does not check for key file existence
    ([\#12496](https://issues.rudder.io/issues/12496))
  - Fixed: When "policy-server.dat" is missing, generated inventory is not legit
    ([\#11715](https://issues.rudder.io/issues/11715))
  - Fixed: /var/log/rudder/agent-check/check.log should contains only error level messages
    ([\#12230](https://issues.rudder.io/issues/12230))
  - Fixed: rudder remote run error, and unable to pass -i option
    ([\#11318](https://issues.rudder.io/issues/11318))
  - Fixed: Command "rudder remote run -a" does not warn about missing token
    ([\#11417](https://issues.rudder.io/issues/11417))
  - Fixed: Add a warn message when agent run is incomplete
    ([\#10751](https://issues.rudder.io/issues/10751))
  - Fixed: Command "rudder agent reset" sets incorrect permission in /var/rudder/cfengine-community/inputs
    ([\#12410](https://issues.rudder.io/issues/12410))
  - Fixed: "rudder agent info" returns invalid report mode for not yet accepted nodes
    ([\#12992](https://issues.rudder.io/issues/12992))
  - Fixed: Missing spaces between key and message on rudder agent run report when using -w option
    ([\#13663](https://issues.rudder.io/issues/13663))

#### Performance and scalability

  - Fixed: There are still tables expectedreports & expectesreportsnodes on upgraded Rudder 4.x and 5.x,
    ([\#13770](https://issues.rudder.io/issues/13770))
  - Fixed: After a node is deleted, a policy generation is started every 5 secondes
    ([\#13845](https://issues.rudder.io/issues/13845))
  - Fixed: Invalid value reported for Node expected reports saved in base in Rudder log
    ([\#13418](https://issues.rudder.io/issues/13418))

#### System integration

  - Fixed: "rudder-pkg enable-all" command fails when a plugin has no jar
    ([\#13785](https://issues.rudder.io/issues/13785))
  - Fixed: Bad log level during generation
    ([\#9512](https://issues.rudder.io/issues/9512))
  - Fixed: Init check on group All classic Nodes known by Rudder (Using a CFEngine based agent) always tries to rewrite the group
    ([\#13792](https://issues.rudder.io/issues/13792))

#### Web - Config management

  - Fixed: The password field allows storing a password without any selected hash
    ([\#12198](https://issues.rudder.io/issues/12198))
  - Fixed: Spinning compliance in nodes list on a disabled node
    ([\#12649](https://issues.rudder.io/issues/12649))
  - Fixed: Spinning compliance in nodes list on a disabled node
    ([\#12649](https://issues.rudder.io/issues/12649))
  - Fixed: "Not copying missing license file into" in webapp log
    ([\#10917](https://issues.rudder.io/issues/10917))
  - Fixed: Missing node state variable expansion in directive
    ([\#13671](https://issues.rudder.io/issues/13671))
  - Fixed: Add full path to shared-folder in description of "Download file from shared folder" Technique
    ([\#13530](https://issues.rudder.io/issues/13530))

#### Web - UI & UX

  - Fixed: Wrong text color in table header in Rule page
    ([\#13835](https://issues.rudder.io/issues/13835))
  - Fixed: Quotes in reports are displayed as &quot; in the web interface
    ([\#13349](https://issues.rudder.io/issues/13349))
  - Fixed: Upgrade loading wheel with a new look
    ([\#8622](https://issues.rudder.io/issues/8622))
  - Fixed: On Dashboard, when we have 100% of something, the pie is including a confusing white line
    ([\#12233](https://issues.rudder.io/issues/12233))
  - Fixed: No color difference on hover on the user menu
    ([\#12926](https://issues.rudder.io/issues/12926))
  - Fixed: "Configure the default state" is lacking explanations
    ([\#12462](https://issues.rudder.io/issues/12462))
  - Fixed: Remove static ids in Password section
    ([\#13457](https://issues.rudder.io/issues/13457))
  - Fixed: Button to enable a technique in Directive Screen is not working, should be a link to the Technique
    ([\#13779](https://issues.rudder.io/issues/13779))
  - Fixed: In directive page, tooltip is not correctly aligned with text 
    ([\#13511](https://issues.rudder.io/issues/13511))
  - Fixed: The "hardware" tab is not displayed in accept new nodes screen
    ([\#13688](https://issues.rudder.io/issues/13688))

#### Web - Nodes & inventories

  - Fixed: When a node is deleted, its generated promises are not removed
    ([\#4709](https://issues.rudder.io/issues/4709))
  - Fixed: Inventory keeps its key certified when node is deleted
    ([\#9149](https://issues.rudder.io/issues/9149))
  - Fixed: Missing gateway, network in network interface details
    ([\#13804](https://issues.rudder.io/issues/13804))
  - Fixed: Network group criteria not working
    ([\#13772](https://issues.rudder.io/issues/13772))
  - Fixed: Node details shows Operating System Type: MSWin for Windows node rather than Windows
    ([\#6019](https://issues.rudder.io/issues/6019))
  - Fixed: The error message for bad inventory signature is unclear
    ([\#9192](https://issues.rudder.io/issues/9192))
  - Fixed: Network, mask and gateway not correctly parsed from inventory
    ([\#13803](https://issues.rudder.io/issues/13803))

#### Web - Compliance & node report

  - Fixed: Compliance error (missing) when a directive is applied by two rules on a node
    ([\#13674](https://issues.rudder.io/issues/13674))

#### API

  - Fixed: Remove old "machyne type" api Rest typo since it should not be called anymore
    ([\#13795](https://issues.rudder.io/issues/13795))
  - Fixed:  Tags in rules are ignored in POST API
    ([\#13374](https://issues.rudder.io/issues/13374))

#### Techniques

  - Fixed: Option description for "File download (Rudder server)" technique is misleading
    ([\#13887](https://issues.rudder.io/issues/13887))
  - Fixed: Technique "Cron job v3.0" does not use the "user" setting with predefined scheduled
    ([\#8004](https://issues.rudder.io/issues/8004))
  - Fixed: Missing reports on password component on "User management" Technique in audit mode
    ([\#9474](https://issues.rudder.io/issues/9474))
  - Fixed:  Enforce checkbox tooltip in "Group management" Technique is misleading
    ([\#13489](https://issues.rudder.io/issues/13489))
  - Fixed: Missing report with 'File and directory basics' Technique in audit mode when checking perms on non existing file
    ([\#11653](https://issues.rudder.io/issues/11653))
  - Fixed: Broken reporting when copying a directory from the Rudder server without specifying the trailing / in the destination
    ([\#13290](https://issues.rudder.io/issues/13290))
  - Fixed: Missing report for post-modification hook in Technique "File download (Rudder server)"
    ([\#13717](https://issues.rudder.io/issues/13717))
  - Fixed: Details of usage of technique "Variable from command output (string)" is not clear
    ([\#12058](https://issues.rudder.io/issues/12058))
  - Fixed: Some files in the techniques repository do not present any licence header
    ([\#13633](https://issues.rudder.io/issues/13633))
  - Fixed: Technique "cron job" refuses task user name if it contains hyphen 
    ([\#12960](https://issues.rudder.io/issues/12960))
  - Fixed: Missing report for component "Post-modification hook" when cleaning files with "File and directory basics" Technique version 4.1
    ([\#13786](https://issues.rudder.io/issues/13786))

#### System techniques

  - Fixed: Mustache templates are not processed at all (including cron.d/rudder-agent file)
    ([\#13885](https://issues.rudder.io/issues/13885))
  - Fixed: Slackware agent cron.d is broken in system technique
    ([\#13848](https://issues.rudder.io/issues/13848))

#### Server components

  - Fixed: server command based on jq should exit when jq is not installed and explain to install it
    ([\#13682](https://issues.rudder.io/issues/13682))

#### Generic methods

  - Fixed: Typo in "File content" generic method description
    ([\#13883](https://issues.rudder.io/issues/13883))
  - Fixed: Generic method "File_remove" can delete empty directories
    ([\#12857](https://issues.rudder.io/issues/12857))
  - Fixed: Scheduler classes have incomplete labels
    ([\#8008](https://issues.rudder.io/issues/8008))

#### Web - Technique editor

  - Fixed: In technique editor, on save, we get "success" but some errors are shallowed
    ([\#12210](https://issues.rudder.io/issues/12210))

#### Generic methods - File Management

  - Fixed: Generic Method "permission dirs" incorrect reporting when target path is a file
    ([\#10689](https://issues.rudder.io/issues/10689))
  - Fixed: "File key-value present" Generic Method  and "Manage keys-values in file" Technique  does not support | as separator
    ([\#13562](https://issues.rudder.io/issues/13562))

#### Documentation

  - Fixed: Fix path to jinja2_custom.py in jinja2 templating doc
    ([\#13784](https://issues.rudder.io/issues/13784))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * David Svejda
 * vlycop Doo
 * Renaud Manus
 * Janos Mattyasovszky
 * Ilan COSTA
 * Florian Heigl
 * Thomas CAILHE
 * Alexandre BRIANCEAU
 * Romain Quinaud

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.3.6" > </a> Rudder 4.3.6 (2018-11-06)

### Changes

#### Generic methods

  - Add condition_once and execute_once generic methods
    ([\#13667](https://www.rudder-project.org/redmine/issues/13667))
  - Add a flag library to store persistent context on the agents
    ([\#13622](https://www.rudder-project.org/redmine/issues/13622))
  - Add a flag library to store persistent context on the agents
    ([\#13622](https://www.rudder-project.org/redmine/issues/13622))

#### Documentation

  - Document zypper pattern usage in the "Package state" generic method documentation
    ([\#13725](https://www.rudder-project.org/redmine/issues/13725))

### Bug fixes

#### Web - UI & UX

  - Fixed: We have no way to know that a Technique is disabled when editing a Directive
    ([\#12829](https://www.rudder-project.org/redmine/issues/12829))

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

#### Generic methods - Package Management

  - Fixed: Missing report when using the "Package state" generic method with default value for the "state" parameter
    ([\#13703](https://www.rudder-project.org/redmine/issues/13703))

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
  - Fixed: "type: systemctl : not found" appears in rudder-agent installation logs
    ([\#13693](https://www.rudder-project.org/redmine/issues/13693))
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

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.3.5" > </a> Rudder 4.3.5 (2018-10-19)

### Changes

#### Packaging

  - Upgrade openssl
    ([\#13316](https://www.rudder-project.org/redmine/issues/13316))
  - Add sles 15 support to rudder-packages
    ([\#13295](https://www.rudder-project.org/redmine/issues/13295))
  - Disable HTTPs for sources download on old OSes
    ([\#13197](https://www.rudder-project.org/redmine/issues/13197))
  - Download sources from repository.rudder.io instead of www.normation.com
    ([\#13172](https://www.rudder-project.org/redmine/issues/13172))

#### Generic methods

  - Add a generic method to test variable existence
    ([\#12986](https://www.rudder-project.org/redmine/issues/12986))

#### Generic methods - Package Management

  - Use the new class_prefix for package methods
    ([\#12427](https://www.rudder-project.org/redmine/issues/12427))
  - Add a package provider for zypper patterns
    ([\#12164](https://www.rudder-project.org/redmine/issues/12164))

#### Agent

  - Add a package techniques migration script
    ([\#12710](https://www.rudder-project.org/redmine/issues/12710))
  - Update technique migration script with 12614 review
    ([\#12676](https://www.rudder-project.org/redmine/issues/12676))

### Bug fixes

#### Web - UI & UX

  - Fixed: Blue text color in node details tabs
    ([\#13168](https://www.rudder-project.org/redmine/issues/13168))

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
  - Fixed: Some old tests are failing on centos
    ([\#13535](https://www.rudder-project.org/redmine/issues/13535))
  - Fixed: there is still a trailing new line in the jinja result test file
    ([\#13529](https://www.rudder-project.org/redmine/issues/13529))
  - Fixed: Tests on variable_string and variable_string_default GM are failing
    ([\#13523](https://www.rudder-project.org/redmine/issues/13523))
  - Fixed: Some tests are failing on ubuntu distros
    ([\#13514](https://www.rudder-project.org/redmine/issues/13514))
  - Fixed: " error: List or container parameter 'args' not found while constructing scope 'log_rudder' - use @(scope.variable) in calling reference"  when running Rudder 4.3
    ([\#13430](https://www.rudder-project.org/redmine/issues/13430))
  - Fixed: add a method to set reportiing_context from within a technique
    ([\#13351](https://www.rudder-project.org/redmine/issues/13351))
  - Fixed: user_primary_group tests are failing on suse
    ([\#13282](https://www.rudder-project.org/redmine/issues/13282))
  - Fixed: Some ncf tests are too old and fails on many distributions
    ([\#13249](https://www.rudder-project.org/redmine/issues/13249))
  - Fixed: Incomplete management of disabled/reenable reporting
    ([\#13209](https://www.rudder-project.org/redmine/issues/13209))
  - Fixed: file_check_special tests are failing on debian
    ([\#13243](https://www.rudder-project.org/redmine/issues/13243))
  - Fixed: Huge agent logs when we define an new class_prefix that is longer than 1024 chars
    ([\#13155](https://www.rudder-project.org/redmine/issues/13155))

#### Web - Nodes & inventories

  - Fixed: Node group with 'OR' multi criteria fails
    ([\#13649](https://www.rudder-project.org/redmine/issues/13649))

#### Generic methods - Package Management

  - Fixed: old packages generic methods are failing on old debian
    ([\#13305](https://www.rudder-project.org/redmine/issues/13305))

#### Generic methods - File Management

  - Fixed: Missing report on Permissions (non recursive)
    ([\#13536](https://www.rudder-project.org/redmine/issues/13536))
  - Fixed: Error when using 2 or more File from a jinja2 template
    ([\#13183](https://www.rudder-project.org/redmine/issues/13183))

#### Documentation

  - Fixed: rudder-doc embedeed doesn't work anymore
    ([\#13659](https://www.rudder-project.org/redmine/issues/13659))
  - Fixed: Document Amazon Linux compatibility
    ([\#13624](https://www.rudder-project.org/redmine/issues/13624))
  - Fixed: Wrong version displayed on the login page for plugin branding
    ([\#13274](https://www.rudder-project.org/redmine/issues/13274))
  - Fixed: Update screenshot for Rudder Branding
    ([\#13270](https://www.rudder-project.org/redmine/issues/13270))
  - Fixed: Bad explanation for generic variable overide priority cause people making the opposite of what is needed
    ([\#13615](https://www.rudder-project.org/redmine/issues/13615))

#### Technique editor - API

  - Fixed: Error message is not correctly treated when an exception occurs in when authenticating to Rudder authentication API
    ([\#13219](https://www.rudder-project.org/redmine/issues/13219))

#### Agent

  - Fixed: remove unessecary patch that remove truncation of line in inventory
    ([\#13403](https://www.rudder-project.org/redmine/issues/13403))
  - Fixed: rudder server command states that "Warning: Long arguments are not supported, you probably tried to use one!" - but it does support it
    ([\#13505](https://www.rudder-project.org/redmine/issues/13505))
  - Fixed: rudder technique-migrate is not documented nor properly named
    ([\#13146](https://www.rudder-project.org/redmine/issues/13146))

#### Packaging

  - Fixed: Debian package cannot build in 4.1 because of docs.rudder.io
    ([\#13594](https://www.rudder-project.org/redmine/issues/13594))
  - Fixed: rudder-agent service is not removed when removing rudder-agent
    ([\#13549](https://www.rudder-project.org/redmine/issues/13549))
  - Fixed: Use new man page URL after doc URL redirect
    ([\#13537](https://www.rudder-project.org/redmine/issues/13537))
  - Fixed: rudder-agent 4.1 install hangs on Debian 7 
    ([\#13525](https://www.rudder-project.org/redmine/issues/13525))
  - Fixed: Doc download in webapp package does not work anymore
    ([\#13499](https://www.rudder-project.org/redmine/issues/13499))
  - Fixed: Use correct version when building Slackware packages
    ([\#13329](https://www.rudder-project.org/redmine/issues/13329))
  - Fixed: parallel build on rpmbuild hides build error
    ([\#13300](https://www.rudder-project.org/redmine/issues/13300))
  - Fixed: Purge of rudder-webapp should not fail
    ([\#13210](https://www.rudder-project.org/redmine/issues/13210))
  - Fixed: Fix bdb download link from repository.rudder.io
    ([\#13198](https://www.rudder-project.org/redmine/issues/13198))
  - Fixed: slackware should not build its package into /tmp
    ([\#13194](https://www.rudder-project.org/redmine/issues/13194))
  - Fixed: rudder server upgrade-techniques --autoupdate-technique-library fails when run during Rudder upgrade
    ([\#13458](https://www.rudder-project.org/redmine/issues/13458))
  - Fixed: cebtos7 install_package_existant should be skipped
    ([\#13596](https://www.rudder-project.org/redmine/issues/13596))
  - Fixed: Makefile fails if a symbolink link /usr/bin/ncf already exists
    ([\#13277](https://www.rudder-project.org/redmine/issues/13277))

#### Generic methods - Service Management

  - Fixed: Service test do not use any service to test on suse
    ([\#13278](https://www.rudder-project.org/redmine/issues/13278))
  - Fixed:  services GM are not working anymore due to typo
    ([\#13258](https://www.rudder-project.org/redmine/issues/13258))
  - Fixed: service_started_start.cf test fails on redhat
    ([\#13257](https://www.rudder-project.org/redmine/issues/13257))
  - Fixed: service_started_path.cf does not generate classes anymore since 13220
    ([\#13254](https://www.rudder-project.org/redmine/issues/13254))

#### API

  - Fixed: Rudder system api token only have RO access
    ([\#13416](https://www.rudder-project.org/redmine/issues/13416))

#### Security

  - Fixed: StackOverflowError during policy generation in JavascriptEngine - debian 9.5 with jdk 1.8.0_181
    ([\#13014](https://www.rudder-project.org/redmine/issues/13014))
  - Fixed: Api User Account doesn't have User role
    ([\#13629](https://www.rudder-project.org/redmine/issues/13629))
  - Fixed: "//" in rudder-web/secure/api//settings/global_policy_mode cause browser/spring error
    ([\#13356](https://www.rudder-project.org/redmine/issues/13356))
  - Fixed: Bad mime type for our js files: application/js
    ([\#13334](https://www.rudder-project.org/redmine/issues/13334))
  - Fixed: file enforce content log file content which can have private info
    ([\#13608](https://www.rudder-project.org/redmine/issues/13608))

#### Performance and scalability

  - Fixed: Hikari pool autocomit configuration is incorrect, which can impact performance
    ([\#13582](https://www.rudder-project.org/redmine/issues/13582))
  - Fixed: Policy generation fails definitively when postgresql is shut down during policy generation
    ([\#13517](https://www.rudder-project.org/redmine/issues/13517))
  - Fixed: On error on nodecompliance SQL, logs are huge
    ([\#13427](https://www.rudder-project.org/redmine/issues/13427))

#### Techniques

  - Fixed: SudoParameter technique version 3.2 returns a report that is not parsable by the CLI
    ([\#13350](https://www.rudder-project.org/redmine/issues/13350))
  - Fixed: Package repository keys Technique in Audit Mode : Missing Reports
    ([\#13065](https://www.rudder-project.org/redmine/issues/13065))
  - Fixed: Package repository keys Technique in Audit Mode : Missing Reports
    ([\#13065](https://www.rudder-project.org/redmine/issues/13065))
  - Fixed: Rudder SNMP technique has a component failing on first run
    ([\#13159](https://www.rudder-project.org/redmine/issues/13159))
  - Fixed: Package management technique fails to check if a package is absent in the "latest" version
    ([\#12939](https://www.rudder-project.org/redmine/issues/12939))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Jeremy CHAMPEL
 * Mikaël Mantel
 * tim c
 * Marco Kirchhoff
 * Guillaume Terrier

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.3.4" > </a> Rudder 4.3.4 (2018-08-08)

### Changes

#### Packaging

  - Add the slackware target to packages.makefile
    ([\#13070](https://www.rudder-project.org/redmine/issues/13070))

#### Web - UI & UX

  - Remove the "Update policy" button
    ([\#12668](https://www.rudder-project.org/redmine/issues/12668))

### Bug fixes

#### Web - UI & UX

  - Fixed: Strange behavior of the generation status icon background
    ([\#12816](https://www.rudder-project.org/redmine/issues/12816))
  - Fixed: Display Rudder Machine ID color scheme is surprising
    ([\#12923](https://www.rudder-project.org/redmine/issues/12923))
  - Fixed: Style to define behaviour regarding duplicated reports in 4.3 is not consistent with the rest of the option
    ([\#12987](https://www.rudder-project.org/redmine/issues/12987))

#### Generic methods

  - Fixed: Generic method File present is called Presence of a file, and that's really confusing
    ([\#13003](https://www.rudder-project.org/redmine/issues/13003))

#### Web - Config management

  - Fixed: "SocketException(message='Socket closed'" error at the end of generation with 500 nodes
    ([\#10646](https://www.rudder-project.org/redmine/issues/10646))
  - Fixed: Wrong tag used in metadata.xml to define if a technique should use ncf method reporting or not
    ([\#13035](https://www.rudder-project.org/redmine/issues/13035))

#### Architecture - Internal libs

  - Fixed: nuProcess 1.2.0 crashes on JDK 10
    ([\#12832](https://www.rudder-project.org/redmine/issues/12832))

#### Documentation

  - Fixed: Script execution must be allowed to install and use Rudder on Windows nodes
    ([\#12772](https://www.rudder-project.org/redmine/issues/12772))

#### Agent

  - Fixed: Broken -g option in rudder remote run
    ([\#13017](https://www.rudder-project.org/redmine/issues/13017))

#### Packaging

  - Fixed: cfengine fails to build with embedded libxml on rhel3
    ([\#13096](https://www.rudder-project.org/redmine/issues/13096))
  - Fixed: agent postinstall fails on OS without /proc/self
    ([\#13066](https://www.rudder-project.org/redmine/issues/13066))
  - Fixed: libxml depends on zlib but we don't pass it the configure flag
    ([\#13060](https://www.rudder-project.org/redmine/issues/13060))
  - Fixed: Libgcc is missing on aix
    ([\#13046](https://www.rudder-project.org/redmine/issues/13046))
  - Fixed: static-libgcc is ignored by some build
    ([\#13042](https://www.rudder-project.org/redmine/issues/13042))
  - Fixed: echo -n doewn't work on aix
    ([\#13005](https://www.rudder-project.org/redmine/issues/13005))
  - Fixed: Missing lib path in AIX cfengine executables
    ([\#12994](https://www.rudder-project.org/redmine/issues/12994))
  - Fixed: Silent install does not work
    ([\#12929](https://www.rudder-project.org/redmine/issues/12929))
  - Fixed: Tests broken after #12953
    ([\#13001](https://www.rudder-project.org/redmine/issues/13001))

#### Relay server or API

  - Fixed: Relay API does not correctly work on relay, as RewriteEngine is not enabled
    ([\#13063](https://www.rudder-project.org/redmine/issues/13063))

#### System techniques

  - Fixed: Missing report on File key-value present
    ([\#12998](https://www.rudder-project.org/redmine/issues/12998))

#### Web - Maintenance

  - Fixed: rudder-metrics-reporting fail to report reports on directive/expected reports in 4.3, as the database schema changed
    ([\#13041](https://www.rudder-project.org/redmine/issues/13041))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Martin Zbozien

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.3.3" > </a> Rudder 4.3.3 (2018-07-18)

### Changes

#### Generic methods

  - Do not modify variables in existing bundles
    ([\#12597](https://www.rudder-project.org/redmine/issues/12597))
  - Add support for BSD-style init scripts services (rc.d) (slackware)
    ([\#12593](https://www.rudder-project.org/redmine/issues/12593))

#### Generic methods - Package Management

  - Synchronize the 'slackpkg' cfengine package module shipped with ncf with the official one
    ([\#12811](https://www.rudder-project.org/redmine/issues/12811))
  - Synchronize package modules from masterfiles
    ([\#10907](https://www.rudder-project.org/redmine/issues/10907))
  - Backport options for yum package provider
    ([\#12127](https://www.rudder-project.org/redmine/issues/12127))

#### Documentation

  - Document rudder branding plugin
    ([\#12852](https://www.rudder-project.org/redmine/issues/12852))
  - Document plugin node-external-reports
    ([\#12864](https://www.rudder-project.org/redmine/issues/12864))
  - Add binary dependency to rpkg format documentation
    ([\#12810](https://www.rudder-project.org/redmine/issues/12810))
  - Change the documentation to tell the user to use the gpg key from the root path
    ([\#12802](https://www.rudder-project.org/redmine/issues/12802))

#### Agent

  - Patch the agent Makefile in rudder-packages in order to build it on Slackware
    ([\#12775](https://www.rudder-project.org/redmine/issues/12775))
  - The agent cannot find its version on Slackware
    ([\#12766](https://www.rudder-project.org/redmine/issues/12766))
  - Add a command line option to run the agent in full compliance mode
    ([\#12681](https://www.rudder-project.org/redmine/issues/12681))

#### Packaging

  - Accept external options to rpmbuild calls
    ([\#12973](https://www.rudder-project.org/redmine/issues/12973))
  - Remove documentation from the install of rudder-agent dependencies in rudder-packages
    ([\#12831](https://www.rudder-project.org/redmine/issues/12831))
  - Add slackware support to rudder-packages
    ([\#12789](https://www.rudder-project.org/redmine/issues/12789))

#### Plugins

  - Integrate plugin-common Trait into rudder
    ([\#12908](https://www.rudder-project.org/redmine/issues/12908))
  - Integrate plugin-common Trait into rudder
    ([\#12908](https://www.rudder-project.org/redmine/issues/12908))

#### System techniques

  - Make the agent resend the inventory if sending failed
    ([\#7490](https://www.rudder-project.org/redmine/issues/7490))

#### Techniques

  - Add testing on sshKeyDistribution
    ([\#12822](https://www.rudder-project.org/redmine/issues/12822))

### Bug fixes

#### Technique editor - UI/UX

  - Fixed: dsc filter in technique editor does not seem to work
    ([\#12468](https://www.rudder-project.org/redmine/issues/12468))

#### Web - UI & UX

  - Fixed: The red cross in case of generation problem is not visible enough
    ([\#11889](https://www.rudder-project.org/redmine/issues/11889))

#### Technique editor - API

  - Fixed: On debian 9.4, ncf views.py can not access http://localhost/rudder (but can https://..)
    ([\#12957](https://www.rudder-project.org/redmine/issues/12957))

#### Web - Nodes & inventories

  - Fixed: NodeInfoCache is precise to the second but we need it to be precise to the millisecond
    ([\#12988](https://www.rudder-project.org/redmine/issues/12988))
  - Fixed: root node disapeared while upgrading from 4.1 to 4.3 on debian 9
    ([\#12474](https://www.rudder-project.org/redmine/issues/12474))
  - Fixed: In inventory, "motherboardid" is not the mother board id but the machine id
    ([\#12893](https://www.rudder-project.org/redmine/issues/12893))
  - Fixed: It's difficult to know if the node property added is valid json 
    ([\#12360](https://www.rudder-project.org/redmine/issues/12360))

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

#### Web - Config management

  - Fixed: When we add a section in the directive editor, it clears the content of the previous section
    ([\#12916](https://www.rudder-project.org/redmine/issues/12916))

#### Documentation

  - Fixed: Invalid ordering of elements in node external reports plugin
    ([\#12901](https://www.rudder-project.org/redmine/issues/12901))
  - Fixed: Update screenshot of branding plugin
    ([\#12897](https://www.rudder-project.org/redmine/issues/12897))
  - Fixed: Move DSC documentation inside the plugins section of Rudder doc
    ([\#12895](https://www.rudder-project.org/redmine/issues/12895))
  - Fixed: Missing support of Ubuntu 18.04 agent in documentation
    ([\#12854](https://www.rudder-project.org/redmine/issues/12854))
  - Fixed: Rudder doc 4.3 fails to list the supported SLES for the nodes
    ([\#12756](https://www.rudder-project.org/redmine/issues/12756))
  - Fixed: Documentation for dsc ncf GM does not appear in the user manual
    ([\#12750](https://www.rudder-project.org/redmine/issues/12750))

#### Generic methods

  - Fixed: In some cases, reporting context calls can be the same for different methods, and hence ignored
    ([\#12953](https://www.rudder-project.org/redmine/issues/12953))
  - Fixed: Wrong bundle name passed in 12154
    ([\#12921](https://www.rudder-project.org/redmine/issues/12921))
  - Fixed: Broken reporting when class_prefix contains an unexpanded variable
    ([\#12819](https://www.rudder-project.org/redmine/issues/12819))
  - Fixed: Description of the "user primary group" method is wrong
    ([\#12785](https://www.rudder-project.org/redmine/issues/12785))
  - Fixed: Broken logger_rudder test in 4.3
    ([\#12777](https://www.rudder-project.org/redmine/issues/12777))
  - Fixed: Create a generic method to define environment variable
    ([\#12154](https://www.rudder-project.org/redmine/issues/12154))

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
  - Fixed: rudder-agent 4.3 install hangs on Debian 7
    ([\#12698](https://www.rudder-project.org/redmine/issues/12698))
  - Fixed: Error in Plugin section for Node external reports
    ([\#12898](https://www.rudder-project.org/redmine/issues/12898))
  - Fixed: Warn during inventory if sending through http not https
    ([\#11284](https://www.rudder-project.org/redmine/issues/11284))

#### Plugin - API ACL

  - Fixed: Rudder 4.3 missing important features for plugins, especially ACL one
    ([\#12808](https://www.rudder-project.org/redmine/issues/12808))

#### Generic methods - Service Management

  - Fixed: fail to restart certain services on Ubuntu because of incomplete detection of systemd/upstart
    ([\#12887](https://www.rudder-project.org/redmine/issues/12887))

#### API

  - Fixed: JS error when changing the status of an api token
    ([\#12947](https://www.rudder-project.org/redmine/issues/12947))
  - Fixed: Can not create token
    ([\#12940](https://www.rudder-project.org/redmine/issues/12940))
  - Fixed: Tags in directives are ignored in POST API
    ([\#12355](https://www.rudder-project.org/redmine/issues/12355))

#### Agent

  - Fixed: Can not install rudder agent on AIX: libyaml.a could not be loaded
    ([\#12966](https://www.rudder-project.org/redmine/issues/12966))

#### Plugins

  - Fixed: rudder-pkg must disable plugin during major version Rudder update
    ([\#12331](https://www.rudder-project.org/redmine/issues/12331))
  - Fixed: rudder-pkg should fail installation is a dependency is missing
    ([\#12749](https://www.rudder-project.org/redmine/issues/12749))
  - Fixed: Declared plugin APIs not correctly regirstered in Rudder
    ([\#12919](https://www.rudder-project.org/redmine/issues/12919))

#### System techniques

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

#### Techniques

  - Fixed: double quoted introduced as a typo of parent ticket
    ([\#12943](https://www.rudder-project.org/redmine/issues/12943))
  - Fixed: Technique userManagement does not change shell
    ([\#6395](https://www.rudder-project.org/redmine/issues/6395))
  - Fixed: Missing support for ubuntu 18_04 in technique aptPackageManagerSettings
    ([\#12884](https://www.rudder-project.org/redmine/issues/12884))
  - Fixed: Clean up the tests for sshKeyDistribution
    ([\#12863](https://www.rudder-project.org/redmine/issues/12863))
  - Fixed: fileTemplate technique does not correctly work in multiversionned format in Rudder 4.3
    ([\#12784](https://www.rudder-project.org/redmine/issues/12784))
  - Fixed: Sudoers technique does not abide by the no password parameter in technique version 3.2
    ([\#12782](https://www.rudder-project.org/redmine/issues/12782))

#### System integration

  - Fixed: Replace the log debug DEBUG com.normation.rudder.services.policies.PromiseGenerationServiceImpl which contains the timing summary to the policy.generation logger, in INFO
    ([\#12731](https://www.rudder-project.org/redmine/issues/12731))
  - Fixed: Generation gets stuck when cf-serverd is not running
    ([\#12604](https://www.rudder-project.org/redmine/issues/12604))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Janos Mattyasovszky
 * Dmitry Svyatogorov
 * Florian Heigl

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.3.2" > </a> Rudder 4.3.2 (2018-06-12)

### Changes

#### Packaging
 
  - Add agent support for Ubuntu 18.04 LTS "Bionic Beaver"
    ([\#12683](https://www.rudder-project.org/redmine/issues/12683))

#### Generic methods

  - Add the possibility to customize filters and tests for jinja2 templating
    ([\#12761](https://www.rudder-project.org/redmine/issues/12761))
  - Add a generic method to test variable content
    ([\#12596](https://www.rudder-project.org/redmine/issues/12596))

#### Web - Nodes & inventories

  - It's not possible to search Nodes by their node lifecycle
    ([\#12564](https://www.rudder-project.org/redmine/issues/12564))

#### Generic methods - Package Management

  - Add a package module for cfengine supporting slackware
    ([\#12684](https://www.rudder-project.org/redmine/issues/12684))

#### Architecture - Internal libs

  - Enforce stricter checks by scala compiler with Xlint flags
    ([\#12558](https://www.rudder-project.org/redmine/issues/12558))

#### Documentation

  - Add a doc about generic method naming conventions
    ([\#12594](https://www.rudder-project.org/redmine/issues/12594))
  -  Node lifecycle: documentation
    ([\#12592](https://www.rudder-project.org/redmine/issues/12592))
  - Add docs about Windows agent logging
    ([\#12393](https://www.rudder-project.org/redmine/issues/12393))

#### Web - Compliance & node report

  - Overriden directives are not listed in reports information
    ([\#7616](https://www.rudder-project.org/redmine/issues/7616))

#### Packaging

  - Strip binaries in rpm packages
    ([\#12452](https://www.rudder-project.org/redmine/issues/12452))

#### Agent

  - Upgrade to CFEngine 3.10.4 LTS
    ([\#12576](https://www.rudder-project.org/redmine/issues/12576))

#### System techniques

  - Add a way to override report mode in system techniques
    ([\#12680](https://www.rudder-project.org/redmine/issues/12680))
  - rudder-lib.st in the "common" system technique does not identify crond as running when the ps is /usr/sbin/crond -l notice
    ([\#12615](https://www.rudder-project.org/redmine/issues/12615))
  - Remove big red button code from techniques
    ([\#12525](https://www.rudder-project.org/redmine/issues/12525))

#### Performance and scalability

  - Explore alternative format for compliance table
    ([\#12621](https://www.rudder-project.org/redmine/issues/12621))

#### Techniques

  - Make the 'common' system technique identify crond on a slackware agent
    ([\#12610](https://www.rudder-project.org/redmine/issues/12610))
  - Add scripts to help migrate techniques to rudder server command
    ([\#12614](https://www.rudder-project.org/redmine/issues/12614))

### Bug fixes

#### API

  - Fixed: Archive API always tells "group" even for other objects
    ([\#12705](https://www.rudder-project.org/redmine/issues/12705))
  - Fixed: NumberFormatException in NodeAPI 8 (runResponse)
    ([\#12556](https://www.rudder-project.org/redmine/issues/12556))
  - Fixed: Custom acl are not parsed by api account API 
    ([\#12585](https://www.rudder-project.org/redmine/issues/12585))

#### Web - UI & UX

  - Fixed: Custom node properties from inventory are not found in group search
    ([\#12572](https://www.rudder-project.org/redmine/issues/12572))
  - Fixed: loading page and 404 page does not use correct style when redirected by apache
    ([\#12736](https://www.rudder-project.org/redmine/issues/12736))
  - Fixed: Windows node show an empty Certificate Hash field in node details
    ([\#11347](https://www.rudder-project.org/redmine/issues/11347))
  - Fixed: GUI problem with long strings in reporting
    ([\#12283](https://www.rudder-project.org/redmine/issues/12283))
  - Fixed: When deleting an API account the removed row is not the good one
    ([\#12638](https://www.rudder-project.org/redmine/issues/12638))
  - Fixed: Compliance bar appears partially white in some graphes
    ([\#12643](https://www.rudder-project.org/redmine/issues/12643))
  - Fixed: Directive and Rule tree filter are very slow
    ([\#12650](https://www.rudder-project.org/redmine/issues/12650))
  - Fixed: While adding network in General settings CIDR notation validation fails in special cases
    ([\#12629](https://www.rudder-project.org/redmine/issues/12629))
  - Fixed: Delete directive confirmation popup should display the action to confirm
    ([\#12552](https://www.rudder-project.org/redmine/issues/12552))
  - Fixed: In technique editor, mouse cursor on top of technique parameter "use with" should be a carret 
    ([\#12266](https://www.rudder-project.org/redmine/issues/12266))

#### Generic methods

  - Fixed: Reporting context is not set correctly when using an iterator somewhere
    ([\#12693](https://www.rudder-project.org/redmine/issues/12693))

#### Web - Nodes & inventories

  - Fixed: Extend groups search capabilities for complex JSON Properties / JsonPath
    ([\#9299](https://www.rudder-project.org/redmine/issues/9299))
  - Fixed: cannot add two node properties at the same time from inventory
    ([\#12760](https://www.rudder-project.org/redmine/issues/12760))
  - Fixed: Slackware is not known by Rudder
    ([\#12707](https://www.rudder-project.org/redmine/issues/12707))
  - Fixed: Log with cause for a missing node is swallowed
    ([\#12724](https://www.rudder-project.org/redmine/issues/12724))

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

#### Web - Config management

  - Fixed: No reports on dsc only techniques on a Linux Node
    ([\#12754](https://www.rudder-project.org/redmine/issues/12754))
  - Fixed: Id of the ncf technique parameter used when generating Rudder technique parameter instead of it's name
    ([\#12743](https://www.rudder-project.org/redmine/issues/12743))
  - Fixed: When policies have wrong permissions (660), agent cannot be executed, and reload server fails, it breaks the generation, and prevent correcting the permission
    ([\#12732](https://www.rudder-project.org/redmine/issues/12732))
  - Fixed: Policies regeneration error when using a parameters with " char
    ([\#12674](https://www.rudder-project.org/redmine/issues/12674))
  - Fixed: "Safelly" typo in logs
    ([\#12635](https://www.rudder-project.org/redmine/issues/12635))

#### Technique editor - API

  - Fixed: Technique Editor may ignores some error when authenticating, leading to unauthorized access
    ([\#12720](https://www.rudder-project.org/redmine/issues/12720))

#### Web - Compliance & node report

  - Fixed: ${const.dollar} in generic method parameter leads to missing report
    ([\#12616](https://www.rudder-project.org/redmine/issues/12616))

#### Packaging

  - Fixed: .pyc file are not cleand up during postinst
    ([\#12634](https://www.rudder-project.org/redmine/issues/12634))
  - Fixed: Build fail because on non existent man3 directory
    ([\#12632](https://www.rudder-project.org/redmine/issues/12632))
  - Fixed: Error during postinst on upgrade to 4.3
    ([\#12583](https://www.rudder-project.org/redmine/issues/12583))
  - Fixed: Cleanup agent makefile
    ([\#12449](https://www.rudder-project.org/redmine/issues/12449))
  - Fixed: ncf script traceback error
    ([\#12633](https://www.rudder-project.org/redmine/issues/12633))

#### System integration

  - Fixed: apache overwrites error response from Rudder
    ([\#12747](https://www.rudder-project.org/redmine/issues/12747))
  - Fixed: Webapp log file have been renamed from stderrout.log to jetty.log
    ([\#12607](https://www.rudder-project.org/redmine/issues/12607))

#### Agent

  - Fixed: jobScheduler does not work when the first non-loopback interface has no ip address
    ([\#12262](https://www.rudder-project.org/redmine/issues/12262))

#### Documentation

  - Fixed: Documentaiton should use full path to rudder-pkg for command examples
    ([\#12771](https://www.rudder-project.org/redmine/issues/12771))
  - Fixed: Adding missings informations for Windows plugin installation
    ([\#12748](https://www.rudder-project.org/redmine/issues/12748))
  - Fixed: Restricted java security policy breaks Rudder (class configured for Cipher(provider: BC)cannot be found)
    ([\#12606](https://www.rudder-project.org/redmine/issues/12606))
  - Fixed: Fix various typos in ncf doc
    ([\#12570](https://www.rudder-project.org/redmine/issues/12570))

#### Technique editor - UI/UX

  - Fixed: Broken css when technique name is long
    ([\#12545](https://www.rudder-project.org/redmine/issues/12545))

#### System techniques

  - Fixed: System Techniques must not be added by reload technique, only updated, else they are duplicated
    ([\#12765](https://www.rudder-project.org/redmine/issues/12765))

#### Security

  - Fixed: JS sandbox permission must be defined in a file
    ([\#12450](https://www.rudder-project.org/redmine/issues/12450))
  - Fixed: Remove max concurrent session limit to avoid denial of services
    ([\#12581](https://www.rudder-project.org/redmine/issues/12581))

#### Performance and scalability

  - Fixed: Unused formatter in policy generation spend a bit of time in policy generation
    ([\#12735](https://www.rudder-project.org/redmine/issues/12735))
  - Fixed: Moving policies to their final position (last step of policies writing) could be improved
    ([\#12730](https://www.rudder-project.org/redmine/issues/12730))
  - Fixed: We are missing a lot of timing measurement in policy generation
    ([\#12725](https://www.rudder-project.org/redmine/issues/12725))

#### Techniques

  - Fixed: Load modules from local ncf in Rudder policies
    ([\#12774](https://www.rudder-project.org/redmine/issues/12774))
  - Fixed: Process management: stopped sends multiple reports.
    ([\#11683](https://www.rudder-project.org/redmine/issues/11683))
  - Fixed: SSH Configuration Technique on AIX does not reload correctly sshd service when there's been a change
    ([\#12745](https://www.rudder-project.org/redmine/issues/12745))
  - Fixed: Misleading error message in Services technique when range of number of process could not be repaired
    ([\#12713](https://www.rudder-project.org/redmine/issues/12713))
  - Fixed: Wrong reporting in "ManagekeyValue" technique
    ([\#12603](https://www.rudder-project.org/redmine/issues/12603))
  - Fixed: Enforce checkbox tooltip in groupmanagement technique is misleading
    ([\#12670](https://www.rudder-project.org/redmine/issues/12670))
  - Fixed: Missing report if two mountounts with the same target
    ([\#12647](https://www.rudder-project.org/redmine/issues/12647))
  - Fixed: Add zypper pattern option in package Technique.
    *please note that it does not work yet and will be available in next release 4.3.3*
    ([\#12700](https://www.rudder-project.org/redmine/issues/12700))
  - Fixed: Missing report when we cannot change home directory in users technique
    ([\#12555](https://www.rudder-project.org/redmine/issues/12555))
  - Fixed: Typo in generic method File content
    ([\#12507](https://www.rudder-project.org/redmine/issues/12507))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Daniel Fuleki
 * Janos Mattyasovszky
 * Ilan COSTA
 * Vincent DAVY

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.3.1" > </a> Rudder 4.3.1 (2018-05-04)

### Changes

#### Web - UI & UX

  - Make the compliance graph clickable
    ([\#12429](https://www.rudder-project.org/redmine/issues/12429))

#### Generic methods

  - Add generic methods to assign monitoring templates and parameters to nodes
    ([\#12517](https://www.rudder-project.org/redmine/issues/12517))

#### Documentation

  - Document the behavior of inventory hooks
    ([\#8335](https://www.rudder-project.org/redmine/issues/8335))

#### Miscellaneous

  - Add tests for sshKeyDistribution technique
    ([\#12455](https://www.rudder-project.org/redmine/issues/12455))

#### Techniques

  - New rudder technique : SNMP configuration to monitor the rudder agent health
    ([\#12501](https://www.rudder-project.org/redmine/issues/12501))
  - Add a system technique handling monitoring files sharing
    ([\#12519](https://www.rudder-project.org/redmine/issues/12519))

### Bug fixes

#### Technique editor - UI/UX

  - Fixed: The filter field in the technique editor should not be monospace
    ([\#12081](https://www.rudder-project.org/redmine/issues/12081))

#### Web - UI & UX

  - Fixed: Missing border in Default policy mode setting
    ([\#12236](https://www.rudder-project.org/redmine/issues/12236))
  - Fixed: Inconsistent font for status of rule in accept new node page, when looking at the Rules to be applied
    ([\#12364](https://www.rudder-project.org/redmine/issues/12364))
  - Fixed: Switch's css is broken on the Api accounts page
    ([\#12518](https://www.rudder-project.org/redmine/issues/12518))
  - Fixed: Add space between filter and Event logs table
    ([\#12515](https://www.rudder-project.org/redmine/issues/12515))
  - Fixed: CSS of txt/json inputs is broken
    ([\#12514](https://www.rudder-project.org/redmine/issues/12514))
  - Fixed: Add margin between selects and button groups in Archives page
    ([\#12513](https://www.rudder-project.org/redmine/issues/12513))
  - Fixed: Buttons don't follow a straight design
    ([\#12512](https://www.rudder-project.org/redmine/issues/12512))

#### Generic methods

  - Fixed: service restart uses an undefined variable
    ([\#12553](https://www.rudder-project.org/redmine/issues/12553))

#### Web - Config management

  - Fixed: Wrong parameter used to create dsc ncf techniques
    ([\#12533](https://www.rudder-project.org/redmine/issues/12533))

#### Documentation

  - Fixed: Wrong service name in agent install instruction in 4.3
    ([\#12569](https://www.rudder-project.org/redmine/issues/12569))
  - Fixed: Typo beeing -> being in rudder manual
    ([\#12506](https://www.rudder-project.org/redmine/issues/12506))
  - Fixed: Add a favicon for Rudder by example
    ([\#12490](https://www.rudder-project.org/redmine/issues/12490))

#### Miscellaneous

  - Fixed: wrong import in ssh-key-distribution tests
    ([\#12511](https://www.rudder-project.org/redmine/issues/12511))

#### Packaging

  - Fixed: Fix flask version during build
    ([\#12541](https://www.rudder-project.org/redmine/issues/12541))
  - Fixed: rudder-pkg python3 issue
    ([\#12504](https://www.rudder-project.org/redmine/issues/12504))

#### Technique editor - API

  - Fixed: Broken reporting for non-applicable generic methods
    ([\#12542](https://www.rudder-project.org/redmine/issues/12542))

#### System integration

  - Fixed: apache_acl file is remplaced, even on relay with no http
    ([\#12530](https://www.rudder-project.org/redmine/issues/12530))

#### System techniques

  - Fixed: monitoring_hook do no exist in initial promises
    ([\#12563](https://www.rudder-project.org/redmine/issues/12563))
  - Fixed: Don't stop agent execution when uuid is missing on non community agent
    ([\#12529](https://www.rudder-project.org/redmine/issues/12529))
  - Fixed: Access rules on Rudder servers/relays prevent in most case the server from downloading/connecting on itself
    ([\#12521](https://www.rudder-project.org/redmine/issues/12521))

#### Techniques

  - Fixed: A rudder relay or server, with no nodes behind it, does not share ncf
    ([\#12465](https://www.rudder-project.org/redmine/issues/12465))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Janos Mattyasovszky

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.3.0" > </a> Rudder 4.3.0 (2018-04-19)

### Changes

#### Web - UI & UX

  - Modify the mouse cursor when hovering the chart
    ([\#12438](https://www.rudder-project.org/redmine/issues/12438))
  - Allow to search on machine type in search nodes request
    ([\#12380](https://www.rudder-project.org/redmine/issues/12380))
  - NodeGroupId picker for subgroup selection
    ([\#12311](https://www.rudder-project.org/redmine/issues/12311))
  - Make dashboard graphs clickable
    ([\#12358](https://www.rudder-project.org/redmine/issues/12358))

#### Generic methods

  - Make reporting work when targeting several time the same item with several generic method
    ([\#12414](https://www.rudder-project.org/redmine/issues/12414))
  - Synchronize ncf stdlib with cfengine 3.10.3 stdlib
    ([\#12384](https://www.rudder-project.org/redmine/issues/12384))

#### Technique editor - Techniques

  - Add import/export buttons to the technique editor
    ([\#12280](https://www.rudder-project.org/redmine/issues/12280))

#### Documentation

  - Add a "Rudder by example" guide to the documentation
    ([\#12383](https://www.rudder-project.org/redmine/issues/12383))

#### Agent

  - Add libacl to Rudder agent
    ([\#12270](https://www.rudder-project.org/redmine/issues/12270))

#### Packaging

  - Oracle jdk url has changed but not in ppa
    ([\#12479](https://www.rudder-project.org/redmine/issues/12479))
  - Disable default logger in ncf
    ([\#12425](https://www.rudder-project.org/redmine/issues/12425))

#### Relay server or API

  - Make Groups and Rules API accessible for internal use
    ([\#12419](https://www.rudder-project.org/redmine/issues/12419))

### Bug fixes

#### Web - UI & UX

  - Fixed: Lifecycle UI elements (dropdown menu & display) looks bad
    ([\#12048](https://www.rudder-project.org/redmine/issues/12048))
  - Fixed: Node agent schedule cannot be changed due to a JS Error
    ([\#12388](https://www.rudder-project.org/redmine/issues/12388))

#### Generic methods

  - Fixed: Permissions dirs recursive has a wrong rename tag
    ([\#12437](https://www.rudder-project.org/redmine/issues/12437))
  - Fixed: service_restart_if has two deprecation tags
    ([\#12435](https://www.rudder-project.org/redmine/issues/12435))

#### Technique editor - Techniques

  - Fixed: Technique editor returning an error when saving
    ([\#12464](https://www.rudder-project.org/redmine/issues/12464))

#### plugin-cfe-enterprise

  - Fixed: Compute SHA key, and change key identification for enterprise node
    ([\#12458](https://www.rudder-project.org/redmine/issues/12458))

#### Web - Config management

  - Fixed: (breaking change) In Windows Agent, a '\' in a directive parameter value is escaped but it should not
    ([\#12390](https://www.rudder-project.org/redmine/issues/12390))

#### Miscellaneous

  - Fixed: broken reporting for ssh key distribution technique
    ([\#12444](https://www.rudder-project.org/redmine/issues/12444))
  - Fixed: Report missing if no password given in User technique
    ([\#12422](https://www.rudder-project.org/redmine/issues/12422))
  - Fixed: wrong xenstore-read path on (at least) ubuntu
    ([\#12376](https://www.rudder-project.org/redmine/issues/12376))

#### Packaging

  - Fixed: rpm fails to build on aix
    ([\#12480](https://www.rudder-project.org/redmine/issues/12480))
  - Fixed: Problem: nothing provides libyaml needed by rudder-agent-1398866025:4.3.0.rc3-1.SLES.12.x86_64
    ([\#12461](https://www.rudder-project.org/redmine/issues/12461))

#### Plugins

  - Fixed: rudder-pkg does not allow to install/update/remove several plugin at once
    ([\#12330](https://www.rudder-project.org/redmine/issues/12330))

#### Security

  - Fixed: Failed generation with "Could not initialize class javax.crypto.JceSecurity"
    ([\#12448](https://www.rudder-project.org/redmine/issues/12448))

#### Server components

  - Fixed: Root server can be disable with node lifecycle "ignore" "set empty policies"
    ([\#12324](https://www.rudder-project.org/redmine/issues/12324))

#### Techniques

  - Fixed: When upgrading from 4.1 to 4.3, reports from Rudder Techniques break reporting
    ([\#12398](https://www.rudder-project.org/redmine/issues/12398))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Janos Mattyasovszky

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.3.0.rc3" > </a> Rudder 4.3.0.rc3 (2018-04-10)

### Changes

#### Web - UI & UX

  - Make API account page pluggable
    ([\#12375](https://www.rudder-project.org/redmine/issues/12375))

#### Generic methods

  - Create hook ncf methods that can be used in pre-/post-run hooks
    ([\#11857](https://www.rudder-project.org/redmine/issues/11857))

#### Documentation

  - Update doc for 4.3
    ([\#12347](https://www.rudder-project.org/redmine/issues/12347))

#### Miscellaneous

  - Update the techniques tests
    ([\#12346](https://www.rudder-project.org/redmine/issues/12346))

### Bug fixes

#### Generic methods

  - Fixed: Canonify job-id in classes for scheduler methods
    ([\#12382](https://www.rudder-project.org/redmine/issues/12382))
  - Fixed: Job cheduler methods whith mode are broken
    ([\#12378](https://www.rudder-project.org/redmine/issues/12378))
  - Fixed: Unexpected report on several methods due to non-executed bundles
    ([\#12368](https://www.rudder-project.org/redmine/issues/12368))
  - Fixed: Missing report for "Shared file to node"
    ([\#12377](https://www.rudder-project.org/redmine/issues/12377))
  - Fixed: Some methods which let another one do the reporting are broken in 4.3
    ([\#12371](https://www.rudder-project.org/redmine/issues/12371))

#### Web - Config management

  - Fixed: Cannot generate policies when there is a loop in policy server hierharchy (stackoverflow)
    ([\#12359](https://www.rudder-project.org/redmine/issues/12359))

#### Web - Nodes & inventories

  - Fixed: LDAP query checker must succeed when criteria is empty
    ([\#12343](https://www.rudder-project.org/redmine/issues/12343))
  - Fixed: "Error when trying to find dependencies for that group" when accepting a node
    ([\#12338](https://www.rudder-project.org/redmine/issues/12338))

#### Generic methods - File Management

  - Fixed: Jinja2 templating: Shows error in output even when successful
    ([\#12379](https://www.rudder-project.org/redmine/issues/12379))
  - Fixed: Missing report in Manage keys-values in file because of invalid conditions in ensure_key_value_option
    ([\#12345](https://www.rudder-project.org/redmine/issues/12345))

#### Documentation

  - Fixed: Remove references to foswiki in the doc
    ([\#12363](https://www.rudder-project.org/redmine/issues/12363))

#### Packaging

  - Fixed: rudder-agent fails to build on debian 7/ubuntu 12.04
    ([\#12362](https://www.rudder-project.org/redmine/issues/12362))
  - Fixed: Rudder agent fails to build on some os
    ([\#12353](https://www.rudder-project.org/redmine/issues/12353))

#### Initial promises & sys tech

  - Fixed: Error at policy generation when using sudoParameter technique with Rudder 4.3
    ([\#12339](https://www.rudder-project.org/redmine/issues/12339))

#### System integration

  - Fixed: Temp folders of jetty are piling up in /var/rudder/tmp/jetty 
    ([\#11987](https://www.rudder-project.org/redmine/issues/11987))

#### Security

  - Fixed: Bad session counting block user login after three session created
    ([\#12367](https://www.rudder-project.org/redmine/issues/12367))

#### Server components

  - Fixed: sysconfig/apache2 modifications get removed
    ([\#11153](https://www.rudder-project.org/redmine/issues/11153))

#### Techniques

  - Fixed: RudderUniqueId is not replaced when using OUTPATH in metadata, causing no report in File Permissions
    ([\#12344](https://www.rudder-project.org/redmine/issues/12344))
  - Fixed: Time settings directive configuration not accessible to non-root users
    ([\#12303](https://www.rudder-project.org/redmine/issues/12303))
  - Fixed: Correct path to permlist file in File Permissions in 4.3
    ([\#12348](https://www.rudder-project.org/redmine/issues/12348))
  - Fixed: Unsupported key types are silently ignored in ssh key management technique
    ([\#8618](https://www.rudder-project.org/redmine/issues/8618))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Janos Mattyasovszky
 * Florian Heigl
 * Rob Pomeroy

This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

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

