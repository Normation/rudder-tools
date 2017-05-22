# Change logs for Rudder 3.1.\* versions

Rudder 3.1 is currently the **latest 'ESR' (Extended Support Release)**
version of Rudder. It is codenamed **Frigate**.

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Main new features in Rudder 3.1:**

  - Global improvement on security  
      - Inventory system is now signed
      - We provide a basic SELinux policy
      - Choose between UDP and TCP to send reports
  - A more complete API
      - Rule categories
      - Group categories
      - Query on Nodes
      - Compliance
      - Global API informations
  - Allow to sort rules and directive execution on nodes (since 3.1.1)
  - Display compliance of each Node in Nodes list
  - Add filter boxes on Directive/Group tree in Rule details
  - Add a summary of applied Directives in Rule details
  - Add a useful 404 page
  - Little improvements on Node details display
  - New commands to rudder agent cli
  - Replace all init scripts by a new generic one
  - SLES 12 Support
  - Agent based on CFEngine 3.6.5

**Installing, upgrading and testing**

Documentation:

  - Install:
    https://www.rudder-project.org/doc-3.1/_install_rudder_server.html
  - Upgrade:
    https://www.rudder-project.org/doc-3.1/_upgrade.html

The Download Links are available here:
https://www.rudder-project.org/site/get-rudder/downloads/.

