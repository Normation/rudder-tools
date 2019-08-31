#!/bin/bash
# @description Sign and send reports to the rudder server


# @man +
# @man *Options*:
# @man +
# @man *-u --uuid*: uuid of the node
# @man +
# @man *-s --server*: server id or hostname
# @man +
# @man *-k --keep*: do not clean file after sending it
# @man +
# @man *-a --all*: send all reports

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -e
CLEAN=true
DATA_PATH=$DIR/data
REPORTS_PATH=$DIR/reports
SERVER=""
UUID=""
ALL_INVENTORIES=false
NB_REPORT_SENT=0

echo -n "Starting script to send reports "
date

# Private key passphrase
PASSPHRASE="Cfengine passphrase"

# detect if any option has been passed to the script
ANY_OPTION_DEFINED=false

# Defines available options
OPTIONS=u:s:k:a
LONGOPTS=uuid:,server:,keep:,all

# Use ! to avoid failing with set -e
# Use $PIPESTATUS to get the right return code even with !
! PARSED=$(getopt --options=$OPTIONS --longoptions=$LONGOPTS --name "$0" -- "$@")

if [[ ${PIPESTATUS[0]} -ne 0 ]]; then
    # Wrong arguments 
    echo "Wrong parameters for command inventory-generation"
    usage
    exit 1
fi

eval set -- "$PARSED"


while true; do
  case "$1" in
    -u|--uuid)
      UUID="$2"
      ANY_OPTION_DEFINED=true
      shift 2
      ;;
    -s|--server)
      SERVER="$2"
      ANY_OPTION_DEFINED=true
      shift 2
      ;;
    -k |--keep)
      CLEAN=false
      ANY_OPTION_DEFINED=true
      shift
      ;;
    -a |--all)
      ALL_INVENTORIES=true
      ANY_OPTION_DEFINED=true
      shift
      ;;
    --)
      shift
      break
      ;;
    *)
      echo "Programming error - option not correctly handled"
      exit 2
      ;;
  esac
done

# No option given, need to show usage
if [ "${ANY_OPTION_DEFINED}" = "false" ]
then
  usage
  exit 1
fi

function compress_and_sign {
  CURRENT_NODE=$1
  SOURCE_FILE=$(ls -C1 ${REPORTS_PATH}/${CURRENT_NODE}/*.log | head -n 1)


  if [ ! -f ${SOURCE_FILE} ]
  then
    echo "Reports file ${SOURCE_FILE} doesn't exist"
    #exit 1;
  fi

  if [ ! -f ${DATA_PATH}/${CURRENT_NODE}/agent.cert ]
  then
    echo "Agent certificate ${DATA_PATH}/${CURRENT_NODE}/agent.cert doesn't exist"
    #exit 1;

  else  


    openssl smime -sign -text -nocerts -signer "${DATA_PATH}/${CURRENT_NODE}/agent.cert" -inkey "${DATA_PATH}/${CURRENT_NODE}/localhost.priv" -passin "pass:${PASSPHRASE}" \
        -in "${SOURCE_FILE}" -out "${SOURCE_FILE}.signed" || true

    gzip -f "${SOURCE_FILE}.signed" 

    mv "${SOURCE_FILE}.signed.gz" "${SOURCE_FILE}.gz"

    curl --tlsv1.2 -k -s  --fail  --proxy '' --user "rudder:rudder" --upload-file "${SOURCE_FILE}.gz" https://${SERVER}/reports/

    if [ ${?} -eq 0 ]
    then
      NB_REPORT_SENT=$((NB_REPORT_SENT+1))
      if [ "${CLEAN}" = "true" ]
      then
        rm -rf "${REPORTS_PATH}/${CURRENT_NODE}/*"
      fi
    fi
  fi
}

}

# if we want to send all inventories, iterate over all available folders
if [ "${ALL_INVENTORIES}" = "true" ]
then
  #find $REPORTS_PATH/*/ -prune -type d | xargs -P 5 -n 1 -i wrap_compress_call {}
  NB_THREAD=0

  for reportdir in $REPORTS_PATH/*/
  do
    # remove trailing /
    reportdir=${reportdir%*/}
    UUID=${reportdir##*/}
    compress_and_sign ${UUID} &
    NB_THREAD=$((NB_THREAD+1))
    if [ 4 -lt $NB_THREAD ]
    then
      wait
      NB_THREAD=0
    fi
  done
else
  compress_and_sign ${UUID}
fi

echo -n "Sent  $NB_REPORT_SENT reports "
date
