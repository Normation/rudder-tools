# Changelogs for Rudder plugin dsc 4.2.\* versions

## <a name="dsc-4.2-1.10" > </a> Plugin dsc - dsc-4.2-1.10 (2018-11-28)

### Changes

### Bug fixes

#### Miscellaneous

  - Fixed: The GM file_download does not create missing folders in path
    ([\#12900](https://issues.rudder.io/issues/12900))
  - Fixed: The GM file_download does not create missing folders in path
    ([\#12900](https://issues.rudder.io/issues/12900))
  - Fixed: Windows Component present/absent are not working from the technique editor
    ([\#12753](https://issues.rudder.io/issues/12753))

#### ncf

  - Fixed: Missing folder for the KB_present GM
    ([\#12899](https://issues.rudder.io/issues/12899))
  - Fixed: Because of wrong encoding for nxlog config file, nxlog fails to start
    ([\#12972](https://issues.rudder.io/issues/12972))
  - Fixed: Files enforce content does not UTF8
    ([\#12935](https://issues.rudder.io/issues/12935))
  - Fixed: File_copy_from_local_source does not create the path when it is not already defined
    ([\#12833](https://issues.rudder.io/issues/12833))
  - Fixed: Variable_Dict GM fails when executed on an already existing variable
    ([\#12826](https://issues.rudder.io/issues/12826))
  - Fixed: Variable_String GM fails when executed on an already existing variable
    ([\#12818](https://issues.rudder.io/issues/12818))

#### Packaging

  - Fixed: zip must be a binary dependency for the package
    ([\#12794](https://issues.rudder.io/issues/12794))
  - Fixed: Postinst script is always ending with errors because openssl can not find its conf file
    ([\#12776](https://issues.rudder.io/issues/12776))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-1.9" > </a> Plugin dsc - dsc-4.2-1.9 (2018-11-28)

### Changes

#### Miscellaneous

  - Add a windows hotfix present GM
    ([\#12727](https://issues.rudder.io/issues/12727))
  - Add a condition_from_variable GM
    ([\#12575](https://issues.rudder.io/issues/12575))
  - Add a condition_from_variable GM
    ([\#12575](https://issues.rudder.io/issues/12575))

#### ncf

  - Add a windows hotfix absent GM
    ([\#12726](https://issues.rudder.io/issues/12726))

### Bug fixes

#### System integration

  - Fixed: DSC agent may stay in no answer because of nxlog 
    ([\#11376](https://issues.rudder.io/issues/11376))

#### Miscellaneous

  - Fixed: condition_from_variable_match is generating wrong classes
    ([\#12746](https://issues.rudder.io/issues/12746))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-1.8" > </a> Plugin dsc - dsc-4.2-1.8 (2018-11-28)

### Changes

### Bug fixes

#### Packaging

  - Fixed: Release version 1.8 of windows agent/plugin
    ([\#12612](https://issues.rudder.io/issues/12612))

#### Miscellaneous

  - Fixed: Changing windows logger need some service restart
    ([\#12523](https://issues.rudder.io/issues/12523))
  - Fixed: registry_entry_present does not work properly in audit mode and with wrong inputs
    ([\#12551](https://issues.rudder.io/issues/12551))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-1.7" > </a> Plugin dsc - dsc-4.2-1.7 (2018-11-28)

### Changes

#### Miscellaneous

  - Add optional verbose logs on dsc agent
    ([\#12403](https://issues.rudder.io/issues/12403))
  - Add a technique to manage installed softwares on the windows agent
    ([\#12494](https://issues.rudder.io/issues/12494))
  - Add a variable_string_from_command GM
    ([\#12492](https://issues.rudder.io/issues/12492))
  - Add a dedicated rudder application event log
    ([\#12413](https://issues.rudder.io/issues/12413))

### Bug fixes

#### Miscellaneous

  - Fixed: nxlog was not well started
    ([\#12401](https://issues.rudder.io/issues/12401))
  - Fixed: Command execution GM is not reporting properly
    ([\#12484](https://issues.rudder.io/issues/12484))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-1.6" > </a> Plugin dsc - dsc-4.2-1.6 (2018-11-28)

### Changes

#### Rudder web app

  - Release version 1.6 of plugin compatible with Rudder 4.2.5
    ([\#12456](https://issues.rudder.io/issues/12456))

### Bug fixes

#### Rudder web app

  - Fixed: Upgrade Windows Agent to implement parameter escape API
    ([\#12405](https://issues.rudder.io/issues/12405))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-1.5" > </a> Plugin dsc - dsc-4.2-1.5 (2018-11-28)

### Changes

### Bug fixes

#### Packaging

  - Fixed: When we upgrade dsc plugin, techniques are not reloaded automatically
    ([\#12327](https://issues.rudder.io/issues/12327))

#### System techniques

  - Fixed: Broken policy generation
    ([\#12315](https://issues.rudder.io/issues/12315))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-1.4" > </a> Plugin dsc - dsc-4.2-1.4 (2018-11-28)

### Changes

### Bug fixes

#### System techniques

  - Fixed: Windows Agent "last seen" never
    ([\#12160](https://issues.rudder.io/issues/12160))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * pierrick prost

This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-1.3" > </a> Plugin dsc - dsc-4.2-1.3 (2018-11-28)

### Changes

#### System integration

  - NXlog configuration cannot be modified
    ([\#12088](https://issues.rudder.io/issues/12088))

### Bug fixes

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-1.2" > </a> Plugin dsc - dsc-4.2-1.2 (2018-11-28)

### Changes

#### Miscellaneous

  - Use rudder to dsify techniques instead of ncf 
    ([\#11817](https://issues.rudder.io/issues/11817))

### Bug fixes

#### ncf

  - Fixed: Implement condition_from_command in dsc
    ([\#11815](https://issues.rudder.io/issues/11815))
  - Fixed: windows component present installs a component in audit mode
    ([\#11767](https://issues.rudder.io/issues/11767))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-1.1" > </a> Plugin dsc - dsc-4.2-1.1 (2018-11-28)

### Changes

#### Packaging

  - Release version 1.1. of dsc plugin/agent
    ([\#11659](https://issues.rudder.io/issues/11659))

### Bug fixes

#### Rudder web app

  - Fixed: Bootstrap creation of DSC groups is not done
    ([\#11657](https://issues.rudder.io/issues/11657))
  - Fixed: DSC system group must be created in plugin
    ([\#11590](https://issues.rudder.io/issues/11590))

#### System techniques

  - Fixed: "System variables definition parameters" component name is too long
    ([\#11441](https://issues.rudder.io/issues/11441))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-1.0" > </a> Plugin dsc - dsc-4.2-1.0 (2018-11-28)

### Changes

#### Packaging

  - Release v1.0 of windows agent and plugin. 
    ([\#11446](https://issues.rudder.io/issues/11446))

#### Rudder web app

  - Add license to dsc plugin
    ([\#11413](https://issues.rudder.io/issues/11413))

#### System techniques

  - Add support for node properties and Rudder parameters to the DSC agent
    ([\#11404](https://issues.rudder.io/issues/11404))

#### Miscellaneous

  - add a File_Download generic method
    ([\#11343](https://issues.rudder.io/issues/11343))
  - Adding type field in windows registry present GM
    ([\#11352](https://issues.rudder.io/issues/11352))
  - make a dsc version of registry edition technique
    ([\#11354](https://issues.rudder.io/issues/11354))
  - make a dsc version of registry edition technique
    ([\#11354](https://issues.rudder.io/issues/11354))
  - Add a File_from_template_mustache generic method
    ([\#11242](https://issues.rudder.io/issues/11242))
  - Add a variable_string generic_method in dsc
    ([\#11256](https://issues.rudder.io/issues/11256))
  - Add a variable_dict_from_file generic method
    ([\#11269](https://issues.rudder.io/issues/11269))

#### CLI

  - Add some colors to agent output
    ([\#10926](https://issues.rudder.io/issues/10926))

### Bug fixes

#### Packaging

  - Fixed: Bad path for demo license file
    ([\#11440](https://issues.rudder.io/issues/11440))
  - Fixed: Error at generation after reinstalling rudder windows plugin
    ([\#11387](https://issues.rudder.io/issues/11387))
  - Fixed: Fix dsc policy generation tests
    ([\#11400](https://issues.rudder.io/issues/11400))
  - Fixed: always update agent schedule when reinstalling agent
    ([\#11368](https://issues.rudder.io/issues/11368))

#### Rudder web app

  - Fixed: Missing private repositories
    ([\#11436](https://issues.rudder.io/issues/11436))
  - Fixed: Tests are broken after #11406
    ([\#11419](https://issues.rudder.io/issues/11419))

#### System techniques

  - Fixed: .st files are distributed to the nodes
    ([\#11425](https://issues.rudder.io/issues/11425))
  - Fixed: Error when running agent right after install
    ([\#11292](https://issues.rudder.io/issues/11292))

#### ncf

  - Fixed: Change report message of dsc generic methods (part 1) 
    ([\#11369](https://issues.rudder.io/issues/11369))
  - Fixed: Wrong reporting on generic method 	File from shared folder
    ([\#11357](https://issues.rudder.io/issues/11357))
  - Fixed: componentKey error in Variable-String
    ([\#11349](https://issues.rudder.io/issues/11349))

#### Miscellaneous

  - Fixed: Json file of variables
    ([\#11379](https://issues.rudder.io/issues/11379))
  - Fixed: file template from mustache template fails when destination is an empty file
    ([\#11374](https://issues.rudder.io/issues/11374))
  - Fixed: Agent installer waiting for entries
    ([\#11373](https://issues.rudder.io/issues/11373))
  - Fixed: file_copy_from_local patch
    ([\#11366](https://issues.rudder.io/issues/11366))
  - Fixed: Missing new standard features in variable string/merge GM
    ([\#11364](https://issues.rudder.io/issues/11364))
  - Fixed: missing some state in the agent
    ([\#11360](https://issues.rudder.io/issues/11360))
  - Fixed: Techniques are not updated correctly to work on dsc at plugin install/update
    ([\#11345](https://issues.rudder.io/issues/11345))
  - Fixed: file_from_shared_folder GM does not handle _
    ([\#11333](https://issues.rudder.io/issues/11333))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-0.4" > </a> Plugin dsc - dsc-4.2-0.4 (2018-11-28)

### Changes

#### Miscellaneous

  - Add a variable_dict_merge generic method
    ([\#11271](https://issues.rudder.io/issues/11271))
  - Add a Windows_Component_absent GM
    ([\#11321](https://issues.rudder.io/issues/11321))
  - Add a Windows_Component_present GM
    ([\#11319](https://issues.rudder.io/issues/11319))
  - Add a Service-started-at-boot in dsc
    ([\#11312](https://issues.rudder.io/issues/11312))
  - Add a Service-stopped-at-boot in dsc
    ([\#11315](https://issues.rudder.io/issues/11315))
  - Add a Service-Restart GM in dsc
    ([\#11311](https://issues.rudder.io/issues/11311))
  - Add a variable_dict generic method
    ([\#11267](https://issues.rudder.io/issues/11267))
  - Add a variable_from_file generic method
    ([\#11265](https://issues.rudder.io/issues/11265))
  - rename rudder variables
    ([\#11247](https://issues.rudder.io/issues/11247))
  - Add a File_copy_from_local_source generic method
    ([\#11236](https://issues.rudder.io/issues/11236))
  - user_present/absent reports
    ([\#11200](https://issues.rudder.io/issues/11200))
  - Add a generic method command_execution
    ([\#11170](https://issues.rudder.io/issues/11170))

#### ncf

  - Change reporting message format in ncf agent
    ([\#11276](https://issues.rudder.io/issues/11276))
  - Add a parameter to generic methods to configure reporting key if needed
    ([\#11273](https://issues.rudder.io/issues/11273))
  - Add generic method to manage registry keys
    ([\#11240](https://issues.rudder.io/issues/11240))
  - Add a generic method to download from shared folder
    ([\#11165](https://issues.rudder.io/issues/11165))
  - Reporting is mixed with action in generic method, so we can't call a generic method from another generic method
    ([\#11103](https://issues.rudder.io/issues/11103))

### Bug fixes

#### Miscellaneous

  - Fixed: user_password debug prompt
    ([\#11337](https://issues.rudder.io/issues/11337))
  - Fixed: Missing .cf files
    ([\#11325](https://issues.rudder.io/issues/11325))
  - Fixed: fix file_from_server method
    ([\#11302](https://issues.rudder.io/issues/11302))
  - Fixed: fix file_from_server method
    ([\#11302](https://issues.rudder.io/issues/11302))
  - Fixed: user_present audit mode
    ([\#11202](https://issues.rudder.io/issues/11202))

#### ncf

  - Fixed: Policy generation fails due to duplicate bundle
    ([\#11332](https://issues.rudder.io/issues/11332))
  - Fixed: Remove code from ncf placeholder methods
    ([\#11294](https://issues.rudder.io/issues/11294))
  - Fixed: Unexpected reporting due to mismatch between component name in generic method .ps1 and @name in equivalent for .cf
    ([\#11293](https://issues.rudder.io/issues/11293))
  - Fixed: Generic method wrong function name
    ([\#11196](https://issues.rudder.io/issues/11196))
  - Fixed: user_present method
    ([\#11189](https://issues.rudder.io/issues/11189))

#### Packaging

  - Fixed: Error when installing plugin rpk
    ([\#11298](https://issues.rudder.io/issues/11298))
  - Fixed: Wrong permissions in dsc techniques
    ([\#11184](https://issues.rudder.io/issues/11184))
  - Fixed: zip may be missing from system (ie on my Ubuntu 16)
    ([\#11115](https://issues.rudder.io/issues/11115))

#### Rudder web app

  - Fixed: Remove json generation done for all agent type
    ([\#11227](https://issues.rudder.io/issues/11227))
  - Fixed: DSC plugin def is the one of DataSource plugin
    ([\#11175](https://issues.rudder.io/issues/11175))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-0.3" > </a> Plugin dsc - dsc-4.2-0.3 (2018-11-28)

### Changes

#### ncf

  - Add extra generic methods for DSC
    ([\#11104](https://issues.rudder.io/issues/11104))

#### Packaging

  - windows agent certificate should contain the uuid instead of the hostname
    ([\#11032](https://issues.rudder.io/issues/11032))

### Bug fixes

#### Miscellaneous

  - Fixed: Missing end run report from agent
    ([\#11026](https://issues.rudder.io/issues/11026))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.2-0.2" > </a> Plugin dsc - dsc-4.2-0.2 (2018-11-28)

### Changes

#### Miscellaneous

  - Make 4.2-0.2 plugin release
    ([\#11108](https://issues.rudder.io/issues/11108))
  - Creata a task to run automatically inventory at night
    ([\#10918](https://issues.rudder.io/issues/10918))
  - Normalize call to Techniques
    ([\#10869](https://issues.rudder.io/issues/10869))
  - Improve reporting
    ([\#10806](https://issues.rudder.io/issues/10806))
  - Create a generic method to edit file based on a template
    ([\#10822](https://issues.rudder.io/issues/10822))
  - Configure nxlog to send reports to the rudder server
    ([\#10802](https://issues.rudder.io/issues/10802))
  - Add time classes
    ([\#10804](https://issues.rudder.io/issues/10804))
  - Generate inventory - first iteration
    ([\#10800](https://issues.rudder.io/issues/10800))
  - Add classes management
    ([\#10789](https://issues.rudder.io/issues/10789))
  - Add reporting to eventlog in agent
    ([\#10794](https://issues.rudder.io/issues/10794))
  - Automatically load all generic method and technique files
    ([\#10790](https://issues.rudder.io/issues/10790))
  - Add second generic method on User, factor logging code, and detect error/repaired status
    ([\#10784](https://issues.rudder.io/issues/10784))
  - First iteration on generic method/technique/loading
    ([\#10777](https://issues.rudder.io/issues/10777))

#### ncf

  - Add directory_create and file_create generic methods
    ([\#10892](https://issues.rudder.io/issues/10892))
  - Initial policies should contain no techniques
    ([\#10966](https://issues.rudder.io/issues/10966))
  - Normalize generic method format
    ([\#10831](https://issues.rudder.io/issues/10831))

#### Rudder web app

  - Move in code from Rudder into the plugin 
    ([\#11073](https://issues.rudder.io/issues/11073))

#### System techniques

  - Change start and end reports for plugin
    ([\#11036](https://issues.rudder.io/issues/11036))
  - Load system variables from a json file
    ([\#10886](https://issues.rudder.io/issues/10886))

#### Packaging

  - Add a hook to create dsc version on a technique
    ([\#11019](https://issues.rudder.io/issues/11019))
  - Call inventory during postinstall
    ([\#10921](https://issues.rudder.io/issues/10921))
  - Support only 64 bits windows 
    ([\#10950](https://issues.rudder.io/issues/10950))
  - Agent certificate must be a CA to be self signed and able to authenticate on apache
    ([\#10944](https://issues.rudder.io/issues/10944))
  - Create a rudder plugin for server-side windows support
    ([\#10935](https://issues.rudder.io/issues/10935))
  - Change names in fusion and package accordingly to naming convention
    ([\#10932](https://issues.rudder.io/issues/10932))
  - Finish agent command line
    ([\#10930](https://issues.rudder.io/issues/10930))
  - Rework windows installer to make debugging easier
    ([\#10924](https://issues.rudder.io/issues/10924))
  - Create a rudder executable and make it available in the PATH
    ([\#10896](https://issues.rudder.io/issues/10896))
  - Policy server should be in etc
    ([\#10878](https://issues.rudder.io/issues/10878))
  - create uuid in lowercase
    ([\#10882](https://issues.rudder.io/issues/10882))
  - Create a self signed certificate instead of a public key
    ([\#10841](https://issues.rudder.io/issues/10841))
  - Add Rudder-agent sofware information on Windows to have it inventory
    ([\#10830](https://issues.rudder.io/issues/10830))
  - First iteration on windows agent packaging
    ([\#10736](https://issues.rudder.io/issues/10736))

#### CLI

  - Update policy using client authentication
    ([\#10957](https://issues.rudder.io/issues/10957))
  - Add an help command for CLI
    ([\#10874](https://issues.rudder.io/issues/10874))
  - add an update command
    ([\#10888](https://issues.rudder.io/issues/10888))
  - Add execution time computation to the CLI
    ([\#10873](https://issues.rudder.io/issues/10873))
  - Add rudder agent enable/disable
    ([\#10872](https://issues.rudder.io/issues/10872))

#### System integration

  - Scheduling / execution engine
    ([\#10740](https://issues.rudder.io/issues/10740))
  - Change Rudder.pm file in fusion-invneoty to look for windows-dsc agent
    ([\#10756](https://issues.rudder.io/issues/10756))

### Bug fixes

#### ncf

  - Fixed: file_enforce_content is not working
    ([\#11133](https://issues.rudder.io/issues/11133))
  - Fixed: When we install dsc plugin, existing techniques generated with technique editor are not updated
    ([\#11132](https://issues.rudder.io/issues/11132))
  - Fixed: File from template does not work when the destination does not exist
    ([\#10867](https://issues.rudder.io/issues/10867))
  - Fixed: Allow defining a class that is already defined
    ([\#10866](https://issues.rudder.io/issues/10866))

#### Packaging

  - Fixed: Add cfengine methods for service_status and user_status so they can be used in technique editor
    ([\#11091](https://issues.rudder.io/issues/11091))
  - Fixed: We are distributing rudder.json, rudder-directives.ps1 and rudder-system-directives.ps1 from initial policies
    ([\#11090](https://issues.rudder.io/issues/11090))
  - Fixed: DSC ps1 file is not added in the technique repository after generation
    ([\#11065](https://issues.rudder.io/issues/11065))
  - Fixed: Use the version from makefile everywhere
    ([\#11056](https://issues.rudder.io/issues/11056))
  - Fixed: Broken UUID generation
    ([\#10893](https://issues.rudder.io/issues/10893))
  - Fixed: A new cert is created during every install
    ([\#10884](https://issues.rudder.io/issues/10884))
  - Fixed: Wrong installation destination for Rudder
    ([\#10853](https://issues.rudder.io/issues/10853))
  - Fixed: Installer cannot install rudder agent dsc
    ([\#10844](https://issues.rudder.io/issues/10844))
  - Fixed: Create agent key and parse it in inventory
    ([\#10817](https://issues.rudder.io/issues/10817))

#### Rudder web app

  - Fixed: error in dscify hook when creating technique
    ([\#11092](https://issues.rudder.io/issues/11092))

#### System techniques

  - Fixed: invalid reporting from system technique
    ([\#11070](https://issues.rudder.io/issues/11070))
  - Fixed: Load user technique ".ps1"
    ([\#11078](https://issues.rudder.io/issues/11078))
  - Fixed: Missing rudder.ps1 in plugin
    ([\#11000](https://issues.rudder.io/issues/11000))
  - Fixed: Missing template for rudder-directives / rudder-system-directives
    ([\#10968](https://issues.rudder.io/issues/10968))
  - Fixed: Broken syntax in agent
    ([\#10851](https://issues.rudder.io/issues/10851))

#### Miscellaneous

  - Fixed: missing closing ) in dsc agent to read build-info.json
    ([\#11069](https://issues.rudder.io/issues/11069))
  - Fixed: policies are not correctly compressed
    ([\#11068](https://issues.rudder.io/issues/11068))
  - Fixed: Missing end run report from agent
    ([\#11026](https://issues.rudder.io/issues/11026))
  - Fixed: Wrong permission for /var/rudder/configuration-repository/dsc
    ([\#11022](https://issues.rudder.io/issues/11022))
  - Fixed: Generated promises are invalid
    ([\#11024](https://issues.rudder.io/issues/11024))
  - Fixed: No reports from dsc node
    ([\#11017](https://issues.rudder.io/issues/11017))
  - Fixed: Typo in 91-compress-dsc-policies 
    ([\#11008](https://issues.rudder.io/issues/11008))
  - Fixed: Replace ReportIdentifier by ReportId in initial promises
    ([\#10954](https://issues.rudder.io/issues/10954))
  - Fixed: Missing default json properties file
    ([\#10902](https://issues.rudder.io/issues/10902))
  - Fixed: Add an inventory command
    ([\#10815](https://issues.rudder.io/issues/10815))
  - Fixed: Missing node name in inventory file name
    ([\#10865](https://issues.rudder.io/issues/10865))
  - Fixed: no eventlog source created after install
    ([\#10863](https://issues.rudder.io/issues/10863))
  - Fixed: Agent log are not inserted in database
    ([\#10828](https://issues.rudder.io/issues/10828))
  - Fixed: nodeuuid is not correctly fetched by policies
    ([\#10827](https://issues.rudder.io/issues/10827))
  - Fixed: Correctly detect when log config file need to be changed
    ([\#10821](https://issues.rudder.io/issues/10821))
  - Fixed: missing variables definition in agent
    ([\#10813](https://issues.rudder.io/issues/10813))
  - Fixed: Reset culture in rudder agent
    ([\#10814](https://issues.rudder.io/issues/10814))
  - Fixed: Add pretty display for execution and reports
    ([\#10803](https://issues.rudder.io/issues/10803))

#### System integration

  - Fixed: Scheduled tasks don't work (and missing update task)
    ([\#11003](https://issues.rudder.io/issues/11003))
  - Fixed: Hook that zips policy don't take agent resource
    ([\#11011](https://issues.rudder.io/issues/11011))
  - Fixed: Generated policy are zipped with "rules.new" directory
    ([\#10970](https://issues.rudder.io/issues/10970))
  - Fixed: Agent type must be "dsc" in hook and metadata.xml
    ([\#10965](https://issues.rudder.io/issues/10965))

#### CLI

  - Fixed: Agent cli is too verbose during post-install
    ([\#10945](https://issues.rudder.io/issues/10945))
  - Fixed: rudder.bat conflicts with rudder cmdlet
    ([\#10940](https://issues.rudder.io/issues/10940))
  - Fixed: Agent inventory fails
    ([\#10941](https://issues.rudder.io/issues/10941))
  - Fixed: Abort on error in agent code
    ([\#10887](https://issues.rudder.io/issues/10887))
  - Fixed: Fix some display issues in the agent
    ([\#10883](https://issues.rudder.io/issues/10883))
  - Fixed: Different fields in report cli outputs are not aligned
    ([\#10875](https://issues.rudder.io/issues/10875))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.2 series and therefore all installations of 4.2.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

