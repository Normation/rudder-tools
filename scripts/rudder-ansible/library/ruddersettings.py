#!/usr/bin/python
# -*- coding: utf-8 -*-
# This file is part of Ansible
#
# Ansible is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Ansible is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Ansible.  If not, see <http://www.gnu.org/licenses/>.
#
# Copyright: (c) 2019, Rémi REY (@rrey)

from __future__ import absolute_import, division, print_function


DOCUMENTATION = '''
---
module: rudder_settings
author:
  - Karo
short_description: Configure Ldap setting via api calls
description:
  - 
options:
  name:
    description:
      - The name the parameter to modify.
    required: true
    type: str
  value:
    description:
      - The value defined to modify a given parameter name.
    required: true
    type: str

''' 

''' EXAMPLE = '''

'''
- name: Modify Ldap Settings
  rudder_settings:
      rudder_url: "https://rudder.example.com/rudder"
      rudder_token: "{{ token_value }}"
      name: "modified_file_ttl"
      value: "22"
'''

import json

from ansible.module_utils.basic import *
from ansible.module_utils.urls import fetch_url, basic_auth_header
__metaclass__ = type


class RudderLdapSettigsInterface(object):

    def __init__(self, module):
        self._module = module
        # {{{ Authentication header
        self.headers = {"Content-Type": "application/json"}
        self.headers = {"X-API-Token": module.params['rudder_token']}
        # }}} 
        self.rudder_url = module.params.get("rudder_url")
        self.validate_certs = module.params.get("validate_certs")

    def _send_request(self, url, data=None, headers=None, method="GET"):
        if data is not None:
            data = json.dumps(data, sort_keys=True)
        if not headers:
            headers = []

        full_url = "{rudder_url}{path}".format(rudder_url=self.rudder_url, path=url)
        resp, info = fetch_url(self._module, full_url, data=data, headers=headers, method=method)

        status_code = info["status"]
        if status_code == 404:
            return None
        elif status_code == 401:
            self._module.fail_json(failed=True, msg="Unauthorized to perform action '%s' on '%s'" % (method, full_url))
        elif status_code == 403:
            self._module.fail_json(failed=True, msg="Permission Denied")
        elif status_code == 200:
            return self._module.from_json(resp.read())
        else:
            self._module.fail_json(failed=True, msg="Rudder API answered with HTTP %d details: %s " % (status_code, info['msg']))
        
    def get_SettingValue(self, name):        
        url = "/api/latest/settings/{name}".format(name=name)
        response = self._send_request(url, headers=self.headers, method="GET")
        VALUE = response.get("data")
        return VALUE.get("settings").get(name)

    def Set_SettingValue(self, name, value):
        url ="/api/latest/settings/{name}?value={value}".format(name=name, value=value)
        response = self._send_request(url, headers=self.headers, method="POST")
        return response

def main():

    module_args = dict(
        name=dict(type='str', required=True),
        value=dict(required=True),
        rudder_url=dict(type='str', required=True),
        rudder_token=dict(type='str', required=True),
        validate_certs=dict(type='bool', default=False),

    )
    module = AnsibleModule(
        argument_spec={
        'rudder_url': {'type': 'str', 'required': True},
        'rudder_token': {'type': 'str', 'required': True},
        'name': {'type': 'str', 'required': True},
        'value': {'type': 'str', 'required': True},
        'validate_certs': {'type': 'bool', 'default': False},
        },
        supports_check_mode=False,
    )

    rudder_url = module.params['rudder_url']
    rudder_token = module.params['rudder_token']
    name = module.params['name']
    value = module.params['value']
    validate_certs = module.params['validate_certs']

    rudder_iface = RudderLdapSettigsInterface(module)
    VALUE = rudder_iface.get_SettingValue(name)
    ''' module.exit_json(failed=False, changed=True, message=VALUE) '''
  
    if str(VALUE) != value:
        rudder_iface.Set_SettingValue(name,value)
        changed = True
        module.exit_json(failed=False, changed=changed, message="changed succefully")
    else:
	rudder_iface.get_SettingValue(name)
        module.exit_json(failed=False, changed=True, ok=True, message="Already exist")

if __name__ == '__main__':
    main()

