#!/bin/bash

#
# This script allows to forward non-compliance events to a slack channel (specified in "CHAN" name)
#

CHAN="%23rudder-compliance"
TOKEN=""
API="https://slack.com/api/chat.postMessage"
REGEX='^\[(?P<Date>[^\]]+)\] N: (?P<NodeUUID>[^ ]+) \[(?P<NodeFQDN>[^\]]+)\] S: \[(?P<Result>[^\]]+)\] R: (?P<RuleUUID>[^ ]+) \[(?P<RuleName>[^\]]+)\] D: (?P<DirectiveUUID>[^ ]+) \[(?P<DirectiveName>[^\]]+)\] T: (?P<TechniqueName>[^\/]+)\/(?P<TechniqueVersion>[^ ]+) C: \[(?P<ComponentName>[^\]]+)\] V: \[(?P<ComponentKey>[^\]]+)\] (?P<Message>.+)$'

LANG=C
urlencode() {
    local l=${#1}
    for (( i = 0 ; i < l ; i++ )); do
        local c=${1:i:1}
        case "$c" in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            ' ') printf + ;;
            *) printf '%%%.2X' "'$c"
        esac
    done
}

tail -F -n1 /var/log/rudder/compliance/non-compliant-reports.log |
  while read line
  do
    ruleid=$(echo "$line" | perl -pe "s/$REGEX/$+{RuleUUID}/")
    if [ "$ruleid" = "b51b6c20-6475-4345-81a4-cc4955ab0a8e" ]
    then
      text=$(echo "$line" | perl -pe "s/$REGEX/$+{NodeFQDN}: $+{Result} on \"$+{RuleName}\\/$+{DirectiveName}\\/$+{ComponentName}\\/$+{ComponentKey}\" \"$+{Message}\"/")
      node=$(echo $line | perl -pe "s/$REGEX/$+{NodeFQDN}/")
      echo $node
      echo $text

      # send to slack
      encoded_text=$(urlencode "$text")
      echo $encoded_text
      curl "$API?token=$TOKEN&channel=$CHAN&pretty=1&text=$encoded_text"
    fi
  done
