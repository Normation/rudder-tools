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

# This script will generate reports and insert them in the database or via syslog

# This script is compatible Rudder 6.x
# As it cannot sign with certificates, it cannot use https, but still database insertion will work
# See inventory-generation/load-database.py  
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

# Use syslog rather than database
use_syslog = False
# if use the database, in case of Rudder 7, need to insert in reportsexecution
is_rudder_7 = True

# Select change only mode or full compliance - change only sends only non success reports
mode_full_compliance = True

# in 7.1, the format of Nodeconfiguration changed
is_rudder_7_1_or_later = True

# Proportion of repaired, error and non-compliant reports
# Betweeen 0 (no such reports) and 1 (only this type of reports)
repair_proportion = 0.05
error_proportion = 0.02
non_compliant_proportion = 0.01

# Proportion of poping last report run (to interleave agents runs)
last_run_frequency = 0.5

sleep_between_run=0.050



import psycopg2
import json
import random
import datetime
import sys
import syslog
from time import sleep


myConnection = psycopg2.connect( host=hostname, user=username, password=password, dbname=database )
cur = myConnection.cursor()

if use_syslog:
  syslog.openlog('rudder', syslog.LOG_PID, syslog.LOG_LOCAL6)

nodes = {}

# init the last runs object
lastruns = {}

def get_parsing_key(key):
  if is_rudder_7_1_or_later:
    return {
      'rules'           : 'rs',
      'directives'      : 'ds',
      'components'      : 'cs',
      'values'          : 'vs',
      'ruleId'          : 'rid',
      'directiveId'     : 'did',
      'componentName'   : 'vid',
      'policyMode'      : 'pm',
      'modes'           : 'ms',
      'mode'            : 'm',
      'globalPolicyMode': 'gpm',
      'nodePolicyMode'  : 'npm',
      'serial'          : 'reportId'
    }.get(key, 'error')
  else:
    return key

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
  
# from a line like [{'bid': 'Linux sshd ciphers', 'rl': 'weighted', 'scs': [{'vid': 'File key-value present', 'vs': [{'id': '6bac7b4e-742d-4250-bf15-21bc6c4a6eb1', 'v': '/etc/ssh/sshd_config'}]}, {'vid': 'Service restart', 'vs': [{'id': '56cf515b-7b32-412c-a243-18c98dcbf9b7', 'v': 'sshd'}]}]}]
# returns all the couple (vid, vs) that are within

return_values = []
def get_inner_block(entry_list):
  if isinstance(entry_list, list):
    for entry in entry_list:
      get_each_value_block(entry)
  else:
    get_each_value_block(entry_list)

def get_each_value_block(entry):
  if not (get_parsing_key('values') in entry):
    if 'scs' in entry:
      get_inner_block(entry['scs'])
  else:
      return_values.append(entry)


startTime = datetime.datetime.now()
nbReports = 0
formatedStartTime = startTime.strftime("%Y-%m-%dT%H:%M:%S+00:00")

cur.execute( "select nodeid, nodeconfigid, begindate, configuration from nodeconfigurations where enddate is null;")

