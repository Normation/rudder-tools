#!/usr/bin/python

# This script will generate reports and insert them in the database

# This script is compatible Rudder 4.0+
# It function by reading all nodeconfigurations, and generating reports 
# with randomized timestamps 

from __future__ import print_function


hostname = 'localhost'
username = 'rudder'
password = 'Normation'
database = 'rudder'
port_database = 5432

import psycopg2
import json
import datetime
import random

myConnection = psycopg2.connect( host=hostname, user=username, password=password, dbname=database, port=port_database )


cur = myConnection.cursor()
cur.execute( "select nodeid, nodeconfigid, begindate, configuration::json from nodeconfigurations where enddate is null;")

for nodeid, nodeconfigid, begindate, configuration in cur.fetchall():
    # We add a bit of randomness in the time, to mimic out of order behaviour caused by network latency
    skew = random.random()*60
    reportDate = (datetime.datetime.now()+datetime.timedelta(0, skew)).replace(microsecond=0)

    d = json.loads(configuration)
    for rules in d['rules']:
        # We commit rule per rule, as in real world, reports are added one by one
        write = myConnection.cursor()

        for directives in rules['directives']:
            for components in directives['components']:
                for value in components['values']:
                    # randomize the reports to have also error and repaired
                    randomValue = random.random()
                    if (randomValue > 0.97):
                      status = 'result_repaired'
                    elif (randomValue > 0.95):
                      status = 'result_error'
                    else:
                      status = 'result_success'

                    write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, serial, component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (reportDate, nodeid, directives['directiveId'], rules['ruleId'],  rules['serial'], components['componentName'], value, reportDate, status, '', 'Dummy reports for load test'))
                    #print(reportDate, nodeid, directives['directiveId'], rules['ruleId'],  rules['serial'], components['componentName'], value, reportDate, 'result_success', '', 'Dummy reports for load test')
        if directives['directiveId'].startswith('common-'):
            write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, serial, component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (reportDate, nodeid, directives['directiveId'], rules['ruleId'],  rules['serial'], 'common', 'EndRun', reportDate, 'log_info', '', 'End execution with config [' + nodeconfigid + ']'))
            #print reportDate, nodeid, directives['directiveId'], rules['ruleId'],  rules['serial'], 'common', 'EndRun', reportDate, 'log_info', 'common', 'End execution with config [' + nodeconfigid + ']'
        myConnection.commit()
        write.close()


cur.close()
myConnection.close()

