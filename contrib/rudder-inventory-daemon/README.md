# Rudder inventory uploader and forwarder

## Overview

The default way to forward inventories by the Rudder Ecosystem is using the agent,
which is run every 5 minutes for policy server.

We identified multiple issues hitting environments with many thousand nodes, where the 
processing queue of the inventory endpoint got saturated by batches of 50, and processing
inventories was not a continuous process. Also, if an inventory breaks the processing engine
and that errors our, there is no proper handling, and it will retry it until manually removed.

This might multiply up if you have chained Rudder Relay servers, causing a "lag" 
between the Rudder node sending the inventory and the Root server processing it.

After having a node installed or updated, this might cause an unwanted delay, up to n x 5Min,
which is not always desirable.

This extension toolset is using a perl-based inventory forwarder- and uploader-daemon with inotify 
to listen on the incoming directories  and manage the upload queue for the rudder-inventory-endpoint.

## Requirements

Currently the minimum versions are Rudder 3.1.24, 4.1.8 or 4.2.1 and later.
This is not a hard requirement but then you have to patch the system policies yourself.
See [#11257](https://www.rudder-project.org/redmine/issues/11257)

It was tested on SLES11 with Rudder 4.1.8 and SLES12 with Rudder 4.3.0.rc3, so make sure you test if on different OS/versions.


## Packaging
You need `make` and `rpmbuild` to do packaging. Execute make in the top directory:

```
   make rpm
```

Currently rpm-based packaging is available, and was only tested on SLES11 and SLES12, other packaging can be established by extending the Makefile.

## Usage
It is intended to be run as a daemon, but can be run in foreground to debugging purposes.

```
rudder-inventory-daemon [options]
    -v|--verbose       enter verbose mode, up to 4x
    -f|--fork          initV mode with forking, otherwise stay on console
    -c|--config <file> use specified config file instead of standard config file (See below)
```

Please consider installing it as a package, since that includes additional files and directories as specified below.

## Working principle

Rudder inventories are uploaded in compressed for over HTTP, and as of 3.1 each is accompanied by a signature file.
These files must either be forwarded to the upstream server or on the root submitted to the inventory endpoint for processing.
To have a low latency on this process, each directory involved in the process is set up with an inotify watcher in polled mode.

One main loop works in an endless loop. 

It polls the inotify handles twice, which fire event handler for each received file. 

Relays are easy, each file is simply forwarded as-is to the upstream server.

On the Root server the event handler starts processing them depending on the type:
* Compressed inventory files are decompressed and are left to be picked up via the next inotify poll.
* Decompressed inventory files are added to an upload queue.

The upload queue is processed sequential after polling the handles.

Inventories which have a corresponding signature are uploaded to the endpoint until saturation is reached (checking for saturation via a REST API).
If reached, all items in the queue will remain there and processing it will be postponed for the next main loop.
 
Inventories with missing signature uploads are being waited until a timeout is reached and upload of the inventory is tried without, but tends to fail.

If the endpoint is unreachable, a 15 second sleep is introduced (mostly at restart of endpoint service).

## Example of running it stand-alone

```
# /opt/rudder/bin/rudder-inventory-daemon
{2017-12-07 17:59:46.440} <28660> [WARNING] Config file /opt/rudder/inventory-daemon/rudder-inventory-daemon.config.yml does not exist
{2017-12-07 17:59:46.442} <28660> [INFO] starting: Inventory daemon started with pid <28660> in mode <ROOT>
{2017-12-07 17:59:46.443} <28660> [INFO] starting: Initialization finished, entering loop.
{2017-12-07 17:59:54.635} <28660> [INFO] send: Endpoint: 1/50, Queued: 0, Accepted: relaysrv (8ae559f6-9e08-46ef-b9de-976cbc24cf35)
{2017-12-07 18:00:14.833} <28660> [INFO] send: Endpoint: 1/50, Queued: 0, Accepted: rootserv (root)
{2017-12-07 18:01:15.092} <28660> [INFO] send: Endpoint: 1/50, Queued: 7, Accepted: aws-sandbox-client-01 (b46bfc43-7eea-4da5-8443-43b242b13b65)
{2017-12-07 18:01:15.198} <28660> [INFO] send: Endpoint: 2/50, Queued: 6, Accepted: aws-sandbox-relay-01 (c8474bea-7327-45b3-9d4d-d83ec2471145)
{2017-12-07 18:01:15.285} <28660> [INFO] send: Endpoint: 3/50, Queued: 5, Accepted: ip-10-60-11-204 (c8474bea-7327-45b3-9d4d-d83ec2471145)
{2017-12-07 18:01:15.380} <28660> [INFO] send: Endpoint: 4/50, Queued: 3, Accepted: testvm00042 (bb788632-35f6-11e5-bef5-c9e3bde9d18c)
{2017-12-07 18:01:15.442} <28660> [INFO] send: Endpoint: 4/50, Queued: 2, Accepted: testvm00188 (6fa7c750-b78b-4ba5-a47c-5f74dd86a253)
{2017-12-07 18:01:15.528} <28660> [INFO] send: Endpoint: 5/50, Queued: 1, Accepted: relaysrv (8ae559f6-9e08-46ef-b9de-976cbc24cf35)
{2017-12-07 18:01:15.647} <28660> [INFO] send: Endpoint: 6/50, Queued: 0, Accepted: rootserv (root)
{2017-12-07 18:03:14.975} <28660> [WARNING] signature_check: Signature missing for /var/rudder/inventories/accepted-nodes-updates/badserver-e58b8105-323c-4f19-be60-5c8272f5de0f.ocs, but timeout of 120 reached
{2017-12-07 18:03:14.978} <28660> [WARNING] send_file: Inventory is UNSIGNED: /var/rudder/inventories/accepted-nodes-updates/badserver-e58b8105-323c-4f19-be60-5c8272f5de0f.ocs
{2017-12-07 18:03:15.091} <28660> [ERROR] send_file: HTTP/401: Bad Signature for '/var/rudder/inventories/accepted-nodes-updates/badserver-e58b8105-323c-4f19-be60-5c8272f5de0f.ocs'. Server returned: Reject inventory 'badserver-e58b8105-323c-4f19-be60-5c8272f5de0f.ocs' for Node 'bb788632-35f6-11e5-bef5-c9e3bde9d18c' because signature is missing, you can go back to unsigned state by running the following command '/opt/rudder/bin/rudder-keys reset-status bb788632-35f6-11e5-bef5-c9e3bde9d18c'
^C{2017-12-07 18:05:28.038} <28660> [INFO] signal: Will terminate gracefully at next loop.
{2017-12-07 18:05:28.039} <28660> [INFO] shutdown: Some stats: Processed total: 10, Still in the Queue: 0
{2017-12-07 18:05:28.039} <28660> [INFO] shutdown: Closing notify handle: /var/rudder/inventories/accepted-nodes-updates
{2017-12-07 18:05:28.039} <28660> [INFO] shutdown: Closing notify handle: /var/rudder/inventories/incoming
{2017-12-07 18:05:28.039} <28660> [INFO] Exiting.
```

This shows the normal processing with one-one incoming inventory.

At `18:01` a set of already received inventories was copied to `accepted-node-updates` and we see the queue jumped to 7 and each upload decreases it by one until the queue is emptied.

The saturation of the endpoint starts increasing with the first four inventories, and then at the fifth it finished processing the first one.

At `18:03` the timeout of 120sec for waiting on a signature of badserver was reached upload was tried regardless, and it did fail as expected.

## Used files

### Generic 

#### `/opt/rudder/etc/no_inventory_upload`
We provide this file to disable the `send-clean.sh` rudder-agent based inventory upload as implemented by
[this issue](https://www.rudder-project.org/redmine/issues/11257).

#### `/opt/rudder/etc/server-roles.d/rudder-server-root`
Detects running on the root policy server, and handles uploading the inventories to the inventory endpoint.
If it is missing, it assumes the daemon is running on a relay and forward inventories to the parent policy server.

#### `/var/log/rudder/rudder-inventory-daemon.log`
Logfile of the daemon

#### `/var/rudder/run/rudder-inventory-daemon.pid`
PID File of the daemon. If it contains a PID that is currently running, it refuses to start, otherwise overwrites it with the new pid.

#### `/opt/rudder/etc/rudder-inventory-daemon.config.yml`
Configuration file template in YAML format, if it exists.
See Config file section for details and copy the provided template file for customizations.

### On Relay Servers

#### `/var/rudder/cfengine-community/inputs/common/1.0/site.cf`
Extracts `davuser` and `davpw` credentials for WebDAV uploads.
Extracts the section of `inventory_upload_protocol` to determine if http or https is to be used.
Sets up an inotify listener to handle updates of the file transparently - no need to restart the daemon if something changes.

#### `/var/rudder/cfengine-community/policy_server.dat`
Extracts the parent policy server for uploads.
Sets up an inotify listener to handle changes in the policy server, even this is not a common scenario...

### On Root Servers

#### `/opt/rudder/etc/rudder-web.properties`
Extracts the `rudder.endpoint.cmdb` configuration for uploading received inventories.
Does __not__ set up an inotify listener, so if you decide to make your one-server to a split-server setup, you have to restart the daemon to reload the file.

## Config file

Some key points:
* It is in yaml format, so indentations *do* matter.
* If the Config file is not present, all options use the default built-in values.
* Help text is commented out using at least two hashmarks and follows the indentation.
* Configurable settings are commented out with single hashmarks at the beginning of the line.
* The commented out settings show the default built-in values.
* There is one generic config section for `default` and one for `uploader` and `forwarder`:
  * Settings defined within the `default` section are inherited by `uploader` and `forwarder`.
  * Settings defined within the `uploader` and `forwarder` sections override ones from `default`.

## Contributions

Contributions are welcome and follow the guidelines for the [Rudder Project](http://www.rudder-project.org/site/).

