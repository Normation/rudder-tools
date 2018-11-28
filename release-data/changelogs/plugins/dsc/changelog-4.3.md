# Changelogs for Rudder plugin dsc 4.3.\* versions

## <a name="dsc-4.3-1.11" > </a> Plugin dsc - dsc-4.3-1.11 (2018-11-28)

### Changes

#### CLI

  - Add a rudder command to list system classes
    ([\#12815](https://issues.rudder.io/issues/12815))
  - Add CLI options
    ([\#13147](https://issues.rudder.io/issues/13147))
  - Add more info in the output of rudder agent info
    ([\#13112](https://issues.rudder.io/issues/13112))

#### ncf

  - Add tests to the files generic methods
    ([\#12837](https://issues.rudder.io/issues/12837))
  - registry type test should be case insensitive
    ([\#13425](https://issues.rudder.io/issues/13425))
  - Add reports mode options to the agent
    ([\#13103](https://issues.rudder.io/issues/13103))
  - Add tests for command_execution generic method
    ([\#13020](https://issues.rudder.io/issues/13020))
  - Add a test mechanism for generic methods
    ([\#11220](https://issues.rudder.io/issues/11220))

#### Packaging

  - use rudder.io instead of normation.com in the makefile
    ([\#13453](https://issues.rudder.io/issues/13453))
  - Use an official curl binary
    ([\#13304](https://issues.rudder.io/issues/13304))

#### Inventory

  - We should sign inventories
    ([\#13431](https://issues.rudder.io/issues/13431))

#### Miscellaneous

  - Add tests for directory_{absent/create} GM
    ([\#12858](https://issues.rudder.io/issues/12858))

### Bug fixes

#### System techniques

  - Fixed: Rudder agent scheduled task is not working due to encoding problem
    ([\#13616](https://issues.rudder.io/issues/13616))
  - Fixed: System technique execution_scheduler still in error
    ([\#13436](https://issues.rudder.io/issues/13436))
  - Fixed: Wrong merge on #13413
    ([\#13423](https://issues.rudder.io/issues/13423))
  - Fixed: Some system component of the dsc-common are not listed in the reporting
    ([\#13413](https://issues.rudder.io/issues/13413))
  - Fixed: System technique execution_scheduler can not be run properly
    ([\#13420](https://issues.rudder.io/issues/13420))
  - Fixed: there are 2 dsc-common on the rudder server
    ([\#13414](https://issues.rudder.io/issues/13414))

#### CLI

  - Fixed: another typo in the update script
    ([\#13422](https://issues.rudder.io/issues/13422))
  - Fixed: update action should not use generic method
    ([\#13415](https://issues.rudder.io/issues/13415))

#### ncf

  - Fixed: Inventory wrong reportId
    ([\#13348](https://issues.rudder.io/issues/13348))
  - Fixed: Service-restart tests fails
    ([\#13143](https://issues.rudder.io/issues/13143))
  - Fixed: Add tests for service GM
    ([\#12868](https://issues.rudder.io/issues/12868))
  - Fixed: typo in rudder.ps1
    ([\#13077](https://issues.rudder.io/issues/13077))
  - Fixed: typo in file-content call to get-file-content
    ([\#13048](https://issues.rudder.io/issues/13048))
  - Fixed: file_enforce_content does not behave like in the unix version
    ([\#12840](https://issues.rudder.io/issues/12840))
  - Fixed: Wrong parameter in file_create GM
    ([\#13040](https://issues.rudder.io/issues/13040))
  - Fixed: Add tests for registry keys {present/absent} generic method
    ([\#13023](https://issues.rudder.io/issues/13023))
  - Fixed: File management generic method can't report success or repair if the file is written in utf8 without bom
    ([\#13007](https://issues.rudder.io/issues/13007))
  - Fixed: File-From-Shared-Folder GM does not support paths with spaces
    ([\#12509](https://issues.rudder.io/issues/12509))
  - Fixed: Most of the files generic methods do not handle file creation when the complete folder path is not already existing
    ([\#13004](https://issues.rudder.io/issues/13004))

#### Packaging

  - Fixed: Wrong jump on the Installer in silent mode
    ([\#13125](https://issues.rudder.io/issues/13125))
  - Fixed: When postinst fails in silent installation, installer never terminates and so does not provide uninstall.exe
    ([\#12952](https://issues.rudder.io/issues/12952))

#### Miscellaneous

  - Fixed: Interval run time should be manageable
    ([\#13049](https://issues.rudder.io/issues/13049))

#### Inventory

  - Fixed: When postinst fails to get  the rudder-server-uuid.txt from the server it should prompt an explicit error
    ([\#13059](https://issues.rudder.io/issues/13059))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.3-1.10" > </a> Plugin dsc - dsc-4.3-1.10 (2018-11-28)

### Changes

### Bug fixes

#### Miscellaneous

  - Fixed: The GM file_download does not create missing folders in path
    ([\#12900](https://issues.rudder.io/issues/12900))
  - Fixed: The GM file_download does not create missing folders in path
    ([\#12900](https://issues.rudder.io/issues/12900))
  - Fixed: Typo in File_download GM
    ([\#12938](https://issues.rudder.io/issues/12938))
  - Fixed: Windows Component present/absent are not working from the technique editor
    ([\#12753](https://issues.rudder.io/issues/12753))

#### ncf

  - Fixed: Missing folder for the KB_present GM
    ([\#12899](https://issues.rudder.io/issues/12899))
  - Fixed: Because of wrong encoding for nxlog config file, nxlog fails to start
    ([\#12972](https://issues.rudder.io/issues/12972))
  - Fixed: Files enforce content does not UTF8
    ([\#12935](https://issues.rudder.io/issues/12935))
  - Fixed: Rename generic methods
    ([\#12795](https://issues.rudder.io/issues/12795))
  - Fixed: File_copy_from_local_source does not create the path when it is not already defined
    ([\#12833](https://issues.rudder.io/issues/12833))
  - Fixed: Variable_Dict GM fails when executed on an already existing variable
    ([\#12826](https://issues.rudder.io/issues/12826))
  - Fixed: Variable_String GM fails when executed on an already existing variable
    ([\#12818](https://issues.rudder.io/issues/12818))

#### Rudder web app

  - Fixed: Plugin does not compile with 4.3.3
    ([\#12942](https://issues.rudder.io/issues/12942))

#### Packaging

  - Fixed: zip must be a binary dependency for the package
    ([\#12794](https://issues.rudder.io/issues/12794))
  - Fixed: Postinst script is always ending with errors because openssl can not find its conf file
    ([\#12776](https://issues.rudder.io/issues/12776))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-4.3-1.9" > </a> Plugin dsc - dsc-4.3-1.9 (2018-11-28)

### Changes

#### Miscellaneous

  - Add a windows hotfix present GM
    ([\#12727](https://issues.rudder.io/issues/12727))
  - Add a generic method to test variable existence
    ([\#12742](https://issues.rudder.io/issues/12742))

#### ncf

  - Add a windows hotfix absent GM
    ([\#12726](https://issues.rudder.io/issues/12726))

### Bug fixes

#### Rudder web app

  - Fixed: Adapt tests after changes in 12743 
    ([\#12751](https://issues.rudder.io/issues/12751))
  - Fixed: Serial is not added to ReportId anymore
    ([\#12528](https://issues.rudder.io/issues/12528))
  - Fixed: Generate technique call with parameters
    ([\#12304](https://issues.rudder.io/issues/12304))

#### Miscellaneous

  - Fixed: condition_from_variable_match is generating wrong classes
    ([\#12746](https://issues.rudder.io/issues/12746))
  - Fixed: Duplicate definition of bundle condition_from_variable_*
    ([\#12741](https://issues.rudder.io/issues/12741))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 4.3 series and therefore all installations of 4.3.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

