#!/bin/bash
#
# Name:        rudder-archive.sh
# Description: Create and get latest Rudder archive
# Author       Dennis Cabooter <Dennis.Cabooter@snow.nl>
#

# Global vars
API_URL="https://localhost/rudder/api"
DESTINATION="/var/backups/rudder"
ARCHIVE=`date +"rudder-conf-all-%Y-%m-%dT%H%M%S.zip"`
MTIME="+30"

# Create and get latest archive
curl -s -k -X GET ${API_URL}/archives/zip/all/HEAD > \
  ${DESTINATION}/${ARCHIVE}

# Delete files older than x days
find $DESTINATION -mtime $MTIME -exec rm -f {} \;
