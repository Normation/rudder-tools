# General information

Rudder 4.1 is currently a maintained **'ESR' (Extended Support Release)** of Rudder.

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Main new features in Rudder 4.1:**

  - Organize Rules and Directives by setting key=value tags (using UI or REST API)
  - Add or remove Node properties directly in the web interface
  - Share files between Nodes (via new generic methods)
  - Trigger agent runs on Nodes via relay servers without modifying your network configuration
  - Many Techniques renamed to be more explicit and now displayed in alphabetical order to make finding them easier
  - Customize Rudder behavior with the new hook system based on server-side actions
  - Improved user experience, overall improvement of web performance (web resources are cached), many minor UI tweaks  (page titles, forms, buttons, filters, ...)
  - Switched to a new graph rendering library, fixing all performance issues with Firefox
  - Agent package now embeds OpenSSL on unmaintained Debian/Ubuntu distributions (Debian 5, Debian 6, Ubuntu 12.04, Ubuntu 12.10) as well as unmaintained RHEL/SLES distributions.
  - New plugin packaging system for easier plugin management
  - New plugin ‘data sources’: Automatically import Node properties from external REST APIs

**Installing, upgrading and testing**

  - Install docs:
    https://www.rudder-project.org/doc-4.1/_installation.html
  - Upgrade docs:
    https://www.rudder-project.org/doc-4.1/_upgrade.html
  - Download links: https://www.rudder-project.org/site/get-rudder/downloads/

