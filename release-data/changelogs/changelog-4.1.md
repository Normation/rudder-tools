# Change logs for Rudder 4.1.\* versions

Rudder 4.1 is currently the beta version of Rudder.

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

