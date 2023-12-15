#!/bin/bash

# - List all system and user crons
# - Format them in a common standard cron format
# - Put them in a JSON array
# - Display them in a format suitable for invenytory extension

all_entries=$( (
# extract user crontab
for user in $(ls -1 /var/spool/cron/crontabs)
do
    # reformat with user in the right place
    perl -pe 's/(.*?\s+.*?\s+.*?\s+.*?\s+.*?\s+)(.*)/$1'${user}' $2/' /var/spool/cron/crontabs/${user}
done
# extract system crontabs
cat /etc/cron.d/*
# extract daily ... crontabs
hourly=$(run-parts --list /etc/cron.hourly | xargs printf "%s;")
daily=$(run-parts --list /etc/cron.daily | xargs printf "%s;")
weekly=$(run-parts --list /etc/cron.weekly | xargs printf "%s;")
monthly=$(run-parts --list /etc/cron.monthly | xargs printf "%s;")
# replace in /etc/crotabs
perl -pe 's|(.*)run-parts --report /etc/cron.hourly(.*)|$1'$hourly'$2|' /etc/crontab |
    perl -pe 's|(.*)run-parts --report /etc/cron.daily(.*)|$1'$daily'$2|' |
    perl -pe 's|(.*)run-parts --report /etc/cron.weekly(.*)|$1'$weekly'$2|' |
    perl -pe 's|(.*)run-parts --report /etc/cron.monthly(.*)|$1'$monthly'$2|'
# exclude empty entries and reformat to json
) | grep -v '^#' | grep -v "^$" | grep -v '^[A-Z]\+=' | tr '\t' ' ' | perl -pe 's/\\/\\\\/g'  | perl -pe 's/"/\\"/g'  | sed 's/.*/,"\0"/' )

printf '{ "crons" : [ %s ]}\n' "${all_entries:1}"