for nodeid, config, begindate, configuration in cur.fetchall():
    # get deprecated nodeconfigid if exists
    nodeconfigid = nodes.get(nodeid, config)

    # We add a bit of randomness in the time, to mimic out of order behaviour caused by network latency
    skew = random.random()*60
    reportDate = (datetime.datetime.now()+datetime.timedelta(0, skew)).replace(microsecond=0)

    d = json.loads(configuration)

    globalAudit = d[get_parsing_key('modes')][get_parsing_key('globalPolicyMode')][get_parsing_key('mode')]
    nodeMode = d[get_parsing_key('modes')].get(get_parsing_key('nodePolicyMode'), 'enforce')
    resultingAudit = False
    if globalAudit == 'audit' or nodeMode == 'audit':
        resultingAudit = True

    for rules in d[get_parsing_key('rules')]:
        # We commit rule per rule, as in real world, reports are added one by one
        write = myConnection.cursor()

        for directives in rules[get_parsing_key('directives')]:
            audit = resultingAudit
            if get_parsing_key('policyMode') in directives.keys():
                if directives[get_parsing_key('policyMode')] == 'audit':
                    audit = True

            for components in directives[get_parsing_key('components')]:
                # in 7.1 we may have blocks here
                serial = 0
                if get_parsing_key('values') in components:
                  for tmpValue in components[get_parsing_key('values')]:
                    # in 7.1, the values is a list of unexpanded/expanded
                    if is_rudder_7_1_or_later:
                      if (isinstance(tmpValue, dict)):
                        value = tmpValue.get('v', 'None')
                        serial = tmpValue.get('id', '0')
                      else:
                        value = 'None'
                        serial = '0'
                    else:
                      value = tmpValue
                    # randomize the reports to have also error and repaired
                    randomValue = random.random()
                    if audit == False:
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

                    nbReports += 1
                    if mode_full_compliance == True or ( status != 'result_success' and status != 'audit_compliant' ): 
                      if use_syslog:
                        syslog_string = 'R: @@Test@@' + status + '@@' + rules[get_parsing_key('ruleId')] + '@@' + directives[get_parsing_key('directiveId')] + '@@' + serial + '@@'+ components['componentName'] + '@@' + value + '@@' + unicode(reportDate) + '+00:00##' + nodeid + '@#Dummy report for load test and make it a bit longer in case of, we never know what could trigger something\n'
                        syslog.syslog(syslog.LOG_INFO, syslog_string)
                      else:
                        write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, ' + get_parsing_key('serial') + ', component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (reportDate, nodeid, directives[get_parsing_key('directiveId')], rules[get_parsing_key('ruleId')],  serial, components[get_parsing_key('componentName')], value, reportDate, status, value, 'Dummy reports for load test'))
                      #print reportDate, nodeid, directives[get_parsing_key('directiveId')], rules[get_parsing_key('ruleId')],  '0', components[get_parsing_key('componentName')], value, reportDate, status, '', 'Dummy reports for load test'

                # this is a block
                else:
                  for block in components['scs']:
                    # block may contain only blocks
                    if not (get_parsing_key('values') in block):
                      return_values = []
                      get_inner_block(block)
                      inner_vs = return_values[]
                    else:
                      inner_vs = [block]
                    for cur_value in inner_vs:
                      # in 7.1, the values is a list of unexpanded/expanded
                      if is_rudder_7_1_or_later:
                        for tmpValue in cur_value[get_parsing_key('values')]:
                          if (isinstance(tmpValue, dict)):
                            value = tmpValue.get('v', 'None')
                            serial = tmpValue.get('id', '0')
                          else:
                            value = 'None'
                            serial = '0'
                      
                      comp_name = cur_value[get_parsing_key('componentName')]

                      # randomize the reports to have also error and repaired
                      randomValue = random.random()
                      if audit == False:
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

                      nbReports += 1
                      if mode_full_compliance == True or ( status != 'result_success' and status != 'audit_compliant' ): 
                        if use_syslog:
                          syslog_string = 'R: @@Test@@' + status + '@@' + rules[get_parsing_key('ruleId')] + '@@' + directives[get_parsing_key('directiveId')] + '@@' + serial + '@@'+ comp_name + '@@' + value + '@@' + unicode(reportDate) + '+00:00##' + nodeid + '@#Dummy report for load test and make it a bit longer in case of, we never know what could trigger something\n'
                          syslog.syslog(syslog.LOG_INFO, syslog_string)
                        else:
                          write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, ' + get_parsing_key('serial') + ', component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (reportDate, nodeid, directives[get_parsing_key('directiveId')], rules[get_parsing_key('ruleId')],  serial, comp_name, value, reportDate, status, value, 'Dummy reports for load test'))
                        #print reportDate, nodeid, directives[get_parsing_key('directiveId')], rules[get_parsing_key('ruleId')],  '0', components[get_parsing_key('componentName')], value, reportDate, status, '', 'Dummy reports for load test'

        # specific report for end of run
        if (directives[get_parsing_key('directiveId')].startswith('common-')) or (directives[get_parsing_key('directiveId')].startswith('dsc-common-')):
          lastruns[nodeid] = [nodeconfigid, reportDate, nodeid]
          # add a wait between each agent run
          sleep(sleep_between_run)

    # send end run
    randomValue = random.random()
    if (randomValue > (1 - last_run_frequency)):
      ending = lastruns.popitem()[1]
      if use_syslog:
         start_string =  'R: @@Common@@control@@rudder@@run@@0@@start@@' + ending[0] + '@@' + unicode(ending[1]) + '+00:00##' + ending[2] + '@#Start execution'
         syslog.syslog(syslog.LOG_INFO, start_string)
         syslog_string = 'R: @@Common@@control@@rudder@@run@@0@@end@@' + ending[0] + '@@' + unicode(ending[1]) + '+00:00##' + ending[2] + '@#End execution'
         syslog.syslog(syslog.LOG_INFO, syslog_string)
         
      else:
         write = myConnection.cursor()
         write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, ' + get_parsing_key('serial') + ', component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s) returning id', (ending[1], ending[2], 'run', 'rudder',  '0', 'start', ending[0], ending[1], 'control', '', 'Start execution'))
         insertionid = write.fetchone()[0]
         write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, ' + get_parsing_key('serial') + ', component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (ending[1], ending[2], 'run', 'rudder',  '0', 'end', ending[0], ending[1], 'control', '', 'End execution'))
         if is_rudder_7:
               write.execute('insert into reportsexecution(nodeid, date, nodeconfigid, insertionid) values (%s, %s, %s, %s)', (ending[2], ending[1], ending[0], insertionid))

         myConnection.commit()
         write.close()