We also recommend using the [Rudder
Vagrant](https://github.com/Normation/rudder-vagrant) config if you want
a quick and easy way to get an installation for testing.

**IMPORTANT:** Rudder 4.1 requires Java RE (version 8 at least)

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server and Rudder relay: **Debian 7, Debian 8, Debian 9, RHEL/CentOS 6, RHEL/CentOS 7
    (64 bits), SLES 11, SLES 12, Ubuntu 14.04, Ubuntu 16.04**
  - Rudder agent: all of the above plus **Debian 5, Debian 6,
    RHEL/CentOS 3, RHEL/CentOS 5, CentOS 7 (32 bits), Fedora 18, SLES
    10, SLES 12, Ubuntu 10.04, Ubuntu 12.04, Ubuntu 12.10**
  - Rudder agent (binary packages available from
    [Normation](http://www.normation.com)): **Windows Server 2008-2012,
    AIX 5-6-7**

**Note**: As of Rudder 4.1, the rudder-agent-thin and rudder-server-relay packages are
no longer available in Debian 5, Debian 6, Ubuntu 10.04, Ubuntu 12.10, Fedora 18, 
RHEL/CentOS 3 and RHEL/CentOS 5

# Changelogs

## <a name="4.1.11" > </a> Rudder 4.1.11 (2018-04-19)

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

#### Server components

  - Fixed: Agent components should not try to load failsafe.cf when policies are broken
    ([\#12243](https://www.rudder-project.org/redmine/issues/12243))
  - Fixed: sysconfig/apache2 modifications get removed
    ([\#11153](https://www.rudder-project.org/redmine/issues/11153))

#### Techniques

  - Fixed: Time settings directive configuration not accessible to non-root users
    ([\#12303](https://www.rudder-project.org/redmine/issues/12303))
  - Fixed: Unsupported key types are silently ignored in ssh key management technique
    ([\#8618](https://www.rudder-project.org/redmine/issues/8618))
  - Fixed: Missing report for component "Post-modification hook" when cleaning files
    ([\#12297](https://www.rudder-project.org/redmine/issues/12297))
  - Fixed: Missing report in Group Management 
    ([\#12214](https://www.rudder-project.org/redmine/issues/12214))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Ilan COSTA
 * Janos Mattyasovszky
 * Florian Heigl
 * Rob Pomeroy

This is a bug fix release in the 4.1 series and therefore all installations of 4.1.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.1.10" > </a> Rudder 4.1.10 (2018-02-23)

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
  - Fixed: Upgrade Java version used when building webapp on old debian versions, since oracle jvm links has changed
    ([\#11981](https://www.rudder-project.org/redmine/issues/11981))
  - Fixed: Rudder root on SLES12 shows LDAP error during installation
    ([\#10454](https://www.rudder-project.org/redmine/issues/10454))

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

#### API

  - Fixed: Api does not fail on bad JSON
    ([\#5931](https://www.rudder-project.org/redmine/issues/5931))

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

#### Techniques

  - Fixed: Typo in templating technique
    ([\#12126](https://www.rudder-project.org/redmine/issues/12126))
  - Fixed: Typo in tooltip of File content (from remote template) for path of file
    ([\#12123](https://www.rudder-project.org/redmine/issues/12123))
  - Fixed: The technique file copy from shared folder reports file source instead of file destination
    ([\#6564](https://www.rudder-project.org/redmine/issues/6564))
  - Fixed: Group management technique silently changes the group gid
    ([\#11863](https://www.rudder-project.org/redmine/issues/11863))
  - Fixed: sharedfile_to_node reports repaired even if it fails 
    ([\#11836](https://www.rudder-project.org/redmine/issues/11836))

#### Server components

  - Fixed: There is a /var/cfengine/inputs on a Rudder server
    ([\#8625](https://www.rudder-project.org/redmine/issues/8625))
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
  - Fixed: Configuration file of Rudder mention that we may change "LDAP DIT configuration", which is wrong
    ([\#10664](https://www.rudder-project.org/redmine/issues/10664))
  - Fixed: send-clean.sh blocks on inventory parsing error
    ([\#10019](https://www.rudder-project.org/redmine/issues/10019))

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

This is a bug fix release in the 4.1 series and therefore all installations of 4.1.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.1.9" > </a> Rudder 4.1.9 (2017-12-12)

### Changes

#### Packaging

  - Upgrade openssl to 1.0.2m
    ([\#11734](https://www.rudder-project.org/redmine/issues/11734))
  - Change rudder-techniques ncf depdency to a correct version
    ([\#11692](https://www.rudder-project.org/redmine/issues/11692))

#### Web - UI & UX

  - Change how Directive priority is displayed
    ([\#11725](https://www.rudder-project.org/redmine/issues/11725))
  - On Nodes table, put the link to node details on node's name instead of on magnifying glass icon
    ([\#11643](https://www.rudder-project.org/redmine/issues/11643))

#### Architecture - Refactoring

  - Clean-up unused imports in rudder
    ([\#11685](https://www.rudder-project.org/redmine/issues/11685))
  - Make allocated memory for build configurable
    ([\#11688](https://www.rudder-project.org/redmine/issues/11688))

#### Architecture - Dependencies

  - sealerate should be scoped "provided"
    ([\#11781](https://www.rudder-project.org/redmine/issues/11781))

#### Agent

  - Create a command to display system classes
    ([\#11049](https://www.rudder-project.org/redmine/issues/11049))

### Bug fixes

#### Web - UI & UX

  - Fixed: Remove limit to have at least 3 characters in all entities names (Rules/Directives/categories ...)
    ([\#11801](https://www.rudder-project.org/redmine/issues/11801))
  - Fixed: CentOS is written "Centos" in the OS graph on the dashboard
    ([\#11652](https://www.rudder-project.org/redmine/issues/11652))
  - Fixed: Some icons in the interface look pixelized on hidpi screens
    ([\#11237](https://www.rudder-project.org/redmine/issues/11237))
  - Fixed: Fix some CSS issues in Rule's compliance tables
    ([\#11679](https://www.rudder-project.org/redmine/issues/11679))

#### Web - Config management

  - Fixed: Missing node id in log message on generaction error
    ([\#11819](https://www.rudder-project.org/redmine/issues/11819))

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
  - Fixed: fetch git branch before checkout when building rudder-doc
    ([\#11697](https://www.rudder-project.org/redmine/issues/11697))
  - Fixed: Use new ncf branches in rudder-doc
    ([\#11693](https://www.rudder-project.org/redmine/issues/11693))
  - Fixed: "Quick installation" section on the Rudder doc
    ([\#11668](https://www.rudder-project.org/redmine/issues/11668))

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

  - Fixed: Unexpected report for Send inventories to CMDB after #11257
    ([\#11648](https://www.rudder-project.org/redmine/issues/11648))
  - Fixed: rudder service and thus cf-execd is never restarted / ensure running
    ([\#11303](https://www.rudder-project.org/redmine/issues/11303))

#### System integration

  - Fixed: rudder-init fails to report memory errors from jetty start
    ([\#8165](https://www.rudder-project.org/redmine/issues/8165))
  - Fixed: When we have a /var full, Rudder LDAP or Postgres can be corrupted
    ([\#11125](https://www.rudder-project.org/redmine/issues/11125))
  - Fixed: Fusioninventory task Deploy is missing a dependency to File-Copy-Recursive
    ([\#11701](https://www.rudder-project.org/redmine/issues/11701))
  - Fixed: rudder-pkg should not preserve owner when extracting plugin
    ([\#11423](https://www.rudder-project.org/redmine/issues/11423))
  - Fixed: Duration of logrotate for /var/log/rudder/  is too long making /var/log too big
    ([\#10912](https://www.rudder-project.org/redmine/issues/10912))
  - Fixed: Allowed network 0.0.0.0/0 is not currently supported by Apache
    ([\#11226](https://www.rudder-project.org/redmine/issues/11226))

#### Policies

  - Fixed: Generic method file_ensure_key_value_present_in_ini_section.cf has leaky classes, resulting in invalid results
    ([\#11792](https://www.rudder-project.org/redmine/issues/11792))
  - Fixed: Boken 4.1 ncf with 3.1 agents
    ([\#11779](https://www.rudder-project.org/redmine/issues/11779))
  - Fixed: file_from_string_mustache inserts only ${content}
    ([\#11744](https://www.rudder-project.org/redmine/issues/11744))
  - Fixed: eval usage is not compatible with CFEngine < 3.9
    ([\#11729](https://www.rudder-project.org/redmine/issues/11729))

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

  - Fixed: The time synchronization technique doesn't work on AIX
    ([\#6964](https://www.rudder-project.org/redmine/issues/6964))
  - Fixed: Time Management Settings cannot set the timezone to UTC
    ([\#6998](https://www.rudder-project.org/redmine/issues/6998))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Janos Mattyasovszky

This is a bug fix release in the 4.1 series and therefore all installations of 4.1.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="4.1.8" > </a> Rudder 4.1.8 (2017-10-26)

### Changes

#### Initial promises & sys tech

  - Do not send inventory if a forwarder/uploader daemon exists
    ([\#11257](https://www.rudder-project.org/redmine/issues/11257))

#### Documentation

  - Document debian 9 support for 4.1
    ([\#11382](https://www.rudder-project.org/redmine/issues/11382))
  - Better explain configuration drift reporting
    ([\#11338](https://www.rudder-project.org/redmine/issues/11338))

#### Miscellaneous

  - Refactor policy generation tests
    ([\#11397](https://www.rudder-project.org/redmine/issues/11397))

#### Agent

  - Node properties local override
    ([\#11618](https://www.rudder-project.org/redmine/issues/11618))
  - Add a rudder agent diff command
    ([\#11099](https://www.rudder-project.org/redmine/issues/11099))

#### Techniques

  - UserManagement technique does not allow to change the gid of an existing user
    ([\#11596](https://www.rudder-project.org/redmine/issues/11596))
  - Add a new syntax for rudder parameters
    ([\#11405](https://www.rudder-project.org/redmine/issues/11405))

### Bug fixes

#### Web - UI & UX

  - Fixed: Screen estate in compliance graph
    ([\#10761](https://www.rudder-project.org/redmine/issues/10761))
  - Fixed: Global parameters UI now showing Edit/Delete button on long lines
    ([\#11585](https://www.rudder-project.org/redmine/issues/11585))
  - Fixed: Update Directive popup is broken on firefox 38.6.1esr 
    ([\#11584](https://www.rudder-project.org/redmine/issues/11584))
  - Fixed: Cannot select version of directive to create if technique desciption contains curly braces 
    ([\#11393](https://www.rudder-project.org/redmine/issues/11393))

#### Web - Nodes & inventories

  - Fixed: Groups are not reloaded after restoring from archive
    ([\#11244](https://www.rudder-project.org/redmine/issues/11244))

#### Web - Config management

  - Fixed: Parameter name requires at least 3 characters
    ([\#11588](https://www.rudder-project.org/redmine/issues/11588))
  - Fixed: There is no way to remove a Directive based on a Technique that no longer exists
    ([\#5203](https://www.rudder-project.org/redmine/issues/5203))

#### Documentation

  - Fixed: Manually restoring permissions for NCF after archive import is broken
    ([\#11414](https://www.rudder-project.org/redmine/issues/11414))
  - Fixed: Dead link in doc
    ([\#11579](https://www.rudder-project.org/redmine/issues/11579))
  - Fixed: Missing documentation on Directive ordering
    ([\#11289](https://www.rudder-project.org/redmine/issues/11289))
  - Fixed: Wrong formatting in doc to build agent
    ([\#11274](https://www.rudder-project.org/redmine/issues/11274))

#### Agent

  - Fixed: Xen domU detection issues with pvops kernels.
    ([\#10787](https://www.rudder-project.org/redmine/issues/10787))
  - Fixed: Inventory uploaded multiple times after reinit
    ([\#11580](https://www.rudder-project.org/redmine/issues/11580))

#### Packaging

  - Fixed: Error at installation of Rudder 4.1 on centos 6
    ([\#11628](https://www.rudder-project.org/redmine/issues/11628))
  - Fixed: Build on Deb7 and ubuntu14.04 fails because jdk8u144 is unavalaible
    ([\#11626](https://www.rudder-project.org/redmine/issues/11626))
  - Fixed: We should not try to edit /etc/cron.d/rudder-agent on AIX
    ([\#11595](https://www.rudder-project.org/redmine/issues/11595))
  - Fixed: Warning about zip dependency is at top of installation of plugin
    ([\#11398](https://www.rudder-project.org/redmine/issues/11398))
  - Fixed: Plugin postint are not run after a rudder upgrade
    ([\#11430](https://www.rudder-project.org/redmine/issues/11430))
  - Fixed: rudder-techniques requires a recent ncf version
    ([\#11411](https://www.rudder-project.org/redmine/issues/11411))
  - Fixed: Cannot save plugin status during initial install
    ([\#11395](https://www.rudder-project.org/redmine/issues/11395))
  - Fixed: When ugrading Rudder, the Windows plugins is not enabled anymore
    ([\#11385](https://www.rudder-project.org/redmine/issues/11385))
  - Fixed: PORT in /etc/default/rudder-slapd is ignored
    ([\#11331](https://www.rudder-project.org/redmine/issues/11331))

#### Initial promises & sys tech

  - Fixed: Tidy expected reports does have a too big TTL
    ([\#11591](https://www.rudder-project.org/redmine/issues/11591))
  - Fixed: Error message on classical windows agent when getting environement variable
    ([\#11435](https://www.rudder-project.org/redmine/issues/11435))

#### API

  - Fixed: Archives API list returns date with wrong format
    ([\#11408](https://www.rudder-project.org/redmine/issues/11408))

#### Techniques

  - Fixed: Allow variable as directive parameters in regexp validated inputs 
    ([\#11449](https://www.rudder-project.org/redmine/issues/11449))
  - Fixed: generic_variable_definition inserts spaces in multi lined values
    ([\#11613](https://www.rudder-project.org/redmine/issues/11613))
  - Fixed: group management technique doesn't ensure optional user is in group
    ([\#8739](https://www.rudder-project.org/redmine/issues/8739))
  - Fixed: Incomplete description of the behaviour of technique copyGitFile, that may result in broken permissions of whole folder
    ([\#11422](https://www.rudder-project.org/redmine/issues/11422))
  - Fixed: File content (key/value format) technique allows white space before separator but not after it
    ([\#11087](https://www.rudder-project.org/redmine/issues/11087))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Janos Mattyasovszky
 * Florian Heigl
 * Hamlyn Mootoo

This is a bug fix release in the 4.1 series and therefore all installations of 4.1.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.


## <a name="4.1.7" > </a> Rudder 4.1.7 (2017-09-07)

### Changes

#### Packaging

  - Add Debian 9 support 
    (CI/internal changes and [\#11262](https://www.rudder-project.org/redmine/issues/11262))

#### Web - UI & UX

  - Fold automatically Group categories if there are too many of them 
    ([\#11323](https://www.rudder-project.org/redmine/issues/11323))

#### Miscellaneous

  - New technique to centralize creation Variable 
    ([\#11148](https://www.rudder-project.org/redmine/issues/11148))
  - New technique to read variables from a JSON file
    ([\#11149](https://www.rudder-project.org/redmine/issues/11149))

#### Agent

  - Upgrade openssl to 1.0.2l
    ([\#11279](https://www.rudder-project.org/redmine/issues/11279))

### Bug fixes

#### Web - UI & UX

  - Fixed: Node key display differences
    ([\#10852](https://www.rudder-project.org/redmine/issues/10852))
  - Fixed: The description of the group tree mentions drag and drop which does not work
    ([\#11287](https://www.rudder-project.org/redmine/issues/11287))

#### Web - Nodes & inventories

  - Fixed: Inventory endpoint info api is reporting saturated off by one
    ([\#11330](https://www.rudder-project.org/redmine/issues/11330))

#### Documentation

  - Fixed: Missing doc about latest hooks in the manual
    ([\#11305](https://www.rudder-project.org/redmine/issues/11305))

#### Miscellaneous

  - Fixed: "compliance" user role is broken
    ([\#11185](https://www.rudder-project.org/redmine/issues/11185))

#### Web - Compliance & node report

  - Fixed: Missing agent reports after Rudder server restart
    ([\#11037](https://www.rudder-project.org/redmine/issues/11037))
  - Fixed: "no report" explanation is not correct in node details
    ([\#11270](https://www.rudder-project.org/redmine/issues/11270))

#### Packaging

  - Fixed: Pre/post upgrade scripts do not correctly save and restore plugins status with rudder-plugin
    ([\#11278](https://www.rudder-project.org/redmine/issues/11278))
  - Fixed: Remove rudder.8.gz from rudder-packages preventing build of man pages
    ([\#11258](https://www.rudder-project.org/redmine/issues/11258))
  - Fixed: Configuration of database password fails after install
    ([\#11253](https://www.rudder-project.org/redmine/issues/11253))

#### Initial promises & sys tech

  - Fixed: When running "rudder agent inventory", all other reports are missing on the server
    ([\#11285](https://www.rudder-project.org/redmine/issues/11285))

#### Agent

  - Fixed: Upgrade agent to CFEngine 3.10.2
    ([\#11288](https://www.rudder-project.org/redmine/issues/11288))
  - Fixed: Do not display components summary in non-full-compliance modes
    ([\#11324](https://www.rudder-project.org/redmine/issues/11324))
  - Fixed: 'rudder agent info' should report compliance mode (full-compliance / changes-only / reports-disabled)
    ([\#10649](https://www.rudder-project.org/redmine/issues/10649))
  - Fixed: When in changes only mode, with no heartbeat, 'rudder agent run' outputs 'error: Rudder agent was interrupted during execution by a fatal error.'
    ([\#9807](https://www.rudder-project.org/redmine/issues/9807))

#### Web - Maintenance

  - Fixed: Node compliances table is never archived
    ([\#11314](https://www.rudder-project.org/redmine/issues/11314))

#### Techniques

  - Fixed: Technique "Package sources and settings (APT)" does not support stretch
    ([\#11336](https://www.rudder-project.org/redmine/issues/11336))
  - Fixed: sudo management isn't update-safe
    ([\#9347](https://www.rudder-project.org/redmine/issues/9347))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Ilan Costa
  - Florian Heigl
  - Janos Mattyasovszky
  - Dmitry Svyatogorov

This is a bug fix release in the 4.1 ESR series and therefore all
installations of 4.1.x should be upgraded when possible.
When we release a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.


## <a name="4.1.6" > </a> Rudder 4.1.6 (2017-08-14)

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

#### Techniques

  - Create a file template technique
    ([\#9078](https://www.rudder-project.org/redmine/issues/9078))

#### System integration

  - Add node-post-acceptance hook 
    ([\#11218](https://www.rudder-project.org/redmine/issues/11218))

### Bug fixes

#### Web - UI & UX

  - Fixed: If a Rule is enabled but applies no Directive, it is displayed as Disabled
    ([\#11123](https://www.rudder-project.org/redmine/issues/11123))
  - Fixed: Wrong sort on compliance in tables
    ([\#11229](https://www.rudder-project.org/redmine/issues/11229))
  - Fixed: Disabled Rules status is invisible
    ([\#11205](https://www.rudder-project.org/redmine/issues/11205))
  - Fixed: In Directive details, tags input is broken on Iceweasel
    ([\#11118](https://www.rudder-project.org/redmine/issues/11118))
  - Fixed: Wrong XML identation in event log
    ([\#10951](https://www.rudder-project.org/redmine/issues/10951))
  - Fixed: Add a margin between the filters and the table in Technical logs tab
    ([\#11083](https://www.rudder-project.org/redmine/issues/11083))
  - Fixed: Repaired does not appear as yellow anymore
    ([\#11028](https://www.rudder-project.org/redmine/issues/11028))

#### Web - Nodes & inventories

  - Fixed: Impossible to delete a node when policy server has been deleted
    ([\#11231](https://www.rudder-project.org/redmine/issues/11231))
  - Fixed: When we manage a Windows 2016, we don't have the proper Windows version displayed
    ([\#11172](https://www.rudder-project.org/redmine/issues/11172))

#### Web - Config management

  - Fixed: Typo in generation error
    ([\#11232](https://www.rudder-project.org/redmine/issues/11232))
  - Fixed: Typo in unauthorized acces message
    ([\#11182](https://www.rudder-project.org/redmine/issues/11182))
  - Fixed: Cannot add a directive with a " in its name in Rule
    ([\#10754](https://www.rudder-project.org/redmine/issues/10754))

#### Documentation

  - Fixed: Put warnings (about dependencies for example) before install/upgrade instructions
    ([\#11162](https://www.rudder-project.org/redmine/issues/11162))
  - Fixed: Typo in rudder-setup usage in documentation
    ([\#11136](https://www.rudder-project.org/redmine/issues/11136))
  - Fixed: Wrong doc for restore of Rudder ldap on 4.1
    ([\#11127](https://www.rudder-project.org/redmine/issues/11127))
  - Fixed: Style broken in documention: upgrade_from_rudder_3_1_3_2_or_4_0
    ([\#11002](https://www.rudder-project.org/redmine/issues/11002))

#### Web - Compliance & node report

  - Fixed: Reporting on old technique fails in audit mode
    ([\#11152](https://www.rudder-project.org/redmine/issues/11152))
  - Fixed: /var/log/webapp/compliance/non-compliant-reports does not contain non-compliant (audit) report
    ([\#11223](https://www.rudder-project.org/redmine/issues/11223))

#### Packaging

  - Fixed: Backup of apache vhost by rudder-server-relay created in bad directory
    ([\#10860](https://www.rudder-project.org/redmine/issues/10860))
  - Fixed: if plugin is broken, we cannot upgrade it
    ([\#11064](https://www.rudder-project.org/redmine/issues/11064))
  - Fixed: When installing Rudder-Webapp, postinst script runs rudder-upgrade before initializing the git, and it can fail
    ([\#10990](https://www.rudder-project.org/redmine/issues/10990))
  - Fixed: Do not show instructions for rudder-node-to-relay on root setup
    ([\#10859](https://www.rudder-project.org/redmine/issues/10859))

#### Initial promises & sys tech

  - Fixed: Check permissions on /var/rudder files, particularly modified-files
    ([\#11110](https://www.rudder-project.org/redmine/issues/11110))
  - Fixed: Wrong stderr / stdout redirection of logs from rudder agent check in 4.1
    ([\#11044](https://www.rudder-project.org/redmine/issues/11044))

#### System integration

  - Fixed: Non normalize hooks env var names for node info
    ([\#11213](https://www.rudder-project.org/redmine/issues/11213))
  - Fixed: Bad semantic for system error on hooks
    ([\#11010](https://www.rudder-project.org/redmine/issues/11010))

#### Agent

  - Fixed: rudder agent factory-reset bugs
    ([\#10766](https://www.rudder-project.org/redmine/issues/10766))
  - Fixed: rudder agent update -q bad exit code
    ([\#11047](https://www.rudder-project.org/redmine/issues/11047))

#### Security

  - Fixed: JSESSION cookie should be "secure"
    ([\#11159](https://www.rudder-project.org/redmine/issues/11159))

#### Techniques

  - Fixed: Aix group technique
    ([\#11235](https://www.rudder-project.org/redmine/issues/11235))
  - Fixed: "Package management" technique missing "allow untrusted" switch
    ([\#10241](https://www.rudder-project.org/redmine/issues/10241))
  - Fixed: Directive: Services Management doesn't support AIX
    ([\#8752](https://www.rudder-project.org/redmine/issues/8752))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Ilan Costa
  - Florian Heigl
  - Maxime Longuet 
  - Janos Mattyasovszky
  - David Svejda
  - Dmitry Svyatogorov

This is a bug fix release in the 4.1 ESR series and therefore all
installations of 4.1.x should be upgraded when possible.
When we release a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.


## <a name="4.1.5" > </a> Rudder 4.1.5 (2017-06-22)

### Bug fixes

#### Initial promises & sys tech

  - Fixed: Broken rsyslog configuration in 4.1
    ([\#10982](https://www.rudder-project.org/redmine/issues/10982))

#### Miscellaneous

  - Fixed: No logs when (r)?syslog(-ng)? is restarted in 4.1
    ([\#10987](https://www.rudder-project.org/redmine/issues/10987))

### Release notes

Note: Rudder 4.1.4 was released but quickly withdrawn because of 
[\#10982](https://www.rudder-project.org/redmine/issues/10982).

This is a bug fix release in the 4.1 ESR series and therefore all
installations of 4.1.x should be upgraded when possible. When we release
a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.

## <a name="4.1.4" > </a> Rudder 4.1.4 (2017-06-21)

### Changes

#### Packaging

  - Log check-rudder-agent cron job output
    ([\#8438](https://www.rudder-project.org/redmine/issues/8438))

#### Architecture - Internal libs

  - Match non exaustive on workflow step: log on error
    ([\#10938](https://www.rudder-project.org/redmine/issues/10938))
  - Bad comparison in unique variable
    ([\#10825](https://www.rudder-project.org/redmine/issues/10825))

#### Documentation

  - Use a bigger favicon for Rudder documentation 
    ([\#10894](https://www.rudder-project.org/redmine/issues/10894))
  - Document the usage of the ansible plugin
    ([\#10854](https://www.rudder-project.org/redmine/issues/10854))

#### Agent

  - Create a rudder agent command to format old logs
    ([\#10708](https://www.rudder-project.org/redmine/issues/10708))

### Bug fixes

#### Web - UI & UX

  - Fixed: Broken display on directive screen on 3.1.20
    ([\#10923](https://www.rudder-project.org/redmine/issues/10923))
  - Fixed: Time since last generation is limited to hours
    ([\#9302](https://www.rudder-project.org/redmine/issues/9302))
  - Fixed: Node search input field are tiny and a nightmare to use
    ([\#10659](https://www.rudder-project.org/redmine/issues/10659))
  - Fixed: Directives tree overflows the page
    ([\#10735](https://www.rudder-project.org/redmine/issues/10735))

#### Documentation

  - Fixed: Agent build documentation in GitHub README is out of date
    ([\#10762](https://www.rudder-project.org/redmine/issues/10762))
  - Fixed: Document renaming of /opt/rudder/etc/ssl/rudder-webapp.crt in 4.1
    ([\#10833](https://www.rudder-project.org/redmine/issues/10833))
  - Fixed: Missing doc about required agent version for audit mode
    ([\#10811](https://www.rudder-project.org/redmine/issues/10811))

#### Web - Config management

  - Fixed: When hooks in policy-generation-node-ready or policy-generation-node-finished fails, there is no error in the generation
    ([\#10908](https://www.rudder-project.org/redmine/issues/10908))

#### Agent

  - Fixed: check-rudder-agent doesn't purge the lmdb file when run via cron
    ([\#10771](https://www.rudder-project.org/redmine/issues/10771))
  - Fixed: If component value starts with # , report is not outputed by rudder agent output
    ([\#10601](https://www.rudder-project.org/redmine/issues/10601))
  - Fixed: rudder agent start fails on sles12
    ([\#10810](https://www.rudder-project.org/redmine/issues/10810))

#### Initial promises & sys tech

  - Fixed: If syslog service is stopped, it is not restarted automatically by rudder-agent, so agent doesn't report anything
    ([\#8168](https://www.rudder-project.org/redmine/issues/8168))

#### Techniques

  - Fixed: The rpmPackageInstallation technique tries to install package-* instead of package when no version is specified
    ([\#9283](https://www.rudder-project.org/redmine/issues/9283))
  - Fixed: Improve generated inventory checks when inventory is missing
    ([\#10711](https://www.rudder-project.org/redmine/issues/10711))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Florian Heigl
  - Janos Mattyasovszky

This is a bug fix release in the 4.1 ESR series and therefore all
installations of 4.1.x should be upgraded when possible.
When we release a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.

## <a name="4.1.3" > </a> Rudder 4.1.3 (2017-05-23)

### Changes

#### Documentation

  - Update FAQ links in the doc
    ([\#10760](https://www.rudder-project.org/redmine/issues/10760))

### Bug fixes

#### Web - UI & UX

  - Fixed: When folding directive tree filter, the directive tree stays at its initial size
    ([\#10705](https://www.rudder-project.org/redmine/issues/10705))

#### Initial promises & sys tech

  - Fixed: During install, inventory generated into bad file path: /var/rudder/${inventory_path}
    ([\#10774](https://www.rudder-project.org/redmine/issues/10774))

### Release notes

This is a bug fix release in the 4.1 series and therefore all installations of 4.1 should be upgraded when possible. The current "esr" release is 3.1.*. When we release a new version of Rudder, it has been thoroughly tested, and we consider the release enterprise-ready for deployment


## <a name="4.1.2" > </a> Rudder 4.1.2 (2017-05-22)

### Changes

#### Architecture - Internal libs

  - Add a test on agent version parsing
    ([\#10726](https://www.rudder-project.org/redmine/issues/10726))

#### Documentation

  - Update server requirement with load test data
    ([\#10698](https://www.rudder-project.org/redmine/issues/10698))
  - Missing paragraph about rudder-setup installation
    ([\#10691](https://www.rudder-project.org/redmine/issues/10691))
  - Add an example of using a condition in the Technique creation tutorial
    ([\#10694](https://www.rudder-project.org/redmine/issues/10694))
  - Add Technique editor documentation
    ([\#10685](https://www.rudder-project.org/redmine/issues/10685))
  - Complete documentation introduction
    ([\#10681](https://www.rudder-project.org/redmine/issues/10681))
  - Translate the technical architecture part of intruduction
    ([\#10684](https://www.rudder-project.org/redmine/issues/10684))
  - Document fully and partially supported OS
    ([\#10679](https://www.rudder-project.org/redmine/issues/10679))
  - Document more precisely the generation process
    ([\#10671](https://www.rudder-project.org/redmine/issues/10671))
  - Add a "general presentation" chapter in documentation
    ([\#10673](https://www.rudder-project.org/redmine/issues/10673))
  - Add relay content for requirements section
    ([\#10674](https://www.rudder-project.org/redmine/issues/10674))
  - Improve policy mode documentation
    ([\#10667](https://www.rudder-project.org/redmine/issues/10667))
  - Extend node property documentation for templates
    ([\#10614](https://www.rudder-project.org/redmine/issues/10614))

#### Techniques

  - Improve readability of system techniques reports
    ([\#10632](https://www.rudder-project.org/redmine/issues/10632))

#### System integration

  - Create a hook for pre and post node deletion event
    ([\#10568](https://www.rudder-project.org/redmine/issues/10568))

### Bug fixes

#### Web - UI & UX

  - Fixed: Fix details in Technique editor doc
    ([\#10699](https://www.rudder-project.org/redmine/issues/10699))
  - Fixed: Cannot generate promises when invalid character in a group name (double quote here)
    ([\#10745](https://www.rudder-project.org/redmine/issues/10745))
  - Fixed: We have no way to know that a Technique is disabled
    ([\#10660](https://www.rudder-project.org/redmine/issues/10660))
  - Fixed: Directive is still marked unused after using it
    ([\#9805](https://www.rudder-project.org/redmine/issues/9805))
  - Fixed: Logout hover background is too wide
    ([\#10529](https://www.rudder-project.org/redmine/issues/10529))
  - Fixed: Cannot go back to the previous page on node details
    ([\#10515](https://www.rudder-project.org/redmine/issues/10515))
  - Fixed: "New" buttons should be renamed "Add"
    ([\#10630](https://www.rudder-project.org/redmine/issues/10630))
  - Fixed: On some resolution, top bar is on two line and we can't see the whole directive tree
    ([\#10552](https://www.rudder-project.org/redmine/issues/10552))
  - Fixed: Mono Font text in directive form are not correctly displayed in Chrome
    ([\#9780](https://www.rudder-project.org/redmine/issues/9780))
  - Fixed: Selects in Archives page are not wide enough
    ([\#10615](https://www.rudder-project.org/redmine/issues/10615))

#### Web - Nodes & inventories

  - Fixed: In Rudder 4.1 dashboard, Nova agent are "unknown"
    ([\#10727](https://www.rudder-project.org/redmine/issues/10727))

#### Performance and scalability

  - Fixed: Unecessary call to inventory code to check its version during policy validation
    ([\#10641](https://www.rudder-project.org/redmine/issues/10641))

#### Web - Config management

  - Fixed: Tooltips don't disapear on safari
    ([\#6145](https://www.rudder-project.org/redmine/issues/6145))

#### Documentation

  - Fixed: Document correctly memory usage 
    ([\#10744](https://www.rudder-project.org/redmine/issues/10744))
  - Fixed: Broken links in doc
    ([\#10730](https://www.rudder-project.org/redmine/issues/10730))
  - Fixed: Missing information in Technique editor doc
    ([\#10710](https://www.rudder-project.org/redmine/issues/10710))
  - Fixed: Improve doc index and header menu
    ([\#10701](https://www.rudder-project.org/redmine/issues/10701))
  - Fixed: Documentation build broken
    ([\#10700](https://www.rudder-project.org/redmine/issues/10700))
  - Fixed: Make a nice agent output screenshot for the intro
    ([\#10693](https://www.rudder-project.org/redmine/issues/10693))
  - Fixed: Missing link toward technique editor in intro "extensibility"
    ([\#10696](https://www.rudder-project.org/redmine/issues/10696))
  - Fixed: Add a diagram about different roles
    ([\#10695](https://www.rudder-project.org/redmine/issues/10695))
  - Fixed: Move Technique editor doc in 4.1
    ([\#10697](https://www.rudder-project.org/redmine/issues/10697))
  - Fixed: Bad links, typo, images in french in intro chapter
    ([\#10690](https://www.rudder-project.org/redmine/issues/10690))
  - Fixed: Use "-" in place of "_" in named reference in doc
    ([\#10688](https://www.rudder-project.org/redmine/issues/10688))
  - Fixed: Broken doc build
    ([\#10687](https://www.rudder-project.org/redmine/issues/10687))
  - Fixed: Create a "Rudder extension and third party integration" chapter
    ([\#10675](https://www.rudder-project.org/redmine/issues/10675))
  - Fixed: Broken doc build
    ([\#10680](https://www.rudder-project.org/redmine/issues/10680))
  - Fixed: Supported Windows platforms are Windows Server 2008 and after
    ([\#10656](https://www.rudder-project.org/redmine/issues/10656))
  - Fixed: Doc: "Regenerate now" button has been renamed "Update policies"
    ([\#10633](https://www.rudder-project.org/redmine/issues/10633))
  - Fixed: Backup restoration requires disabling the agent
    ([\#10639](https://www.rudder-project.org/redmine/issues/10639))
  - Fixed: Rudder installation docs are misleading as to running rudder-init
    ([\#10624](https://www.rudder-project.org/redmine/issues/10624))
  - Fixed: Plugin installation doc is not up-to-date for rpkg package
    ([\#10555](https://www.rudder-project.org/redmine/issues/10555))
  - Fixed: Node property documentation has error
    ([\#10613](https://www.rudder-project.org/redmine/issues/10613))

#### Miscellaneous

  - Fixed: If cf-serverd is not up, hook 50-reload-policy-file-server is in error and breaks policy generation
    ([\#10493](https://www.rudder-project.org/redmine/issues/10493))
  - Fixed: Docs: Reference to "TODO" that doesn't exist
    ([\#10622](https://www.rudder-project.org/redmine/issues/10622))
  - Fixed: escaping ${SSH_ORIGINAL_COMMAND} in GUI - sshKeyDistribution/3.0
    ([\#10715](https://www.rudder-project.org/redmine/issues/10715))

#### Web - Compliance & node report

  - Fixed: In reports list, if the directive contains < >, then the part in < > doesn't appear in the reports
    ([\#5718](https://www.rudder-project.org/redmine/issues/5718))
  - Fixed: When no reports has been received from a node for new policy, message contains unexpanded variable
    ([\#10636](https://www.rudder-project.org/redmine/issues/10636))

#### Packaging

  - Fixed: Installation fails due to broken nss/nss-softokn detection on CentOS6
    ([\#10734](https://www.rudder-project.org/redmine/issues/10734))
  - Fixed: PostgreSQL could not connect to server when installing Rudder 4.1 nightlies on Centos6
    ([\#10704](https://www.rudder-project.org/redmine/issues/10704))
  - Fixed: Broken agent build on Debian/ubuntu
    ([\#10729](https://www.rudder-project.org/redmine/issues/10729))
  - Fixed: Man pages provided in rudder-agent package are out-of-date
    ([\#10432](https://www.rudder-project.org/redmine/issues/10432))
  - Fixed: rudder-init doesn't use fully qualified path for executing cf-agent
    ([\#10607](https://www.rudder-project.org/redmine/issues/10607))
  - Fixed: rudder-pkg error on debian8: missing depency to xz-utils
    ([\#10628](https://www.rudder-project.org/redmine/issues/10628))
  - Fixed: When fetching webapp WARs, a repository maven is created in user home
    ([\#10618](https://www.rudder-project.org/redmine/issues/10618))

#### Initial promises & sys tech

  - Fixed: Invalid generation of inventory at install
    ([\#10752](https://www.rudder-project.org/redmine/issues/10752))
  - Fixed: Agent inventory generation invalid if hostname is not defined
    ([\#9829](https://www.rudder-project.org/redmine/issues/9829))

#### System integration

  - Fixed: Script rudder-init cannot reinit ldap database
    ([\#10608](https://www.rudder-project.org/redmine/issues/10608))
  - Fixed:  java.lang.InternalError when calling the internal API on Redhat because of invalid version of nss
    ([\#9905](https://www.rudder-project.org/redmine/issues/9905))
  - Fixed: Infinite "rudder is loading" page if rudder-init didn't run
    ([\#10567](https://www.rudder-project.org/redmine/issues/10567))
  - Fixed: If an error happen during boostrap, the webapp starts but is in a zombie state and the error page is not displayed
    ([\#1974](https://www.rudder-project.org/redmine/issues/1974))
  - Fixed: rudder server debug fails on SLES 11
    ([\#7892](https://www.rudder-project.org/redmine/issues/7892))

#### Agent

  - Fixed: If component value starts with # , report is not outputed by rudder agent output
    ([\#10601](https://www.rudder-project.org/redmine/issues/10601))
  - Fixed: Thell the user a node needs to be removed from the server when running a factory-reset
    ([\#10640](https://www.rudder-project.org/redmine/issues/10640))

#### Web - Maintenance

  - Fixed: Adding an authorized network when "common-root" directive is missing seems to work, but actually fails
    ([\#8017](https://www.rudder-project.org/redmine/issues/8017))
  - Fixed: There is small display glitch in change request display 
    ([\#6257](https://www.rudder-project.org/redmine/issues/6257))

#### Server components

  - Fixed: Inventory endpoint accepts inventory even if ldap or postgresql connectivity failed
    ([\#10485](https://www.rudder-project.org/redmine/issues/10485))

#### Techniques

  - Fixed: Technique tests do not pass on initial promises
    ([\#10725](https://www.rudder-project.org/redmine/issues/10725))
  - Fixed: Unclear field description in MOTD technique
    ([\#10655](https://www.rudder-project.org/redmine/issues/10655))
  - Fixed: Technique files contains UTF-8 chars (especially spaces)
    ([\#7622](https://www.rudder-project.org/redmine/issues/7622))
  - Fixed: "Variable (String)" Directive in the Directive library does not use textarea
    ([\#10585](https://www.rudder-project.org/redmine/issues/10585))
  - Fixed: When agent run interval is not 5 minutes, lock database is always purged
    ([\#10634](https://www.rudder-project.org/redmine/issues/10634))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

  - François Bayart
  - Romuald Bouvard
  - Jean Cardona
  - Ilan Costa
  - Christophe Crier
  - Tristan Gallet
  - Florian Heigl
  - Janos Mattyasovszky
  - Ferenc Ulrich
  - Kiran V
  - Rémi Verchère
  - Josh Watt

This is a bug fix release in the 4.1 series and therefore all installations of 4.1 should be upgraded when possible. The current "esr" release is 3.1.*. When we release a new version of Rudder, it has been thoroughly tested, and we consider the release enterprise-ready for deployment





## <a name="4.1.1" > </a> Rudder 4.1.1 (2017-04-19)

### Changes

#### Techniques

  - Add tests for manageKeyValueFile
    ([\#10473](https://www.rudder-project.org/redmine/issues/10473))

### Bug fixes

#### Web - UI & UX

  - Fixed: Different icons for magnifier in pending nodes page
    ([\#10524](https://www.rudder-project.org/redmine/issues/10524))
  - Fixed: A magnifier icon appears in the filter fild after displaying directives that would be applied in pending nodes page
    ([\#10525](https://www.rudder-project.org/redmine/issues/10525))
  - Fixed: Buttons left-right padding is inconsistent
    ([\#10528](https://www.rudder-project.org/redmine/issues/10528))
  - Fixed: "Reset to default" action in "Change Audit Logs" doesn't reset to install version
    ([\#9391](https://www.rudder-project.org/redmine/issues/9391))
  - Fixed: Directive column of pending nodes table is not wide enough.
    ([\#10513](https://www.rudder-project.org/redmine/issues/10513))

#### Web - Nodes & inventories

  - Fixed: Adding a json node property by UI make it a string
    ([\#10569](https://www.rudder-project.org/redmine/issues/10569))
  - Fixed: Regex search on node properties is broken: returns all nodes with a property when no using invalid value
    ([\#10570](https://www.rudder-project.org/redmine/issues/10570))
  - Fixed: Rudder fails to accept inventories with user account different only in their case
    ([\#10545](https://www.rudder-project.org/redmine/issues/10545))

#### Web - Config management

  - Fixed: On centos7, generation fails because of hook policy-generation-node-ready/10-cf-promise-check
    ([\#10532](https://www.rudder-project.org/redmine/issues/10532))
  - Fixed: Cannot add node property when audit message is mandatory
    ([\#10578](https://www.rudder-project.org/redmine/issues/10578))
  - Fixed: Missing "user techniques" in the technique editor when exporting / importing archive
    ([\#9448](https://www.rudder-project.org/redmine/issues/9448))

#### Documentation

  - Fixed: Broken links in 4.1 doc
    ([\#10593](https://www.rudder-project.org/redmine/issues/10593))
  - Fixed: Rudder documentation and release note don't mention the dependency to Java 1.8 for Rudder 4.1
    ([\#10548](https://www.rudder-project.org/redmine/issues/10548))

#### Agent

  - Fixed: Policy loading is slow due to innefficient variable manipulation
    ([\#10576](https://www.rudder-project.org/redmine/issues/10576))
  - Fixed: On upgrade from 3.1 to 4.1, policy could not be generated any more
    ([\#10559](https://www.rudder-project.org/redmine/issues/10559))

#### Packaging

  - Fixed: rudder-pkg is missing in rudder package
    ([\#10556](https://www.rudder-project.org/redmine/issues/10556))

#### API

  - Fixed: Wrong error message on directive API
    ([\#10554](https://www.rudder-project.org/redmine/issues/10554))
  - Fixed: Cannot insert a directive via the API in Rudder 4.1
    ([\#10547](https://www.rudder-project.org/redmine/issues/10547))

#### Web - Compliance & node report

  - Fixed: Compliance bar graph doesn't show small compliance numbers
    ([\#10392](https://www.rudder-project.org/redmine/issues/10392))

#### System integration

  - Fixed: Log contains debug info  "**** got string: {"start":"2017-03-09 00:00:00", "end", "2017-03-11 00:00:00"}"
    ([\#10553](https://www.rudder-project.org/redmine/issues/10553))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

  - Ilan Costa
  - Florian Heigl
  - Janos Mattyasovszky
  - Hamlyn Mootoo 
  - Dmitry Svyatogorov 
  - Rémi Verchère

This is a bug fix release in the 4.1 series and therefore all installations of 4.1 should be upgraded when possible. The current "esr" release is 3.1.*. When we release a new version of Rudder, it has been thoroughly tested, and we consider the release enterprise-ready for deployment



## <a name=4.1.0> </a> Rudder 4.1.0 (2017-03-30)

### Changes

#### Packaging

  - rpm packages should depend on java headless
    ([\#10468](https://www.rudder-project.org/redmine/issues/10468))

#### Web - UI & UX

  - Add icon for directives which can be migrated to an upper technique version
    ([\#10421](https://www.rudder-project.org/redmine/issues/10421))
  - Add icon for directives which use deprecated technique
    ([\#10420](https://www.rudder-project.org/redmine/issues/10420))
  - Find a way to display "deprecated" techniques which still contain directives in the directives tree
    ([\#10229](https://www.rudder-project.org/redmine/issues/10229))
  - Fix some details in Directives page
    ([\#10384](https://www.rudder-project.org/redmine/issues/10384))
  - Group Type order should be switched
    ([\#10330](https://www.rudder-project.org/redmine/issues/10330))

#### Documentation

  - Document how to build an agent
    ([\#10333](https://www.rudder-project.org/redmine/issues/10333))
  - Change page split level and reorganize sections
    ([\#10350](https://www.rudder-project.org/redmine/issues/10350))

#### Performance and scalability

  - Add caching information to static JS/CSS resources
    ([\#4519](https://www.rudder-project.org/redmine/issues/4519))

#### Miscellaneous

  - Add a convention for ".disabled" hooks to not be executed
    ([\#10412](https://www.rudder-project.org/redmine/issues/10412))

### Bug fixes

#### Web - UI & UX

  - Fixed: "New category" button hides "Categories" title on small screens
    ([\#10510](https://www.rudder-project.org/redmine/issues/10510))
  - Fixed: Some tooltips can't overflow their container
    ([\#10509](https://www.rudder-project.org/redmine/issues/10509))
  - Fixed: A running Policy generation is not displayed on the Status dropdown
    ([\#10451](https://www.rudder-project.org/redmine/issues/10451))
  - Fixed: Directive page not displaying with "None.get" in logs
    ([\#10501](https://www.rudder-project.org/redmine/issues/10501))
  - Fixed: When activating change requests, the CR zone doesn't appear in the main bar
    ([\#10499](https://www.rudder-project.org/redmine/issues/10499))
  - Fixed: GUI breaks completely with IE 11
    ([\#10452](https://www.rudder-project.org/redmine/issues/10452))
  - Fixed: padding-down instead of padding-bottom in rudder.css
    ([\#10465](https://www.rudder-project.org/redmine/issues/10465))
  - Fixed: Weird appearance of accet new nodes popup
    ([\#10458](https://www.rudder-project.org/redmine/issues/10458))
  - Fixed: Display issue on "Accept new Nodes" page
    ([\#9165](https://www.rudder-project.org/redmine/issues/9165))
  - Fixed: Dropdown lists in directive forms are not wide enough and hide the contents of options
    ([\#10361](https://www.rudder-project.org/redmine/issues/10361))
  - Fixed: In the rule table, Recent changes column change size during page loading
    ([\#10340](https://www.rudder-project.org/redmine/issues/10340))
  - Fixed: On the Rule details, if I click on "Clone", then cancel action, I get switched to Settings tab
    ([\#10345](https://www.rudder-project.org/redmine/issues/10345))
  - Fixed: Directive from a whole deprecated technique are not displayed
    ([\#10422](https://www.rudder-project.org/redmine/issues/10422))
  - Fixed: "Create with latest version" button text is cut off in new directive page
    ([\#10358](https://www.rudder-project.org/redmine/issues/10358))
  - Fixed: Cannot use slashes in quick search
    ([\#10407](https://www.rudder-project.org/redmine/issues/10407))
  - Fixed: Quick search text has gone a hard to read gray
    ([\#10400](https://www.rudder-project.org/redmine/issues/10400))
  - Fixed: Checkboxes in Administration menu are not locked for users with missing permissions
    ([\#9328](https://www.rudder-project.org/redmine/issues/9328))
  - Fixed: Bad Rudder logo in src/main/webapp/images
    ([\#10386](https://www.rudder-project.org/redmine/issues/10386))
  - Fixed: Rudder (svg) logo aren't displayed with chrome 
    ([\#10387](https://www.rudder-project.org/redmine/issues/10387))
  - Fixed: Tooltips are broken in Rule tables
    ([\#10389](https://www.rudder-project.org/redmine/issues/10389))
  - Fixed: Directive "Migrate" button is stuck to the version dropdown list
    ([\#10360](https://www.rudder-project.org/redmine/issues/10360))
  - Fixed: "Delete <component> #1" button in directive form's text is not centered
    ([\#10359](https://www.rudder-project.org/redmine/issues/10359))
  - Fixed: Save button shown even no permission to change it
    ([\#9819](https://www.rudder-project.org/redmine/issues/9819))
  - Fixed: If there is an error in the Parameter edition/creation popup, its shape change
    ([\#10248](https://www.rudder-project.org/redmine/issues/10248))
  - Fixed: Inconsistent capitalization of titles in the menu
    ([\#9545](https://www.rudder-project.org/redmine/issues/9545))
  - Fixed: Inconsistent message style in settings page
    ([\#9426](https://www.rudder-project.org/redmine/issues/9426))
  - Fixed: Wrong action named in API accounts table
    ([\#10203](https://www.rudder-project.org/redmine/issues/10203))

#### Documentation

  - Fixed: Inconsistent section order
    ([\#10413](https://www.rudder-project.org/redmine/issues/10413))
  - Fixed: Remove doc for the old quicksearch bar that has been removed
    ([\#10401](https://www.rudder-project.org/redmine/issues/10401))

#### Web - Technique editor

  - Fixed: Cannot open technique editor on SLES12
    ([\#10511](https://www.rudder-project.org/redmine/issues/10511))

#### Web - Nodes & inventories

  - Fixed: On Group page, we can click on "Save" on arrival on the page, and it prevent any further saving of the Group
    ([\#10376](https://www.rudder-project.org/redmine/issues/10376))
  - Fixed: No error message in group creation popup if no name is set
    ([\#10328](https://www.rudder-project.org/redmine/issues/10328))

#### Web - Config management

  - Fixed: No generation triggered at the end of installation
    ([\#10448](https://www.rudder-project.org/redmine/issues/10448))
  - Fixed: When upgrading to 4.1, rudder.community.checkpromises.command=/bin/true option is lost 
    ([\#10379](https://www.rudder-project.org/redmine/issues/10379))
  - Fixed: Dataource can not override an existing property
    ([\#10520](https://www.rudder-project.org/redmine/issues/10520))
  - Fixed: Policy validation fails
    ([\#10446](https://www.rudder-project.org/redmine/issues/10446))

#### Miscellaneous

  - Fixed: Validation hooks should execute cf-promises by exec
    ([\#10449](https://www.rudder-project.org/redmine/issues/10449))

#### Web - Compliance & node report

  - Fixed: Several core features don't work anymore with more than 1000 nodes
    ([\#10456](https://www.rudder-project.org/redmine/issues/10456))

#### Packaging

  - Fixed: slapd migration for 4.1 is not done on Ubuntu 16.04
    ([\#10517](https://www.rudder-project.org/redmine/issues/10517))
  - Fixed: Rudder 4.1 fails to install Ubuntu/Debian because of rudder-slapd service restart
    ([\#10506](https://www.rudder-project.org/redmine/issues/10506))
  - Fixed: Error when upgrading from Rudder 3.1 to Rudder 4.1 on Debian 8
    ([\#10440](https://www.rudder-project.org/redmine/issues/10440))
  - Fixed: On SLES12, missing package rsyslog-module-pgsql
    ([\#10497](https://www.rudder-project.org/redmine/issues/10497))
  - Fixed: Use the same initial database password everywhere to avoid breaking database connection before rudder-init
    ([\#10484](https://www.rudder-project.org/redmine/issues/10484))
  - Fixed: Relay-Api does not handle different Apache versions
    ([\#10455](https://www.rudder-project.org/redmine/issues/10455))
  - Fixed: Error on hooks on fresh install on Centos7
    ([\#10436](https://www.rudder-project.org/redmine/issues/10436))
  - Fixed: LDAP error at upgrade - Cannot allocate memory
    ([\#10424](https://www.rudder-project.org/redmine/issues/10424))
  - Fixed: On Centos 7.3, upgrading from 4.0 to 4.1 fail due to SELinux problem
    ([\#10372](https://www.rudder-project.org/redmine/issues/10372))
  - Fixed: Upgrading from 4.0 to 4.1 failed on Centos7.3, and purged LDAP directory
    ([\#10373](https://www.rudder-project.org/redmine/issues/10373))
  - Fixed: Don't display warning about configuring policy server on root server
    ([\#8976](https://www.rudder-project.org/redmine/issues/8976))

#### Initial promises & sys tech

  - Fixed: Inventory is not resent in case of error - and agent don't report the error
    ([\#10088](https://www.rudder-project.org/redmine/issues/10088))
  - Fixed: A 4.1 agent cannot fetch its promises from a 3.1 server
    ([\#10049](https://www.rudder-project.org/redmine/issues/10049))
  - Fixed: Ignore changes generated by creation/deletion of ncf expected reports file
    ([\#10355](https://www.rudder-project.org/redmine/issues/10355))

#### System integration

  - Fixed: Error in migration (ldap backup not found because ending by .gz)
    ([\#10521](https://www.rudder-project.org/redmine/issues/10521))
  - Fixed: Apache not started on a fresh centos7 install (selinux problem)
    ([\#10426](https://www.rudder-project.org/redmine/issues/10426))
  - Fixed: On freshly installed centos7, ldap connections fail with "bad auth"
    ([\#10427](https://www.rudder-project.org/redmine/issues/10427))
  - Fixed: rudder-upgrade fails if run twice 
    ([\#10466](https://www.rudder-project.org/redmine/issues/10466))
  - Fixed: rudder-slapd force-stop doesn't exist on sles 12
    ([\#10464](https://www.rudder-project.org/redmine/issues/10464))
  - Fixed: rudder-reports doesn't start postgresql on postinstall on sles 12
    ([\#10460](https://www.rudder-project.org/redmine/issues/10460))
  - Fixed: Unable to setup metadata virtual space list
    ([\#10444](https://www.rudder-project.org/redmine/issues/10444))
  - Fixed: /var/log/rudder/ldap/slapd.log is full of not indexed message
    ([\#10429](https://www.rudder-project.org/redmine/issues/10429))
  - Fixed: Hook failed with fork: retry: No child processes
    ([\#10457](https://www.rudder-project.org/redmine/issues/10457))
  - Fixed: After running rudder-init, no connectivity to postgresql
    ([\#10486](https://www.rudder-project.org/redmine/issues/10486))

#### Relay server or API

  - Fixed: Error in the cron job prevents purging expired files shared between nodes
    ([\#10417](https://www.rudder-project.org/redmine/issues/10417))

#### Architecture - Dependencies

  - Fixed: Update monix (critical bug fix)
    ([\#10393](https://www.rudder-project.org/redmine/issues/10393))

#### Performance and scalability

  - Fixed: If I click on "Regenerate all policies", it clears the cache of changes, and slows down a lot the web interface
    ([\#10383](https://www.rudder-project.org/redmine/issues/10383))
  - Fixed: Enable gzip compression on text resources
    ([\#10365](https://www.rudder-project.org/redmine/issues/10365))

#### Server components

  - Fixed: slapd is not always restarted after installation of rudder-inventory-ldap
    ([\#10467](https://www.rudder-project.org/redmine/issues/10467))
  - Fixed: In debug verbosity, logs are overflowed by logs about com.zaxxer.hikari.pool
    ([\#10471](https://www.rudder-project.org/redmine/issues/10471))

#### Techniques

  - Fixed: Variable * techniques description refers to CFEngine technical vocabulary
    ([\#10363](https://www.rudder-project.org/redmine/issues/10363))
  - Fixed: "Download files from the shared folder" behaving badly?
    ([\#10312](https://www.rudder-project.org/redmine/issues/10312))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

  - Janos Mattyasovszky

This is a bug fix release in the 4.1 series and therefore all installations of 4.1 should be upgraded when possible. The current "esr" release is 3.1.*. When we release a new version of Rudder, it has been thoroughly tested, and we consider the release enterprise-ready for deployment


## Rudder 4.1.0.rc1 (2017-03-07)

### Changes

#### Web - UI & UX

  - Adjust providers display in the node properties tab
    ([\#10320](https://www.rudder-project.org/redmine/issues/10320))
  - Display provider of node properties if defined
    ([\#10302](https://www.rudder-project.org/redmine/issues/10302))
  - Change graph lib to more efficent one
    ([\#8171](https://www.rudder-project.org/redmine/issues/8171))
  - Adjust the height box height's css property instead of max-height 
    ([\#10252](https://www.rudder-project.org/redmine/issues/10252))
  - Add autocomplete on rule/directive tags
    ([\#10192](https://www.rudder-project.org/redmine/issues/10192))
  - The "Technique version" select and "Migrate" button should be aligned
    ([\#9938](https://www.rudder-project.org/redmine/issues/9938))
  - Reorder and hide deprecated Techniques in Directive tree 
    ([\#10228](https://www.rudder-project.org/redmine/issues/10228))
  - UI to define node properties
    ([\#10169](https://www.rudder-project.org/redmine/issues/10169))
  - Reorganize Directives page interface
    ([\#10080](https://www.rudder-project.org/redmine/issues/10080))

#### Documentation

  - Document usage of file sharing between nodes
    ([\#10278](https://www.rudder-project.org/redmine/issues/10278))
  - Add guideline for technique naming
    ([\#10222](https://www.rudder-project.org/redmine/issues/10222))
  - Use the lato font in the manual
    ([\#9945](https://www.rudder-project.org/redmine/issues/9945))
  - Add link to the new FAQ in the manual
    ([\#10181](https://www.rudder-project.org/redmine/issues/10181))

#### Agent

  - Create a cfengine_rudder class
    ([\#9384](https://www.rudder-project.org/redmine/issues/9384))
  - Improve usage of ncf logging in rudder command
    ([\#9280](https://www.rudder-project.org/redmine/issues/9280))

#### Packaging

  - Registered Plugins should be kept at upgrade
    ([\#10251](https://www.rudder-project.org/redmine/issues/10251))
  - Stop jetty before upgrading the webapp
    ([\#9820](https://www.rudder-project.org/redmine/issues/9820))
  - Embed openssl on old debian systems
    ([\#10303](https://www.rudder-project.org/redmine/issues/10303))
  - Upgrade OpenSSL to 1.0.2k
    ([\#10246](https://www.rudder-project.org/redmine/issues/10246))
  - Upgrade fusion agent to 2.3.19
    ([\#9763](https://www.rudder-project.org/redmine/issues/9763))
  - Redirect http to https in relay api
    ([\#10073](https://www.rudder-project.org/redmine/issues/10073))

#### Initial promises & sys tech

  - Remove unused body yum_remi
    ([\#10349](https://www.rudder-project.org/redmine/issues/10349))

#### System integration

  - Add a package manager for plugins
    ([\#10254](https://www.rudder-project.org/redmine/issues/10254))

#### Techniques

  - More consistant naming of techniques
    ([\#10214](https://www.rudder-project.org/redmine/issues/10214))

### Bug fixes

#### Web - UI & UX

  - Fixed: Compliance display when hoverving over the compliance bar is too precise
    ([\#9323](https://www.rudder-project.org/redmine/issues/9323))
  - Fixed: Compliance/Recent change column should not be present by default in directive screen
    ([\#10339](https://www.rudder-project.org/redmine/issues/10339))
  - Fixed: Compliance bar isn't display the same way in 'List nodes' and 'Rules' pages
    ([\#10321](https://www.rudder-project.org/redmine/issues/10321))
  - Fixed: Display of shared files popup is broken
    ([\#10329](https://www.rudder-project.org/redmine/issues/10329))
  - Fixed: Unconsistent titles style in Rule settings
    ([\#10325](https://www.rudder-project.org/redmine/issues/10325))
  - Fixed: Disabled label disappear passing the mouse over the policy mode label
    ([\#10323](https://www.rudder-project.org/redmine/issues/10323))
  - Fixed: Cannot change schedule on Node 
    ([\#10318](https://www.rudder-project.org/redmine/issues/10318))
  - Fixed: Clone group popup is broken
    ([\#10307](https://www.rudder-project.org/redmine/issues/10307))
  - Fixed: Lost space at the bottom of the group page
    ([\#10281](https://www.rudder-project.org/redmine/issues/10281))
  - Fixed: When clicking refresh in rules, grid header height change
    ([\#10262](https://www.rudder-project.org/redmine/issues/10262))
  - Fixed: When trying to create a new API account that has the same name as an existing acocunt, nothing happen
    ([\#10250](https://www.rudder-project.org/redmine/issues/10250))
  - Fixed: Setting title are barelly outstanding
    ([\#10261](https://www.rudder-project.org/redmine/issues/10261))
  - Fixed: Button are not correctly aligned compared to tables in 4.1
    ([\#10257](https://www.rudder-project.org/redmine/issues/10257))
  - Fixed: Rules form fields are too wide
    ([\#10202](https://www.rudder-project.org/redmine/issues/10202))
  - Fixed: Vertically center the filter line in the event logs page
    ([\#10219](https://www.rudder-project.org/redmine/issues/10219))
  - Fixed: Unconsistent titles style in the Settings page
    ([\#10217](https://www.rudder-project.org/redmine/issues/10217))
  - Fixed: Parameters description won't show up in 4.1
    ([\#10197](https://www.rudder-project.org/redmine/issues/10197))
  - Fixed: Broken display in Rule popup creation
    ([\#10182](https://www.rudder-project.org/redmine/issues/10182))
  - Fixed: If we set a short description for a Rule, it won't show up anymore in the rule list
    ([\#10196](https://www.rudder-project.org/redmine/issues/10196))

#### Web - Config management

  - Fixed: Remove "rights" in node property
    ([\#10301](https://www.rudder-project.org/redmine/issues/10301))
  - Fixed: When we filter directive by tags, and update a directive, the tree is refreshed without taking into account the filter
    ([\#10271](https://www.rudder-project.org/redmine/issues/10271))
  - Fixed: When we add/remove/update a tag to a Directive/Rule, we get an empty event log
    ([\#10275](https://www.rudder-project.org/redmine/issues/10275))
  - Fixed: Tag filter creation greyed out after creating a tag filter
    ([\#10272](https://www.rudder-project.org/redmine/issues/10272))
  - Fixed: "Migrate" button is displayed for deprecated techniques even if all version are deprecated
    ([\#9859](https://www.rudder-project.org/redmine/issues/9859))

#### Techniques

  - Fixed: The service management technique does not disable boot services
    ([\#9872](https://www.rudder-project.org/redmine/issues/9872))
  - Fixed: Deprecate openVPN technique
    ([\#6707](https://www.rudder-project.org/redmine/issues/6707))

#### Web - Nodes & inventories

  - Fixed: Include Timezone in Node Info
    ([\#7092](https://www.rudder-project.org/redmine/issues/7092))
  - Fixed: Improve management of rights and other metadata of node properties
    ([\#10235](https://www.rudder-project.org/redmine/issues/10235))
  - Fixed: Cannot choose between Group or category when creating a Group
    ([\#10249](https://www.rudder-project.org/redmine/issues/10249))
  - Fixed: Users with "node_all" security role can not change Agent Policy Mode
    ([\#9936](https://www.rudder-project.org/redmine/issues/9936))
  - Fixed: Can not see details of pending node
    ([\#10174](https://www.rudder-project.org/redmine/issues/10174))
  - Fixed: Inventories with fields containing only spaces/tabs/... may fail to be parsed due to invalid sanitization of entry
    ([\#10220](https://www.rudder-project.org/redmine/issues/10220))

#### Documentation

  - Fixed: Doc about copying ncf technique to /var/rudder/ncf/local is false
    ([\#10269](https://www.rudder-project.org/redmine/issues/10269))
  - Fixed: Broken formatting of plugin packaging doc
    ([\#10297](https://www.rudder-project.org/redmine/issues/10297))
  - Fixed: Merge error - Link check disappeared in 4.0
    ([\#10206](https://www.rudder-project.org/redmine/issues/10206))

#### Miscellaneous

  - Fixed: Error when putting uuid.hive in inventory-updates
    ([\#10070](https://www.rudder-project.org/redmine/issues/10070))
  - Fixed: Clean tags data model 
    ([\#9934](https://www.rudder-project.org/redmine/issues/9934))
  - Fixed: Promise validation errors (cf-promises) are unreadable
    ([\#10175](https://www.rudder-project.org/redmine/issues/10175))

#### Agent

  - Fixed: Scary message about OpenSSL on SLES when running rudder agent update
    ([\#10066](https://www.rudder-project.org/redmine/issues/10066))
  - Fixed: Some QEMU virtual machines are seen as physical
    ([\#9616](https://www.rudder-project.org/redmine/issues/9616))
  - Fixed: If rudder server component is stopped on Rudder root server, it is never restarted
    ([\#10258](https://www.rudder-project.org/redmine/issues/10258))

#### Packaging

  - Fixed: make clean in rudder agent package doesn't remove build-cfengine-stamp
    ([\#10334](https://www.rudder-project.org/redmine/issues/10334))
  - Fixed: Accept TTL with spaces in relay API
    ([\#10296](https://www.rudder-project.org/redmine/issues/10296))
  - Fixed: Error downloading perl modules with https
    ([\#10264](https://www.rudder-project.org/redmine/issues/10264))
  - Fixed: Missing prefix in asynchronous output in remote run
    ([\#10190](https://www.rudder-project.org/redmine/issues/10190))
  - Fixed: Impossible to share file due to wrong permissions for /var/rudder/shared-files
    ([\#10184](https://www.rudder-project.org/redmine/issues/10184))
  - Fixed: version is not properly set in web interface
    ([\#10107](https://www.rudder-project.org/redmine/issues/10107))

#### Initial promises & sys tech

  - Fixed: Transient update error on ncf/local
    ([\#10028](https://www.rudder-project.org/redmine/issues/10028))
  - Fixed: Error in relay promises when there are no shared files
    ([\#9881](https://www.rudder-project.org/redmine/issues/9881))
  - Fixed: Propagate promises error when no nodes behind a relay
    ([\#7671](https://www.rudder-project.org/redmine/issues/7671))
  - Fixed: Impossible to collect reports in mission portal since #9216
    ([\#10209](https://www.rudder-project.org/redmine/issues/10209))

#### API

  - Fixed: API compatibility feature switch must be removed in 4.1
    ([\#10322](https://www.rudder-project.org/redmine/issues/10322))
  - Fixed: Log an error when Rest API fails 
    ([\#10295](https://www.rudder-project.org/redmine/issues/10295))
  - Fixed: Missing timezone information in API "node details"
    ([\#10280](https://www.rudder-project.org/redmine/issues/10280))
  - Fixed: Fix behavior of directive API and make api more consistent
    ([\#10225](https://www.rudder-project.org/redmine/issues/10225))

#### Relay server or API

  - Fixed: Allow dots in file_id in shared-files api
    ([\#10338](https://www.rudder-project.org/redmine/issues/10338))
  - Fixed: Remote-run exec for root fail with "rudder agent was interrupted"
    ([\#10185](https://www.rudder-project.org/redmine/issues/10185))

#### Web - Compliance & node report

  - Fixed: Recent changes aren't display sometimes on Rules list
    ([\#10194](https://www.rudder-project.org/redmine/issues/10194))

#### Web - Maintenance

  - Fixed: There is no error logged when an error occurs when updating information of Node in Node cache
    ([\#10290](https://www.rudder-project.org/redmine/issues/10290))
  - Fixed: If the Rudder Web Interface is interrupted during the second step of reports archiving, then it won't never succeed in archiving again
    ([\#10171](https://www.rudder-project.org/redmine/issues/10171))

#### Plugin - datasources

  - Fixed: EventLog at promise generation for datasources change, even if nothing changed
    ([\#10198](https://www.rudder-project.org/redmine/issues/10198))

#### System integration

  - Fixed: Log for failed login attempt is not (correctly) reported
    ([\#10259](https://www.rudder-project.org/redmine/issues/10259))
  - Fixed: Clean-up and add build information in META-INF
    ([\#10253](https://www.rudder-project.org/redmine/issues/10253))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Janos Mattyasovszky
  - Hamlyn Mootoo
  - Dmitry Svyatogorov

This software is in beta status and contains several new features but we
have tested it and believe it to be free of any critical bugs.¬The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!


## Rudder 4.1.0.beta3 (2017-02-14)

### Changes

#### Web - UI & UX

  - Add an option to not display rule status/recent changes in directives screen
    ([\#10157](https://www.rudder-project.org/redmine/issues/10157))
  - Node breakdown - show actual numbers
    ([\#7422](https://www.rudder-project.org/redmine/issues/7422))

#### Documentation

  - Document the relay API
    ([\#9997](https://www.rudder-project.org/redmine/issues/9997))

#### Initial promises & sys tech

  - Use rudder agent run as cfruncommand
    ([\#10081](https://www.rudder-project.org/redmine/issues/10081))

#### Architecture - Dependencies

  - Switch to Scala 2.12 / Lift 3.0 
    ([\#10127](https://www.rudder-project.org/redmine/issues/10127))

#### Architecture - Refactoring

  - Scala actors are deprecated in scala 2.11 and removed in 2.12: update inventory-endpoint
    ([\#10119](https://www.rudder-project.org/redmine/issues/10119))

#### Techniques

  - Deprecate old techniques versions
    ([\#10159](https://www.rudder-project.org/redmine/issues/10159))

### Bug fixes

#### Web - UI & UX

  - Fixed: Status dropdown's display is broken
    ([\#10177](https://www.rudder-project.org/redmine/issues/10177))
  - Fixed: Display of new "Display compliance and recent changes columns on rule summary" setting is broken
    ([\#10173](https://www.rudder-project.org/redmine/issues/10173))
  - Fixed: Included "time ended" in Status dropdown
    ([\#10133](https://www.rudder-project.org/redmine/issues/10133))
  - Fixed: On Group creation, the tooltip on the "Save" button doesn't appear when it is disabled
    ([\#10116](https://www.rudder-project.org/redmine/issues/10116))
  - Fixed: Broken text fields in directive form
    ([\#10164](https://www.rudder-project.org/redmine/issues/10164))

#### Web - Config management

  - Fixed: Deadlock with simultaneous generation and new reports
    ([\#10168](https://www.rudder-project.org/redmine/issues/10168))
  - Fixed: Incomplete logging in expected reports computation
    ([\#10143](https://www.rudder-project.org/redmine/issues/10143))
  - Fixed: Renable WriteSystemTechniquesTest
    ([\#10150](https://www.rudder-project.org/redmine/issues/10150))

#### Documentation

  - Fixed: Broken link in CFEngine doc
    ([\#10151](https://www.rudder-project.org/redmine/issues/10151))

#### Packaging

  - Fixed: the shared-files directory is owned by root
    ([\#10178](https://www.rudder-project.org/redmine/issues/10178))
  - Fixed: openjdk8 cannot be installed if there is a backport in the building os
    ([\#10163](https://www.rudder-project.org/redmine/issues/10163))
  - Fixed: rudder-techniques depends on perl(XML::TreePP)
    ([\#9845](https://www.rudder-project.org/redmine/issues/9845))
  - Fixed: Missing entry in rudder-web.properties after update to 4.1.0.b2
    ([\#10132](https://www.rudder-project.org/redmine/issues/10132))
  - Fixed: rudder-relay has bad "sed" line
    ([\#10131](https://www.rudder-project.org/redmine/issues/10131))

#### Initial promises & sys tech

  - Fixed: Download Shared from node and  to nodes fail because /var/rudder/share-files is non existent (on centos)
    ([\#10085](https://www.rudder-project.org/redmine/issues/10085))

#### API

  - Fixed: Allow relay-api to make asynchronous remote run call with output 
    ([\#10114](https://www.rudder-project.org/redmine/issues/10114))

#### Architecture - Dependencies

  - Fixed: Test broken with "FileNotFoundException /ldap/bootstrap.ldif"
    ([\#10147](https://www.rudder-project.org/redmine/issues/10147))
  - Fixed: warning: Class javax.annotation.Nonnull not found - continuing with a stub.
    ([\#10146](https://www.rudder-project.org/redmine/issues/10146))
  - Fixed: warning: Class javax.annotation.Nonnull not found - continuing with a stub.
    ([\#10146](https://www.rudder-project.org/redmine/issues/10146))
  - Fixed: Use correct repository definition in pom.xml
    ([\#10120](https://www.rudder-project.org/redmine/issues/10120))

#### Server components

  - Fixed: pass ttl through url parameters in sharedfiles api
    ([\#10138](https://www.rudder-project.org/redmine/issues/10138))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Janos Mattyasovszky

This software is in beta status and contains several new features but we
have tested it and believe it to be free of any critical bugs.¬The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!



## Rudder 4.1.0~beta2 (2017-02-02)

### Changes

#### Web - UI & UX

  - Reorganize Rules page interface ([\#9960](http://www.rudder-project.org/redmine/issues/9960))

#### Web - Config management

  - Remove all datasource code from Rudder main and add needed hooks ([\#10050](http://www.rudder-project.org/redmine/issues/10050))

#### Agent

  - Extend rudder-sign to add new information ([\#9996](http://www.rudder-project.org/redmine/issues/9996))
  - Warn the user if rudder agent is not run as root ([\#9684](http://www.rudder-project.org/redmine/issues/9684))

#### Packaging

  - Permit skipping scala build within packages ([\#10055](http://www.rudder-project.org/redmine/issues/10055))
  - use suse_version instead of sles_version during build ([\#9919](http://www.rudder-project.org/redmine/issues/9919))
  - Automatically set year in Rudder interface at build time ([\#9891](http://www.rudder-project.org/redmine/issues/9891))

#### API

  - Deprecate API v5, v6 and v7, and remove API v2,3,4 ([\#9836](http://www.rudder-project.org/redmine/issues/9836))
  - Remote run API should use relay API ([\#9714](http://www.rudder-project.org/redmine/issues/9714))

#### Architecture - Dependencies

  -  Requires Java8 (jdk8) for Rudder 4.1 ([\#9917](http://www.rudder-project.org/redmine/issues/9917))

### Bug fixes

#### Packaging

  - Fixed: Wrong ncf version dependency in 4.1 ([\#10091](http://www.rudder-project.org/redmine/issues/10091))
  - Fixed: On CentOS relay API uses /etc/httpd/logs/wsgi.18610.0.1.sock ([\#10072](http://www.rudder-project.org/redmine/issues/10072))
  - Fixed: The user trying to open nodes list in relay-api is not rudder ([\#10068](http://www.rudder-project.org/redmine/issues/10068))
  - Fixed: Wrong permission for /etc/sudoers.d/rudder-relay file on Sles ([\#10065](http://www.rudder-project.org/redmine/issues/10065))
  - Fixed: Remove rudder-apache-common.conf in postinstall ([\#10041](http://www.rudder-project.org/redmine/issues/10041))
  - Fixed: Not having set %{real_name} does operate on /bin ([\#10003](http://www.rudder-project.org/redmine/issues/10003))
  - Fixed: Allow to restrict edits on sudoers during install ([\#10001](http://www.rudder-project.org/redmine/issues/10001))

#### Web - Config management

  - Fixed: When I save a Directive, after cliking "save", it's not possible to scroll anymore in the Directive tree ([\#10010](http://www.rudder-project.org/redmine/issues/10010))

#### Server components

  - Fixed: the relay api shoud read nodeslist on each call ([\#10111](http://www.rudder-project.org/redmine/issues/10111))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Janos Mattyasovszky

This software is in beta status and contains several new features but we
have tested it and believe it to be free of any critical bugs.¬The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!


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

