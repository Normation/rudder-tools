#!/usr/bin/python
""" Rudder inventory hook script to return EC2 metadata """

import os.path
import json
try:
    import requests
except: 
    print("Install python-requests OR use python3")

# The following url for viewing all categories of instance metadata from within a running instance.
# The IP address 169.254.169.254 is a link-local address and is valid only from the instance.
METAURL = 'http://169.254.169.254/latest'

def is_ec2():
    # Not perfect
    # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/identify_ec2_instances.html
    with open("/sys/hypervisor/uuid") as f:
        if f.read(3).lower() != "ec2":
            return False
    return requests.get(METAURL).status_code == 200

def load():
    metadict = {'dynamic': {}, 'meta-data': {}}

    for subsect in metadict.keys():
        dataparse('{0}/{1}/'.format(METAURL, subsect), metadict[subsect])

    newdict = metadict
    for key in newdict.keys():
        try:
            newdict['AWS-'+key] = newdict.pop(key)
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
    if is_ec2():
      print(json.dumps(load()))
    else:
      print("{}")
