#!/usr/bin/env python


# Rudder API CLI Schnittstelle


import sys, json, requests
import pprint
import argparse
import ldap


nodes  = {}
groups = {}
group_categories = {}
hostnames  = []

#baseurl = 'https://localhost/rudder/api/latest'


token    = {}
url      = {}
head     = {}
ldaphost = {}
ldapuser = {}
ldappass = {}


ldaphost['source'] = "localhost"
ldapuser['source'] = "cn=manager,cn=rudder-configuration"
ldappass['source'] = "XXXXXXXXXXXXXXXXXXXX"


url['source']   = 'https://localhost/rudder/api/latest'
url['dest']     = 'https://target/rudder/api/latest'

token['source'] = "SOURCE_API_KEY"
token['dest']   = "DEST_API_KEY"

head['source'] = {
     "X-API-Token"  : token['source'],
}
head['dest'] = {
     "X-API-Token"  : token['dest'],
}


def get_all_directives(server):
	geturl = url[server] + '/directives'
	return get_request(server, geturl)['data']['directives']

def get_all_groups(server):
	geturl = url[server] + '/groups'
	return get_request(server, geturl)['data']['groups']

def get_all_rules(server):
	geturl = url[server] + '/rules'
	return get_request(server, geturl)['data']['rules']

def get_all_objecttype(server, type):
	geturl = url[server] + '/' + type
	return get_request(server, geturl)['data'][type]

def get_directive(server, id):
	geturl = url[server] + '/directives/' + id
	return get_request(server, geturl)['data']

def get_request(server, url, params = {}):
	return request(server, "GET", url, params)

def put_request(server, url, params={}, body={}):
	request(server, "PUT", url, params, body)

def post_request(server, url, params, body = {}):
	request(server, "POST", url, params, body)

def delete_request(server, url):
	request(server, "DELETE", url)

def request(server, method, url, params = {}, body = {}):
    try:
	#print "DEBUG: method=" , method , ", url=" , url , ", params=" , params
	
	# Sanitize booleans because Python's "True" is not supported
	# by Rudder's API which expects "true" (same for False/false)
	for key, value in params.iteritems():
		if isinstance(value, bool):
			params[key] = str(value).lower()

	for key, value in body.iteritems():
		if isinstance(value, bool):
			body[key] = str(value).lower()

        resp = requests.request(method, url=url, params=params, data=body, verify=False, headers=head[server])
    except requests.exceptions.RequestException as e:
      print e
      #sys.exit(1)
      return

    if resp.status_code != 200:
        print "HTTP Access error, HTTP Return code %d pushing data to API" % resp.status_code
	print "Method: ", method
	print "URL: ", url
        print "Params: ", params
	print "Body: ", body
        print "Error details:",
        pprint.pprint(resp)
        #sys.exit(1)

    j = json.loads(resp.text)
    if j.get('errorDetails'):
        print "API Error:", j['errorDetails']
        #sys.exit(1)
        return

    return resp.json()


def connect_ldap(server):
    try:
        l = ldap.open(ldaphost[server])
        l.protocol_version = ldap.VERSION3
        # Any errors will throw an ldap.LDAPError exception 
        # or related exception so you can ignore the result
        l.simple_bind(ldapuser[server], ldappass[server])
    except ldap.LDAPError, e:
        print e
        # handle error however you like
    return l



def search_ldap_info(server, cat_type):

    categories = {
        "techniques" : ( 
            "techniqueCategoryId=Active Techniques,ou=Rudder,cn=rudder-configuration", 
            "(objectClass=activeTechnique)" ),
        "groups"     : ( 
            "groupCategoryId=GroupRoot,ou=Rudder,cn=rudder-configuration", 
            "(&(objectClass=nodeGroup)(isSystem=FALSE))"),
            #"(objectClass=nodeGroup)"),
        "rules"      : (  
            "ruleCategoryId=rootRuleCategory,ou=Rudder,cn=rudder-configuration",
            "(objectClass=ruleCategory)"),
        }

    l = connect_ldap("source")
    searchScope = ldap.SCOPE_SUBTREE
    # None heisst "alles"
    retrieveAttributes = None
    
    try:
        ldap_result_id = l.search(categories[cat_type][0], searchScope, categories[cat_type][1], retrieveAttributes)
        result_set = []
        while 1:
                result_type, result_data = l.result(ldap_result_id, 0)
                if (result_data == []):
                        break
                else:
                        if result_type == ldap.RES_SEARCH_ENTRY:
                                result_set.append(result_data)
        return(result_set)
    except ldap.LDAPError, e:
        print e


