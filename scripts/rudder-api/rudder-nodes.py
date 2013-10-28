#!/usr/bin/env python
#
# Name:         rudder-nodes.py 
# Synopsis:     Get node details from Rudder api to spreadsheet
# Requirements: xlwt Python module
# Author:       Dennis Cabooter <Dennis.Cabooter@snow.nl>
#

# Imports
import requests
import json
import xlwt
import subprocess

# Global vars
api_url = "http://rudder.example.com/rudder/api"  # CHANGE THIS
api_version = 2
api_token = ""                                    # CHANGE THIS
node_url = "%s/%s/nodes" % (api_url, api_version)
headers = {"X-API-Token": api_token}  
workbook = "/tmp/test.xls"

# Call API
r = requests.get(node_url, headers=headers)

# Parse JSON
j = json.loads(r.content)

# Define nodes
nodes = j["data"]["nodes"]

# Initialize Workbook object 
wbk = xlwt.Workbook()

# Add Worksheet object to Workbook
sheet = wbk.add_sheet("Rudder nodes")

# Set style to bold
style = xlwt.easyxf("font: bold on")

# Write headers
headers = {"Node", "Node id", "Operating system" , "Machine type"}

for index, header in enumerate(headers):
  # Indexing is zero based, row then column
  sheet.write(0, index, header, style)

# Row counter
row = 1

# Loop nodes
for node in sorted(nodes):
  # Vars
  host_name = node["hostname"]
  node_id = node["id"]
  oper_sys = node["osName"] + " " + node["osVersion"]
  mach_type = node["machyneType"]

  # Indexing is zero based, row then column
  sheet.write(row, 0, host_name)
  sheet.write(row, 1, node_id)
  sheet.write(row, 2, oper_sys)
  sheet.write(row, 3, mach_type)

  # Increase row counter
  row += 1

# Save Workbook
wbk.save(workbook)

# Execute libreoffice
subprocess.call(["libreoffice", "--minimized", workbook])
