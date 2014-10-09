#!/bin/bash

#####################################################################################
# Copyright 2014 Normation SAS
#####################################################################################
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, Version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
#####################################################################################



#
# Goal:
# -----
# This tool allows to display some interstings stats
# about the use of Rudder regarding database usage.
# Display the number of directive compoenents,
# directives, rules, nodes, reports by day,
# postgres database size...
#

#
# Usage:
# ------
# just chmod+ +x the script and execute it on a rudder server.
#



echo -n "Number of expected reports (components*directives*nodes): "
psql -U rudder -h localhost -t -c "select sum(nbnodes* cardinality) from (select count(nodeid) as nbnodes, pkid, cardinality from expectedreports exp join expectedreportsnodes nodes on exp.nodejoinkey = nodes.nodejoinkey where enddate is null group by pkid, cardinality) as T;"

echo -n "Number of rules: "
psql -U rudder -h localhost -t -c "select count(distinct(ruleid)) from expectedreports where enddate is null;"

echo -n "Number of directives: "
psql -U rudder -h localhost -t -c "select count(distinct(directiveid)) from expectedreports where enddate is null;"

echo -n "Number of nodes: "
psql -U rudder -h localhost -t -c "select count(*) from nodes where endtime is null;"

echo -n "Number of reports for one day: "
psql -U rudder -h localhost -t -c "select count(*) from ruddersysevents where executiontimestamp >= (now() - interval '1 day');"

echo -n "Report database size: "
psql -U rudder -h localhost -t -c "select pg_size_pretty(pg_total_relation_size('ruddersysevents')) as size;"

echo -n "Number of lines in reports table: "
psql -U rudder -h localhost -t -c "select reltuples from pg_class where relname = 'ruddersysevents';"

echo -n "Full database size: "
psql -U rudder -h localhost -t -c "select pg_size_pretty(pg_catalog.pg_database_size('rudder'));"

echo "Configuration for report archiving: "
cat /opt/rudder/etc/rudder-web.properties | grep "rudder.batch.reportscleaner" | sed -e "s/rudder.batch.reportscleaner./ /"


