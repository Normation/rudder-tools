gatekeeper
==========

`gatekeeper` allows synchronizing the configuration-repository between two (or more) Rudder servers.

This repository contains:

* The groups definitions
* The directives
* The rules
* The global parameters
* The techniques

It does not contain:

* Server settings
* Node inventories
* Compliance data
* Plugins settings

How to setup gatekeeper on your Rudder server
---------------------------------------------

Run the following commands

```
usermod -a -G rudder <you>
chgrp -R rudder /var/rudder/configuration-repository/
chmod -R g+ws /var/rudder/configuration-repository/
```

Run the following commands on all server that will be a destination server

```
cd /var/rudder/configuration-repository/
git config receive.denyCurrentBranch ignore
```

You need to create an API token on the destination server, with write rights, to commit the changes.


How to install gatekeeper on your host
--------------------------------------

Run the following commands

```
cp gatekeeper.conf ~/.gatekeeper
cp gatekeeper /usr/local/bin/
chmod +x /usr/local/bin/gatekeeper
```

And edit `~/.gatekeeper` to add your environments and the destination server API token

All synchronizations will be performed in
```
GATEKEEPER_BASE_FOLDER/<environment>
```

folder.


How to use gatekeeper
---------------------


First, prepare your workspace by synchronizing from remote servers:

```
gatekeeper prepare <environment>
```

If you have a graphical interface, run meld between source and destination to synchronise data:

```
gatekeeper meld <environment>
```

NOTE: it is recommended, if you want to have totally synchronized environment, to copy all files and folder from rudder-source to rudder-destination


Commit your change to the destination server:

```
gatekeeper commit <environment>
```

This will automatically reload techniques and restore archives, triggering a policy generation



If your workspace is cluttered you can reset it to a working state with:

```
gatekeeper reset
```
