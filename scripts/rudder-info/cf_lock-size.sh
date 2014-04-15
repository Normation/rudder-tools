#!/bin/bash 

# That script monitor the size of the file cf_lock.tcdb and look for its growth rate
# The result is put in /tmp/cflock_res
# Thanks to Olivier Mauras for the base command https://www.rudder-project.org/redmine/issues/4752

for i in $(seq 0 60)
do
  DATE="$(date '+%D %r')"
  SIZE="$(ls -sh /var/rudder/cfengine-community/state/cf_lock.tcdb)"
  echo "${DATE}: ${SIZE}" >> /tmp/cflock_res
  sleep 300
done
