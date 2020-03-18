#!/usr/bin/python

# This script will generate reports and insert them in the database

# This script is compatible Rudder 4.3, 5.0 and more
# It function by reading all nodeconfigurations, and generating reports 
# with randomized timestamps 

from __future__ import print_function

import sys, os

# Get path from script
path_name = os.path.dirname(sys.argv[0])        
report_path = path_name + "/reports/"

## Configuration part
# Access to the database
hostname = 'localhost'
username = 'rudder'
password = 'Normation'
database = 'rudder'
port_database = 5432

# Use syslog rather than database
use_syslog = False
use_https  = True
send_reports_https = True # if true, will call the script to send inventory itself

# Proportion of repaired, error and non-compliant reports
# Betweeen 0 (no such reports) and 1 (only this type of reports)
repair_proportion = 0.05
error_proportion = 0.02
non_compliant_proportion = 0.01

# Proportion of poping last report run (to interleave agents runs)
last_run_frequency = 0.5

sleep_between_run=0.050


import os
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
    #d = configuration

    # Open the file if using HTTPS
    if use_https:
      try:
        os.mkdir(report_path+nodeid)
      except OSError, e:
        if e.errno != os.errno.EEXIST:
            raise
      formatted_date = reportDate.strftime("%Y-%m-%dT%H:%M:%S+00:00")
      report_file = open(report_path+nodeid+"/" + formatted_date + "@" + nodeid + ".log", "w")

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

                    nbReports += 1
                    report_string = 'R: @@Test@@' + status + '@@' + rules['ruleId'] + '@@' + directives['directiveId'] + '@@0@@'+ components['componentName'] + '@@' + value + '@@' + unicode(reportDate) + '+00:00##' + nodeid + '@#Dummy report for load test and make it a bit longer in case of, we never know what could trigger something\n'
                    if use_https:
                      report_file.write(formatedStartTime + ' ' +report_string)

                    if use_syslog:
                      syslog.syslog(syslog.LOG_INFO, report_string)

                    if (not use_syslog and not use_https):
                      write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, serial, component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (reportDate, nodeid, directives['directiveId'], rules['ruleId'],  '0', components['componentName'], value, reportDate, status, value, 'Dummy reports for load test'))
                    #print reportDate, nodeid, directives['directiveId'], rules['ruleId'],  '0', components['componentName'], value, reportDate, status, '', 'Dummy reports for load test'

        # specific report for end of run
        if (directives['directiveId'].startswith('common-')) or (directives['directiveId'].startswith('dsc-common-')):
          lastruns[nodeid] = [nodeconfigid, reportDate, nodeid]
          # add a wait between each agent run
          sleep(sleep_between_run)

    if (use_https):
      # always send last message with rest in https
      ending = lastruns.popitem()[1]
      report_string = formatedStartTime +' R: @@Common@@control@@rudder@@run@@0@@end@@' + ending[0] + '@@' + unicode(ending[1]) + '+00:00##' + ending[2] + '@#End execution\n'
      report_file.write(report_string)
      report_file.close()
      if (send_reports_https):
        os.system(os.path.dirname(os.path.realpath(__file__)) + '/sign-and-send-reports.sh -u ' + nodeid + ' -s ' + hostname)
    else:
      # send end run
      randomValue = random.random()
      if (randomValue > (1 - last_run_frequency)):
        ending = lastruns.popitem()[1]
        if use_syslog:
           syslog_string = 'R: @@Common@@control@@rudder@@run@@0@@end@@' + ending[0] + '@@' + unicode(ending[1]) + '+00:00##' + ending[2] + '@#End execution'
           syslog.syslog(syslog.LOG_INFO, syslog_string)
        else:
           write = myConnection.cursor()
           write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, serial, component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (ending[1], ending[2], 'run', 'rudder',  '0', 'end', ending[0], ending[1], 'control', '', 'End execution'))
       #print reportDate, nodeid, directives['directiveId'], rules['ruleId'],  '0', 'common', 'EndRun', reportDate, 'log_info', 'common', 'End execution with config [' + nodeconfigid + ']'
           myConnection.commit()
           write.close()

# finally, send all remaining endruns
lastruns[nodeid] = [nodeconfigid, reportDate, nodeid]
for ending in lastruns.values():
      if use_syslog:
         syslog_string = 'R: @@Common@@control@@rudder@@run@@0@@end@@' + ending[0] + '@@' + unicode(ending[1]) + '+00:00##' + ending[2] + '@#End execution'
         syslog.syslog(syslog.LOG_INFO, syslog_string)
      else:
         write = myConnection.cursor()
         write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, serial, component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (ending[1], ending[2], 'run', 'rudder',  '0', 'end', ending[0], ending[1], 'control', '', 'End execution'))
       #print reportDate, nodeid, directives['directiveId'], rules['ruleId'],  '0', 'common', 'EndRun', reportDate, 'log_info', 'common', 'End execution with config [' + nodeconfigid + ']'
         myConnection.commit()
         write.close()


cur.close()
myConnection.close()
if use_syslog:
  syslog.closelog()

duration = datetime.datetime.now() - startTime
print('Sent ', nbReports, ' reports in ', duration, ', finished at', datetime.datetime.now())
