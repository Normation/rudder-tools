#!/usr/bin/python

# This script will generate reports and insert them in the database

# This script is compatible Rudder 3.x
# It functions by reading all duplicating all root server reports
# so you may have some/a lot of unexpected given the difference between root
# and node config


from __future__ import print_function


hostname = 'localhost'
username = 'rudder'
password = 'Normation'
database = 'rudder'

import psycopg2
import json
import datetime
import random

myConnection = psycopg2.connect( host=hostname, user=username, password=password, dbname=database )


cur = myConnection.cursor()

nodes = {}
# Get all nodeid + nodeconfigid
cur.execute( "select node_id, config_ids from nodes_info where node_id != 'root';")
for nodeid, configs in cur.fetchall():
    dates = json.loads(configs)
    sorted_list = sorted(dates.items(), key=lambda tup: tup[1], reverse=True)
    nodes[nodeid] = sorted_list[0][0]



# Get all node root reports from last complete run
reports = list()
cur.execute("select directiveid, ruleid, serial, component, keyvalue, eventtype, policy from ruddersysevents R where nodeid = 'root' and executiontimestamp = (select max(date) from reportsexecution where nodeid = 'root' and  complete = 't');")
for directiveid, ruleid, serial, component, keyvalue, eventtype, policy in cur.fetchall():
    report = {}

    report['directiveid'] = directiveid
    report['ruleid'] = ruleid
    report['component'] = component
    report['serial'] = serial
    report['keyvalue'] = keyvalue
    report['eventtype'] = eventtype
    report['policy'] = policy
    reports.append(report)
cur.close()




for nodeid, nodeconfigid in nodes.items():
    # We add a bit of randomness in the time, to mimic out of order behaviour caused by network latency
    skew = random.random()*60
    reportDate = (datetime.datetime.now()+datetime.timedelta(0, skew)).replace(microsecond=0)


    for report in reports:
        # We commit rule per rule, as in real world, reports are added one by one
        write = myConnection.cursor()

        # randomize the reports to have also error and repaired
        randomValue = random.random()
        if (randomValue > 0.97):
           status = 'result_repaired'
        elif (randomValue > 0.95):
           status = 'result_error'
        else:
           status = report['eventtype']

        if (report['keyvalue'] == 'EndRun' and report['component'] == 'common' ):
           write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, serial, component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (reportDate, nodeid, report['directiveid'], report['ruleid'],  report['serial'], report['component'], report['keyvalue'], reportDate, report['eventtype'], '', 'End execution with config ['+nodeconfigid+']'))
           print(reportDate, nodeid, report['directiveid'], report['ruleid'],  report['serial'], report['component'], report['keyvalue'], reportDate, report['eventtype'], '', 'End execution with config ['+nodeconfigid+']')
        else:
           write.execute('insert into ruddersysevents(executiondate, nodeid, directiveid, ruleid, serial, component, keyvalue, executiontimestamp, eventtype, policy, msg) values (%s, %s, %s, %s, %s, %s, %s , %s , %s , %s, %s)', (reportDate, nodeid, report['directiveid'], report['ruleid'],  report['serial'], report['component'], report['keyvalue'], reportDate, status, '', 'Dummy reports for load test'))
           print(reportDate, nodeid, report['directiveid'], report['ruleid'],  report['serial'], report['component'], report['keyvalue'], reportDate, status, '', 'Dummy reports for load test')
        myConnection.commit()
        write.close()


myConnection.close()

