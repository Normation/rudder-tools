# Change logs for Rudder 4.0.\* versions

Rudder 4.0 is currently the **latest** version of Rudder.

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Main new features in Rudder 4.0:**

  - Policy can be applied in "Audit mode", which only checks
    configuration and does not enforce it, on a global, per-node or
    per-directive basis
  - Global redesign of web interface
  - Files from shared folder can be selected using a file browser
  - Agents can be remotely started using API (wrapper for "rudder remote
    run" on the CLI)
  - Settings API
  - Rudder agent status command
  - Performance improved (compliance, policy generation are faster)

**Installing, upgrading and testing**

  - Install docs:
    https://www.rudder-project.org/doc-4.0/_install_rudder_server.html
  - Upgrade docs:
    https://www.rudder-project.org/doc-4.0/_upgrade_rudder.html
  - Download links:

We also recommend using the [Rudder
Vagrant](https://github.com/Normation/rudder-vagrant) config if you want
a quick and easy way to get an installation for testing.

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server: **Debian 7, Debian 8, RHEL/CentOS 6, RHEL/CentOS 7
    (64 bits), SLES 11, Ubuntu 14.04, Ubuntu 16.04**
  - Rudder agent: all of the above plus **Debian 5, Debian 6,
    RHEL/CentOS 3, RHEL/CentOS 5, CentOS 7 (32 bits), Fedora 18, SLES
    10, SLES 12, Ubuntu 10.04, Ubuntu 12.04, Ubuntu 12.10**
  - Rudder agent (binary packages available from
    ([Normation](http://www.normation.com)): **Windows Server 2008-2012,
    AIX 5-6-7**

## Rudder 4.0.0 (2016-11-10)

### Changes

#### Web - UI & UX

  - Too large fields in directive form ([\#9619](http://www.rudder-project.org/redmine/issues/9619))
  - Allow overriding the policy mode by default ([\#9605](http://www.rudder-project.org/redmine/issues/9605))
  - Filter rules by application in the directive page ([\#9256](http://www.rudder-project.org/redmine/issues/9256))

#### Documentation

  - Update Github Readme for Rudder 4.0 and up ([\#9647](http://www.rudder-project.org/redmine/issues/9647))
  - Update doc for the new server-node protocol ([\#9638](http://www.rudder-project.org/redmine/issues/9638))

#### Techniques

  - Deprecate old package management techniques ([\#9607](http://www.rudder-project.org/redmine/issues/9607))

### Bug fixes

#### Web - UI & UX

  - Fixed: Can not click on Audit button in Settings ([\#9655](http://www.rudder-project.org/redmine/issues/9655))
  - Fixed: Link to settings from node preferences doesn't work ([\#9642](http://www.rudder-project.org/redmine/issues/9642))
  - Fixed: Some tables still have 10 entries by default ([\#9606](http://www.rudder-project.org/redmine/issues/9606))
  - Fixed: There is a request to fonts.googleapi.com ([\#9604](http://www.rudder-project.org/redmine/issues/9604))
  - Fixed: We cannot add group exception in rules settings ([\#9603](http://www.rudder-project.org/redmine/issues/9603))
  - Fixed: In rules list, the category column is as wide as the name column ([\#9601](http://www.rudder-project.org/redmine/issues/9601))
  - Fixed: There is a cursor under Global compliance details in the home page ([\#9600](http://www.rudder-project.org/redmine/issues/9600))
  - Fixed: The technique tree does not reach the bottom of the screen ([\#9599](http://www.rudder-project.org/redmine/issues/9599))
  - Fixed: "Applying" appears like "no report" in "nodes by overall compliance" ([\#9579](http://www.rudder-project.org/redmine/issues/9579))

#### Initial promises & sys tech

  - Fixed: Do not report on report file creation because it is always repaired ([\#9577](http://www.rudder-project.org/redmine/issues/9577))
  - Fixed: Add an EndRun report to Rudder abort handler ([\#9571](http://www.rudder-project.org/redmine/issues/9571))

#### Web - Maintenance

  - Fixed: Changing policy mode in the setting screen spams the webapp log ([\#9611](http://www.rudder-project.org/redmine/issues/9611))

#### Agent

  - Fixed: Typo in rudder agent stop output ([\#9617](http://www.rudder-project.org/redmine/issues/9617))

#### Web - Compliance & node report

  - Fixed: Bad constraint in table nodeConfigurations ([\#9646](http://www.rudder-project.org/redmine/issues/9646))
  - Fixed: Null pointer exception when changing policy mode on the Directive screen ([\#9610](http://www.rudder-project.org/redmine/issues/9610))
  - Fixed: If i override compliance on a node to "audit", it is still shows "enforce" in its details ([\#9593](http://www.rudder-project.org/redmine/issues/9593))

### Release notes

This version of Rudder is a final release. We have tested it thoroughly
and believe it to be free of any major bugs. This version is now the
latest version of Rudder (lastest ESR is still 3.1).

## Rudder 4.0.0~rc5 (2016-10-26)

### Changes

### Bug fixes

#### Web - Nodes & inventories

  - Fixed: On Search nodes page, if I click on "Include Rudder server
    components" checkbox, or change any criteria (except And and Or), I
    get a JS error
    ([\#9544](http://www.rudder-project.org/redmine/issues/9544))

#### Web - UI & UX

  - Fixed: Recent change column title is incorrect for status
    ([\#9550](http://www.rudder-project.org/redmine/issues/9550))
  - Fixed: The link to the quick search doc has disappeared in 4.0
    ([\#9537](http://www.rudder-project.org/redmine/issues/9537))

#### System integration

  - Fixed: Remove index script on expectedreportsnodes table
    ([\#9554](http://www.rudder-project.org/redmine/issues/9554))

#### Web - Compliance & node report

  - Fixed: NodeConfigurations and reportsexecutions are not archived in
    the same way as reports
    ([\#8444](http://www.rudder-project.org/redmine/issues/8444))

### Release notes

This software is in "release candidate" status but we have tested it and
believe it to be free of any critical bug. The use on production systems
is not encouraged at this time and is at your own risk. However, we do
encourage testing, and welcome all and any feedback\! If no major bugs
are found, a "final" release of 4.0.0 will be released by November 4th.

## Rudder 4.0.0~rc4 (2016-10-26)

### Changes

#### Web - UI & UX

  - Update the login page background
    ([\#9535](http://www.rudder-project.org/redmine/issues/9535))
  - The "info" icon should be replaced
    ([\#9526](http://www.rudder-project.org/redmine/issues/9526))
  - LIttle improvements on Directive form display (bootstrap on general
    informations)
    ([\#9509](http://www.rudder-project.org/redmine/issues/9509))

#### Documentation

  - Remove gradient background in tabs in embedded html doc
    ([\#9525](http://www.rudder-project.org/redmine/issues/9525))

### Bug fixes

#### Web - UI & UX

  - Fixed: Compliance not display in node details from direct link
    ([\#9533](http://www.rudder-project.org/redmine/issues/9533))
  - Fixed: Inconsitent naming of buttons in setting actions
    ([\#9532](http://www.rudder-project.org/redmine/issues/9532))
  - Fixed: Old icon when cleaning report datatbase
    ([\#9529](http://www.rudder-project.org/redmine/issues/9529))

#### Web - Config management

  - Fixed: When changing policy mode on a node, it changes the global
    policy mode for the application
    ([\#9541](http://www.rudder-project.org/redmine/issues/9541))
  - Fixed: Two generation are started after changing the global policy
    mode ([\#9539](http://www.rudder-project.org/redmine/issues/9539))
  - Fixed: Wrong warning in directive save popup
    ([\#9523](http://www.rudder-project.org/redmine/issues/9523))

#### Documentation

  - Fixed: Remove bottom border of doc header
    ([\#9516](http://www.rudder-project.org/redmine/issues/9516))

#### Web - Compliance & node report

  - Fixed: When the node reports an abort run for bad policy mode,
    nothing is displayed
    ([\#9549](http://www.rudder-project.org/redmine/issues/9549))

#### Initial promises & sys tech

  - Fixed: Create the expected reports file for ncf in system techniques
    instead of first log
    ([\#9540](http://www.rudder-project.org/redmine/issues/9540))

#### System integration

  - Fixed: On a fresh Rudder 4.0 install, expectedreports and
    expectedreportsnodes table are still present
    ([\#9517](http://www.rudder-project.org/redmine/issues/9517))

### Release notes

## Rudder 4.0.0~rc3 (2016-10-26)

### Changes

#### Web - UI & UX

  - Add bootstrap on Rules form
    ([\#9494](http://www.rudder-project.org/redmine/issues/9494))

### Bug fixes

#### Packaging

  - Fixed: Sometime ppkeys is not 700
    ([\#9520](http://www.rudder-project.org/redmine/issues/9520))
  - Fixed: rudder agant post-install make an error trying to stop the
    service
    ([\#9519](http://www.rudder-project.org/redmine/issues/9519))
  - Fixed: rudder-init fails to check authorized networks
    ([\#9515](http://www.rudder-project.org/redmine/issues/9515))

#### System integration

  - Fixed: WARN level debug message
    ([\#9513](http://www.rudder-project.org/redmine/issues/9513))

#### Web - Compliance & node report

  - Fixed: When we just apply a configuration, reports is "missing" (not
    "pending")
    ([\#9518](http://www.rudder-project.org/redmine/issues/9518))

### Release notes

## Rudder 4.0.0~rc2 (2016-10-26)

### Changes

#### Packaging

  - Add IPV6 support in rudder-init
    ([\#9269](http://www.rudder-project.org/redmine/issues/9269))

#### Web - UI & UX

  - Remove stripped progress bars animation
    ([\#9498](http://www.rudder-project.org/redmine/issues/9498))

### Bug fixes

#### Packaging

  - Fixed: Error in add-nodeconfigurations migration script in 4.0
    nightly
    ([\#9447](http://www.rudder-project.org/redmine/issues/9447))
  - Fixed: Error during upgrade from 3.2 to 4.0
    ([\#9233](http://www.rudder-project.org/redmine/issues/9233))

#### Web - UI & UX

  - Fixed: DataTable warning when clicking in Software in Node details
    ([\#9493](http://www.rudder-project.org/redmine/issues/9493))
  - Fixed: 404 on JS script
    ([\#9484](http://www.rudder-project.org/redmine/issues/9484))
  - Fixed: No background on audit component compliance status
    ([\#9473](http://www.rudder-project.org/redmine/issues/9473))
  - Fixed: Wrong display of node details tabs while loading
    ([\#9472](http://www.rudder-project.org/redmine/issues/9472))
  - Fixed: In some forms, we see variables names before page loading in
    finished
    ([\#9470](http://www.rudder-project.org/redmine/issues/9470))
  - Fixed: Animations are too slow in the UI
    ([\#9389](http://www.rudder-project.org/redmine/issues/9389))

#### System integration

  - Fixed: We should not hide exceptions in logs
    ([\#9407](http://www.rudder-project.org/redmine/issues/9407))
  - Fixed: Process management issues on nodes hosting LXC containers
    ([\#7381](http://www.rudder-project.org/redmine/issues/7381))

### Release notes

## Rudder 4.0.0~rc1 (2016-10-26)

### Changes

#### Web - UI & UX

  - Redesign Rudder web interface
    ([\#8844](http://www.rudder-project.org/redmine/issues/8844)) \*\*
    New menu \*\* Responsive design \*\* New popups / tree /
    buttons \*\* New colors for compliance \*\* Upgraded all Javascript
    / css librairies, and reorganized

#### Web - Nodes & inventories

  - Default group type should be "dynamic"
    ([\#8568](http://www.rudder-project.org/redmine/issues/8568))

#### Web - Config management

  - Add Directive field with a graphical File Explorer for shared files
    ([\#9211](http://www.rudder-project.org/redmine/issues/9211))
  - Add an Audit mode to Rudder: only check properties, no modification
    on nodes
    ([\#1808](http://www.rudder-project.org/redmine/issues/1808))

#### API

  - Settings API
    ([\#9478](http://www.rudder-project.org/redmine/issues/9478))
  - Add an API endpoint to call rudder-remote-run
    ([\#9290](http://www.rudder-project.org/redmine/issues/9290))

#### Agent

  - Update CFEngine to 3.7.4
    ([\#8812](http://www.rudder-project.org/redmine/issues/8812))
  - Move check-rudder-agent to rudder-agent repo
    ([\#8806](http://www.rudder-project.org/redmine/issues/8806))
  - Rudder agent disable should have a stop option too
    ([\#8734](http://www.rudder-project.org/redmine/issues/8734))
  - Update lmdb to 0.9.18
    ([\#8325](http://www.rudder-project.org/redmine/issues/8325))
  - Add a cfpromises check to rudder agent health
    ([\#8205](http://www.rudder-project.org/redmine/issues/8205))
  - rudder remote-run should allow running for a group of nodes
    ([\#8187](http://www.rudder-project.org/redmine/issues/8187))
  - rudder agent status/start/stop
    ([\#8076](http://www.rudder-project.org/redmine/issues/8076))
  - Filter "rudder remote run" output like "rudder agent run"
    ([\#7945](http://www.rudder-project.org/redmine/issues/7945))
  - Add a -u option to rudder agent run to run an update before the run
    ([\#7824](http://www.rudder-project.org/redmine/issues/7824))
  - Add a rudder server disable command
    ([\#7050](http://www.rudder-project.org/redmine/issues/7050))

#### Documentation

  - Update list of supported OSes in the manual
    ([\#9408](http://www.rudder-project.org/redmine/issues/9408))
  - Document agent-server compatibility limits for 4.0
    ([\#9305](http://www.rudder-project.org/redmine/issues/9305))
  - Prepare manual for 4.0
    ([\#8927](http://www.rudder-project.org/redmine/issues/8927))
  - Create packages for Ubuntu 16.04
    ([\#8200](http://www.rudder-project.org/redmine/issues/8200))
  - Remove asciidoc from the documentation repository and use the system
    version
    ([\#7891](http://www.rudder-project.org/redmine/issues/7891))

#### Packaging

  - Upgrade jdk version used to build the webapp
    ([\#9446](http://www.rudder-project.org/redmine/issues/9446))
  - Only display major version on the login page
    ([\#9386](http://www.rudder-project.org/redmine/issues/9386))
  - Require a recent ncf version for 4.0
    ([\#9385](http://www.rudder-project.org/redmine/issues/9385))
  - Change the Rudder version in the sources to be substituted in the
    packaging script
    ([\#9382](http://www.rudder-project.org/redmine/issues/9382))
  - Remove old conflicts in rudder-inventory-ldap package
    ([\#9104](http://www.rudder-project.org/redmine/issues/9104))
  - Remove migration scripts for 2.10-3.0 in 4.0
    ([\#9012](http://www.rudder-project.org/redmine/issues/9012))
  - Add an automatic network detection in rudder-init
    ([\#9010](http://www.rudder-project.org/redmine/issues/9010))
  - Update embedded openLDAP to 2.4.44
    ([\#8486](http://www.rudder-project.org/redmine/issues/8486))
  - Update fusioninventory to 2.3.17
    ([\#8328](http://www.rudder-project.org/redmine/issues/8328))
  - Preliminary support for Slackware
    ([\#8015](http://www.rudder-project.org/redmine/issues/8015))
  - Preliminary support for freebsd
    ([\#7358](http://www.rudder-project.org/redmine/issues/7358))
  - Include Timezone in Inventory
    ([\#7093](http://www.rudder-project.org/redmine/issues/7093))
  - Merge rudder-agent postinstall into a single script
    ([\#7074](http://www.rudder-project.org/redmine/issues/7074))
  - Preliminary support for solaris package
    ([\#6832](http://www.rudder-project.org/redmine/issues/6832))
  - Rework rudder-agent makefile to make it more standard
    ([\#6770](http://www.rudder-project.org/redmine/issues/6770))

#### Initial promises & sys tech

  - Add node key in managed\_nodes system variable
    ([\#8985](http://www.rudder-project.org/redmine/issues/8985))
  - Make environment variables parse easier
    ([\#8464](http://www.rudder-project.org/redmine/issues/8464))
  - Load environment variables from /etc/profile
    ([\#8263](http://www.rudder-project.org/redmine/issues/8263))
  - Make signature problem easier to diagnose
    ([\#8053](http://www.rudder-project.org/redmine/issues/8053))
  - Merge initial promises and system techniques
    ([\#7915](http://www.rudder-project.org/redmine/issues/7915))
  - Simplify generic\_process\_check\_process bundle
    ([\#7822](http://www.rudder-project.org/redmine/issues/7822))

#### Architecture - Dependencies

  - Use latest minor jetty in Rudder 4.0
    ([\#8965](http://www.rudder-project.org/redmine/issues/8965))
  - use Hikari connection pool
    ([\#7865](http://www.rudder-project.org/redmine/issues/7865))

#### Architecture - Refactoring

  - Clean old fileFormat migration and fileFormat numbering policy
    ([\#9202](http://www.rudder-project.org/redmine/issues/9202))
  - Rename Rudder 3.3 to 4.0
    ([\#8934](http://www.rudder-project.org/redmine/issues/8934))
  - Use Doobie or Slick in place of SpringTemplate / squeryl / pur JDBC
    ([\#2787](http://www.rudder-project.org/redmine/issues/2787))

#### System integration

  - make rudder-perl able to call either rudder's perl or the local perl
    ([\#8500](http://www.rudder-project.org/redmine/issues/8500))

### Bug fixes

#### Documentation

  - Fixed: Broken manual build due to missing 4.0 repo
    ([\#9396](http://www.rudder-project.org/redmine/issues/9396))

#### Agent

  - Fixed: "rudder agent update" should not be quiet by default
    ([\#9218](http://www.rudder-project.org/redmine/issues/9218))
  - Fixed: Syntax errors in rudder commands
    ([\#8915](http://www.rudder-project.org/redmine/issues/8915))
  - Fixed: Broken "rudder agent reinit" on 4.0
    ([\#8838](http://www.rudder-project.org/redmine/issues/8838))
  - Fixed: rudder\_promises\_generated is now called
    rudder-promises-generated
    ([\#8818](http://www.rudder-project.org/redmine/issues/8818))
  - Fixed: Copy initial-ncf in rudder agent reset
    ([\#8805](http://www.rudder-project.org/redmine/issues/8805))
  - Fixed: Rename rudder agent reinit to rudder agent factory-reset
    ([\#8676](http://www.rudder-project.org/redmine/issues/8676))
  - Fixed: Tell if we are on a relay in rudder agent info
    ([\#8196](http://www.rudder-project.org/redmine/issues/8196))
  - Fixed: Add an output to all Rudder commands
    ([\#7911](http://www.rudder-project.org/redmine/issues/7911))

#### Packaging

  - Fixed: Build may fail on rhel6
    ([\#9358](http://www.rudder-project.org/redmine/issues/9358))
  - Fixed: Rudder man page is missing in 4.0 package
    ([\#9223](http://www.rudder-project.org/redmine/issues/9223))
  - Fixed: Make downloading files in Makefile be done in two steps
    ([\#9002](http://www.rudder-project.org/redmine/issues/9002))
  - Fixed: Maven does not honor PROXY settings during build
    ([\#9000](http://www.rudder-project.org/redmine/issues/9000))
  - Fixed: SLES12 SP1 is not detected properly
    ([\#8999](http://www.rudder-project.org/redmine/issues/8999))
  - Fixed: Broken dependencies in 4.0 RPM because of epoch
    ([\#8914](http://www.rudder-project.org/redmine/issues/8914))
  - Fixed: Makke uuidgen a single point of uuid generation
    ([\#8837](http://www.rudder-project.org/redmine/issues/8837))
  - Fixed: On SLES (at least), updating rudder-server-root does not
    update dependencies
    ([\#8454](http://www.rudder-project.org/redmine/issues/8454))

#### Initial promises & sys tech

  - Fixed: Incorrect inventory on Rudder server
    ([\#9433](http://www.rudder-project.org/redmine/issues/9433))

#### System integration

  - Fixed: logback.xml doesn't contains most entries in 4.0
    ([\#9397](http://www.rudder-project.org/redmine/issues/9397))
  - Fixed: Wrong detection of rudder init parameters
    ([\#9222](http://www.rudder-project.org/redmine/issues/9222))

#### Architecture - Dependencies

  - Fixed: Missing version bump in parent-pom for rudder-version
    ([\#8035](http://www.rudder-project.org/redmine/issues/8035))

