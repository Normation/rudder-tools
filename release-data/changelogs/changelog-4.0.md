# Change logs for Rudder 4.0.\* versions

Rudder 4.0 is currently the **old-latest** version of Rudder.

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
  - New file copy protocol

A blog post explaining these features is
available here: https://www.normation.com/en/blog/2016/11/11/rudder-4-0/

**Installing, upgrading and testing**

  - Install docs:
    https://www.rudder-project.org/doc-4.0/_install_rudder_server.html
  - Upgrade docs:
    https://www.rudder-project.org/doc-4.0/_upgrade.html
  - Download links: https://www.rudder-project.org/site/get-rudder/downloads/

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

## <a name="4.0.5" > </a> Rudder 4.0.5 (2017-05-22)

### Changes

#### Documentation

  - Add an example of using a condition in the Technique creation tutorial
    ([\#10694](https://www.rudder-project.org/redmine/issues/10694))
  - Add Technique editor documentation
    ([\#10685](https://www.rudder-project.org/redmine/issues/10685))
  - Improve policy mode documentation
    ([\#10667](https://www.rudder-project.org/redmine/issues/10667))
  - Extend node property documentation for templates
    ([\#10614](https://www.rudder-project.org/redmine/issues/10614))

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
  - Fixed: On some resolution, top bar is on two line and we can't see the whole directive tree
    ([\#10552](https://www.rudder-project.org/redmine/issues/10552))
  - Fixed: Mono Font text in directive form are not correctly displayed in Chrome
    ([\#9780](https://www.rudder-project.org/redmine/issues/9780))
  - Fixed: Selects in Archives page are not wide enough
    ([\#10615](https://www.rudder-project.org/redmine/issues/10615))

#### Web - Config management

  - Fixed: Tooltips don't disapear on safari
    ([\#6145](https://www.rudder-project.org/redmine/issues/6145))

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
  - Fixed: Broken agent build on Debian/ubuntu
    ([\#10729](https://www.rudder-project.org/redmine/issues/10729))
  - Fixed: Man pages provided in rudder-agent package are out-of-date
    ([\#10432](https://www.rudder-project.org/redmine/issues/10432))
  - Fixed: rudder-init doesn't use fully qualified path for executing cf-agent
    ([\#10607](https://www.rudder-project.org/redmine/issues/10607))

#### Initial promises & sys tech

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

## Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - François Bayart
  - Romuald Bouvard
  - Jean Cardona
  - Christophe Crier
  - Florian Heigl
  - Janos Mattyasovszky
  - Ferenc Ulrich
  - Kiran V
  - Rémi Verchère
  - Josh Watt

This is a bug fix release in the 4.0 series and therefore all installations of 4.0 should be upgraded when possible. An end-of-life date has been scheduled for this release (30th June 2017), See our FAQ for details, on the website. As such, it is recommended to upgrade all pre-4.1 (current latest version) installations to 4.1 as soon as possible to enjoy the latest features and improvements of a more mature and stable version.


## <a name="4.0.4" > </a> Rudder 4.0.4 (2017-04-19)

### Changes

#### Packaging

  - Upgrade OpenSSL to 1.0.2k
    ([\#10246](https://www.rudder-project.org/redmine/issues/10246))

#### Techniques

  - Add tests for manageKeyValueFile
    ([\#10473](https://www.rudder-project.org/redmine/issues/10473))

### Bug fixes

#### API

  - Fixed: Wrong error message on directive API
    ([\#10554](https://www.rudder-project.org/redmine/issues/10554))
  - Fixed: Log an error when Rest API fails 
    ([\#10295](https://www.rudder-project.org/redmine/issues/10295))
  - Fixed: Missing timezone information in API "node details"
    ([\#10280](https://www.rudder-project.org/redmine/issues/10280))
  - Fixed: Fix behavior of directive API and make api more consistent
    ([\#10225](https://www.rudder-project.org/redmine/issues/10225))

#### Web - UI & UX

  - Fixed: Different icons for magnifier in pending nodes page
    ([\#10524](https://www.rudder-project.org/redmine/issues/10524))
  - Fixed: A magnifier icon appears in the filter fild after displaying directives that would be applied in pending nodes page
    ([\#10525](https://www.rudder-project.org/redmine/issues/10525))
  - Fixed: "Reset to default" action in "Change Audit Logs" doesn't reset to install version
    ([\#9391](https://www.rudder-project.org/redmine/issues/9391))
  - Fixed: Directive column of pending nodes table is not wide enough.
    ([\#10513](https://www.rudder-project.org/redmine/issues/10513))
  - Fixed: A running Policy generation is not displayed on the Status dropdown
    ([\#10451](https://www.rudder-project.org/redmine/issues/10451))
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
  - Fixed: Cannot use slashes in quick search
    ([\#10407](https://www.rudder-project.org/redmine/issues/10407))
  - Fixed: Checkboxes in Administration menu are not locked for users with missing permissions
    ([\#9328](https://www.rudder-project.org/redmine/issues/9328))
  - Fixed: Bad Rudder logo in src/main/webapp/images
    ([\#10386](https://www.rudder-project.org/redmine/issues/10386))
  - Fixed: Tooltips are broken in Rule tables
    ([\#10389](https://www.rudder-project.org/redmine/issues/10389))
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
  - Fixed: Compliance display when hoverving over the compliance bar is too precise
    ([\#9323](https://www.rudder-project.org/redmine/issues/9323))
  - Fixed: Cannot change schedule on Node 
    ([\#10318](https://www.rudder-project.org/redmine/issues/10318))
  - Fixed: When trying to create a new API account that has the same name as an existing acocunt, nothing happen
    ([\#10250](https://www.rudder-project.org/redmine/issues/10250))
  - Fixed: Setting title are barelly outstanding
    ([\#10261](https://www.rudder-project.org/redmine/issues/10261))

#### Web - Config management

  - Fixed: On centos7, generation fails because of hook policy-generation-node-ready/10-cf-promise-check
    ([\#10532](https://www.rudder-project.org/redmine/issues/10532))
  - Fixed: Missing "user techniques" in the technique editor when exporting / importing archive
    ([\#9448](https://www.rudder-project.org/redmine/issues/9448))
  - Fixed: Policy validation fails
    ([\#10446](https://www.rudder-project.org/redmine/issues/10446))

#### Web - Maintenance

  - Fixed: There is no error logged when an error occurs when updating information of Node in Node cache
    ([\#10290](https://www.rudder-project.org/redmine/issues/10290))

#### Web - Nodes & inventories

  - Fixed: Regex search on node properties is broken: returns all nodes with a property when no using invalid value
    ([\#10570](https://www.rudder-project.org/redmine/issues/10570))
  - Fixed: Include Timezone in Node Info
    ([\#7092](https://www.rudder-project.org/redmine/issues/7092))
  - Fixed: Rudder fails to accept inventories with user account different only in their case
    ([\#10545](https://www.rudder-project.org/redmine/issues/10545))

#### Documentation

  - Fixed: Remove doc for the old quicksearch bar that has been removed
    ([\#10401](https://www.rudder-project.org/redmine/issues/10401))
  - Fixed: Doc about copying ncf technique to /var/rudder/ncf/local is false
    ([\#10269](https://www.rudder-project.org/redmine/issues/10269))

#### Agent

  - Fixed: Policy loading is slow due to innefficient variable manipulation
    ([\#10576](https://www.rudder-project.org/redmine/issues/10576))
  - Fixed: On upgrade from 3.1 to 4.1, policy could not be generated any more
    ([\#10559](https://www.rudder-project.org/redmine/issues/10559))
  - Fixed: Some QEMU virtual machines are seen as physical
    ([\#9616](https://www.rudder-project.org/redmine/issues/9616))
  - Fixed: If rudder server component is stopped on Rudder root server, it is never restarted
    ([\#10258](https://www.rudder-project.org/redmine/issues/10258))

#### Packaging

  - Fixed: Don't display warning about configuring policy server on root server
    ([\#8976](https://www.rudder-project.org/redmine/issues/8976))
  - Fixed: make clean in rudder agent package doesn't remove build-cfengine-stamp
    ([\#10334](https://www.rudder-project.org/redmine/issues/10334))

#### Initial promises & sys tech

  - Fixed: Transient update error on ncf/local
    ([\#10028](https://www.rudder-project.org/redmine/issues/10028))
  - Fixed: Inventory is not resent in case of error - and agent don't report the error
    ([\#10088](https://www.rudder-project.org/redmine/issues/10088))
  - Fixed: A 4.1 agent cannot fetch its promises from a 3.1 server
    ([\#10049](https://www.rudder-project.org/redmine/issues/10049))
  - Fixed: Ignore changes generated by creation/deletion of ncf expected reports file
    ([\#10355](https://www.rudder-project.org/redmine/issues/10355))
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

#### Web - Compliance & node report

  - Fixed: Compliance bar graph doesn't show small compliance numbers
    ([\#10392](https://www.rudder-project.org/redmine/issues/10392))

#### Performance and scalability

  - Fixed: Enable gzip compression on text resources
    ([\#10365](https://www.rudder-project.org/redmine/issues/10365))

#### Server components

  - Fixed: In debug verbosity, logs are overflowed by logs about com.zaxxer.hikari.pool
    ([\#10471](https://www.rudder-project.org/redmine/issues/10471))

#### Techniques

  - Fixed: "Download files from the shared folder" behaving badly?
    ([\#10312](https://www.rudder-project.org/redmine/issues/10312))

## Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Ilan Costa
  - Florian Heigl
  - Janos Mattyasovszky
  - Hamlyn Mootoo 
  - Dmitry Svyatogorov 

This is a bug fix release in the 4.0 series and therefore all installations of 4.0 should be upgraded when possible. An end-of-life date has been scheduled for this release (30th June 2017), See our FAQ for details, on the website. As such, it is recommended to upgrade all pre-4.1 (current latest version) installations to 4.1 as soon as possible to enjoy the latest features and improvements of a more mature and stable version.



## Rudder 4.0.3 (2017-02-20)

### Changes

#### Web - Nodes & inventories

  - API endpoint to get information about queue status of uploaded inventories
    ([\#9976](https://www.rudder-project.org/redmine/issues/9976))

#### Web - UI & UX

  - Add an option to not display rule status/recent changes in directives screen
    ([\#10157](https://www.rudder-project.org/redmine/issues/10157))
  - Node breakdown - show actual numbers
    ([\#7422](https://www.rudder-project.org/redmine/issues/7422))
  - Remove the "disabled rule" notice 
    ([\#9955](https://www.rudder-project.org/redmine/issues/9955))

#### Documentation

  - Add link to the new FAQ in the manual
    ([\#10181](https://www.rudder-project.org/redmine/issues/10181))
  - Add qa-test for line breaks
    ([\#9893](https://www.rudder-project.org/redmine/issues/9893))
  - Document the Audit mode
    ([\#9668](https://www.rudder-project.org/redmine/issues/9668))

### Bug fixes

#### Web - UI & UX

  - Fixed: Status dropdown's display is broken
    ([\#10177](https://www.rudder-project.org/redmine/issues/10177))
  - Fixed: Display of new "Display compliance and recent changes columns on rule summary" setting is broken
    ([\#10173](https://www.rudder-project.org/redmine/issues/10173))
  - Fixed: Included "time ended" in Status dropdown
    ([\#10133](https://www.rudder-project.org/redmine/issues/10133))
  - Fixed: In group page, remove reference to CFEngine in generated classes
    ([\#9885](https://www.rudder-project.org/redmine/issues/9885))

#### Web - Nodes & inventories

  - Fixed: Users with "node_all" security role can not change Agent Policy Mode
    ([\#9936](https://www.rudder-project.org/redmine/issues/9936))
  - Fixed: Inventories with fields containing only spaces/tabs/... may fail to be parsed due to invalid sanitization of entry
    ([\#10220](https://www.rudder-project.org/redmine/issues/10220))
  - Fixed: FileNotFoundException when looking for deleted history file
    ([\#10115](https://www.rudder-project.org/redmine/issues/10115))

#### Performance and scalability

  - Fixed: Compliance on all reports is always computed, even when not necessary
    ([\#9869](https://www.rudder-project.org/redmine/issues/9869))
  - Fixed: Incomplete logging in debug_timming
    ([\#9853](https://www.rudder-project.org/redmine/issues/9853))

#### Web - Config management

  - Fixed: Broken directive migration in Rudder 4.0.2
    ([\#9859](https://www.rudder-project.org/redmine/issues/9859))
  - Fixed: Deadlock with simultaneous generation and new reports
    ([\#10168](https://www.rudder-project.org/redmine/issues/10168))
  - Fixed: Incomplete logging in expected reports computation
    ([\#10143](https://www.rudder-project.org/redmine/issues/10143))
  - Fixed: Cannot select by status on the "Change Requests" page
    ([\#10012](https://www.rudder-project.org/redmine/issues/10012))

#### Web - Compliance & node report

  - Fixed: If node is sending unexpected report, we get an invalid text
    ([\#9930](https://www.rudder-project.org/redmine/issues/9930))
  - Fixed: When we receive reports from node with old reports, caches are not used for compliance computation
    ([\#9835](https://www.rudder-project.org/redmine/issues/9835))

#### Documentation

  - Fixed: Merge error - Link check disappeared in 4.0
    ([\#10206](https://www.rudder-project.org/redmine/issues/10206))
  - Fixed: Broken link in CFEngine doc
    ([\#10151](https://www.rudder-project.org/redmine/issues/10151))
  - Fixed: expected reports, component keys
    ([\#8633](https://www.rudder-project.org/redmine/issues/8633))

#### Miscellaneous

  - Fixed: Typo in root of policy libray tree name
    ([\#9884](https://www.rudder-project.org/redmine/issues/9884))

#### Agent

  - Fixed: Error when upgrading rudder-agent
    ([\#10034](https://www.rudder-project.org/redmine/issues/10034))
  - Fixed: Broken CFEngine patch in 4.0 branch
    ([\#9809](https://www.rudder-project.org/redmine/issues/9809))
  - Fixed: Logs from 4.1 agent are not sent to the server
    ([\#9776](https://www.rudder-project.org/redmine/issues/9776))

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
  - Fixed: When upgrading Rudder, we get mails from cron saying "ok: Rudder agent check ran without errors."
    ([\#9858](https://www.rudder-project.org/redmine/issues/9858))
  - Fixed: ncf-api-virtualenv build depends on selinux
    ([\#9851](https://www.rudder-project.org/redmine/issues/9851))
  - Fixed: Simple relay tries to configure rsyslog-pgsql
    ([\#9979](https://www.rudder-project.org/redmine/issues/9979))

#### Initial promises & sys tech

  - Fixed: Impossible to collect reports in mission portal since #9216
    ([\#10209](https://www.rudder-project.org/redmine/issues/10209))
  - Fixed: Error parsing inventory
    ([\#9841](https://www.rudder-project.org/redmine/issues/9841))

#### Plugin - datasources

  - Fixed: EventLog at promise generation for datasources change, even if nothing changed
    ([\#10198](https://www.rudder-project.org/redmine/issues/10198))

#### Architecture - Internal libs

  - Fixed: Test create directories in /tmp that are not cleaned nor unique
    ([\#10029](https://www.rudder-project.org/redmine/issues/10029))

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

  - Ilan Costa
  - Janos Mattyasovszky
  - Dmitry Svyatogorov

This is a bug fix release in the 4.0 series and therefore all
installations of 4.0 should be upgraded when possible. The current "esr"
release is 3.1.\*. When we release a new version of Rudder, it has been
 thoroughly tested, and we consider the release enterprise-ready for
deployment


## Rudder 4.0.2 (2016-12-20)

### Changes

#### Documentation

  - Document the Audit mode ([\#9668](http://www.rudder-project.org/redmine/issues/9668))

### Bug fixes

#### Web - UI & UX

  - Fixed: Broken login page css on latest Chrome version ([\#9778](http://www.rudder-project.org/redmine/issues/9778))
  - Fixed: Shared files input does not appear on in directives form ([\#9804](http://www.rudder-project.org/redmine/issues/9804))
  - Fixed: Change request link is too small ([\#6142](http://www.rudder-project.org/redmine/issues/6142))

#### Web - Config management

  - Fixed: Error when displaying Rules when a rule is applying a directive that does not exists anymore ([\#9802](http://www.rudder-project.org/redmine/issues/9802))
  - Fixed: Error when accessing change request ([\#9790](http://www.rudder-project.org/redmine/issues/9790))

#### Agent

  - Fixed: Broken CFEngine patch in 4.0 branch ([\#9809](http://www.rudder-project.org/redmine/issues/9809))
  - Fixed: Grep error when running the agent ([\#9799](http://www.rudder-project.org/redmine/issues/9799))

#### Documentation

  - Fixed: Missing "default =" word in node properties expansion documention ([\#9800](http://www.rudder-project.org/redmine/issues/9800))

#### Server components

  - Fixed: Rudder's LDAP server configuration does not allow to query the monitor DB ([\#9818](http://www.rudder-project.org/redmine/issues/9818))

#### Techniques

  - Fixed: Malformed .gz inventory breaks upload process ([\#9794](http://www.rudder-project.org/redmine/issues/9794))
  
### Release notes

Special thanks go out to the following individuals who invested time,
patience, testing, patches or bug reports to make this version of Rudder
better:

  - Alexandre Anriot
  - Janos Mattyasovszky

This is a bug fix release in the 4.0 series and therefore all
installations of 4.0 should be upgraded when possible. The current "esr"
release is 3.1.\*. When we release a new version of Rudder, it has been
 thoroughly tested, and we consider the release enterprise-ready for
deployment


## Rudder 4.0.1 (2016-12-12)

### Changes

#### Agent

  - Warn the user when he tries to use long arguments with rudder agent ([\#9658](http://www.rudder-project.org/redmine/issues/9658))
  - Make rudder agent reinit warn the user ([\#8106](http://www.rudder-project.org/redmine/issues/8106))

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
  - Add Rudder high level diagram on Readme ([\#9672](http://www.rudder-project.org/redmine/issues/9672))

### Bug fixes

#### Web - Config management

  - Fixed: Node properties update doesn't invalidate node configuration hash ([\#9402](http://www.rudder-project.org/redmine/issues/9402))

#### Web - UI & UX

  - Fixed: Degraded style of text areas in directive forms ([\#9703](http://www.rudder-project.org/redmine/issues/9703))
  - Fixed: Missing top of eventLog datetime picker on small screen  ([\#9267](http://www.rudder-project.org/redmine/issues/9267))
  - Fixed: If an event logs contains long lines it is not displayed properly ([\#5963](http://www.rudder-project.org/redmine/issues/5963))
  - Fixed: Rounded corner inside status menu ([\#9681](http://www.rudder-project.org/redmine/issues/9681))
  - Fixed: Pop-up bottom is rounded, but top is not ([\#9657](http://www.rudder-project.org/redmine/issues/9657))
  - Fixed: Login page broken when window is widened ([\#9656](http://www.rudder-project.org/redmine/issues/9656))
  - Fixed: Display disabled rules with a tag in place is grey italic ([\#9492](http://www.rudder-project.org/redmine/issues/9492))
  - Fixed: Error message when failing to accept a new node is hard to find ([\#9436](http://www.rudder-project.org/redmine/issues/9436))
  - Fixed: An horizontal scrollbar appears on the dashboard when hovering over the right graph ([\#9429](http://www.rudder-project.org/redmine/issues/9429))

#### Web - Compliance & node report

  - Fixed: When applying same directive in different rule, reporting is broken ([\#9743](http://www.rudder-project.org/redmine/issues/9743))

#### Web - Nodes & inventories

  - Fixed: No server inventory in web interface if /etc/hosts is not correctly configured ([\#9744](http://www.rudder-project.org/redmine/issues/9744))

##### Agent

  - Fixed: Improve error messages in "rudder agent update" ([\#9726](http://www.rudder-project.org/redmine/issues/9726))
  - Fixed: Fusioninventory is not tracked by check-rudder-health ([\#9622](http://www.rudder-project.org/redmine/issues/9622))
  - Fixed: Typo in rudder agent run failure message ([\#9618](http://www.rudder-project.org/redmine/issues/9618))
  - Fixed: Virtual machine detected as physical ([\#9496](http://www.rudder-project.org/redmine/issues/9496))
  - Fixed: Some QEMU systems are wrongly detected as physical system ([\#9335](http://www.rudder-project.org/redmine/issues/9335))
  - Fixed: Agent capabilities should be per agent, and not per node ([\#9359](http://www.rudder-project.org/redmine/issues/9359))
  
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
  - Fixed: ncf initialization seems to be repaired conctinuously ([\#9464](http://www.rudder-project.org/redmine/issues/9464))

#### Initial promises & sys tech

  - Fixed: Script that validate inventory is not correctly called on Windows ([\#9764](http://www.rudder-project.org/redmine/issues/9764))
  - Fixed: Error on inventory of policy servers:  Error when parsing an <RUDDER><AGENT> entry, that agent will be ignored. <- could not parse policy server id (tag POLICY_SERVER_UUID) from specific inventory ([\#9327](http://www.rudder-project.org/redmine/issues/9327))
  - Fixed: Explain in the reports of system techniques that we do not need to manage the cron service on AIX ([\#9235](http://www.rudder-project.org/redmine/issues/9235))
  - Fixed: Multiple errors "The postgresql process was not running and has been restarted" ([\#9182](http://www.rudder-project.org/redmine/issues/9182))
  - Fixed: No reports when agent cannot update its promises ([\#9751](http://www.rudder-project.org/redmine/issues/9751))
  - Fixed: The locks are removed every 10 minutes by check-rudder-agent when there is no promise update ([\#9626](http://www.rudder-project.org/redmine/issues/9626))
  - Fixed: Error message when restarting rudder-agent during relay install ([\#9216](http://www.rudder-project.org/redmine/issues/9216))
  - Fixed: No answer with common / update ([\#8155](http://www.rudder-project.org/redmine/issues/8155))
  - Fixed: A cfengine enterprise agent fails to connect to rudder server in cfengine 3.7, because there is no agentallconnects ([\#9716](http://www.rudder-project.org/redmine/issues/9716))
  - Fixed: Broken node.env variable in 4.0 ([\#9691](http://www.rudder-project.org/redmine/issues/9691))

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

This is a bug fix release in the 4.0 series and therefore all
installations of 4.0 should be upgraded when possible. The current "esr"
release is 3.1.\*. When we release a new version of Rudder, it has been
 thoroughly tested, and we consider the release enterprise-ready for
deployment

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