# finally, send all remaining endruns
lastruns[nodeid] = [nodeconfigid, reportDate, nodeid]
for ending in lastruns.values():
      if use_syslog:
         start_string =  'R: @@Common@@control@@rudder@@run@@0@@start@@' + ending[0] + '@@' + unicode(ending[1]) + '+00:00##' + ending[2] + '@#Start execution'
         syslog.syslog(syslog.LOG_INFO, start_string)
         syslog_string = 'R: @@Common@@control@@rudder@@run@@0@@end@@' + ending[0] + '@@' + unicode(ending[1]) + '+00:00##' + ending[2] + '@#End execution'
         syslog.syslog(syslog.LOG_INFO, syslog_string)
      else:
         write = myConnection.cursor()
         write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, ' + get_parsing_key('serial') + ', component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s) returning id', (ending[1], ending[2], 'run', 'rudder',  '0', 'start', ending[0], ending[1], 'control', '', 'Start execution'))
         insertionid = write.fetchone()[0]
         write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, ' + get_parsing_key('serial') + ', component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (ending[1], ending[2], 'run', 'rudder',  '0', 'end', ending[0], ending[1], 'control', '', 'End execution'))
         if is_rudder_7:
               write.execute('insert into reportsexecution(nodeid, date, nodeconfigid, insertionid) values (%s, %s, %s, %s)', (ending[2], ending[1], ending[0], insertionid))
       #print reportDate, nodeid, directives['directiveId'], rules['ruleId'],  '0', 'common', 'EndRun', reportDate, 'log_info', 'common', 'End execution with config [' + nodeconfigid + ']'
         myConnection.commit()
         write.close()


cur.close()
myConnection.close()
if use_syslog:
  syslog.closelog()

duration = datetime.datetime.now() - startTime
print('Sent ', nbReports, ' reports in ', duration, ', finished at', datetime.datetime.now())
