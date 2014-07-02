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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#####################################################################################

set -e

# Avoid any environment pollution that may cause package installation to fail
export LANG=C LC_ALL=C

# AMI types
UBUNTU_1210_64=ami-34af5f43

## CONFIGURATION - BEGIN

# Don't forget to define EC2_ACCESS_KEY and EC2_SECRET_KEY in your environment

# eu-west-1, sa-east-1, us-east-1, ap-northeast-1, us-west-2, us-west-1, ap-southeast-1, ap-southeast-2
REGION_ID="us-east-1"

# Change this to a security group you have setup in EC2
SECURITY_GROUP="sg-d34db33f"

# AMI type, as present in "AMI types" in the previous section
IMAGE_ID=${UBUNTU_1210_64}

# Currently 3.75 GiB of RAM + 1 x 4 GB SSD, try m3.large for more RAM/disk space
INSTANCE_TYPE="m3.medium"

## CONFIGURATION - END

# Use a trap calling a function on error which stop the VM used.
trap on_exit EXIT

on_exit()
{
  EXIT_STATUS=$?
  if [ ${EXIT_STATUS} -ne 0 ]; then
    echo "ERROR: Creating the instance failed for some reason. Here is the output from the failed command:"
    cat ${TMPFILE}
  fi
  rm -f ${TMPFILE}
}

# Create a temporary directory to work on
TMPFILE=`mktemp`

# Compute the EC2 endpoint URL from the given region ID by default
# Prevents the euca2ools to fallback to ec2.amazonaws.com, which uses
# us-east-1 by default.
EC2_URL="https://ec2.${REGION_ID}.amazonaws.com"

# Get user data content
USER_DATA=`./generate-mime-message ssh-keys:cloud-config install-script.sh:x-shellscript`

# Make sure we have euca2ools
if ! euca-run-instances --version > /dev/null; then
  echo "Can't run euca-run-instances. Please install euca2ools (apt-get install euca2ools)"
  exit 1
fi

# Start a server
euca-run-instances --region ${REGION_ID} -t ${INSTANCE_TYPE} -g ${SECURITY_GROUP} --user-data "${USER_DATA}" ${IMAGE_ID} > "${TMPFILE}"
INSTANCE_ID=`grep INSTANCE "${TMPFILE}" | sed -r "s/^INSTANCE[\t ]*([a-z0-9-]+)[\t ]+.*$/\1/"`

# Weird bug
echo "INSTANCE_ID=${INSTANCE_ID}"
if [ "z${INSTANCE_ID}" == "z" ]; then
  exit 2
fi

# Print out instance info
echo "Instance started, ID is ${INSTANCE_ID}."
echo -n "Waiting for hostname to be available..."
FOUND=0
while [ ${FOUND} -ne 1 ]; do
  HOSTNAME=`euca-describe-instances --region ${REGION_ID} ${INSTANCE_ID} | grep "^INSTANCE" | cut -f4`
  if [ "z${HOSTNAME}" != "z" ]; then
    FOUND=1
    echo " OK!"
  else
    echo -n "."
    sleep 1
  fi
done

echo "You can now connect to it using:"
echo "ssh ubuntu@${HOSTNAME}"
echo "https://${HOSTNAME}"
