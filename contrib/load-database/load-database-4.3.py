#!/usr/bin/python

# This script will generate reports and insert them in the database

# This script is compatible Rudder 4.2 and more
# It function by reading all nodeconfigurations, and generating reports 
# with randomized timestamps 

from __future__ import print_function

## Configuration part
# Access to the database
hostname = 'localhost'
username = 'rudder'
password = 'Normation'
database = 'rudder'
port_database = 5432

# Proportion of repaired, error and non-compliant reports
# Betweeen 0 (no such reports) and 1 (only this type of reports)
repair_proportion = 0.3
error_proportion = 0.2
non_compliant_proportion = 0.1

import psycopg2
import json
import random
import datetime
import sys

myConnection = psycopg2.connect( host=hostname, user=username, password=password, dbname=database )
cur = myConnection.cursor()


nodes = {}


def init_table():
  print("Creating table oldconfig to store old config id")
  cur.execute("CREATE TABLE oldconfig (nodeid text NOT NULL CHECK (nodeId <> '') , nodeconfigid text NOT NULL );")
  myConnection.commit()
  exit(0)

def usage():
  sys.stderr.write("Can't parse parameters\n")
  print("Usage: load_database <command> [arguments]")
  print("Available commands:")
  print(" - init_table                      : initialize table to store node config ids")
  print(" - store_config_id <node_id_filter>: store in this table current node config ids, based on the regular expression node_id_filter (for instance ^[b|c].*[a]$ to match all node id starting by 'b' or 'c' and ending by 'a')")
  print(" - use_config_id                   : use the previously stored node config ids, to generated unexpected report ")
  exit(0)


def use_config_id():
  # get stored nodeid + nodeconfigid
  cur.execute( "select nodeid, nodeconfigid from oldconfig where nodeid != 'root';")
  for nodeid, configs in cur.fetchall():
      nodes[nodeid] = configs

def store_config_id(regex):
  print("Storing config ids in database")
  cur.execute( "select nodeid, nodeconfigid from nodeconfigurations where nodeid ~ '" + regex +"' and enddate is null")
  for nodeid, configs in cur.fetchall():
    write = myConnection.cursor()
    write.execute('update oldconfig set nodeconfigid = %s where nodeid = %s; insert into oldconfig (nodeid, nodeconfigid) select %s, %s where not exists (select 1 from oldconfig where nodeid = %s);', (configs, nodeid, nodeid, configs, nodeid))
    myConnection.commit()
    write.close()
  exit(0)

if len(sys.argv) > 1:
  if sys.argv[1] == "init_table":
    init_table()
  elif sys.argv[1] == "store_config_id":
    if len(sys.argv) == 2:
      usage()
      exit(1)
    else:
      store_config_id(sys.argv[2])
  elif sys.argv[1] == "use_config_id":
    use_config_id()
  else:
    usage()
  

cur.execute( "select nodeid, nodeconfigid, begindate, configuration from nodeconfigurations where enddate is null;")

for nodeid, config, begindate, configuration in cur.fetchall():
    # get deprecated nodeconfigid if exists
    nodeconfigid = nodes.get(nodeid, config)

    # We add a bit of randomness in the time, to mimic out of order behaviour caused by network latency
    skew = random.random()*60
    reportDate = (datetime.datetime.now()+datetime.timedelta(0, skew)).replace(microsecond=0)

    d = json.loads(configuration)
    #d = configuration

    for rules in d['rules']:
        # We commit rule per rule, as in real world, reports are added one by one
        write = myConnection.cursor()

        for directives in rules['directives']:
            audit = False
            if 'policyMode' in directives.keys():
                if directives['policyMode'] == 'audit':
                    audit = True

            for components in directives['components']:
                for value in components['values']:
                    # randomize the reports to have also error and repaired
                    randomValue = random.random()
                    if audit ==  False:
                        if (randomValue > (1 - repair_proportion)):
                          status = 'result_repaired'
                        elif (randomValue > (1 - repair_proportion - error_proportion)):
                          status = 'result_error'
                        else:
                          status = 'result_success'
                    else:
                        if (randomValue > (1-non_compliant_proportion)):
                            status = 'audit_noncompliant'
                        elif (randomValue > (1 - non_compliant_proportion - error_proportion)):
                            status = 'audit_error'
                        else:
                            status = 'audit_compliant'

                    write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, serial, component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (reportDate, nodeid, directives['directiveId'], rules['ruleId'],  '0', components['componentName'], value, reportDate, status, value, 'Dummy reports for load test'))
                    #print reportDate, nodeid, directives['directiveId'], rules['ruleId'],  '0', components['componentName'], value, reportDate, status, '', 'Dummy reports for load test'
        if directives['directiveId'].startswith('common-'):
            write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, serial, component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (reportDate, nodeid, 'run', 'rudder',  '0', 'end', nodeconfigid, reportDate, 'control', '', 'End execution'))
            #print reportDate, nodeid, directives['directiveId'], rules['ruleId'],  '0', 'common', 'EndRun', reportDate, 'log_info', 'common', 'End execution with config [' + nodeconfigid + ']'
        myConnection.commit()
        write.close()


cur.close()
myConnection.close()

