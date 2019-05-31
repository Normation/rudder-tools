#!/usr/bin/python

import re
import os
import json
import sys

# Syntax is documented in
# https://github.com/torvalds/linux/blob/2f4c53349961c8ca480193e47da4d44fdb8335a8/Documentation/ABI/testing/sysfs-devices-system-cpu#L481

# Details about (some) vulnerabilities
# https://github.com/torvalds/linux/tree/master/Documentation/admin-guide/hw-vuln

MITIGATED = re.compile("^Mitigation") 
VULNERABLE = re.compile("^Vulnerable")
NOT_AFFECTED = re.compile("^Not affected")
DETAILS = re.compile("(Mitigation|Vulnerable): (.*)$")

VULN_DIR = "/sys/devices/system/cpu/vulnerabilities"

output = {}
output["cpu_vulnerabilities"] = {}

try:
    vulns = os.listdir(VULN_DIR)
except:
    # Not supported on current kernel
    exit(0)

for vuln in vulns:
    with open(os.path.join(VULN_DIR, vuln), 'r') as vuln_file:
        info = {}
        data = vuln_file.read()
        data = data.rstrip()
        if MITIGATED.match(data):
            info["status"] = "mitigated"
        elif VULNERABLE.match(data):
            info["status"] = "vulnerable"
        elif NOT_AFFECTED.match(data):
            info["status"] = "not-affected"
        else:
            info["status"] = "unknown"
        # Additionnal information
        details = DETAILS.search(data)
        if details:
            info["details"] = details.group(2)
        output["cpu_vulnerabilities"][vuln] = info

json.dump(output, sys.stdout)
