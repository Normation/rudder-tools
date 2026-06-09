# COMPLIANCE REPORT EXPORT SCRIPT

This script exports a global compliance report from the server. It provides:

    The global compliance percentage of the server.

    The list of nodes that are not 100% compliant.

    Patch campaigns from the last two days, including the number of successful and failed nodes, alongside the list of failed and missing nodes.

## REQUIREMENTS

The script is written in Python 3.

You need to install the following Python modules:

python -m pip install requests pyyaml

Mail services must be pre-configured on the server.

## CONFIGURATION

Configure the config.yaml file.

### Rudder configuration

Set the Rudder server URL and API token:

rudder:
  url: "https://rudder-server"
  token: "YOUR_API_TOKEN"
  verify_ssl: false

### Mail configuration

Define the sender and recipients:

mail:
  from: "sender@test.com"
  to:
    - "receiver@test.com"

## SETUP

Before running the script, make sure that:

export_compliance.py and config.yaml are in the same directory

## USAGE

### 1. Export the compliance by mail

python export_compliance.py 

This execution will:

    Export the global compliance of the nodes.

    List all nodes that are not 100% compliant.

    Retrieve patch campaigns from approximately the last two days, showing the number of successful and failed nodes, as well as the list of failed and missing nodes.

## LICENSE

This script is licensed under the GNU Affero General Public License v3.0