We also recommend using the [Rudder
Vagrant](https://github.com/Normation/rudder-vagrant) config if you want
a quick and easy way to get an installation for testing.

**IMPORTANT:** The inventories are now sent over HTTPS by default, you
need to open the HTTPS (443) port between your nodes and your Rudder
servers\!

**Operating systems supported**

This version provides packages for these operating systems:

  - Rudder server: **Debian 7, Debian 8, RHEL/CentOS 6, RHEL/CentOS 7,
    SLES 11, Ubuntu 12.04, Ubuntu 14.04**
  - Rudder agent: all of the above plus **Debian 5, Debian 6,
    RHEL/CentOS 3, RHEL/CentOS 5, Fedora 18, SLES 10, SLES 12 Ubuntu
    10.04, Ubuntu 12.10**
  - Rudder agent (non-free): **Windows Server 2008-2012**, **AIX 5-6-7**


## <a name="3.1.19" > </a> Rudder 3.1.19 (2017-04-19)

### Changes

#### Packaging

  - Upgrade OpenSSL to 1.0.2k
    ([\#10246](https://www.rudder-project.org/redmine/issues/10246))

### Bug fixes

#### API

  - Fixed: Wrong error message on directive API
    ([\#10554](https://www.rudder-project.org/redmine/issues/10554))
  - Fixed: Log an error when Rest API fails 
    ([\#10295](https://www.rudder-project.org/redmine/issues/10295))
  - Fixed: Fix behavior of directive API and make api more consistent
    ([\#10225](https://www.rudder-project.org/redmine/issues/10225))

#### Web - UI & UX

  - Fixed: Different icons for magnifier in pending nodes page
    ([\#10524](https://www.rudder-project.org/redmine/issues/10524))
  - Fixed: A magnifier icon appears in the filter fild after displaying directives that would be applied in pending nodes page
    ([\#10525](https://www.rudder-project.org/redmine/issues/10525))
  - Fixed: "Reset to default" action in "Change Audit Logs" doesn't reset to install version
    ([\#9391](https://www.rudder-project.org/redmine/issues/9391))
  - Fixed: A running Policy generation is not displayed on the Status dropdown
    ([\#10451](https://www.rudder-project.org/redmine/issues/10451))
  - Fixed: GUI breaks completely with IE 11
    ([\#10452](https://www.rudder-project.org/redmine/issues/10452))
  - Fixed: padding-down instead of padding-bottom in rudder.css
    ([\#10465](https://www.rudder-project.org/redmine/issues/10465))
  - Fixed: Display issue on "Accept new Nodes" page
    ([\#9165](https://www.rudder-project.org/redmine/issues/9165))
  - Fixed: Dropdown lists in directive forms are not wide enough and hide the contents of options
    ([\#10361](https://www.rudder-project.org/redmine/issues/10361))
  - Fixed: Cannot use slashes in quick search
    ([\#10407](https://www.rudder-project.org/redmine/issues/10407))
  - Fixed: Checkboxes in Administration menu are not locked for users with missing permissions
    ([\#9328](https://www.rudder-project.org/redmine/issues/9328))
  - Fixed: Compliance display when hoverving over the compliance bar is too precise
    ([\#9323](https://www.rudder-project.org/redmine/issues/9323))
  - Fixed: When trying to create a new API account that has the same name as an existing acocunt, nothing happen
    ([\#10250](https://www.rudder-project.org/redmine/issues/10250))

#### Web - Nodes & inventories

  - Fixed: Regex search on node properties is broken: returns all nodes with a property when no using invalid value
    ([\#10570](https://www.rudder-project.org/redmine/issues/10570))
  - Fixed: Rudder fails to accept inventories with user account different only in their case
    ([\#10545](https://www.rudder-project.org/redmine/issues/10545))

#### Web - Maintenance

  - Fixed: There is no error logged when an error occurs when updating information of Node in Node cache
    ([\#10290](https://www.rudder-project.org/redmine/issues/10290))

#### Web - Config management

  - Fixed: Missing "user techniques" in the technique editor when exporting / importing archive
    ([\#9448](https://www.rudder-project.org/redmine/issues/9448))
  - Fixed: Policy validation fails
    ([\#10446](https://www.rudder-project.org/redmine/issues/10446))

#### Agent

  - Fixed: Policy loading is slow due to innefficient variable manipulation
    ([\#10576](https://www.rudder-project.org/redmine/issues/10576))
  - Fixed: On upgrade from 3.1 to 4.1, policy could not be generated any more
    ([\#10559](https://www.rudder-project.org/redmine/issues/10559))

#### Packaging

  - Fixed: Don't display warning about configuring policy server on root server
    ([\#8976](https://www.rudder-project.org/redmine/issues/8976))

#### Initial promises & sys tech

  - Fixed: Transient update error on ncf/local
    ([\#10028](https://www.rudder-project.org/redmine/issues/10028))
  - Fixed: Propagate promises error when no nodes behind a relay
    ([\#7671](https://www.rudder-project.org/redmine/issues/7671))

#### System integration

  - Fixed: Error in migration (ldap backup not found because ending by .gz)
    ([\#10521](https://www.rudder-project.org/redmine/issues/10521))
  - Fixed: Log contains debug info  "**** got string: {"start":"2017-03-09 00:00:00", "end", "2017-03-11 00:00:00"}"
    ([\#10553](https://www.rudder-project.org/redmine/issues/10553))
  - Fixed: Log for failed login attempt is not (correctly) reported
    ([\#10259](https://www.rudder-project.org/redmine/issues/10259))
  - Fixed: After running rudder-init, no connectivity to postgresql
    ([\#10486](https://www.rudder-project.org/redmine/issues/10486))
  - Fixed: Clean-up and add build information in META-INF
    ([\#10253](https://www.rudder-project.org/redmine/issues/10253))

#### Performance and scalability

  - Fixed: Enable gzip compression on text resources
    ([\#10365](https://www.rudder-project.org/redmine/issues/10365))

#### Techniques

  - Fixed: "Download files from the shared folder" behaving badly?
    ([\#10312](https://www.rudder-project.org/redmine/issues/10312))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Ilan Costa
  - Florian Heigl
  - Janos Mattyasovszky
  - Hamlyn Mootoo 
  - Dmitry Svyatogorov 

This is a bug fix release in the 3.1 'esr' series and therefore all
installations of 3.1.x should be upgraded when possible. When we release
a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.



## <a name="3.1.20" > </a> Rudder 3.1.20 (2017-05-22)

### Changes

#### Documentation

  - Add an example of using a condition in the Technique creation tutorial
    ([\#10694](https://www.rudder-project.org/redmine/issues/10694))
  - Add Technique editor documentation
    ([\#10685](https://www.rudder-project.org/redmine/issues/10685))
  - Extend node property documentation for templates
    ([\#10614](https://www.rudder-project.org/redmine/issues/10614))

### Bug fixes

#### Web - UI & UX

  - Fixed: Fix details in Technique editor doc
    ([\#10699](https://www.rudder-project.org/redmine/issues/10699))
  - Fixed: On some resolution, top bar is on two line and we can't see the whole directive tree
    ([\#10552](https://www.rudder-project.org/redmine/issues/10552))
  - Fixed: Mono Font text in directive form are not correctly displayed in Chrome
    ([\#9780](https://www.rudder-project.org/redmine/issues/9780))
  - Fixed: Selects in Archives page are not wide enough
    ([\#10615](https://www.rudder-project.org/redmine/issues/10615))

#### Web - Config management

  - Fixed: Tooltips don't disapear on safari
    ([\#6145](https://www.rudder-project.org/redmine/issues/6145))
  - Fixed: Clearly report on template attribute with a '.' in them
    ([\#10742](https://www.rudder-project.org/redmine/issues/10742))

#### Performance and scalability

  - Fixed: Unecessary call to inventory code to check its version during policy validation
    ([\#10641](https://www.rudder-project.org/redmine/issues/10641))

#### Documentation

  - Fixed: Document correctly memory usage 
    ([\#10744](https://www.rudder-project.org/redmine/issues/10744))
  - Fixed: Missing information in Technique editor doc
    ([\#10710](https://www.rudder-project.org/redmine/issues/10710))
  - Fixed: Supported Windows platforms are Windows Server 2008 and after
    ([\#10656](https://www.rudder-project.org/redmine/issues/10656))
  - Fixed: Doc: "Regenerate now" button has been renamed "Update policies"
    ([\#10633](https://www.rudder-project.org/redmine/issues/10633))
  - Fixed: Backup restoration requires disabling the agent
    ([\#10639](https://www.rudder-project.org/redmine/issues/10639))
  - Fixed: Rudder installation docs are misleading as to running rudder-init
    ([\#10624](https://www.rudder-project.org/redmine/issues/10624))
  - Fixed: Node property documentation has error
    ([\#10613](https://www.rudder-project.org/redmine/issues/10613))

#### Miscellaneous

  - Fixed: If cf-serverd is not up, hook 50-reload-policy-file-server is in error and breaks policy generation
    ([\#10493](https://www.rudder-project.org/redmine/issues/10493))
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
  - Fixed: Man pages provided in rudder-agent package are out-of-date
    ([\#10432](https://www.rudder-project.org/redmine/issues/10432))
  - Fixed: rudder-init doesn't use fully qualified path for executing cf-agent
    ([\#10607](https://www.rudder-project.org/redmine/issues/10607))

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

#### Web - Maintenance

  - Fixed: Adding an authorized network when "common-root" directive is missing seems to work, but actually fails
    ([\#8017](https://www.rudder-project.org/redmine/issues/8017))
  - Fixed: There is small display glitch in change request display 
    ([\#6257](https://www.rudder-project.org/redmine/issues/6257))

#### Server components

  - Fixed: Inventory endpoint accepts inventory even if ldap or postgresql connectivity failed
    ([\#10485](https://www.rudder-project.org/redmine/issues/10485))

#### Techniques

  - Fixed: Unclear field description in MOTD technique
    ([\#10655](https://www.rudder-project.org/redmine/issues/10655))
  - Fixed: Technique files contains UTF-8 chars (especially spaces)
    ([\#7622](https://www.rudder-project.org/redmine/issues/7622))
  - Fixed: "Variable (String)" Directive in the Directive library does not use textarea
    ([\#10585](https://www.rudder-project.org/redmine/issues/10585))


## Rudder 3.1.18 (2017-02-20)

### Changes

#### Web - Nodes & inventories

  - API endpoint to get information about queue status of uploaded inventories
    ([\#9976](https://www.rudder-project.org/redmine/issues/9976))

#### Web - UI & UX

  - Add an option to not display rule status/recent changes in directives screen
    ([\#10157](https://www.rudder-project.org/redmine/issues/10157))
  - Node breakdown - show actual numbers
    ([\#7422](https://www.rudder-project.org/redmine/issues/7422))

#### Documentation

  - Add link to the new FAQ in the manual
    ([\#10181](https://www.rudder-project.org/redmine/issues/10181))
  - Add qa-test for line breaks
    ([\#9893](https://www.rudder-project.org/redmine/issues/9893))

### Bug fixes

#### Web - UI & UX

  - Fixed: Included "time ended" in Status dropdown
    ([\#10133](https://www.rudder-project.org/redmine/issues/10133))
  - Fixed: Shared files input does not appear on in directives form
    ([\#9804](https://www.rudder-project.org/redmine/issues/9804))
  - Fixed: Change request link is too small
    ([\#6142](https://www.rudder-project.org/redmine/issues/6142))

#### Web - Config management

  - Fixed: Deadlock with simultaneous generation and new reports
    ([\#10168](https://www.rudder-project.org/redmine/issues/10168))
  - Fixed: Incomplete logging in expected reports computation
    ([\#10143](https://www.rudder-project.org/redmine/issues/10143))

#### Performance and scalability

  - Fixed: Compliance on all reports is always computed, even when not necessary
    ([\#9869](https://www.rudder-project.org/redmine/issues/9869))

#### Architecture - Internal libs

  - Fixed: Test create directories in /tmp that are not cleaned nor unique
    ([\#10029](https://www.rudder-project.org/redmine/issues/10029))

#### Documentation

  - Fixed: Broken link in CFEngine doc
    ([\#10151](https://www.rudder-project.org/redmine/issues/10151))
  - Fixed: expected reports, component keys
    ([\#8633](https://www.rudder-project.org/redmine/issues/8633))
  - Fixed: Missing "default =" word in node properties expansion documention
    ([\#9800](https://www.rudder-project.org/redmine/issues/9800))

#### Miscellaneous

  - Fixed: Typo in root of policy libray tree name
    ([\#9884](https://www.rudder-project.org/redmine/issues/9884))

#### Web - Compliance & node report

  - Fixed: If node is sending unexpected report, we get an invalid text
    ([\#9930](https://www.rudder-project.org/redmine/issues/9930))
  - Fixed: When we receive reports from node with old reports, caches are not used for compliance computation
    ([\#9835](https://www.rudder-project.org/redmine/issues/9835))

#### Packaging

  - Fixed: rudder-techniques depends on perl(XML::TreePP)
    ([\#9845](https://www.rudder-project.org/redmine/issues/9845))
  - Fixed: Missing selinux-policy-devel in rudder-server-relay dependencies
    ([\#10090](https://www.rudder-project.org/redmine/issues/10090))
  - Fixed: Do not build SELinux policy on old OSes
    ([\#10089](https://www.rudder-project.org/redmine/issues/10089))
  - Fixed: SELinux target directory does not exist
    ([\#10056](https://www.rudder-project.org/redmine/issues/10056))
  - Fixed: Add SELinux config to relay package
    ([\#9913](https://www.rudder-project.org/redmine/issues/9913))
  - Fixed: ncf-api-virtualenv build depends on selinux
    ([\#9851](https://www.rudder-project.org/redmine/issues/9851))

#### Initial promises & sys tech

  - Fixed: Error parsing inventory
    ([\#9841](https://www.rudder-project.org/redmine/issues/9841))

#### Web - Nodes & inventories

  - Fixed: Inventories with fields containing only spaces/tabs/... may fail to be parsed due to invalid sanitization of entry
    ([\#10220](https://www.rudder-project.org/redmine/issues/10220))
  - Fixed: FileNotFoundException when looking for deleted history file
    ([\#10115](https://www.rudder-project.org/redmine/issues/10115))

#### Agent

  - Fixed: Logs from 4.1 agent are not sent to the server
    ([\#9776](https://www.rudder-project.org/redmine/issues/9776))

#### Architecture - Dependencies

  - Fixed: warning: Class javax.annotation.Nonnull not found - continuing with a stub.
    ([\#10146](https://www.rudder-project.org/redmine/issues/10146))
  - Fixed: Use correct repository definition in pom.xml
    ([\#10120](https://www.rudder-project.org/redmine/issues/10120))

#### Web - Maintenance

  - Fixed: If the Rudder Web Interface is interrupted during the second step of reports archiving, then it won't never succeed in archiving again
    ([\#10171](https://www.rudder-project.org/redmine/issues/10171))

#### Server components

  - Fixed: Rudder's LDAP server configuration does not allow to query the monitor DB
    ([\#9818](https://www.rudder-project.org/redmine/issues/9818))

#### Techniques

  - Fixed: The service management technique does not disable boot services
    ([\#9872](https://www.rudder-project.org/redmine/issues/9872))
  - Fixed: copyGitFile reports an error when destination is a symbolic link
    ([\#9500](https://www.rudder-project.org/redmine/issues/9500))
  - Fixed: Job is not run for Technique JobScheduler in Rudder
    ([\#9822](https://www.rudder-project.org/redmine/issues/9822))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Janos Mattyasovszky

This is a bug fix release in the 3.1 'esr' series and therefore all
installations of 3.1.x should be upgraded when possible. When we release
a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.



## Rudder 3.1.17 (2016-12-12)

### Changes

#### Web - Nodes & inventories

  - On agent, check inventory before sending it to Rudder server ([\#8127](http://www.rudder-project.org/redmine/issues/8127))

#### System integration

  - Rudder error pages should not change transport ([\#9637](http://www.rudder-project.org/redmine/issues/9637))

#### Architecture - Internal libs

  - Add basic infrastructure to test REST API ([\#9201](http://www.rudder-project.org/redmine/issues/9201))

#### Documentation

  - Move techniques reference doc to the manual ([\#9586](http://www.rudder-project.org/redmine/issues/9586))
  - Make rudder-doc gitignore more complete ([\#9570](http://www.rudder-project.org/redmine/issues/9570))
  - Build final doc for releases in rc status ([\#9564](http://www.rudder-project.org/redmine/issues/9564))
  - Use $releasever in upgrade section for RHEL ([\#9439](http://www.rudder-project.org/redmine/issues/9439))
  - Update documentation to have version independant repo ([\#9422](http://www.rudder-project.org/redmine/issues/9422))
  - Use release info to get ncf version to use in doc ([\#9393](http://www.rudder-project.org/redmine/issues/9393))

### Bug fixes

#### Web - Config management

  - Fixed: Node properties update doesn't invalidate node configuration hash ([\#9402](http://www.rudder-project.org/redmine/issues/9402))

#### Web - UI & UX

  - Fixed: Degraded style of text areas in directive forms ([\#9703](http://www.rudder-project.org/redmine/issues/9703))
  - Fixed: Missing top of eventLog datetime picker on small screen  ([\#9267](http://www.rudder-project.org/redmine/issues/9267))
  - Fixed: If an event logs contains long lines it is not displayed properly ([\#5963](http://www.rudder-project.org/redmine/issues/5963))

#### Web - Nodes & inventories

  - Fixed: No server inventory in web interface if /etc/hosts is not correctly configured ([\#9744](http://www.rudder-project.org/redmine/issues/9744))

##### Agent

  - Fixed: Improve error messages in "rudder agent update" ([\#9726](http://www.rudder-project.org/redmine/issues/9726))
  - Fixed: Fusioninventory is not tracked by check-rudder-health ([\#9622](http://www.rudder-project.org/redmine/issues/9622))
  - Fixed: Typo in rudder agent run failure message ([\#9618](http://www.rudder-project.org/redmine/issues/9618))
  - Fixed: Virtual machine detected as physical ([\#9496](http://www.rudder-project.org/redmine/issues/9496))
  - Fixed: Some QEMU systems are wrongly detected as physical system ([\#9335](http://www.rudder-project.org/redmine/issues/9335))

##### Techniques

  - Fixed: Allow to only install a specific version in apt and rpm techniques. ([\#9761](http://www.rudder-project.org/redmine/issues/9761))
  - Fixed: Wrong warn log report in ssh techniques on sles >= 11 ([\#9317](http://www.rudder-project.org/redmine/issues/9317))

### API

  - Fixed: API allows to create duplicate UUIDs at group creation ([\#9742](http://www.rudder-project.org/redmine/issues/9742))
  - Fixed: Creating an empty group with no search criteria messes up GUI ([\#9741](http://www.rudder-project.org/redmine/issues/9741))
  - Fixed: Setting nodeProperty over API does fail on bad key order ([\#9326](http://www.rudder-project.org/redmine/issues/9326))
  - Fixed: Rudder API timeouts when passing wrong parameters ([\#7134](http://www.rudder-project.org/redmine/issues/7134))

### Documentation

  - Fixed: Bad plugin installation info on doc ([\#9721](http://www.rudder-project.org/redmine/issues/9721))
  - Fixed: Bad file indicated in Java memory config chapter ([\#9628](http://www.rudder-project.org/redmine/issues/9628))
  - Fixed: Manual is broken because of some new syntax in ncf doc ([\#9621](http://www.rudder-project.org/redmine/issues/9621))
  - Fixed: Wiki documentation broken URL ([\#9608](http://www.rudder-project.org/redmine/issues/9608))
  - Fixed: Mention port 80 in manual ([\#9567](http://www.rudder-project.org/redmine/issues/9567))
  - Fixed: API Documentation: Delete node shows example of accept node ([\#9368](http://www.rudder-project.org/redmine/issues/9368))
  - Fixed: Cleanup node properties documentation ([\#9253](http://www.rudder-project.org/redmine/issues/9253))
  - Fixed: Rudder API doc is invalid for getting the list of pending nodes ([\#7973](http://www.rudder-project.org/redmine/issues/7973))

#### Packaging

  - Fixed: On Ubuntu 16.04, openjdk 9 is installed by default, and not recognized as a compatible version ([\#9613](http://www.rudder-project.org/redmine/issues/9613))
  - Fixed: fusion agent fail to build on ubuntu 16 ([\#9556](http://www.rudder-project.org/redmine/issues/9556))

#### Initial promises & sys tech

  - Fixed: Script that validate inventory is not correctly called on Windows ([\#9764](http://www.rudder-project.org/redmine/issues/9764))
  - Fixed: Error on inventory of policy servers:  Error when parsing an <RUDDER><AGENT> entry, that agent will be ignored. <- could not parse policy server id (tag POLICY_SERVER_UUID) from specific inventory ([\#9327](http://www.rudder-project.org/redmine/issues/9327))
  - Fixed: Explain in the reports of system techniques that we do not need to manage the cron service on AIX ([\#9235](http://www.rudder-project.org/redmine/issues/9235))
  - Fixed: Multiple errors "The postgresql process was not running and has been restarted" ([\#9182](http://www.rudder-project.org/redmine/issues/9182))

#### System integration

  - Fixed: rudder-upgrade should use the database name from the webapp configuration ([\#9749](http://www.rudder-project.org/redmine/issues/9749))
  - Fixed: Add a warning comment for password change in rudder-web.properties ([\#9685](http://www.rudder-project.org/redmine/issues/9685))
  - Fixed: Compressing the ldap backup hangs if would require to overwrite it ([\#9630](http://www.rudder-project.org/redmine/issues/9630))
  - Fixed: Firefox stalls after TLS handshake on self signed certificate ([\#9566](http://www.rudder-project.org/redmine/issues/9566))
  - Fixed: The API alive check may hang forever ([\#9561](http://www.rudder-project.org/redmine/issues/9561))
  - Fixed: Missing logger information for quicksearch in logback.xml ([\#9406](http://www.rudder-project.org/redmine/issues/9406))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alexandre Anriot
  - Alexander Brunhirl
  - Florian Heigl
  - Janos Mattyasovszky
  - Dmitry Svyatogorov

This is a bug fix release in the 3.1 'esr' series and therefore all
installations of 3.1.x should be upgraded when possible. When we release
a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.

## Rudder 3.1.16 (2016-10-12)

### Changes

#### Agent

  - Send inventory signature before inventory
    ([\#9196](http://www.rudder-project.org/redmine/issues/9196))

### Bug fixes

#### Web - UI & UX

  - Fixed: Technique "Enforce a file content" breaks carriage returns
    ([\#9243](http://www.rudder-project.org/redmine/issues/9243))

#### Web - Nodes & inventories

  - Fixed: Virtual machine detection does not recognize HyperV machines
    ([\#9262](http://www.rudder-project.org/redmine/issues/9262))

#### Web - Config management

  - Fixed: Rule & directive order is not taken into account for
    nodeConfig cache invalidation
    ([\#9320](http://www.rudder-project.org/redmine/issues/9320))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alexandre Anriot

This is a bug fix release in the 3.1 'esr' series and therefore all
installations of 3.1.x should be upgraded when possible. When we release
a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.

## Rudder 3.1.15 (2016-10-05)

### Changes

#### Web - Config management

  - Allow the use of node properties info in Directive parameters
    ([\#9057](http://www.rudder-project.org/redmine/issues/9057))
  - Allow to look for past reports and event logs using a date selector,
    so they are not limited last 1000 entries
    ([\#8886](http://www.rudder-project.org/redmine/issues/8886))

#### Web - UI & UX

  - Make the quicksearch bar in menu able to also search rule, group,
    directive, etc
    ([\#8563](http://www.rudder-project.org/redmine/issues/8563))
  - Allow to use JS script in text/textarea
    ([\#9090](http://www.rudder-project.org/redmine/issues/9090))

#### API

  - Add item names in compliance API
    ([\#9083](http://www.rudder-project.org/redmine/issues/9083))

#### Documentation

  - Document separate database configuration in Rudder
    ([\#8908](http://www.rudder-project.org/redmine/issues/8908))

#### Architecture - Internal libs

  - Add a qa-test to techniques repo
    ([\#8975](http://www.rudder-project.org/redmine/issues/8975))

#### Agent

  - Use rudder commands directly inside other rudder commands
    ([\#8925](http://www.rudder-project.org/redmine/issues/8925))

### Bug fixes

#### Web - Compliance & node report

  - Fixed: When there is missing and received reports, we don't see the
    received one
    ([\#9141](http://www.rudder-project.org/redmine/issues/9141))

#### Web - Config management

  - Fixed: JS scripting engine is broken with IBM JDK 7 (and 8)
    ([\#8936](http://www.rudder-project.org/redmine/issues/8936))
  - Fixed: 'ip' fields in techniques/directives does not support ipv6
    ([\#8628](http://www.rudder-project.org/redmine/issues/8628))
  - Fixed: If a technique ncf has a $, generation
    fails ([\#9184](http://www.rudder-project.org/redmine/issues/9184))

#### API

  - Fixed: Rudder Directive Rest API does not parse json parameters
    correctly
    ([\#8957](http://www.rudder-project.org/redmine/issues/8957))

#### Web - UI & UX

  - Fixed: Webapp: sorting by recent changes doesn't work
    ([\#8867](http://www.rudder-project.org/redmine/issues/8867))
  - Fixed: Typo in error message when ldap is empty
    ([\#8899](http://www.rudder-project.org/redmine/issues/8899))
  - Fixed: Script evaluation is not limited to password fields anymore
    ([\#9190](http://www.rudder-project.org/redmine/issues/9190))
  - Fixed: Typo in doc for new scripts evaluation and node properties
    ([\#9180](http://www.rudder-project.org/redmine/issues/9180))

#### Builder - UI/UX

  - Fixed: Uneeded scrollbar when using ncf builder in an iframe
    ([\#9164](http://www.rudder-project.org/redmine/issues/9164))
  - Fixed: Cannot save new generic method with some contraints
    ([\#8981](http://www.rudder-project.org/redmine/issues/8981))
  - Fixed: We need to save twice after cloning a technique
    ([\#8896](http://www.rudder-project.org/redmine/issues/8896))

#### Web - Nodes & inventories

  - Fixed: AIX inventory tries to report on cpuid.arc
    ([\#9145](http://www.rudder-project.org/redmine/issues/9145))
  - Fixed: Inventory "toInt" error when parsing report with
    VIRTUALMEMORY = 2297795780
    ([\#9077](http://www.rudder-project.org/redmine/issues/9077))
  - Fixed: Some KVM virtual machines considered as physical nodes
    ([\#9049](http://www.rudder-project.org/redmine/issues/9049))
  - Fixed: Inventory is not parsed if OPERATINGSYSTEM/NAME is missing
    ([\#8993](http://www.rudder-project.org/redmine/issues/8993))
  - Fixed: Virtual machines considered as physical nodes
    ([\#8953](http://www.rudder-project.org/redmine/issues/8953))

#### Techniques

  - Fixed: Techniques use $ for paths of ressources files
    (ex: properties), which prevent their validation by the Web
    Interface during policies generation
    ([\#9113](http://www.rudder-project.org/redmine/issues/9113))
  - Fixed: Typo in 'Package version match' in "Package management for
    RHEL / CentOS / SuSE / RPM systems" technique
    ([\#8954](http://www.rudder-project.org/redmine/issues/8954))
  - Fixed: crontab frequency does not support reserved string @reboot
    ([\#8825](http://www.rudder-project.org/redmine/issues/8825))
  - Fixed: Zypper repo management "Delete all other repositories than
    those managed by Rudder" is broken
    ([\#8824](http://www.rudder-project.org/redmine/issues/8824))

#### ncf - Policies

  - Fixed: Do not save backups for expected reports files
    ([\#9139](http://www.rudder-project.org/redmine/issues/9139))
  - Fixed: Package check installed does not produce reports
    ([\#9132](http://www.rudder-project.org/redmine/issues/9132))
  - Fixed: Check/Verify package generic methods are actually installing
    packages
    ([\#8972](http://www.rudder-project.org/redmine/issues/8972))
  - Fixed: missing rudder\_expected\_reports.csv.res when starting the
    agent for the first time after an update
    ([\#8871](http://www.rudder-project.org/redmine/issues/8871))
  - Fixed: file\_ensure\_lines\_present\_in\_ini\_section.cf test fails
    with CFEngine 3.9
    ([\#8638](http://www.rudder-project.org/redmine/issues/8638))
  - Fixed: Missing reporting in "Service ensure running with service
    path" when the service is not running
    ([\#8270](http://www.rudder-project.org/redmine/issues/8270))
  - The test framework should be able to use list-compatible-input to
    only test compatible generic methods
    ([\#8657](http://www.rudder-project.org/redmine/issues/8657))

#### Agent

  - Fixed: rudder agent version doesn't work on old rpm versions
    ([\#9142](http://www.rudder-project.org/redmine/issues/9142))
  - Fixed: rudder agent fails on aix
    ([\#9138](http://www.rudder-project.org/redmine/issues/9138))
  - Fixed: Kept classes are not defined when editing fields in a file in
    warn only mode
    ([\#9082](http://www.rudder-project.org/redmine/issues/9082))
  - Fixed: Forbid agent reinit on the root server
    ([\#9076](http://www.rudder-project.org/redmine/issues/9076))
  - Fixed: Agent sometimes fail to apply package actions because of
    global lock
    ([\#8926](http://www.rudder-project.org/redmine/issues/8926))
  - Fixed: The agent fails writing fields in lines longer than 4k
    ([\#8794](http://www.rudder-project.org/redmine/issues/8794))
  - Fixed: JSON output in cf-promises is limited to 2048 chars for
    strings
    ([\#8260](http://www.rudder-project.org/redmine/issues/8260))
  - Fixed: cfengine stops processing a promise on symlinks
    ([\#7060](http://www.rudder-project.org/redmine/issues/7060))
  - Fixed: Rudder agent ignores virtual network interfaces
    ([\#6124](http://www.rudder-project.org/redmine/issues/6124))
  - Fixed: The PowerShell list-compatible-inputs version should be
    executed with Bypass ExecutionPolicy
    ([\#9193](http://www.rudder-project.org/redmine/issues/9193))
  - Fixed: Rudder bash completion does not handle correctly commands
    containing dashes
    ([\#9174](http://www.rudder-project.org/redmine/issues/9174))

#### Documentation

  - Fixed: Wrong display of Rudder versions in the doc
    ([\#8937](http://www.rudder-project.org/redmine/issues/8937))
  - Fixed: Code blocks in the doc overflow the page width
    ([\#8917](http://www.rudder-project.org/redmine/issues/8917))
  - Fixed: Improve documentation on directive API on update and creation
    ([\#8913](http://www.rudder-project.org/redmine/issues/8913))
  - Fixed: The search bar sometimes hides the page title in webhelp doc
    ([\#8897](http://www.rudder-project.org/redmine/issues/8897))
  - Fixed: Normalize prompt/command display in the doc
    ([\#8849](http://www.rudder-project.org/redmine/issues/8849))
  - Fixed: Give more precise requirements for JVM to manage AIX
    sha256/512 passwords
    ([\#8804](http://www.rudder-project.org/redmine/issues/8804))

#### ncf - Documentation

  - Small improvement for ncf website
    ([\#9068](http://www.rudder-project.org/redmine/issues/9068))
  - Remove TODO file from ncf repo
    ([\#9014](http://www.rudder-project.org/redmine/issues/9014))
  - Drop CFEngine 3.5 support
    ([\#8946](http://www.rudder-project.org/redmine/issues/8946))

#### Packaging

  - Fixed: Embedded openssl command doesn't work on aix
    ([\#9143](http://www.rudder-project.org/redmine/issues/9143))
  - Fixed: Builds are failing with "stack overflow error" in typer
    ([\#9123](http://www.rudder-project.org/redmine/issues/9123))
  - Fixed: rudder-server-relay Makefile misses WGET def
    ([\#9023](http://www.rudder-project.org/redmine/issues/9023))
  - Fixed: \[rudder-packages\] invalid spec files for SLES12 SP1
    ([\#9001](http://www.rudder-project.org/redmine/issues/9001))
  - Fixed: Update 3.0-\>3.1 on SLES commits and rebuilds vanilla system
    techniques
    ([\#8980](http://www.rudder-project.org/redmine/issues/8980))
  - Fixed: Fail while building perl modules on Ubuntu 16.04 for Rudder
    3.1/3.2
    ([\#8979](http://www.rudder-project.org/redmine/issues/8979))
  - Fixed: The file rsyslog.d/rudder.conf might not be embedded in
    rudder-reports (db on a separate server)
    ([\#8876](http://www.rudder-project.org/redmine/issues/8876))
  - Fixed: We need a run with the initial promises before being able to
    update the promises
    ([\#8850](http://www.rudder-project.org/redmine/issues/8850))

#### Initial promises & sys tech

  - Fixed: ncf compatibility cache not updated after Rudder upgrade
    ([\#9156](http://www.rudder-project.org/redmine/issues/9156))
  - Fixed: Typo in common technique reports
    ([\#9035](http://www.rudder-project.org/redmine/issues/9035))
  - Fixed: missing rudder\_expected\_reports.csv.res when starting the
    agent for the first time after an update - technique changes
    ([\#8909](http://www.rudder-project.org/redmine/issues/8909))
  - Fixed: outputs folder is cleaned at each run
    ([\#8750](http://www.rudder-project.org/redmine/issues/8750))
  - Fixed: Don't report error when the copy of the license file for
    CFEngine Enterprise fails
    ([\#8521](http://www.rudder-project.org/redmine/issues/8521))

#### Builder - API

  - Fixed: rudderification breaks when a parameter contains '&'
    ([\#9096](http://www.rudder-project.org/redmine/issues/9096))
  - Fixed: When the conditions contain spaces, they are kept and the
    generated file is invalid
    ([\#8763](http://www.rudder-project.org/redmine/issues/8763))
  - Fixed: The Category list is cut on small screen
    ([\#8762](http://www.rudder-project.org/redmine/issues/8762))

#### System integration

  - Fixed: JS Script, Node Properties expansion and Quicksearch should
    be disabled on migration
    ([\#9157](http://www.rudder-project.org/redmine/issues/9157))
  - Fixed: The "rudder" init script tries to stop slapd before jetty
    ([\#9091](http://www.rudder-project.org/redmine/issues/9091))

#### Architecture - Internal libs

  - Fixed: Control.bestEffort duplicate the last failure
    ([\#9118](http://www.rudder-project.org/redmine/issues/9118))
  - Fixed: wget doesn't always work
    ([\#8991](http://www.rudder-project.org/redmine/issues/8991))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alexandre Anriot
  - Florian Heigl
  - Jérémy Hocdé
  - Janos Mattyasovszky

This is a bug fix release in the 3.1 'esr' series and therefore all
installations of 3.1.x should be upgraded when possible. When we release
a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.

## Rudder 3.1.14 (2016-10-05)

Rudder 3.1.14 was not published because we found [several
bugs](http://www.rudder-project.org/redmine/projects/rudder/issues?utf8=%E2%9C%93&set_filter=1&f%5B%5D=status_id&op%5Bstatus_id%5D=%3D&v%5Bstatus_id%5D%5B%5D=11&f%5B%5D=fixed_version_id&op%5Bfixed_version_id%5D=%3D&v%5Bfixed_version_id%5D%5B%5D=311&f%5B%5D=&c%5B%5D=project&c%5B%5D=tracker&c%5B%5D=parent&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=category&c%5B%5D=fixed_version&group_by=)
after build.

## Rudder 3.1.13 (2016-08-30)

### Changes

#### System integration

  - Update JGit to version \> 4.0 to support pre-commit hook on
    configuration repository
    ([\#8889](http://www.rudder-project.org/redmine/issues/8889))
  - Allow to customize reports database name and user to ease a separate
    database
    ([\#8873](http://www.rudder-project.org/redmine/issues/8873))

#### Web - Technique editor

  - Add 'Windows Server 2012 R2' as OS condition
    ([\#8071](http://www.rudder-project.org/redmine/issues/8071))

#### Documentation

  - Generate a custom index page for the manual
    ([\#8488](http://www.rudder-project.org/redmine/issues/8488))

#### Techniques

  - Download technique-files from Rudder website
    ([\#8853](http://www.rudder-project.org/redmine/issues/8853))

#### Packaging

  - Use dmidecode instead of pmtools on OpenSuSE 11
    ([\#8821](http://www.rudder-project.org/redmine/issues/8821))

### Bug fixes

#### Web - Config management

  - Fixed: Unable to save/edit a directive via rudder web ui when
    technique use an optionnal SELECT field
    ([\#8874](http://www.rudder-project.org/redmine/issues/8874))
  - Fixed: Typo in cf-clerk logs
    ([\#8823](http://www.rudder-project.org/redmine/issues/8823))
  - Fixed: When there is an error in a directive form, the target rule
    is unchecked
    ([\#8696](http://www.rudder-project.org/redmine/issues/8696))
  - Fixed: Node properties are not being synchronized on the node itself
    until promises are created/modified
    ([\#8840](http://www.rudder-project.org/redmine/issues/8840))
  - Fixed: Inconsistent hashing algorithms used in passwords generated
    in the script engine
    ([\#8801](http://www.rudder-project.org/redmine/issues/8801))

#### Web - UI & UX

  - Fixed: The new password field hides the Save Directive button
    ([\#8800](http://www.rudder-project.org/redmine/issues/8800))
  - Fixed: Typos in the node's compliance explanation text
    ([\#8787](http://www.rudder-project.org/redmine/issues/8787))
  - Fixed: Cannot see rule details when you have read\_only role
    ([\#8878](http://www.rudder-project.org/redmine/issues/8878))
  - Fixed: When no editing rights are given to Groups, you drag an drop
    them between categories
    ([\#8863](http://www.rudder-project.org/redmine/issues/8863))
  - Fixed: "Update techniques now" button on the techniques screen is
    too small
    ([\#8616](http://www.rudder-project.org/redmine/issues/8616))

#### Web - Technique editor

  - Fixed: Cannot access Technique Editor with role technique\_all
    ([\#8492](http://www.rudder-project.org/redmine/issues/8492))
  - Fixed: New method calls are considered valid, although they are
    empty which leads to error when validated via API
    ([\#8829](http://www.rudder-project.org/redmine/issues/8829))
  - Fixed: Warn when the string length reaches the maximum value
    supported by the agent
    ([\#8261](http://www.rudder-project.org/redmine/issues/8261))
  - Fixed: ncf still loads mp.autofocus module that was deleted\!
    ([\#8793](http://www.rudder-project.org/redmine/issues/8793))

#### API

  - Fixed: Two different API methods return the same action name
    "listDirectives"
    ([\#8688](http://www.rudder-project.org/redmine/issues/8688))

#### Agent

  - Fixed: rudder agent run tells to give -i for errors, even if you did
    give -i
    ([\#8861](http://www.rudder-project.org/redmine/issues/8861))
  - Fixed: Failing CFEngine unit test on recent OSes
    ([\#8860](http://www.rudder-project.org/redmine/issues/8860))

#### Documentation

  - Fixed: Document migration from manually installed relays
    ([\#6226](http://www.rudder-project.org/redmine/issues/6226))
  - Fixed: Safe setup of the Rudder repo in the manual
    ([\#8864](http://www.rudder-project.org/redmine/issues/8864))

#### Techniques

  - Fixed: Broken syntax in fstabConfiguration 4.0
    ([\#8870](http://www.rudder-project.org/redmine/issues/8870))
  - Fixed: Misleading comment in rudder cron
    ([\#8816](http://www.rudder-project.org/redmine/issues/8816))
  - Fixed: ncf template methods do not empty file before editing it
    ([\#8843](http://www.rudder-project.org/redmine/issues/8843))

#### Initial promises & sys tech

  - Fixed: Typo in system techniques reports
    ([\#8841](http://www.rudder-project.org/redmine/issues/8841))

#### Packaging

  - Fixed: Do not depend on pam-devel on AIX
    ([\#8893](http://www.rudder-project.org/redmine/issues/8893))
  - Fixed: Missing BuildRequires for rudder-agent : pam-devel
    ([\#8822](http://www.rudder-project.org/redmine/issues/8822))

#### Architecture - Internal libs

  - Fixed: Some Javascript engine fails when accessing system values
    ([\#8857](http://www.rudder-project.org/redmine/issues/8857))
  - Fixed: JS engine tests broken due to security exeception when using
    jdk 1.8
    ([\#8856](http://www.rudder-project.org/redmine/issues/8856))

#### Architecture - Refactoring

  - Fixed: Compilation warning about unsound assumption could lead to
    hard to understand errors
    ([\#8797](http://www.rudder-project.org/redmine/issues/8797))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alexandre Anriot
  - Florian Heigl
  - Kevin Kok
  - Avit Sidis

This is a bug fix release in the 3.1 'esr' series and therefore all
installations of 3.1.x should be upgraded when possible. When we release
a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.

## Rudder 3.1.12 (2016-07-29)

### Changes

#### Web - UI & UX

  - Improve experience of password field in Directives
    ([\#8753](http://www.rudder-project.org/redmine/issues/8753))
  - Technical logs are sorted by date, oldest date first
    ([\#8728](http://www.rudder-project.org/redmine/issues/8728))

#### Web - Config management

  - Allows generation-time javascript eval in directive parameters
    ([\#8629](http://www.rudder-project.org/redmine/issues/8629), see
    ([documentation](http://www.rudder-project.org/doc-3.1/_javascript_evaluation_in_directives.html)
    for details)
  - Allow Node properties to be used in directives and ncf techniques
    ([\#6733](http://www.rudder-project.org/redmine/issues/6733), see
    ([documentation](http://www.rudder-project.org/doc-3.1/_node_properties.html)
    for details)

#### Agent

  - Create a 'rudder agent run --force' option
    ([\#8729](http://www.rudder-project.org/redmine/issues/8729))
  - Support CFEngine enterprise agents on 'rudder server debug'
    ([\#8555](http://www.rudder-project.org/redmine/issues/8555))
  - 'rudder agent inventory' should not run the techniques
    ([\#8757](http://www.rudder-project.org/redmine/issues/8757))

#### Architecture - Dependencies

  - Update Rudder 3.1 to Scala 2.11 / liftweb 2.6
    ([\#8655](http://www.rudder-project.org/redmine/issues/8655))
  - Utility to get all objects from a sealed trait
    ([\#8614](http://www.rudder-project.org/redmine/issues/8614))

#### Initial promises & sys tech

  - Disable inventories using a file
    ([\#8741](http://www.rudder-project.org/redmine/issues/8741))

#### Techniques

  - Create a technique that manages key/values in a file
    ([\#8631](http://www.rudder-project.org/redmine/issues/8631))

#### API

  - Add an technique API endpoint to display directives based on a
    technique
    ([\#8534](http://www.rudder-project.org/redmine/issues/8534))
  - API: add an option to just run a "pre-check" on directive
    modifications to change technique version
    ([\#7961](http://www.rudder-project.org/redmine/issues/7961))

#### Documentation

  - Use release-info to generate the manual header at creation
    ([\#8450](http://www.rudder-project.org/redmine/issues/8450))
  - Add documentation on new techniques and check directive API
    ([\#8639](http://www.rudder-project.org/redmine/issues/8639))

#### Packaging

  - Update openssl to openssl-1.0.2h
    ([\#8329](http://www.rudder-project.org/redmine/issues/8329))

### Bug fixes

#### Web - UI & UX

  - Fixed: The API token creation popup is not centered
    ([\#8592](http://www.rudder-project.org/redmine/issues/8592))
  - Fixed: Recent changes graph can overflow the page width
    ([\#8437](http://www.rudder-project.org/redmine/issues/8437))
  - Fixed: Missing an information line in rule details to explain that
    the graph is clickable
    ([\#8432](http://www.rudder-project.org/redmine/issues/8432))
  - Fixed: When the compliance is very small the status bar twice as big
    ([\#7658](http://www.rudder-project.org/redmine/issues/7658))

#### Web - Nodes & inventories

  - Fixed: Inventory messes up Last logged in user date when last user
    was a reboot
    ([\#8239](http://www.rudder-project.org/redmine/issues/8239))

#### Web - Config management

  - Fixed: Correct error message when SHA512 algorithm is not available
    ([\#8770](http://www.rudder-project.org/redmine/issues/8770))
  - Fixed: UserManagement need to have hashed password for both Linux
    and AIX
    ([\#8593](http://www.rudder-project.org/redmine/issues/8593))

#### Web - Compliance & node report

  - Fixed: Refresh button on recent changes graph on Rule details does
    not refresh data
    ([\#8630](http://www.rudder-project.org/redmine/issues/8630))
  - Fixed: When updating runs, hooks should really be async
    ([\#8424](http://www.rudder-project.org/redmine/issues/8424))
  - Fixed: When a node send reports with an unknow configID, no expected
    reports are showned
    ([\#8409](http://www.rudder-project.org/redmine/issues/8409))

#### Agent

  - Fixed: 'rudder agent run' should allow multiple -D
    ([\#8758](http://www.rudder-project.org/redmine/issues/8758))
  - Fixed: Having a report-separator in the report message causes the
    report not show up in "rudder agent run" output
    ([\#8635](http://www.rudder-project.org/redmine/issues/8635))

#### Server components

  - Fixed: Upgrade from 2.11 to 3.1 on sles does not preserve the
    rudder-jetty java parameters
    ([\#8172](http://www.rudder-project.org/redmine/issues/8172))

#### Initial promises & sys tech

  - Fixed: Use the list-compatible-input equivalent on Windows system
    ([\#8553](http://www.rudder-project.org/redmine/issues/8553))
  - Fixed: Update promises on Windows complains about setting ownership
    to "root"
    ([\#8532](http://www.rudder-project.org/redmine/issues/8532))
  - Fixed: fusionAgent.cf for ARM
    ([\#7203](http://www.rudder-project.org/redmine/issues/7203))

#### Techniques

  - Fixed: Add a technique check to make sure \&endif& are followed by
    an empty line
    ([\#8646](http://www.rudder-project.org/redmine/issues/8646))
  - Fixed: Add a test for checkGenericFileContent 7.0
    ([\#8673](http://www.rudder-project.org/redmine/issues/8673))
  - Fixed: technique-files cannot find with a pattern on the whole
    technique name
    ([\#8736](http://www.rudder-project.org/redmine/issues/8736))
  - Fixed: lines after \&endif& in techniques
    ([\#8647](http://www.rudder-project.org/redmine/issues/8647))
  - Fixed: technique-metadata-sample.xml has invalid content
    ([\#8615](http://www.rudder-project.org/redmine/issues/8615))
  - Fixed: UserManagement 6.0 fails to add user if the user's default
    group already exists
    ([\#8599](http://www.rudder-project.org/redmine/issues/8599))
  - Fixed: Reporting for usermanagement in case of Policy to apply to
    this account "check only" is missing the Password component report
    ([\#8585](http://www.rudder-project.org/redmine/issues/8585))
  - Fixed: userManagement technique doesn't do anything on Windows on
    version 5 and 6
    ([\#8566](http://www.rudder-project.org/redmine/issues/8566))
  - Fixed: checkGenericFile missing report when given non absolute path
    ([\#8405](http://www.rudder-project.org/redmine/issues/8405))
  - Fixed: Broken technique tests
    ([\#8786](http://www.rudder-project.org/redmine/issues/8786))
  - Fixed: Check-techniques.sh checks for cfengine\_community class in
    comments
    ([\#8751](http://www.rudder-project.org/redmine/issues/8751))
  - Fixed: Fix metadata syntax of generic enforce file content test
    ([\#8738](http://www.rudder-project.org/redmine/issues/8738))
  - Fixed: Technique userManagement, home directory is not taken into
    account
    ([\#8466](http://www.rudder-project.org/redmine/issues/8466))

#### API

  - Fixed: Inconsistent directive API parameters at creation
    ([\#8687](http://www.rudder-project.org/redmine/issues/8687))
  - Fixed: NoSuchElementException when querying change request API
    ([\#8686](http://www.rudder-project.org/redmine/issues/8686))
  - Fixed: The select parameter in the nodes API is not correctly
    documented
    ([\#7131](http://www.rudder-project.org/redmine/issues/7131))

#### Documentation

  - Fixed: Add a test for dead links on the doc
    ([\#8548](http://www.rudder-project.org/redmine/issues/8548))
  - Fixed: Documentation makefile fails to update git repos (git pull
    before changing branch)
    ([\#8788](http://www.rudder-project.org/redmine/issues/8788))
  - Fixed: Display link errors in doc build
    ([\#8727](http://www.rudder-project.org/redmine/issues/8727))
  - Fixed: SLES Documentation has bad package name
    ([\#8624](http://www.rudder-project.org/redmine/issues/8624))
  - Fixed: Left menu is sometimes broken when there is an anchor in the
    link ([\#8569](http://www.rudder-project.org/redmine/issues/8569))
  - Fixed: Fix doc after ncf lib changes (same as \#8522)
    ([\#8524](http://www.rudder-project.org/redmine/issues/8524))
  - Fixed: Broken formatting of man command sections in the doc
    ([\#8732](http://www.rudder-project.org/redmine/issues/8732))
  - Fixed: Broken link in the doc
    ([\#8726](http://www.rudder-project.org/redmine/issues/8726))
  - Fixed: Correct example to use a query when listing accepted nodes
    via API
    ([\#8594](http://www.rudder-project.org/redmine/issues/8594))

#### Packaging

  - Fixed: Do not package technique tests
    ([\#8679](http://www.rudder-project.org/redmine/issues/8679))
  - Fixed: There is a non standard test in os detection
    ([\#8760](http://www.rudder-project.org/redmine/issues/8760))
  - Fixed: Packages should remove their temporary files
    ([\#8744](http://www.rudder-project.org/redmine/issues/8744))
  - Fixed: Update openssl to 1.0.1t on 2.11 branch
    ([\#8658](http://www.rudder-project.org/redmine/issues/8658))
  - Fixed: rudder-apache-common.conf is not updated on upgrade with RPM
    packages
    ([\#8641](http://www.rudder-project.org/redmine/issues/8641))
  - Fixed: Do not only build-depend on virtual packages
    ([\#8565](http://www.rudder-project.org/redmine/issues/8565))
  - Fixed: The event count during the last day in
    rudder-metrics-reporting can be very slow
    ([\#8583](http://www.rudder-project.org/redmine/issues/8583))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Janos Mattyasovszky
  - Florian Heigl
  - Francois Bayart

This is a bug fix release in the 3.1 'esr' series and therefore all
installations of 3.1.x should be upgraded when possible. When we release
a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.

## Rudder 3.1.11 (2016-06-08)

### Changes

#### Documentation

  - Add tests for doc syntax
    ([\#8443](http://www.rudder-project.org/redmine/issues/8443))

### Bug fixes

#### Web - Compliance & node report

  - Fixed: Parallel traversal of new promises directories causes some
    nodes promises to not be updated
    ([\#8427](http://www.rudder-project.org/redmine/issues/8427))
  - Fixed: Not possible to switch details for time period on rule recent
    changes on Chromium
    ([\#8408](http://www.rudder-project.org/redmine/issues/8408))
  - Fixed: When a node send reports with a wrong config\_id it is never
    marked as unresponsive
    ([\#8118](http://www.rudder-project.org/redmine/issues/8118))

#### Web - Nodes & inventories

  - Fixed: Change in group may be overwritten by dynamic group update
    ([\#8453](http://www.rudder-project.org/redmine/issues/8453))

#### Web - Config management

  - Fixed: Many WARN messages after upgrade about JSON deserialisation
    error ([\#8288](http://www.rudder-project.org/redmine/issues/8288))

#### Techniques

  - Fixed: Invalidation of previous package state and of package status
    cache does not work on rpmPackageInstallation 5.0 5.1 6.0 6.1 7.0
    ([\#8421](http://www.rudder-project.org/redmine/issues/8421))
  - Fixed: rpmPackageInstallation 7.0 uses the wrong version number for
    it's data file
    ([\#8419](http://www.rudder-project.org/redmine/issues/8419))
  - Fixed: Missing reports in file and zypper techniques due to a syntax
    error in reporting
    ([\#8403](http://www.rudder-project.org/redmine/issues/8403))

#### Initial promises & sys tech

  - Fixed: On Centos6.6, rsyslog is always restarted
    ([\#8451](http://www.rudder-project.org/redmine/issues/8451))
  - Fixed: failsafe sometimes produce rudder reports
    ([\#8422](http://www.rudder-project.org/redmine/issues/8422))
  - Fixed: Reference to \&TRACKINGKEY& in initial promises
    ([\#8415](http://www.rudder-project.org/redmine/issues/8415))
  - Fixed: Remove unused variable in cf-serverd
    ([\#8392](http://www.rudder-project.org/redmine/issues/8392))
  - Fixed: The component "Check Technique library reloading file" is
    sometime a log and sometime a result
    ([\#8380](http://www.rudder-project.org/redmine/issues/8380))
  - Fixed: Launching twice in a row a disabled agent make the agent runs
    ([\#7100](http://www.rudder-project.org/redmine/issues/7100))
  - Fixed: The uuid in the promises and the uuid in
    /opt/rudder/etc/uuid.hive may be out of sync, and chaos and sadness
    follows
    ([\#7091](http://www.rudder-project.org/redmine/issues/7091))
  - Fixed: If using Rudder Server 3.1 and a node with agent 3.2,
    protocol used is TLS
    ([\#8458](http://www.rudder-project.org/redmine/issues/8458))

#### Documentation

  - Fixed: Unclear message in the upgrade doc
    ([\#8440](http://www.rudder-project.org/redmine/issues/8440))
  - Fixed: The SLES upgrade section has a broken title syntax
    ([\#8439](http://www.rudder-project.org/redmine/issues/8439))

#### Packaging

  - Fixed: stty does not handle no-tty input
    ([\#8426](http://www.rudder-project.org/redmine/issues/8426))
  - Fixed: When updating a Rudder install,
    changes\_executionTimeStamp\_idx index is not created
    ([\#8423](http://www.rudder-project.org/redmine/issues/8423))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Janos Mattyasovszky
  - Daniel Stan

This is a bug fix release in the 3.1 'esr' series and therefore all
installations of 3.1.x should be upgraded when possible. When we release
a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.

## Rudder 3.1.10 (2016-06-01, Not announced)

That version was not announced due to several bugs:
[\#8423](http://www.rudder-project.org/redmine/issues/8423),
[\#8427](http://www.rudder-project.org/redmine/issues/8427),
[\#8430](http://www.rudder-project.org/redmine/issues/8430)

### Changes

#### Web - Nodes & inventories

  - Make page node details/search node less confusing
    ([\#7642](http://www.rudder-project.org/redmine/issues/7642))

#### Web - UI & UX

  - Augment default number of lines displayed in tables and add more
    options
    ([\#8107](http://www.rudder-project.org/redmine/issues/8107))

#### Initial promises & sys tech

  - Add support to cfengine bootstrap in server
    ([\#7902](http://www.rudder-project.org/redmine/issues/7902))

#### Documentation

  - Create an installation section in the documentation
    ([\#8233](http://www.rudder-project.org/redmine/issues/8233))
  - Homogenize OS names in the doc
    ([\#8224](http://www.rudder-project.org/redmine/issues/8224))
  - How to: Ensure a line is present in a file (and only one time\!)
    ([\#8169](http://www.rudder-project.org/redmine/issues/8169))
  - Integrate ncf generic methods reference into the doc
    ([\#7844](http://www.rudder-project.org/redmine/issues/7844))
  - Add "Troubleshooting" section
    ([\#7711](http://www.rudder-project.org/redmine/issues/7711))
  - Move man pages into the reference section
    ([\#8332](http://www.rudder-project.org/redmine/issues/8332))
  - Move Relay doc to the install section
    ([\#7889](http://www.rudder-project.org/redmine/issues/7889))
  - Document easier way to reload techniques after upgrade
    ([\#8291](http://www.rudder-project.org/redmine/issues/8291))

### Bug fixes

#### Web - UI & UX

  - Fixed: Typo in directive migration message "an other"
    ([\#8289](http://www.rudder-project.org/redmine/issues/8289))
  - Fixed: Broken links in the "Support Desk" box of the home page
    ([\#8110](http://www.rudder-project.org/redmine/issues/8110))
  - Fixed: Some messages in the Settings page end with a comma
    ([\#8044](http://www.rudder-project.org/redmine/issues/8044))
  - Fixed: Show seconds in Execution date at Technical Logs of Node
    Details
    ([\#7981](http://www.rudder-project.org/redmine/issues/7981))
  - Fixed: Prevent red color usage in inventory graphs
    ([\#8262](http://www.rudder-project.org/redmine/issues/8262))
  - Fixed: Change audit message is not checked in the "Clone Directive"
    popup ([\#8213](http://www.rudder-project.org/redmine/issues/8213))
  - Fixed: Priority field in Directive form does not show it has a
    tooltip and has wrong description
    ([\#8201](http://www.rudder-project.org/redmine/issues/8201))
  - Fixed: Fix display issues on IE11
    ([\#8136](http://www.rudder-project.org/redmine/issues/8136))
  - Fixed: Add a left margin to the Rudder search box
    ([\#7825](http://www.rudder-project.org/redmine/issues/7825))

#### Web - Compliance & node report

  - Fixed: "All the last execution reports for this server are ok"
    displayed when no report received
    ([\#8400](http://www.rudder-project.org/redmine/issues/8400))
  - Fixed: Misleading message on node compliance detail when run's
    configID is unknown
    ([\#8399](http://www.rudder-project.org/redmine/issues/8399))
  - Fixed: "repaired" are counted as "required attention" on node
    compliance details
    ([\#8396](http://www.rudder-project.org/redmine/issues/8396))
  - Fixed: Compliance is not correctly computed if we receive run agent
    right after generation
    ([\#8051](http://www.rudder-project.org/redmine/issues/8051))
  - Fixed: OOM in Rudder when there are too many repaired reports
    ([\#7735](http://www.rudder-project.org/redmine/issues/7735))

#### Web - Config management

  - Fixed: Node configuration cache is invalidated too often
    ([\#8246](http://www.rudder-project.org/redmine/issues/8246))
  - Fixed: Directive detail don't show the OS compatibility version
    ([\#7042](http://www.rudder-project.org/redmine/issues/7042))

#### API

  - Fixed: Better document Node Api: include detail always returns
    "default"
    ([\#8192](http://www.rudder-project.org/redmine/issues/8192))
  - Fixed: API call to get the list of node is REALLY slow with latest
    version
    ([\#7972](http://www.rudder-project.org/redmine/issues/7972))

#### Agent

  - Fixed: rudder agent update doesn't always update policy
    ([\#8346](http://www.rudder-project.org/redmine/issues/8346))
  - Fixed: "rudder agent enable -s" doesn't return an error code if it
    can't start the agent
    ([\#8317](http://www.rudder-project.org/redmine/issues/8317))
  - Fixed: rudder server reload- don't work due to
    missing exec perms
    ([\#8290](http://www.rudder-project.org/redmine/issues/8290))

#### Techniques

  - Fixed: permissions technique tries to set a group even when we do
    not ask for it
    ([\#8198](http://www.rudder-project.org/redmine/issues/8198))
  - Fixed: It is not possible to use quotes in generic variable
    definition values
    ([\#8188](http://www.rudder-project.org/redmine/issues/8188))
  - Fixed: Clear package caches when repairing a package repository
    ([\#8121](http://www.rudder-project.org/redmine/issues/8121))
  - Fixed: The start at boot does not work in the openssh technique on
    systemd OSes
    ([\#8108](http://www.rudder-project.org/redmine/issues/8108))
  - Fixed: Double reporting for group creation
    ([\#8100](http://www.rudder-project.org/redmine/issues/8100))
  - Fixed: Avoid waiting on lock when calling yum
    ([\#6487](http://www.rudder-project.org/redmine/issues/6487))
  - Fixed: applications/aptPackageManagerSettings/3.1 missing from list
    of maintained techniques
    ([\#8395](http://www.rudder-project.org/redmine/issues/8395))
  - Fixed: Document usage of line replacement in Enforce a file content
    technique
    ([\#8162](http://www.rudder-project.org/redmine/issues/8162))

#### System integration

  - Fixed: Rudder jetty init script broken on CentOS 7
    ([\#8369](http://www.rudder-project.org/redmine/issues/8369))
  - Fixed: rudder-slapd may break on upgrade when restarting on openVZ
    ([\#8210](http://www.rudder-project.org/redmine/issues/8210))
  - Fixed: check-rudder-agent complains about not existing
    policy-server.dat backup file
    ([\#8202](http://www.rudder-project.org/redmine/issues/8202))
  - Fixed: ACL Posix on Git repos
    ([\#8065](http://www.rudder-project.org/redmine/issues/8065))
  - Fixed: Disable ldap logging on non existing indexes
    ([\#7667](http://www.rudder-project.org/redmine/issues/7667))
  - Fixed: Messages can be dropped on the node, resulting in Unknown
    reports on the Web Interface
    ([\#6421](http://www.rudder-project.org/redmine/issues/6421))
  - Fixed: promises can become invalid if copies fail rendering the
    agent unusable
    ([\#5650](http://www.rudder-project.org/redmine/issues/5650))
  - Fixed: rudder-jetty initialisation should not support Java 6
    ([\#7348](http://www.rudder-project.org/redmine/issues/7348))
  - Fixed: rudder init script fails with "/etc/init.d/rudder: line 109:
    printf \\033\[1;32m---8\<---\\033\[0;39m\\n: command not found"
    ([\#8296](http://www.rudder-project.org/redmine/issues/8296))
  - Fixed: rudder init script reports wrong status if run as non-root
    ([\#8295](http://www.rudder-project.org/redmine/issues/8295))

#### Server components

  - Fixed: Apache config does not get cleaned up after removal of
    rudder-webapp
    ([\#8232](http://www.rudder-project.org/redmine/issues/8232))
  - Fixed: rudder-apache gets added multiple times to apache config
    ([\#8231](http://www.rudder-project.org/redmine/issues/8231))

#### Packaging

  - Fixed: Spurious message "grep: /etc/sysconfig/apache2: No such file
    or directory" in RPM install for rudder-webapp
    ([\#8371](http://www.rudder-project.org/redmine/issues/8371))
  - Fixed: ncf package asks about replacing dist config file during
    upgrade
    ([\#8286](http://www.rudder-project.org/redmine/issues/8286))
  - Fixed: When we install rudder-agent after having removing it, the
    uuid is not restored on RPM-based systems
    ([\#6468](http://www.rudder-project.org/redmine/issues/6468))
  - Fixed: Makefile missing in rudder-server-relay package
    ([\#8370](http://www.rudder-project.org/redmine/issues/8370))
  - Fixed: Several systemd warnings in install on RHEL/CentOS 7
    ([\#7530](http://www.rudder-project.org/redmine/issues/7530))

#### Initial promises & sys tech

  - Fixed: Can't stat file '/opt/rudder/bin/cf-hub' on 'localhost' in
    files.copy\_from promise
    ([\#8397](http://www.rudder-project.org/redmine/issues/8397))
  - Fixed: check-techniques script doesn't properly exit non-zero on
    errors
    ([\#8386](http://www.rudder-project.org/redmine/issues/8386))
  - Fixed: Error in cf-serverd for allowing remote access to cf-agent
    binary
    ([\#8374](http://www.rudder-project.org/redmine/issues/8374))
  - Fixed: logrotate promise for CFEngine Enterprise agents
    ([\#8340](http://www.rudder-project.org/redmine/issues/8340))
  - Fixed: Invalid path for rudder\_ncf in Windows
    ([\#8338](http://www.rudder-project.org/redmine/issues/8338))
  - Fixed: Duplicate lines in body classes success in update.cf in
    initial promises
    ([\#8309](http://www.rudder-project.org/redmine/issues/8309))
  - Fixed: Use variables for path to cf-agent in system Techniques to
    work on Windows
    ([\#8307](http://www.rudder-project.org/redmine/issues/8307))
  - Fixed: Disable Repeated message reduction or reports may be lost on
    the relay
    ([\#8264](http://www.rudder-project.org/redmine/issues/8264))
  - Fixed: Error message about setgid on ncf.conf
    ([\#8181](http://www.rudder-project.org/redmine/issues/8181))
  - Fixed: Missing reporting in "check postgresql process" on rudder-db
    role ([\#8178](http://www.rudder-project.org/redmine/issues/8178))
  - Fixed: Crontab promise with the Windows agent
    ([\#8161](http://www.rudder-project.org/redmine/issues/8161))
  - Fixed: Rudder agent connect at each runs to its policy server to get
    its server uuid
    ([\#7638](http://www.rudder-project.org/redmine/issues/7638))
  - Fixed: Extra carriage return in policy\_server.dat inventory failure
    ([\#7328](http://www.rudder-project.org/redmine/issues/7328))
  - Fixed: In case of error in logrotate check, there is no report
    ([\#8382](http://www.rudder-project.org/redmine/issues/8382))
  - Fixed: Error on windows: agent tries to check if /usr/bin/env
    supports the -0 option
    ([\#8336](http://www.rudder-project.org/redmine/issues/8336))
  - Fixed: Using Rudder server 3.x + rudder agent 2.11.x, a node doesn't
    properly detect its change of relay server
    ([\#8045](http://www.rudder-project.org/redmine/issues/8045))
  - Fixed: cf-promises can hang for about 30 seconds looking up default
    server name "rudder"
    ([\#7621](http://www.rudder-project.org/redmine/issues/7621))

#### Architecture - Internal libs

  - Fixed: Examples in ldap-inventory are not real life examples
    ([\#8236](http://www.rudder-project.org/redmine/issues/8236))

#### Documentation

  - Fixed: Documentation wrongly states default report TTL is 30 days
    ([\#8297](http://www.rudder-project.org/redmine/issues/8297))
  - Fixed: Documentation no longer clearly tells user to upgrade
    Techniques
    ([\#8294](http://www.rudder-project.org/redmine/issues/8294))
  - Fixed: Invalid documentation on how to use rudder global parameters
    in Technique editor
    ([\#8278](http://www.rudder-project.org/redmine/issues/8278))
  - Fixed: Make clearer what the goal of Scala-ldap is in readme
    ([\#8275](http://www.rudder-project.org/redmine/issues/8275))
  - Fixed: rudder doc can be misleading on the repo to use for
    Centos/RHEL
    ([\#7976](http://www.rudder-project.org/redmine/issues/7976))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alexandre Anriot
  - Jean Cardona
  - Janos Mattyasovszky
  - David Svejda

This is a bug fix release in the 3.1 'esr' series and therefore all
installations of 3.1.x should be upgraded when possible. When we release
a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.

## Rudder 3.1.9 (2016-04-18)

### Changes

#### Web - Nodes & inventories

  - Exit sending inventory to rudder-webapp if the queue is full
    ([\#7291](http://www.rudder-project.org/redmine/issues/7291))

#### Agent

  - Add -c to general options of rudder command
    ([\#8139](http://www.rudder-project.org/redmine/issues/8139))
  - Add calls to local API in rudder server commands - backport to 3.1
    ([\#7952](http://www.rudder-project.org/redmine/issues/7952))

#### Documentation

  - Explain the SLES 12 case in the zypper segfault section
    ([\#8097](http://www.rudder-project.org/redmine/issues/8097))

### Bug fixes

#### Web - UI & UX

  - Fixed: API account table broken when empty
    ([\#8144](http://www.rudder-project.org/redmine/issues/8144))
  - Fixed: Double arrow in Pending Nodes list
    ([\#8078](http://www.rudder-project.org/redmine/issues/8078))

#### Web - Maintenance

  - Fixed: web interface login: able to log in with valid ldap account
    but no matching rudder-users.xml entry
    ([\#8085](http://www.rudder-project.org/redmine/issues/8085))

#### Techniques

  - Fixed: Missing reporting in UserManagement 6.0 when creating a user
    ([\#8079](http://www.rudder-project.org/redmine/issues/8079))

#### Performance and scalability

  - Fixed: Java OOM during Java's log migration
    ([\#7524](http://www.rudder-project.org/redmine/issues/7524))

#### Windows agent

  - Fixed: On Windows, a file c:\\Program is created
    ([\#8149](http://www.rudder-project.org/redmine/issues/8149))
  - Fixed: Environement variable fail to load on windows
    ([\#8146](http://www.rudder-project.org/redmine/issues/8146))

#### Packaging

  - Fixed: Error in rudder-server-relay post install script on debian
    ([\#8117](http://www.rudder-project.org/redmine/issues/8117))

#### Server components

  - Fixed: node-to-relay fails to reload policy when proxy is set
    ([\#8054](http://www.rudder-project.org/redmine/issues/8054))
  - Fixed: Compress ldif backups
    ([\#6714](http://www.rudder-project.org/redmine/issues/6714))\]\[\#7900\]\])

#### Initial promises & sys tech

  - Fixed: Do not backup modified promise files and encrypt ncf/local
    transfer
    ([\#8159](http://www.rudder-project.org/redmine/issues/8159))

#### Architecture - Internal libs

  - Fixed: java.util.regex.PatternSyntaxException: Unexpected internal
    error near index 1 on windows
    ([\#7935](http://www.rudder-project.org/redmine/issues/7935))

#### Architecture - Refactoring

  - Remove trailing space in code file that make merge conflicts
    ([\#8126](http://www.rudder-project.org/redmine/issues/8126))
  - Fixed: Typo in tests
    ([\#8116](http://www.rudder-project.org/redmine/issues/8116))
  - Fixed: Bad logs for event log migration since \#8085
    ([\#8124](http://www.rudder-project.org/redmine/issues/8124))

#### Documentation

  - Fixed: API documentation for compliance needs JSON prettified
    ([\#7900](http://www.rudder-project.org/redmine/issues/7900))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Florian Heigl
  - Janos Mattyasovszky

This is a bug fix release in the 3.1 'esr' series and therefore all
installations of 3.1.x should be upgraded when possible. When we release
a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.

## Rudder 3.1.8 (2016-03-24)

### Changes

#### Packaging

  - Put a makefile inside each directory of rudder-packages
    ([\#7718](http://www.rudder-project.org/redmine/issues/7718))

#### Web - Nodes & inventories

  - The Motherboard UUID doesn't appear on the inventory on a Node
    ([\#3749](http://www.rudder-project.org/redmine/issues/3749))

#### Documentation

  - Mark 3.1 as ESR in the doc header
    ([\#8059](http://www.rudder-project.org/redmine/issues/8059))
  - Import doc from foswiki about parametrized variable in the doc
    ([\#7836](http://www.rudder-project.org/redmine/issues/7836))
  - Reorganize the introduction
    ([\#7818](http://www.rudder-project.org/redmine/issues/7818))

#### Techniques

  - Add an option for MOTD Technique to display MOTD before login
    ([\#7983](http://www.rudder-project.org/redmine/issues/7983))
  - New Technique to import a GPG Key into RPM
    ([\#6756](http://www.rudder-project.org/redmine/issues/6756))

### Bug fixes

#### API

  - Fixed: Changing Directive version via API does not set default
    values, and return wrong parameters
    ([\#7979](http://www.rudder-project.org/redmine/issues/7979))

#### Web - UI & UX

  - Fixed: Typo in webapp message when policy generation failed
    ([\#8094](http://www.rudder-project.org/redmine/issues/8094))
  - Fixed: Tooltip on Rule categories may display after selecting Rule
    ([\#8086](http://www.rudder-project.org/redmine/issues/8086))
  - Fixed: Typo in webapp warn message "sendind"
    ([\#7990](http://www.rudder-project.org/redmine/issues/7990))
  - Fixed: Legend for node breakdown is not readable
    ([\#7969](http://www.rudder-project.org/redmine/issues/7969))
  - Fixed: Sorting is broken in tables after sorting by compliance
    ([\#7653](http://www.rudder-project.org/redmine/issues/7653))
  - Fixed: Typo in webapp logs
    ([\#8041](http://www.rudder-project.org/redmine/issues/8041))

#### Web - Nodes & inventories

  - Fixed: Missing error message in node acceptation when there is a
    problem with getting authorized networks
    ([\#8016](http://www.rudder-project.org/redmine/issues/8016))
  - Fixed: Debian Jessie, on VMWare, are wrongly considered as
    "Physical" machine
    ([\#7204](http://www.rudder-project.org/redmine/issues/7204))
  - Fixed: Rudder doesn't store and display the IPV6 of the nodes
    ([\#7136](http://www.rudder-project.org/redmine/issues/7136))
  - Fixed: Order of button on "accept nodes in rudder" is the exact
    opposite of the rest of the webapp
    ([\#6722](http://www.rudder-project.org/redmine/issues/6722))
  - Fixed: Allow to make a group with only 32bits or 64bits nodes
    ([\#2543](http://www.rudder-project.org/redmine/issues/2543))
  - Fixed: When several agents are installed, hostname is doubled on
    that node inventories
    ([\#7880](http://www.rudder-project.org/redmine/issues/7880))

#### Documentation

  - Fixed: Broken link in the manual
    ([\#7817](http://www.rudder-project.org/redmine/issues/7817))
  - Fixed: Document that when we reduce the run interval of nodes, "no
    data" may be wrongly reported
    ([\#6231](http://www.rudder-project.org/redmine/issues/6231))

#### Packaging

  - Fixed: rudder-upgrade takes too long
    ([\#7987](http://www.rudder-project.org/redmine/issues/7987))
  - Fixed: Backup and restore policy\_server.dat like we do with
    uuid.hive file
    ([\#7901](http://www.rudder-project.org/redmine/issues/7901))
  - Fixed: Rudder agent tries sending an inventory during update
    ([\#7881](http://www.rudder-project.org/redmine/issues/7881))
  - Fixed: rudder-upgrade does not make some check on remote sql in case
    of distributed setup
    ([\#7849](http://www.rudder-project.org/redmine/issues/7849))
  - Fixed: Rudder init script kill all agent on Open VZ (or similar
    system)
    ([\#4499](http://www.rudder-project.org/redmine/issues/4499))
  - Fixed: Default vhost is not disabled on rudder-relay
    ([\#7846](http://www.rudder-project.org/redmine/issues/7846))

#### Initial promises & sys tech

  - Fixed: gzip can stop rudder agent when compressing log files
    ([\#7985](http://www.rudder-project.org/redmine/issues/7985))
  - Fixed: System technique cannot compress inventories
    ([\#7930](http://www.rudder-project.org/redmine/issues/7930))
  - Fixed: Unexpected reports on "Check jetty process" component of
    system techniques
    ([\#7821](http://www.rudder-project.org/redmine/issues/7821))
  - Fixed: Rudder inventory don't produce error report
    ([\#7785](http://www.rudder-project.org/redmine/issues/7785))
  - Fixed: date of report may be invalid on windows
    ([\#7741](http://www.rudder-project.org/redmine/issues/7741))
  - Fixed: Reporting in server-components missing when restarting some
    services (ie jetty)
    ([\#7813](http://www.rudder-project.org/redmine/issues/7813))

#### System integration

  - Fixed: rudder-init broken on SLES
    ([\#7991](http://www.rudder-project.org/redmine/issues/7991))
  - Fixed: Missing usefull logger in logger file
    ([\#7910](http://www.rudder-project.org/redmine/issues/7910))
  - Fixed: Errors with apache on ubuntu 12.04
    ([\#6763](http://www.rudder-project.org/redmine/issues/6763))

#### Server components

  - Fixed: Rudder password are not properly protected
    ([\#8096](http://www.rudder-project.org/redmine/issues/8096))
  - Fixed: Allow disable of git-autocommit of system policy on Update
    ([\#7222](http://www.rudder-project.org/redmine/issues/7222))
  - Fixed: Node not included in dynamic group due to openldap bug with
    modrdn not showing node children
    ([\#6780](http://www.rudder-project.org/redmine/issues/6780))

#### Techniques

  - Fixed: When we manage twice a same package in rpm package
    management, we don't get the second report
    ([\#8034](http://www.rudder-project.org/redmine/issues/8034))
  - Fixed: Incomplete reporting in service management
    ([\#8032](http://www.rudder-project.org/redmine/issues/8032))
  - Fixed: Script check-techniques.sh fails on first error
    ([\#8012](http://www.rudder-project.org/redmine/issues/8012))
  - Fixed: The script check-techniques.sh checks old techniques when the
    parent directory contains a version number
    ([\#8010](http://www.rudder-project.org/redmine/issues/8010))
  - Fixed: Fix invalid metadata.xml statement in clockSettings 3.1
    ([\#8009](http://www.rudder-project.org/redmine/issues/8009))
  - Fixed: Wrong reporting in servicesManagement 3.0
    ([\#7975](http://www.rudder-project.org/redmine/issues/7975))
  - Fixed: "Download a file from shared folder" technique doesn't have
    an explicit default value for "Compare method" (was mtime, now
    digest)
    ([\#7962](http://www.rudder-project.org/redmine/issues/7962))
  - Fixed: Missing Timezones from clockConfiguration
    ([\#7489](http://www.rudder-project.org/redmine/issues/7489))
  - Fixed: Missing "don't change" password hash type in userManagement
    ([\#6493](http://www.rudder-project.org/redmine/issues/6493))
  - Fixed: Support for more Debian / Ubuntu repository components
    ([\#8073](http://www.rudder-project.org/redmine/issues/8073))
  - Fixed: Technique jobScheduler v2.0 doesn't schedule
    ([\#8068](http://www.rudder-project.org/redmine/issues/8068))

#### Performance and scalability

  - Fixed: Queries on expected reports are really slow with more than
    2000 nodes
    ([\#8057](http://www.rudder-project.org/redmine/issues/8057))

#### Agent

  - Fixed: Put rudder agent output before the awk call
    ([\#7942](http://www.rudder-project.org/redmine/issues/7942))
  - Fixed: The display of truncated lines in rudder agent output
    (sometimes?) adds two spaces after | instead of one
    ([\#7941](http://www.rudder-project.org/redmine/issues/7941))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alexandre Anriot
  - Dennis Cabooter
  - Janos Mattyasovszky

This is a bug fix release in the 3.1 'esr' series and therefore all
installations of 3.1.x should be upgraded when possible. When we release
a new version of Rudder it has been thoroughly tested, and we consider
the release enterprise-ready for deployment.

## Rudder 3.1.6 (2016-01-22)

### Changes

#### Web - UI & UX

  - Add last promise generation date in generation policy menu entry
    ([\#7661](http://www.rudder-project.org/redmine/issues/7661))
  - Clicking on recent changes graph should show detail graph in rule
    details
    ([\#7640](http://www.rudder-project.org/redmine/issues/7640))
  - Add an option to disable display changes graphes if they are slow
    ([\#7618](http://www.rudder-project.org/redmine/issues/7618))

#### Agent

  - rudder-agent should trigger a new inventory after upgrade
    ([\#7620](http://www.rudder-project.org/redmine/issues/7620))
  - rudder agent run should explain when agent is disabled.
    ([\#7792](http://www.rudder-project.org/redmine/issues/7792))
  - Warn when the agent run was interrupted
    ([\#7790](http://www.rudder-project.org/redmine/issues/7790))
  - Make the output of rudder agent readable by a human
    ([\#7698](http://www.rudder-project.org/redmine/issues/7698))

#### Techniques

  - Add test for rudder-techniques to ensure removed deprecated
    techniques don't come back in an erroneous merge
    ([\#7504](http://www.rudder-project.org/redmine/issues/7504))

#### Documentation

  - Document the zypper segfault when installing Rudder packages locally
    ([\#7652](http://www.rudder-project.org/redmine/issues/7652))
  - Document AIX support in Rudder manual
    ([\#7650](http://www.rudder-project.org/redmine/issues/7650))
  - Document nofiles dependency for syslog/tcp on master and relays
    ([\#7220](http://www.rudder-project.org/redmine/issues/7220))

#### Architecture - Refactoring

  - Remove deprecated package rudder-policy-templates
    ([\#7723](http://www.rudder-project.org/redmine/issues/7723))
  - Make NodeInfo more dependant on Node
    ([\#7634](http://www.rudder-project.org/redmine/issues/7634))
  - Change AGPL to GPL in rudder-plugin-external-node-information
    ([\#7576](http://www.rudder-project.org/redmine/issues/7576))

### Bug fixes

#### Web - Config management

  - Fixed: Promise generation never finishes if jetty is restarted
    mid-generation
    ([\#7814](http://www.rudder-project.org/redmine/issues/7814))
  - Fixed: Too long directive name breaks directive serialization
    ([\#7766](http://www.rudder-project.org/redmine/issues/7766))
  - Fixed: Error on promise generation after accepting a node
    ([\#7689](http://www.rudder-project.org/redmine/issues/7689))

#### Web - UI & UX

  - Fixed: Filter keeps applied between Rules Tables within Directives
    page ([\#7754](http://www.rudder-project.org/redmine/issues/7754))
  - Fixed: Typo in AGENT RUN SCHEDULE description
    ([\#7749](http://www.rudder-project.org/redmine/issues/7749))
  - Fixed: Blue colour in "Nodes by overall compliance" chart is
    confusingly the same as "No report" blue
    ([\#7757](http://www.rudder-project.org/redmine/issues/7757))
  - Fixed: The directive tree filter should not be reset when we click
    on a directive
    ([\#7656](http://www.rudder-project.org/redmine/issues/7656))
  - Fixed: Remove one pixel 'border' in Rudder menu
    ([\#7641](http://www.rudder-project.org/redmine/issues/7641))
  - Fixed: No auto scroll since rudder 3.0
    ([\#7617](http://www.rudder-project.org/redmine/issues/7617))
  - Fixed: Open external links of the webapp in another tab
    ([\#6628](http://www.rudder-project.org/redmine/issues/6628))
  - Fixed: Compliance bar in nodes list should trigger node display
    ([\#7639](http://www.rudder-project.org/redmine/issues/7639))

#### Web - Compliance & node report

  - Fixed: When several directives value have a CFEngine var, we get
    "unexpected" due to bad regex matching
    ([\#7758](http://www.rudder-project.org/redmine/issues/7758))
  - Fixed: Compliance take into account expired run
    ([\#7743](http://www.rudder-project.org/redmine/issues/7743))
  - Fixed: Not accepted node reports trigger compliance processing
    ([\#7625](http://www.rudder-project.org/redmine/issues/7625))

#### Web - Nodes & inventories

  - Fixed: Only one system group is displayed in node details
    ([\#7061](http://www.rudder-project.org/redmine/issues/7061))

#### Web - Maintenance

  - Fixed: Jetty cache files in /tmp directory are removed by the OS
    tmpwatch cron job, preventing access to the application
    ([\#4473](http://www.rudder-project.org/redmine/issues/4473))

#### Agent

  - Fixed: rudder-agent does not stop on network error during file copy,
    which can lead to file deletions when purging is enabled
    ([\#7629](http://www.rudder-project.org/redmine/issues/7629))
  - Fixed: rudder CLI commands should print their expected options with
    -h / --help
    ([\#7742](http://www.rudder-project.org/redmine/issues/7742))
  - Fixed: Add a "quiet" option to rudder agent run to only display
    errors
    ([\#7608](http://www.rudder-project.org/redmine/issues/7608))

#### Techniques

  - Fixed: Invalid reporting on windows for clockconfiguration if
    Hardware Clock is not set
    ([\#7739](http://www.rudder-project.org/redmine/issues/7739))
  - Fixed: Technique copyGitFile can send success AND error reports on
    post-hook execution and lead to unexpected reports
    ([\#7624](http://www.rudder-project.org/redmine/issues/7624))
  - Fixed: Unexpected reports using "rpmPackageInstallation" technique
    ([\#7623](http://www.rudder-project.org/redmine/issues/7623))
  - Fixed: Technique "Name resolution": Regexp to check value of
    Nameserver does not allow the use of variable
    ([\#3741](http://www.rudder-project.org/redmine/issues/3741))
  - Fixed: Package management for RHEL / CentOS / SuSE / RPM systems:
    The number of reports about ZMD is uncorrect
    ([\#3478](http://www.rudder-project.org/redmine/issues/3478))
  - Fixed: syslog-ng's loghost regex does not match with set line
    ([\#7635](http://www.rudder-project.org/redmine/issues/7635))
  - Fixed: The "Ignore file or directory if it does not exist" parameter
    in filesPermission is ignored
    ([\#7607](http://www.rudder-project.org/redmine/issues/7607))

#### Documentation

  - Fixed: Fix use links containing emphasized keywords in manual
    ([\#7812](http://www.rudder-project.org/redmine/issues/7812))
  - Fixed: The size of one image is not correctly recognized in the doc
    ([\#7713](http://www.rudder-project.org/redmine/issues/7713))
  - Fixed: Some titles broken in the documentation
    ([\#7551](http://www.rudder-project.org/redmine/issues/7551))
  - Fixed: Wrong anchors in Rudder API doc
    ([\#6694](http://www.rudder-project.org/redmine/issues/6694))
  - Fixed: Document the use of port 5310 for rudder server debug
    ([\#7712](http://www.rudder-project.org/redmine/issues/7712))
  - Fixed: Update documentation to use rudder-server-relay package
    instead of manual configuration
    ([\#7266](http://www.rudder-project.org/redmine/issues/7266))

#### System integration

  - Fixed: Firefox stalls after TLS handshake on self signed certificate
    with a missing contact email
    ([\#7800](http://www.rudder-project.org/redmine/issues/7800))

#### Packaging

  - Fixed: Test for non-applying patches on rudder-jetty and
    rudder-agent-thin is broken
    ([\#7803](http://www.rudder-project.org/redmine/issues/7803))
  - Fixed: Backport fixes for openldap memory leak in our package
    ([\#7801](http://www.rudder-project.org/redmine/issues/7801))
  - Fixed: rudder-upgrade edits the wrong ncf.conf file causing
    transitory invalid promises during upgrades
    ([\#7794](http://www.rudder-project.org/redmine/issues/7794))
  - Fixed: rudder-init overwrite its logs
    ([\#7776](http://www.rudder-project.org/redmine/issues/7776))
  - Fixed: rudder-server-relay rpm package should require rudder-agent
    ([\#7593](http://www.rudder-project.org/redmine/issues/7593))
  - Fixed: rudder-agent not set to start on boot on RHEL 5 and older
    ([\#7737](http://www.rudder-project.org/redmine/issues/7737))

#### Initial promises & sys tech

  - Fixed: initial promises don't create
    /var/rudder/configuration-repository/ncf/ncf.conf
    ([\#7810](http://www.rudder-project.org/redmine/issues/7810))
  - Fixed: inventory sent file timestamp not updated in normal run
    (system techniques)
    ([\#7782](http://www.rudder-project.org/redmine/issues/7782))
  - Fixed: Fix permissions of the rudder tools in the repo
    ([\#7697](http://www.rudder-project.org/redmine/issues/7697))
  - Fixed: check-rsyslog-version is missing on the nodes
    ([\#7680](http://www.rudder-project.org/redmine/issues/7680))
  - Fixed: Non quiet curl calls on root and relay servers
    ([\#7678](http://www.rudder-project.org/redmine/issues/7678))
  - Fixed: Permissions of rudder tools are not preserved on relays
    ([\#7644](http://www.rudder-project.org/redmine/issues/7644))
  - Fixed: Unexpected reports on "Log system for reports" component of
    system techniques
    ([\#7619](http://www.rudder-project.org/redmine/issues/7619))
  - Fixed: Rudder agent simulates an aptitude full-upgrade during each
    run ([\#7141](http://www.rudder-project.org/redmine/issues/7141))
  - Fixed: Error in environment-variables.cf on Centos 5
    ([\#7761](http://www.rudder-project.org/redmine/issues/7761))
  - Fixed: Missing reporting for jetty and slapd on relay
    ([\#7645](http://www.rudder-project.org/redmine/issues/7645))

#### Architecture - Refactoring

  - Fixed: Change AGPL to GPL in rudder-plugin-itop
    ([\#7577](http://www.rudder-project.org/redmine/issues/7577))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Enrico Bigaignon
  - Florian Heigl
  - Janos Mattyasovszky
  - Alex Tkachenko

This is a bug fix release in the 3.1 series and therefore all
installations of 3.1 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "esr" release is still 2.11.\*. When we release a new version of
Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.1.5 (2015-12-10)

### Changes

#### Documentation

  - Add compliance API documentation
    ([\#7367](http://www.rudder-project.org/redmine/issues/7367))

#### Agent

  - Backport rudder agent commands from 3.2 to 3.1
    ([\#7552](http://www.rudder-project.org/redmine/issues/7552))

#### Packaging

  - Update OpenSSL version to latest release
    ([\#7368](http://www.rudder-project.org/redmine/issues/7368))

### Bug fixes

#### API

  - Fixed: API Parameters create "overridable" boolean check doesn't
    work ([\#6695](http://www.rudder-project.org/redmine/issues/6695))
  - Fixed: Node compliance API is not working
    ([\#7331](http://www.rudder-project.org/redmine/issues/7331))

#### Web - Config management

  - Fixed: Read technique access does not give access to techniques
    ([\#7514](http://www.rudder-project.org/redmine/issues/7514))
  - Fixed: Promises are not regenerated during upgrade
    ([\#7557](http://www.rudder-project.org/redmine/issues/7557))
  - Fixed: Make possible to delete ANY active technique
    ([\#7536](http://www.rudder-project.org/redmine/issues/7536))
  - Fixed: duplicate key value error on Rudder
    ([\#7316](http://www.rudder-project.org/redmine/issues/7316))
  - Fixed: Changing rule/directive name does not start a promise
    generation
    ([\#7474](http://www.rudder-project.org/redmine/issues/7474))

#### Web - Nodes & inventories

  - Fixed: Tag FULL\_NAME missing from SLES12 inventory
    ([\#7559](http://www.rudder-project.org/redmine/issues/7559))
  - Fixed: Inventory \ content differs from hostname --fqdn and
    may lead to unauthorised nodes
    ([\#7031](http://www.rudder-project.org/redmine/issues/7031))
  - Fixed: Test inventories are out of date since the addition of tag
    RUDDER([\#7325](http://www.rudder-project.org/redmine/issues/7325))
  - Fixed: Accepting two nodes seems to only accept one
    ([\#7024](http://www.rudder-project.org/redmine/issues/7024))

#### Web - Technique editor

  - Fixed: Impossible to create Technique with technique editor on
    Centos
    ([\#7386](http://www.rudder-project.org/redmine/issues/7386))

#### Web - UI & UX

  - Fixed: Clone rule window too small
    ([\#7397](http://www.rudder-project.org/redmine/issues/7397))
  - Fixed: Links to Node in event logs still contains an extra rudder
    ([\#7323](http://www.rudder-project.org/redmine/issues/7323))
  - Fixed: Policy server url in node details is broken
    ([\#7462](http://www.rudder-project.org/redmine/issues/7462))
  - Fixed: Compliance detail and compliance summary use different
    colours
    ([\#7416](http://www.rudder-project.org/redmine/issues/7416))
  - Fixed: Dashboard incorrectly says "0 node" (should be nodes, in
    plural)
    ([\#7406](http://www.rudder-project.org/redmine/issues/7406))
  - Fixed: Improve Rule compliance details loading
    ([\#7383](http://www.rudder-project.org/redmine/issues/7383))
  - Fixed: Remove log from javascript console
    ([\#7382](http://www.rudder-project.org/redmine/issues/7382))
  - Fixed: Rudder error page refers to wrong log file
    ([\#7484](http://www.rudder-project.org/redmine/issues/7484))

#### Server components

  - Fixed: promises are not regenerated when a node is transformed into
    a relay
    ([\#7301](http://www.rudder-project.org/redmine/issues/7301))
  - Fixed: slapd core dumps on 1TB RAM
    ([\#7295](http://www.rudder-project.org/redmine/issues/7295))

#### Agent

  - Fixed: rudder-agent repository on GitHub does not have a license
    ([\#7394](http://www.rudder-project.org/redmine/issues/7394))
  - Fixed: If using proxmox, process management fails due to bad options
    used on vzps
    ([\#7423](http://www.rudder-project.org/redmine/issues/7423))
  - Fixed: check-rudder-agent silently fails if namespaces are not
    supported
    ([\#7335](http://www.rudder-project.org/redmine/issues/7335))
  - Fixed: 'rudder agent reset' doesn't cause ncf and tools to be
    updated
    ([\#7481](http://www.rudder-project.org/redmine/issues/7481))
  - Fixed: Agent processes parts of the environment (multiline bash
    variables)
    ([\#7094](http://www.rudder-project.org/redmine/issues/7094))
  - Fixed: rudder agent info should show version number
    ([\#7482](http://www.rudder-project.org/redmine/issues/7482))

#### Performance and scalability

  - Fixed: Major performance hit in promise generation for unused
    inventories fetch
    ([\#7541](http://www.rudder-project.org/redmine/issues/7541))
  - Fixed: Improve graph perf by upgrade javascript libraries
    ([\#7512](http://www.rudder-project.org/redmine/issues/7512))

#### Documentation

  - Fixed: Add a section about ncf-builder and its integration wihin
    Rudder
    ([\#6305](http://www.rudder-project.org/redmine/issues/6305))
  - Fixed: Doc build is broken because of missing Makefile dependencies
    ([\#7339](http://www.rudder-project.org/redmine/issues/7339))
  - Fixed: rudder-doc 3.1 publishes 3.0 man pages
    ([\#7332](http://www.rudder-project.org/redmine/issues/7332))

#### Techniques

  - Fixed: Technique "Clock settings" uses Europe/Paris as China's
    timezone (technique version 3.0)
    ([\#7501](http://www.rudder-project.org/redmine/issues/7501))
  - Fixed: OpenSSH server configuration does not reload configurations
    ([\#7479](http://www.rudder-project.org/redmine/issues/7479))
  - Fixed: Create a new version of download file from the shared folder
    that would allow to set the suid and gid to multiple file
    ([\#7379](http://www.rudder-project.org/redmine/issues/7379))

#### Initial promises & sys tech

  - Fixed: Use whole path to binaries in cron from check-rudder-agent on
    AIX ([\#7525](http://www.rudder-project.org/redmine/issues/7525))
  - Fixed: Use of nonexistant class cfengine\_community makes
    failsafe.cf not copy CFEngine binaries to /var/rudder
    ([\#7499](http://www.rudder-project.org/redmine/issues/7499))
  - Fixed: "Update" component of common technique sometimes return
    unexpected status and has incomplete reporting
    ([\#6648](http://www.rudder-project.org/redmine/issues/6648))
  - Fixed: Syslog fails to restart due bad line in syslog-ng.conf
    ([\#7389](http://www.rudder-project.org/redmine/issues/7389))
  - Fixed: Initial promises and techniques set group to "root" rather
    than 0, breaking non-Linux OSes
    ([\#7476](http://www.rudder-project.org/redmine/issues/7476))
  - Fixed: New version of ncf\_conf.cache may not be properly updated on
    nodes after an upgrade
    ([\#7452](http://www.rudder-project.org/redmine/issues/7452))
  - Fixed: internal security check always assume that the node is a
    community one
    ([\#7430](http://www.rudder-project.org/redmine/issues/7430))
  - Fixed: Agent cannot replace file per folder when copying promises,
    and it may lock agent with invalid promises
    ([\#7190](http://www.rudder-project.org/redmine/issues/7190))
  - Fixed: svcadm does not exist - so syslog is never restarted on
    Solaris
    ([\#7464](http://www.rudder-project.org/redmine/issues/7464))
  - Fixed: Unexpected reports on "cron daemon" component of system
    techniques
    ([\#7176](http://www.rudder-project.org/redmine/issues/7176))
  - Fixed: Agent update Rudder WebDAV user and password at every run
    ([\#7485](http://www.rudder-project.org/redmine/issues/7485))
  - Fixed: ncf copy is always repaired on server due to an
    non-convergent hash function
    ([\#7473](http://www.rudder-project.org/redmine/issues/7473))
  - Fixed: Invalid inventory files only partially moved/renamed to the
    fail folder
    ([\#7004](http://www.rudder-project.org/redmine/issues/7004))

#### System integration

  - Fixed: The rudder-agent cron on AIX uses if then, which makes some
    security test fails
    ([\#7508](http://www.rudder-project.org/redmine/issues/7508))
  - Fixed: JVM 8.0: warning about "Ignoring option PermSize=128m;
    support was removed in 8.0"
    ([\#7345](http://www.rudder-project.org/redmine/issues/7345))
  - Fixed: rudder-agent and rudder-slapd init scripts may fail to stop
    services if killall is missing or misbehaving
    ([\#7515](http://www.rudder-project.org/redmine/issues/7515))
  - Fixed: /etc/init.d/rudder-jetty fails to stop jetty if it's PID file
    is missing
    ([\#7469](http://www.rudder-project.org/redmine/issues/7469))
  - Fixed: cf-execd is running twice after a reboot or after running
    rudder-agent twice
    ([\#7420](http://www.rudder-project.org/redmine/issues/7420))
  - Fixed: Initial git commit during package installation is too verbose
    ([\#7419](http://www.rudder-project.org/redmine/issues/7419))
  - Fixed: Rudder OpenLDAP Authentication sans ipv4 localhost
    ([\#4922](http://www.rudder-project.org/redmine/issues/4922))
  - Fixed: Missing debuging information for explain\_compliance
    ([\#7353](http://www.rudder-project.org/redmine/issues/7353))
  - Fixed: rudder-upgrade recommends to use deprecated
    rudder-server-root init script
    ([\#7449](http://www.rudder-project.org/redmine/issues/7449))
  - Fixed: Selinux policy prevent running cf-agent when using technique
    editor
    ([\#7393](http://www.rudder-project.org/redmine/issues/7393))
  - Fixed: The initial installation of rudder-jetty outputs an error on
    rudder %pre scriptlet
    ([\#7387](http://www.rudder-project.org/redmine/issues/7387))

#### Packaging

  - Fixed: Some patches silently fail to apply
    ([\#7556](http://www.rudder-project.org/redmine/issues/7556))
  - Fixed: Modify the copy of ncf.conf instead of the original
    ([\#7445](http://www.rudder-project.org/redmine/issues/7445))
  - Fixed: After a fresh install on Centos, the Rudder server web
    interface does not work
    ([\#7395](http://www.rudder-project.org/redmine/issues/7395))
  - Fixed: mvn --quiet is too quiet
    ([\#7371](http://www.rudder-project.org/redmine/issues/7371))
  - Fixed: make wget quiet during build
    ([\#7370](http://www.rudder-project.org/redmine/issues/7370))
  - Fixed: Make maven quiet during build
    ([\#7317](http://www.rudder-project.org/redmine/issues/7317))
  - Fixed: rudder-inventory-ldap and rudder-jetty don't stop their
    services on uninstall and rudder-slapd can fail to restart on
    upgrade
    ([\#7516](http://www.rudder-project.org/redmine/issues/7516))
  - Fixed: rudder-upgrade fails when \*re\*installing Rudder
    ([\#7510](http://www.rudder-project.org/redmine/issues/7510))
  - Fixed: Script never terminate when they run rudder-jetty init script
    ([\#7492](http://www.rudder-project.org/redmine/issues/7492))
  - Fixed: The package leave a temporary directory mehind
    ([\#7391](http://www.rudder-project.org/redmine/issues/7391))
  - Fixed: All reports are missing (totally orange) for a node due to
    multiple cf-execd processes
    ([\#7338](http://www.rudder-project.org/redmine/issues/7338))
  - Fixed: Error when installing rudder :
    /opt/rudder/bin/rudder-upgrade: line 573: /opt/rudder/bin/rpmvercmp:
    No such file or directory
    ([\#7470](http://www.rudder-project.org/redmine/issues/7470))

#### Techniques - Tests

  - Fixed: rudder-techniques test script "technique-files" doesn't list
    promises.cf and failsafe.cf in initial-promises
    ([\#7496](http://www.rudder-project.org/redmine/issues/7496))
  - Fixed: rudder-techniques test script "technique-files" lists files
    in .git
    ([\#7495](http://www.rudder-project.org/redmine/issues/7495))

#### Architecture - Refactoring

  - Fixed: Correct a warning in rudder compilation
    ([\#7356](http://www.rudder-project.org/redmine/issues/7356))
  - Fixed: We are using AGPL in place of GPL
    ([\#7546](http://www.rudder-project.org/redmine/issues/7546))
  - Fixed: Inventory query test are not passing anymore in Rudder 3.0
    ([\#7357](http://www.rudder-project.org/redmine/issues/7357))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Layne Breitkreutz
  - Dennis Cabooter
  - Steeve Chailloux
  - David Durieux
  - Fabrice Flore-Thébault
  - Greg fr
  - Florian Heigl
  - LibrA LinuX
  - Maxime Longuet
  - Olivier Mauras
  - Janos Mattyasovszky

This is a bug fix release in the 3.1 series and therefore all
installations of 3.1 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "esr" release is still 2.11.\*. When we release a new version of
Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.1.4 (2015-10-27)

### Changes

#### Agent

  - Add info about last time inventory and policy updated to rudder
    agent info
    ([\#7282](http://www.rudder-project.org/redmine/issues/7282))

#### System & initial promises

 \* Touch local file on inventory upload
[\#7206](http://www.rudder-project.org/redmine/issues/7206))

### Bug fixes

#### Web - Config management

  - Fixed: Change request list page, link to Rules are invalids (extra
    rudder)
    ([\#7244](http://www.rudder-project.org/redmine/issues/7244))

#### Web - Nodes & inventories

  - Fixed: Link from node/directive list to node detail is broken on
    Firefox/chrome
    ([\#7286](http://www.rudder-project.org/redmine/issues/7286))

#### Packaging

  - Fixed: Maven never uses internal mirror
    ([\#7300](http://www.rudder-project.org/redmine/issues/7300))
  - Fixed: Temporary files are not cleaned up after build
    ([\#7293](http://www.rudder-project.org/redmine/issues/7293))

#### System integration

  - Fixed: zypper --version outputs on stderr
    ([\#7289](http://www.rudder-project.org/redmine/issues/7289))

#### Performance and scalability

  - Fixed: RuleTargetTest.scala takes \>40s where it should take 2s
    ([\#7303](http://www.rudder-project.org/redmine/issues/7303))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Florian Heigl
  - Janos Mattyasovszky

This is a bug fix release in the 3.1 series and therefore all
installations of 3.1 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "esr" release is still 2.11.\*. When we release a new version of
Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.1.3 (2015-10-20)

#### Web - Nodes & inventories

  - Fixed: No service pack is reported when lsb\_release is installed on
    SLES ([\#7205](http://www.rudder-project.org/redmine/issues/7205))

#### Techniques

  - Fixed: Ssh key distribution cannot distibute several keys on one
    user ([\#7254](http://www.rudder-project.org/redmine/issues/7254))

#### Agent

  - Fixed: Agent should be enabled after reinit
    ([\#7201](http://www.rudder-project.org/redmine/issues/7201))
  - Fixed: Show fqdn in rudder agent info
    ([\#7269](http://www.rudder-project.org/redmine/issues/7269))

#### Initial promises & sys tech

  - Fixed: Network list for apache 2.4 is invalidly generated
    ([\#7268](http://www.rudder-project.org/redmine/issues/7268))
  - Fixed: The daily cf-execd and cf-serverd restart should use SRC on
    AIX ([\#7274](http://www.rudder-project.org/redmine/issues/7274))
  - Fixed: System technique's curl should follow redirects
    ([\#7211](http://www.rudder-project.org/redmine/issues/7211))

#### System integration

  - Fixed: check-rudder-agent faisl on an error while checking processes
    ([\#7243](http://www.rudder-project.org/redmine/issues/7243))

#### Packaging

  - Fixed: Rudder agent doesn't build with hardening flags
    ([\#7257](http://www.rudder-project.org/redmine/issues/7257))
  - Fixed: Patch not applied on fusion inventory
    ([\#7241](http://www.rudder-project.org/redmine/issues/7241))

#### Server components

  - Fixed: Root server's apache config does not honor \< 2.4 for webdav
    ([\#7267](http://www.rudder-project.org/redmine/issues/7267))

#### Performance and scalability

  - Fixed: Writting promises should be parallelized
    ([\#7265](http://www.rudder-project.org/redmine/issues/7265))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Florian Heigl
  - Maxime Longuet
  - Janos Mattyasovszky

This is a bug fix release in the 3.1 series and therefore all
installations of 3.1 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "esr" release is still 2.11.\*. When we release a new version of
Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.1.2 (2015-09-24)

### Changes

#### Techniques

  - Fixed: Add an option to ignore non existent file in the file
    permission technique
    ([\#7228](http://www.rudder-project.org/redmine/issues/7228))

#### Documentation

  - Split the html documentation to improve readability and navigability
    ([\#6604](http://www.rudder-project.org/redmine/issues/6604))
  - Improve rudder server requirements formatting
    ([\#7081](http://www.rudder-project.org/redmine/issues/7081))
  - Improve the readability of the server installation section of the
    manual
    ([\#6603](http://www.rudder-project.org/redmine/issues/6603))
  - Fixed: Document clearly technique upgrades
    ([\#7077](http://www.rudder-project.org/redmine/issues/7077))

### Bug fixes

#### Web - Config management

  - Fixed: When a directive from an unique technique is in several
    rules, it's order may be lost
    ([\#7128](http://www.rudder-project.org/redmine/issues/7128))
  - Fixed: Order of directive in a rule is only for ncf or standard lib
    ([\#7127](http://www.rudder-project.org/redmine/issues/7127))
  - Fixed: Rules are not serialized correctly anymore
    ([\#7108](http://www.rudder-project.org/redmine/issues/7108))

#### Initial promises & sys tech

  - Fixed: The rudder server tries to send "uuid.hive" as an inventory
    ([\#6987](http://www.rudder-project.org/redmine/issues/6987))
  - Fixed: System technique distributePolicy is not system and has two
    system var section
    ([\#7138](http://www.rudder-project.org/redmine/issues/7138))
  - Fixed: Promise copy is not convergent: if the copy is interupted, it
    will never recover
    ([\#7086](http://www.rudder-project.org/redmine/issues/7086))
  - Fixed: If the agent schedule is not every 5 minutes, inventory may
    not be sent anymore
    ([\#6718](http://www.rudder-project.org/redmine/issues/6718))
  - Fixed: Environnement variables cannot be used on windows
    ([\#7150](http://www.rudder-project.org/redmine/issues/7150))
  - Fixed: send-clean.sh always wait for expiration time for signed
    inventories
    ([\#7212](http://www.rudder-project.org/redmine/issues/7212))

#### Agent

  - Fixed: ldap error with rudder-keys
    ([\#7197](http://www.rudder-project.org/redmine/issues/7197))
  - Fixed: Wrong roles display in rudder agent info
    ([\#7143](http://www.rudder-project.org/redmine/issues/7143))

#### System integration

  - Fixed: Error starting apache on SLES11 relay
    ([\#7097](http://www.rudder-project.org/redmine/issues/7097))

#### Web - Compliance & node report

  - Fixed: Agent schedule is not historised, so we can't know what was
    the agent run interval in the past
    ([\#7154](http://www.rudder-project.org/redmine/issues/7154))

#### Web - Technique editor

  - Fixed: Read only role is not correctly interpreted in technique
    editor.
    ([\#7199](http://www.rudder-project.org/redmine/issues/7199))

#### Techniques

  - Fixed: motd technique wrongly reports that it is incompatible with
    windows
    ([\#7153](http://www.rudder-project.org/redmine/issues/7153))

#### Documentation

  - Fixed: Documentation for Rudder 3.1 doesn't properly state the port
    to open between client and server
    ([\#7122](http://www.rudder-project.org/redmine/issues/7122))

#### Packaging

  - Fixed: issues with process management on physical hosting LXC
    containers
    ([\#7189](http://www.rudder-project.org/redmine/issues/7189))
  - Fixed: Migrations to 3.1 may fail due to a wrong Jetty configuration
    migration on RPM based systems
    ([\#7166](http://www.rudder-project.org/redmine/issues/7166))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Libra Linux

This is a bug fix release in the 3.1 series and therefore all
installations of 3.1 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.11.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.1.1 (2015-08-19)

### Changes

#### Web - Config management

  - Allow user to choose order of Directive application in a Rule
    ([\#2881](http://www.rudder-project.org/redmine/issues/2881))

### Bug fixes

#### Web - Config management

  - Fixed: System object (techniques, directives, rules, groups) must be
    always enabled
    ([\#7064](http://www.rudder-project.org/redmine/issues/7064))
  - Fixed: Editing a rule category remove it from Git - rule categories
    disapear\! (Ranärok ensues)
    ([\#6840](http://www.rudder-project.org/redmine/issues/6840))
  - Fixed: Clear cache doesn't regenerate expected reports
    ([\#7080](http://www.rudder-project.org/redmine/issues/7080))

#### Web - Compliance & node report

  - Fixed: Reporting cannot be used when there is several component with
    the same value and several messages
    ([\#7037](http://www.rudder-project.org/redmine/issues/7037))

#### Web - Maintenance

  - Fixed: When accessing event logs page, it stays empty until jetty is
    restarted
    ([\#6939](http://www.rudder-project.org/redmine/issues/6939))

#### Web - Nodes & inventories

  - Fixed: If domain name is not set in resolv.conf, the inventory
    generated is invalid
    ([\#7001](http://www.rudder-project.org/redmine/issues/7001))
  - Fixed: Xen list parsed badly by FusionInventory, causing VCPU to be
    counted badly
    ([\#6754](http://www.rudder-project.org/redmine/issues/6754))
  - Fixed: FusionInventory doesn't provide the Rudder extension on other
    platform than Linux
    ([\#6747](http://www.rudder-project.org/redmine/issues/6747))

#### Agent

  - Fixed: If we ask to install a package in a version at least equal to
    another, we get no report if the version installed is \> than the
    one requested
    ([\#6996](http://www.rudder-project.org/redmine/issues/6996))
  - Fixed: Migration from 2.10.x to 2.11.x on Debian may disable the
    agent ([\#7099](http://www.rudder-project.org/redmine/issues/7099)
    )

#### Techniques

  - Fixed: aptPackageManagerSetting technique doesn't work on Ubuntu
    ([\#6999](http://www.rudder-project.org/redmine/issues/6999))
  - Fixed: Reporting on openssh server configuration technique is not
    correct for port edition
    ([\#6942](http://www.rudder-project.org/redmine/issues/6942))
  - Fixed: ntp Technique does not report when repairing
    ([\#6941](http://www.rudder-project.org/redmine/issues/6941))

#### Initial promises & sys tech

  - Fixed: Do not sign inventory on windows
    ([\#7011](http://www.rudder-project.org/redmine/issues/7011))
  - Fixed: Bad regexp in the cron for Rudder nova
    ([\#7014](http://www.rudder-project.org/redmine/issues/7014))
  - Fixed: A report is missing on system techniques when cron needs to
    be restartd
    ([\#6660](http://www.rudder-project.org/redmine/issues/6660))
  - Fixed: On Windows, Rudder specific inventories is not be added to
    inventory with most version of CFEngine Enterprise
    ([\#7057](http://www.rudder-project.org/redmine/issues/7057))
  - Fixed: When promises could have been updated, we still have the
    error messages saying we couldn't update promises
    ([\#7038](http://www.rudder-project.org/redmine/issues/7038))
  - Fixed: When the nxlog configuration is changed on windows, service
    is not restarted
    ([\#7012](http://www.rudder-project.org/redmine/issues/7012))
  - Fixed: System techniques on systemd based system do not handle boot
    script correctly
    ([\#6988](http://www.rudder-project.org/redmine/issues/6988))
  - Fixed: After updagre to 3.1.1, nodes reports error "could not
    retrieve UUID of the policy server"
    ([\#7109](http://www.rudder-project.org/redmine/issues/7109))

#### Performance and scalability

  - Fixed: Copy ncf only if it is updated
    ([\#7020](http://www.rudder-project.org/redmine/issues/7020))

#### Packaging

  - Fixed: Some code is duplicated in debian postinst
    ([\#7073](http://www.rudder-project.org/redmine/issues/7073))
  - Fixed: Wrong permission on /var/lib/ncf-api-env
    ([\#7095](http://www.rudder-project.org/redmine/issues/7095))

#### System integration

  - Fixed: Rsyslog problem on Ubuntu 14.04 fresh install
    ([\#6127](http://www.rudder-project.org/redmine/issues/6127))
  - Fixed: With SELinux enabled, httpd cannot execute ncf scripts
    ([\#7053](http://www.rudder-project.org/redmine/issues/7053))
  - Fixed: Add httpd log context to /var/log/rudder/apache2
    ([\#7041](http://www.rudder-project.org/redmine/issues/7041))
  - Fixed: When SELinux is enabled, the ncf-api-venv home is owned by
    root ([\#7021](http://www.rudder-project.org/redmine/issues/7021))
  - Fixed: Could not upload inventory when SELinux is enabled
    ([\#7019](http://www.rudder-project.org/redmine/issues/7019))
  - Fixed: Error starting apache on SLES11 relay
    ([\#7097](http://www.rudder-project.org/redmine/issues/7097))

#### Architecture - Refactoring

  - Fixed: Remove scala compiler warning about comparing values of type
    Null ([\#7072](http://www.rudder-project.org/redmine/issues/7072))

#### Architecture - Internal libs

  - Fixed: A test is not compiling on branch 2.11 since \#6729 was
    merged
    ([\#7056](http://www.rudder-project.org/redmine/issues/7056))
  - Fixed: Exception thrown when debug\_timer is set on Rule pages
    ([\#7071](http://www.rudder-project.org/redmine/issues/7071))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Dennis Cabooter
  - Remi Debay
  - Janos Mattyasovszky
  - Christophe Nowicki

This is a bug fix release in the 3.1 series and therefore all
installations of 3.1 should be upgraded when possible. This version is
not yet marked "stable", since it has not yet proven itself to be
reliable on production systems over a period of several months. The
current "stable" release is still 2.11.\*. When we release a new version
of Rudder, it needs to be thoroughly tested, and we consider the release
enterprise-ready for deployment only after it has been proven to run in
production reliably for several months.

## Rudder 3.1.0 (2015-07-09)

### Changes

#### Web - Compliance & node report

  - Display node compliances in Nodes lists
    ([\#6781](http://www.rudder-project.org/redmine/issues/6781))

#### Agent

  - Add rudder agent check in rudder cli
    ([\#6359](http://www.rudder-project.org/redmine/issues/6359))

#### Web - UI & UX

  - Rudder 3.1 logo
    ([\#6927](http://www.rudder-project.org/redmine/issues/6927))

#### Documentation

  - Update documentation for 3.1 release
    ([\#6908](http://www.rudder-project.org/redmine/issues/6908))

#### Packaging

  - Add a caching system to rudder build system
    ([\#6713](http://www.rudder-project.org/redmine/issues/6713))
  - Remove migration process from old version to 3.1
    ([\#6911](http://www.rudder-project.org/redmine/issues/6911))

### Bug fixes

#### Web - UI & UX

  - Fixed: More coherent informations on dashboard
    ([\#6777](http://www.rudder-project.org/redmine/issues/6777))
  - Fixed: Broken down stats by agent version is completely out of it
    ([\#6491](http://www.rudder-project.org/redmine/issues/6491))

#### Web - Config management

  - Fixed: After a partial promise generation, some nodes being a relay
    may have their promises stored in a non reachable location
    ([\#6729](http://www.rudder-project.org/redmine/issues/6729))

#### Web - Nodes & inventories

  - Fixed: Broken inventory - missing 'FQDN'
    ([\#6782](http://www.rudder-project.org/redmine/issues/6782))
  - Fixed: Heartbeat bad interval time calcul on node
    ([\#6746](http://www.rudder-project.org/redmine/issues/6746))

#### Agent

  - Fixed: Cf-agent writes incorrect files when the server answers too
    slowly during recursive copy
    ([\#6915](http://www.rudder-project.org/redmine/issues/6915))

#### Initial promises & sys tech

  - Fixed: Error in signInventories with nodes \<3.1 and a 3.1 server
    ([\#6856](http://www.rudder-project.org/redmine/issues/6856))
  - Fixed: System techniques tries to add old services at boot
    ([\#6833](http://www.rudder-project.org/redmine/issues/6833))
  - Fixed: Use HTTP for inventory handling on AIX to prevent minicurl
    errors
    ([\#6831](http://www.rudder-project.org/redmine/issues/6831))
  - Fixed: Unsigned inventories are not processed
    ([\#6748](http://www.rudder-project.org/redmine/issues/6748))
  - Fixed: Rudder relay rsyslog configuration still have AllowedSender
    directives
    ([\#6907](http://www.rudder-project.org/redmine/issues/6907))
  - Fixed: Ubuntu trusty does not have an /etc/motd by default
    ([\#6904](http://www.rudder-project.org/redmine/issues/6904))
  - Fixed: We can't use cf-runagent because port is not taken into
    account in the body runagent control
    ([\#6916](http://www.rudder-project.org/redmine/issues/6916))
  - Fixed: Nodes using syslogd coninue to report to their old server
    when changing their policy server
    ([\#6845](http://www.rudder-project.org/redmine/issues/6845))
  - Fixed: Editing non-existent /etc/rsyslog.d/pgsql.conf in initial
    promises
    ([\#6784](http://www.rudder-project.org/redmine/issues/6784))

#### Web - Maintenance

  - Fixed: Syslog protocol not correctly set, using always UDP
    ([\#6905](http://www.rudder-project.org/redmine/issues/6905))

#### System integration

  - Fixed: Bad handling of pid file on OpenVZ
    ([\#6928](http://www.rudder-project.org/redmine/issues/6928))
  - Fixed: Rudder-jetty init script fails to get openjdk version
    ([\#6765](http://www.rudder-project.org/redmine/issues/6765))
  - Fixed: Sometimes, promises get corrupted to the point they can't be
    automatically repaired on a node
    ([\#6768](http://www.rudder-project.org/redmine/issues/6768))

#### Server components

  - Fixed: Relay configuration always use TCP to send reports
    ([\#6906](http://www.rudder-project.org/redmine/issues/6906))
  - Fixed: Relay configuration should be defined on https
    ([\#6836](http://www.rudder-project.org/redmine/issues/6836))
  - Fixed: Rudder-ldap and rudder-jetty settings should be user
    configurable in /etc/default
    ([\#6773](http://www.rudder-project.org/redmine/issues/6773))
  - Fixed: Update OpenLDAP to 2.4.41
    ([\#6931](http://www.rudder-project.org/redmine/issues/6931))

#### Techniques

  - Fixed: No reporting in dnsConfiguration 3.0
    ([\#6775](http://www.rudder-project.org/redmine/issues/6775))
  - Fixed: Openssh technique is missing reports
    ([\#6611](http://www.rudder-project.org/redmine/issues/6611))
  - Fixed: Unexpected status for fileAlterationMonitoring
    ([\#6771](http://www.rudder-project.org/redmine/issues/6771))

#### Documentation

  - Fixed: Wrong hierachy in archives section of the manual
    ([\#6909](http://www.rudder-project.org/redmine/issues/6909))
  - Fixed: Broken asciidoc list formatting
    ([\#6778](http://www.rudder-project.org/redmine/issues/6778))
  - Fixed: Outdated download link in the manual
    ([\#6764](http://www.rudder-project.org/redmine/issues/6764))
  - Fixed: Broken link and misplaced page in documentation
    ([\#6757](http://www.rudder-project.org/redmine/issues/6757))

#### Packaging

  - Fixed: AIX installations output errors due to "cp -a" usage
    ([\#6830](http://www.rudder-project.org/redmine/issues/6830))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Dennis Cabooter
  - Olivier Mauras

This version of Rudder is a final release. We have tested it thoroughly
and believe it to be free of any major bugs.

## Rudder 3.1.0~rc1 (2015-06-18)

### Changes

#### API

  - Add info about API
    ([\#6715](http://www.rudder-project.org/redmine/issues/6715))
  - Retrieve compliance from the API
    ([\#6137](http://www.rudder-project.org/redmine/issues/6137))

#### Web - Config management

  - Display/manage Directives in Rule details like Groups
    ([\#6755](http://www.rudder-project.org/redmine/issues/6755))
  - Add directive search box in Rule parameters panel
    ([\#3851](http://www.rudder-project.org/redmine/issues/3851))

#### Agent

  - Upgrade CFEngine to 3.6.5
    ([\#6705](http://www.rudder-project.org/redmine/issues/6705))
  - Add an option to run cf-agent with -v to rudder agent run
    ([\#6731](http://www.rudder-project.org/redmine/issues/6731))
  - Man pages for the rudder command
    ([\#6659](http://www.rudder-project.org/redmine/issues/6659))

#### System integration

  - Let the user choose between udp and tcp for syslog messages
    ([\#5622](http://www.rudder-project.org/redmine/issues/5622))

### Bug fixes

#### Web - Compliance & node report

  - Fixed: Compliance in dashboard and rule page are not consistant
    ([\#6663](http://www.rudder-project.org/redmine/issues/6663))
  - Fixed: The Global compliance is buggy when there is no data
    ([\#6633](http://www.rudder-project.org/redmine/issues/6633))
  - Fixed: Blue for no report in bar charts doesn't make sense
    ([\#6489](http://www.rudder-project.org/redmine/issues/6489))

#### Web - UI & UX

  - Fixed: No rules displayed in firefox
    ([\#6490](http://www.rudder-project.org/redmine/issues/6490))

#### Web - Nodes & inventories

  - Fixed: Search results grayed out
    ([\#6277](http://www.rudder-project.org/redmine/issues/6277))
  - Fixed: Hostname in inventory may sometimes be wrongfully in
    lowercase
    ([\#6711](http://www.rudder-project.org/redmine/issues/6711))

#### Web - Technique editor

  - Fixed: Cannot save technique with ncf builder - error during the API
    call to the technique librairy reload
    ([\#6724](http://www.rudder-project.org/redmine/issues/6724))

#### System integration

  - Fixed: rudder-server-root init script is not compatible with systemd
    ([\#6760](http://www.rudder-project.org/redmine/issues/6760))
  - Fixed: RHEL7 does not initialise postgresql db
    ([\#6702](http://www.rudder-project.org/redmine/issues/6702))
  - Fixed: ncf init fails in webapp postinst
    ([\#6698](http://www.rudder-project.org/redmine/issues/6698))
  - Fixed: rudder-reports does not find correct postgresql service when
    using systemctl
    ([\#6699](http://www.rudder-project.org/redmine/issues/6699))
  - Fixed: Startup links for rudder-server-root on Ubuntu are not
    correct - before 3.1
    ([\#6263](http://www.rudder-project.org/redmine/issues/6263))
  - Fixed: Error about ldconfig during rudder-agent installation on AIX
    ([\#6703](http://www.rudder-project.org/redmine/issues/6703))

#### Server components

  - Fixed: rudder-reports has not sufficient dependency to postgresql's
    version
    ([\#6662](http://www.rudder-project.org/redmine/issues/6662))
  - Fixed: When a node is promoted to relay, the old rsyslog conf is
    never replaced
    ([\#6721](http://www.rudder-project.org/redmine/issues/6721))

#### Documentation

  - Fixed: Add Debian 8 support in the specs for Rudder nodes
    ([\#6704](http://www.rudder-project.org/redmine/issues/6704))
  - Fixed: HashcodeCaching.scala typo error WRNING =\> WARNING
    ([\#6734](http://www.rudder-project.org/redmine/issues/6734))

#### Techniques

  - Fixed: Promises.st can't load ncf on windows
    ([\#6700](http://www.rudder-project.org/redmine/issues/6700))

#### Initial promises & sys tech

  - Fixed: Create a rudder variable containing all IP of agents
    ([\#6481](http://www.rudder-project.org/redmine/issues/6481))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Dennis Cabooter
  - Florian Heigl
  - Janos Mattyasovszky
  - Olivier Mauras

This software is in beta status and contains several new features but we
have tested it and believe it to be free of any critical bugs. The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!

## Rudder 3.1.0~beta1 (2015-06-08)

### Changes

#### System integration

  - Improve Rudder security in 3.1: Inventory signature and security,
    SELinux compliance
    ([\#6589](http://www.rudder-project.org/redmine/issues/6589))
  - Package rudder-agent SLES12
    ([\#6547](http://www.rudder-project.org/redmine/issues/6547))
  - Generic rudder init script
    ([\#6513](http://www.rudder-project.org/redmine/issues/6513))

#### API

  - Add an API to manage Group categories
    ([\#6512](http://www.rudder-project.org/redmine/issues/6512))
  - Add an API to manage Rule categories
    ([\#6511](http://www.rudder-project.org/redmine/issues/6511))
  - Add an API to query Nodes
    ([\#6470](http://www.rudder-project.org/redmine/issues/6470))

#### Agent

  - Add a rudder remote run command
    ([\#6543](http://www.rudder-project.org/redmine/issues/6543))
  - Add rudder-agent general informations command
    ([\#6432](http://www.rudder-project.org/redmine/issues/6432))

#### Web - UI & UX

  - Have a pretty 404 Page, explaining what is wrong
    ([\#6401](http://www.rudder-project.org/redmine/issues/6401))

#### Documentation

  - Prepare doc for 3.1 branch
    ([\#6647](http://www.rudder-project.org/redmine/issues/6647))

#### Architecture - Dependencies

  - Update pom version to 3.1.0~alpha1 on master
    ([\#6064](http://www.rudder-project.org/redmine/issues/6064))

### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Janos Mattyasovszky

This software is in beta status and contains several new features but we
have tested it and believe it to be free of any critical bugs. The use
on production systems is not encouraged at this time and is at your own
risk. However, we do encourage testing, and welcome all and any
feedback\!

