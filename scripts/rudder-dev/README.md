rudder-dev
==========

This tool is the workhorse for everyday operations for Rudder developers.

In particular, it automates many tasks including:
* Creating a branch to fix a ticket
* Commiting, pushing and creating a pull request to submit work for a ticket
* Amending or rebasing an existing pull request
* Merging pull requests or branches

rudder-dev itself is split into several libraries in this source code folder. It is made available as a standalone script to ease it's installation from http://www.rudder-project.org/tools/rudder-dev.

To set it up, simply run:
> curl http://www.rudder-project.org/tools/rudder-dev > /usr/local/bin/rudder-dev && chmod +x /usr/local/bin/rudder-dev

Read the documentation to get started by running:
> rudder-dev --help
