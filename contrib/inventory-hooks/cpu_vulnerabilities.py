#!/bin/sh
# vim: syntax=python
''':'
# First try to run this script with python3, else run with python then python2
if command -v python3 >/dev/null 2>/dev/null; then
  exec python3 "$0" "$@"
elif command -v python >/dev/null 2>/dev/null; then
  exec python  "$0" "$@"
else
  exec python2 "$0" "$@"
fi
'''

""" Rudder inventory hook script to return information about known CPU vulnerabilities """

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

def parse_vuln_status(raw_text):
    """ Parses a CPU vulnerability entry """
    info = {}
    data = raw_text.rstrip()
    if MITIGATED.match(data):
        info["status"] = "mitigated"
    elif VULNERABLE.match(data):
        info["status"] = "vulnerable"
    elif NOT_AFFECTED.match(data):
        info["status"] = "not-affected"
    else:
        info["status"] = "unknown"
    # Additional information
    details = DETAILS.search(data)
    if details:
        info["details"] = details.group(2)
    return info

def list_vulns(vulns_dir):
    """ Lists known vulnerabilities """
    vulns = {}
    try:
        for vuln in os.listdir(vulns_dir):
            vuln_file = open(os.path.join(vulns_dir, vuln), 'r')
            data = vuln_file.read()
            vulns[vuln] = parse_vuln_status(data)
    except Exception as err:
        print(err)
        exit(1)
    return vulns

if __name__ == "__main__":
    # Add the property only if supported by kernel
    if os.path.isdir(VULN_DIR):
        PROPERTIES = {}
        PROPERTIES["cpu_vulnerabilities"] = list_vulns(VULN_DIR)
        json.dump(PROPERTIES, sys.stdout)
    else:
        print("{}")
