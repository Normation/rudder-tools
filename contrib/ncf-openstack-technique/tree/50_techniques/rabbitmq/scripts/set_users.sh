#!/bin/sh

data=${1}

rabbitmqctl="/usr/sbin/rabbitmqctl -q"
length=$((`echo ${data} | jq ". | length"`-1))
users=`${rabbitmqctl} list_users | cut -f1`

# Remove other users
for user in $users; do
  echo ${data} | jq -r ".[] | select(.username | contains(\"${user}\")) | .username" | grep ${user}
  if [ $? -eq 0 ]; then
    break
  else
    ${rabbitmqctl} delete_user ${user}
  fi
done;

# Add given users if necessary
for i in `seq 0 ${length}`; do
  username=`echo ${data} | jq -r ".[${i}] | .username"`
  password=`echo ${data} | jq -r ".[${i}] | .password"`
  ${rabbitmqctl} list_user_permissions ${username}
  if [ $? -eq 0 ]; then
    break
  else
    ${rabbitmqctl} add_user ${username} ${password}
    ${rabbitmqctl} set_permissions ${username} ".*" ".*" ".*"
  fi
done;