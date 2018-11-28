# Changelogs for Rudder plugin dsc 5.0.\* versions

## <a name="dsc-5.0-1.12" > </a> Plugin dsc - dsc-5.0-1.12 (2018-11-28)

### Changes

#### Techniques

  - Full path details to shared-folders in WebUI for "File copy from Rudder Shared Folder"
    ([\#13818](https://issues.rudder.io/issues/13818))

#### CLI

  - Add a global variable to check if the verbose mode is active
    ([\#13600](https://issues.rudder.io/issues/13600))

### Bug fixes

#### System integration

  - Fixed: agent is not correctly running
    ([\#13905](https://issues.rudder.io/issues/13905))

#### System techniques

  - Fixed: inventory is not generated at install, because of a path issue to make the signature
    ([\#13904](https://issues.rudder.io/issues/13904))
  - Fixed: Rudder agent does not manage the inventory task
    ([\#13617](https://issues.rudder.io/issues/13617))
  - Fixed: Rudder agent scheduled task is not working due to encoding problem
    ([\#13616](https://issues.rudder.io/issues/13616))

#### CLI

  - Fixed: set culture fails on 2008R2
    ([\#11179](https://issues.rudder.io/issues/11179))
  - Fixed: Do not display curl output when sending an inventory
    ([\#11012](https://issues.rudder.io/issues/11012))
  - Fixed: "rudder agent run -u" does not work properly on dsc
    ([\#13620](https://issues.rudder.io/issues/13620))

#### Inventory

  - Fixed: Windows VM on Redhat Openstack Nova compute QEMU virtual machines are seen as physical
    ([\#11737](https://issues.rudder.io/issues/11737))

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:

 * Ilan COSTA

This is a bug fix release in the 5.0 series and therefore all installations of 5.0.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

## <a name="dsc-5.0-1.11" > </a> Plugin dsc - dsc-5.0-1.11 (2018-11-28)

### Changes

#### Rudder web app

  - Adapt DSC plujgin with 5.0 changes
    ([\#13605](https://issues.rudder.io/issues/13605))
  - Remove spring usage for plugin definition
    ([\#13039](https://issues.rudder.io/issues/13039))

### Bug fixes

### Release notes

Special thanks go out to the following individuals who invested time, patience, testing, patches or bug reports to make this version of Rudder better:


This is a bug fix release in the 5.0 series and therefore all installations of 5.0.x should be upgraded when possible. When we release a new version of Rudder it has been thoroughly tested, and we consider the release enterprise-ready for deployment.

