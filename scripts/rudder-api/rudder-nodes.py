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
api_url = "http://rudder.example.com/rudder/api"
api_version = 2
api_token = ""
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

# Initialize a style
style = xlwt.XFStyle()

# Create a font to use with the style
font = xlwt.Font()
font.bold = True

# Set the style's font to this new one you set up
style.font = font

# Indexing is zero based, row then column
sheet.write(0, 0, "Node", style)
sheet.write(0, 1, "Node id", style)
sheet.write(0, 2, "Operating system", style)
sheet.write(0, 3, "Machine type", style)

# Row counter
row = 1

# Loop nodes
for node in sorted(nodes):
  #print node

  # indexing is zero based, row then column
  sheet.write(row, 0, node["hostname"])
  sheet.write(row, 1, node["id"])
  sheet.write(row, 2, node["osName"] + " " + node["osVersion"])
  sheet.write(row, 3, node["machyneType"])

  # Increase row counter
  row += 1
  
# Save Workbook
wbk.save(workbook)

# Execute libreoffice
subprocess.call(["libreoffice", "--minimized", workbook])
