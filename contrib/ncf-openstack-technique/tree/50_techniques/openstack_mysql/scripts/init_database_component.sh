#!/bin/sh

data=${1}

length=$((`echo ${data} | jq ".users | length"`-1))

for i in `seq 0 ${length}`; do
  root_password=`echo ${data} | jq -r ".root_password"`
  database=`echo ${data} | jq -r ".users | .[${i}] | .database"`
  username=`echo ${data} | jq -r ".users | .[${i}] | .username"`
  password=`echo ${data} | jq -r ".users | .[${i}] | .password"`
  host=`echo ${data} | jq -r ".users | .[${i}] | .host"`
  
  mysql -u root -p"${root_password}" -e "CREATE DATABASE IF NOT EXISTS ${database};
  GRANT ALL PRIVILEGES ON ${database}.* TO '${username}'@'${host}' IDENTIFIED BY '${password}';"
done;

mysql -u root -p"${root_password}" -e "FLUSH PRIVILEGES;"