#!/usr/bin/python3

""" Rudder inventory hook script to return EC2 metadata """

import os.path
import json
import sys
from subprocess import Popen, PIPE
import argparse
from pprint import pprint
try:
    import requests
except:
    print("Install python-requests OR use python3")

# The following url for viewing all categories of instance metadata from within a running instance.
# The IP address 169.254.169.254 is a link-local address and is valid only from the instance.
METAURL = 'http://169.254.169.254/latest'


# ### Generic command handling ###

def run(command, check=False):
    proc = Popen(command, stdout=PIPE, stderr=PIPE)
    output, error = proc.communicate()
    error = error.decode('UTF-8')
    output = output.decode('UTF-8')
    return (proc.returncode, output, error)

def is_ec2(debug):
    # Not perfect
    # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/identify_ec2_instances.html
    try:
        pv_ami_uuid_path = "/sys/hypervisor/uuid"

        if os.path.exists(pv_ami_uuid_path):
            if debug: print("File {file} found".format(file=pv_ami_uuid_path))
            with open(pv_ami_uuid_path) as f:
                uuid_start = f.read(3).lower()
                if debug: print("Got {output}".format(output=uuid_start))
                return bool( uuid_start == "ec2")
        else:
            if debug: print("File {file} not found\nTrying dmidecode --string system-uuid....".format(file=pv_ami_uuid_path))
            (returnCode, uuid, err) = run(['dmidecode', '--string', 'system-uuid'])
            uuid_start = uuid[0:3].lower()
            if debug: print("Got {output}, testing the first 3 chars: {start}".format(output=uuid, start=uuid_start))
            return uuid_start == "ec2"
    except:
        return False
    return True

def aws_get(api, token):
    data = requests.get(METAURL+api, headers = { "X-aws-ec2-metadata-token": token })
    if data.status_code != 200:
        raise ValueError("AWS api error:" + data.reason + "\n When getting " + METAURL+api)
    return data.text

def aws_get_keys(base, items, token):
    result = {}
    for item in items:
        # it sometimes works without the split, it should always works with it
        path = item.split("=")[0]+"/openssh-key"
        data = aws_get(base + path, token)
        result[item] = data
    return result

def aws_get_all(base, items, token):
    result = {}
    for item in items:
        data = aws_get(base + item, token)
        # IMDSv2 doesn't tell what is a directory and what is a final entry, wild guess base on name's last char
        if item.endswith("/"):
            name = item[:-1]
            new_items = data.split("\n")
            # IMDSv2 uses a different scheme for public keys
            if name == "public-keys":
                result[name] = aws_get_keys(base + item, new_items, token)
            else:
                result[name] = aws_get_all(base + item, new_items, token)
        else:
            # IMDSv2 doesn't tell when a result is a string or json, wild guess by trying to convert and fallback in cas or error (80% are not json)
            try:
                value = json.loads(data)
            except:
                value = data
            result[item] = value
    return result

def get_token():
    data = requests.put(METAURL+"/api/token", headers={ "X-aws-ec2-metadata-token-ttl-seconds": "21600"})
    if data.status_code != 200:
        raise ValueError("Cannot get IMDSv2 token: " + data.reason)
    return data.text

def load(debug):
    token = get_token()
    if debug:
        print("Got token: "+token)
    result = aws_get_all("/", ["meta-data/", "dynamic/"], token)
    output = { "AWS-meta-data": result["meta-data"], "AWS-dynamic": result["dynamic"] }
    return output

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Retrieve the AWS data from the API and format them in JSON')
    parser.add_argument('--debug', help='print debug information', action='store_true')
    args = parser.parse_args()
    debug = args.debug
    if is_ec2(debug):
      if debug: print("The machine is an ec2 instance")
      print(json.dumps(load(debug)))
    else:
      if debug: print("The machine is NOT an ec2 instance")
      print("{}")

