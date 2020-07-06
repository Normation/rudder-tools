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
chmog -R g+ws /var/rudder/configuration-repository/
```

Run the following commands on all server that will be a destination server

```
cd /var/rudder/configuration-repository/
git config receive.denyCurrentBranch ignore
```

How to install gatekeeper on your host
--------------------------------------

Run the following commands

```
cp gatekeeper.conf ~/.gatekeeper
cp gatekeeper /usr/local/bin/
chmod +x /usr/local/bin/gatekeeper
```

And edit `~/.gatekeeper` to add your environments
  

How to use gatekeeper
---------------------

You need an empty directory to work in:

```
mkdir workspace
cd workspace
```

Prepare your workspace:

```
gatekeeper prepare <environment>
```

Run meld between source and destination:

```
gatekeeper meld
```

Commit your change to the destination server:

```
gatekeeper commit <environment>
```

If your workspace is cluttered you can reset it to a working state with:

```
gatekeeper reset
```