def directive_create(server, directive):
	# @TODO: There is currently a bug in Rudder that prevents it
	# from handling JSON in the body of a HTTP PUT request to create
	# a Directive. This method should be rewritten once this is fixed.
	# See http://www.rudder-project.org/redmine/issues/5778

	# For now, we create the Directive without parameters,
	# then add them afterwards with a Directive update
	
	directive_create = directive
        parameters_json = json.dumps(directive['parameters'])
	del directive_create['parameters']

	put_request(server, url[server]+'/directives', directive_create)
	post_request(server, url[server]+'/directives/'+directive_create['id'], {'parameters': parameters_json })

def directive_update(server, directive):
	# @TODO: Implement this method.
	print "UPDATE directive: method not yet implemented!"
	
def directive_delete(server, directive_id):
	delete_request(server, url[server]+'/directives/'+directive_id)

def group_create(server, group):
	# Make a local copy
	group_create = group

	# We never include node IDs when creating a group
	del group_create['nodeIds']

	# The query string needs to be passed as a JSON string 
	# (not as a Python dict!)
        group_query_json = json.dumps(group['query'])
	group['query'] = group_query_json

        print group_create.keys()
	
	# @TODO: For now, we assign all groups to the root category.
	# We need to synchronize group categories too, once the Rudder
	# API allows this.
        cn = group_create['displayName']
        #print group_create['nodeGroupId']
        #print idmap_source['groups'].keys()
        #print idmap_source['groups'][u'%s' % cn]
	#group_create['nodeGroupCategory'] = cId
#+	group_create['nodeGroupCategory'] = "GroupRoot"
        
#        print group_categories.keys()
	group_create['nodeGroupCategory'] = group_categories[group_create['id']]

        #pprint.pprint(( group_create ))

	put_request(server, url[server]+'/groups', group_create)

def create_object(server, type, object):
	if type == 'directives':
		directive_create(server, object)
	elif type == 'groups':
		group_create(server, object)
	else:
		put_request(server, url[server]+'/'+type, object)

def update_object(server, type, object):
	print "TODO: implement update method!"
	#post_request(server, url[server]+'/'+type+'/'+object['id'], object)

def delete_object(server, type, object_id):
	delete_request(server, url[server]+'/'+type+'/'+object_id)

# @TODO: add parameters to sync

# Return a list of objects found in a but not in b
def find_missing_objects(a, b):
	missing_objects = []
	for a_object in a:
		# Check if this object exists in b
		exists = False
		for b_object in b:
			if a_object['id'] == b_object['id']:
				exists = True
				
		if not exists:
			missing_objects.append(a_object)
	return missing_objects



def get_group_catids(server): 

     d = search_ldap_info('source', "groups")

     for obj in d:
         ids = obj[0][0]
         dn = ids.split(",")
         cn = obj[0][1]['cn'][0]
         nodeGroupId = dn[0].split("=")[1]
         groupCategoryId = dn[1].split("=")[1]
         group_categories[nodeGroupId] = groupCategoryId
     


# Fetch a list of all objects from both servers
source = {}
dest = {} 
idmap_source = {}

for type in ['directives', 'groups', 'rules']:
	source[type]       = get_all_objecttype('source', type)
	dest[type]         = get_all_objecttype('dest', type)

get_group_catids('source')


# Step 1 of the sync: Sync all existing Directives, Groups, Rules from source and create/update in destination
for type in ['directives', 'groups', 'rules']:
	missing = find_missing_objects(source[type], dest[type])
	
	print "Found ", len(missing), " ", type, " missing from dest"

	for source_object in source[type]:

		# @TODO: We currently don't exclude system items, maybe we should

                # attempt to do that for groups:

                if type == "groups" and source_object['displayName'].startswith("All nodes managed by"):
                    continue

		if source_object in missing:
			print type + " ID " + source_object['id'] + " does not exist in destination, creating it..."
			create_object('dest', type, source_object)
		else:
			print type + " ID " + source_object['id'] + " already exists in destination, updating..."
			update_object('dest', type, source_object)


# Step 2 of the sync: Delete any Rules, Groups, Directives in destination that don't exist in source
for type in reversed(['directives', 'groups', 'rules']):
	missing = find_missing_objects(dest[type], source[type])
	print "Found ", len(missing), " extra ", type, " in dest"
	for dest_object in missing:
		print type + " ID " + dest_object['id'] + " should not exist in destination, deleting it..."
		delete_object('dest', type, dest_object['id'])


sys.exit(1)
for d in dest['directives']:
	# Check if this directive exists in source
	exists = False

	print "Checking if Directive ID " + d['id'] + " exists in source..."

	for source_d in source['directives']:
		if source_d['id'] == d['id']:
			exists = True
			break
			
	if not exists:
		print "Directive ID " + d['id'] + " doesn't exist in source (anymore?). Removing..."
		directive_delete("dest", d['id'])
