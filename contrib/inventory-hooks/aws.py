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

""" Rudder inventory hook script to return EC2 metadata """

import os.path
import json
from subprocess import run
import argparse
try:
    import requests
except:
    print("Install python-requests OR use python3")

# The following url for viewing all categories of instance metadata from within a running instance.
# The IP address 169.254.169.254 is a link-local address and is valid only from the instance.
METAURL = 'http://169.254.169.254/latest'

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
            uuid = run(['dmidecode', '--string', 'system-uuid'], capture_output=True).stdout.decode('utf-8').strip()
            uuid_start = uuid[0:3].lower()
            if debug: print("Got {output}, testing the first 3 chars: {start}".format(output=uuid, start=uuid_start))
            return uuid_start == "ec2"
    except:
        return False
    return requests.get(METAURL).status_code == 200

def load(debug):
    metadict = {'dynamic': {}, 'meta-data': {}}

    for subsect in metadict.keys():
        dataparse('{0}/{1}/'.format(METAURL, subsect), metadict[subsect])

    newdict = {}
    for key in metadict.keys():
        try:
            newdict['AWS-'+key] = metadict.get(key)
        except KeyError:
            pass

    return newdict

def dataparse(url,k):
    data = requests.get(url)
    if data.status_code == 404:
        return

    for key in data.text.split('\n'):
        if not key:
            continue

        if key in [ "rsa2048", "pkcs7", "signature", "security-credentials/", "user-data" ]:
            continue

        newurl = '{0}{1}'.format(url, key)

        if key.endswith('/'):
            newkey = key.split('/')[-2]
            k[newkey] = {}
            dataparse(newurl, k[newkey], )

        else:
            data = requests.get(newurl)
            if data.status_code != 404:
                try:
                    k[key] = json.loads(data.text)
                except ValueError:
                    k[key] = data.text
            else:
                k[key] = None

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
