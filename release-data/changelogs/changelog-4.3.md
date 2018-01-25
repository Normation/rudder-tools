
# General information

Rudder 4.3 is currently under development..

This page provides a summary of changes for each version. Previous beta
and rc versions are listed below for convenience.

**Main new features in Rudder 4.3:**

  - Ability to have directives from the same technique with different versions or policy mode on the same node.
  - Autorization system for API accounts
  - The techniques created with the technique editor can now have parameters
  - The reporting in techniques created with the technique editor now works even when using variables as parameters
  - Ability to add custom data to the inventory on the node side
  - Complete IPv6 support by default
  - Node lifecycles that allow different behavior depending on the node state (provisionning, pending removal, etc.)

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

