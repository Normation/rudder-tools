#!/usr/bin/env python
#
# Name:     rudder-set-node-props.py 
# Required: Python docopt module
# Author:   Dennis Cabooter <Dennis.Cabooter@snow.nl>
#

""" 
Add key=value properties to a Rudder node - multiple key=value properties

Usage: rudder-set-node-props.py [--node=<fqdn>] (--key=OPT ...) (--value=OPT ...)

Options:
  -n --node=<fqdn>  The node's FQDN
  -k --key=OPT      Key to add to a node 
  -v --value=OPT    Value to add to a node

"""

# Imports
import sys
import requests
import json
from docopt import docopt

# Main
def main():
  # Global vars
  api_url = "https://rudder.example.com/rudder/api" # CHANGE THIS
  api_token = "" # CHANGE THIS
  headers = {"X-API-Token": api_token, "Content-type": "application/json"}  

  # Parse options
  options = docopt(__doc__, options_first=True)
  node_name = options["--node"]
  keys = options["--key"]
  values = options["--value"]

  # Get from API
  nodes_url = "%s/latest/nodes" % (api_url)
  r = requests.get(nodes_url, headers=headers, verify=False)

  # Parse JSON
  j = json.loads(r.content)

  # Define nodes
  nodes = j["data"]["nodes"]

  # Loop nodes
  for node in nodes:
    if node["hostname"] == node_name:
      node_id = node["id"]

  # Create empty list
  data_container = [] 

  for key, value in zip(keys, values):
    # Create empty dict
    data = {}

    # Populate dict
    data["name"] = key
    data["value"] = value
    
    # Populate list
    data_container.append(data)

  # Create dict for API
  api_container = { "properties": data_container }

  # Post to API
  node_url = "%s/latest/nodes/%s" % (api_url, node_id)
  requests.post(node_url, data=json.dumps(api_container), headers=headers, verify=False)

if __name__ == "__main__":
  main()
