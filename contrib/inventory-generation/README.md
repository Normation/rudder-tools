# Inventory generation

This folder contains tooling to generate data for Rudder:
* raw source data
* inventories based on these data
* reports (syslog based) based on policy applied to nodes
* reports (HTTPS based) signed with raw data, based on policy applied to nodes


# Folder Description

* data: generaed data containing the raw data for inventories, on per node uuid. It contains: uuid, hostname, ip, mac, public/private key, certificate, OS name, agent version 
* inventories: the generated inventories
* template: template used to generate inventories

# Scripts

inventory-generation: generate the data and the inventories
sign-and-send-reports.sh: script to sign and send reports generated

## Tips

On the Rudder server, you'll wan't to increase hard ansd soft limit for nofile in /etc/secutiry/limits.conf, and remove rate limiting in journald in /etc/systemd/journald.conf

