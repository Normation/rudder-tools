#!/bin/bash
#####################################################################################
# Copyright 2013 Normation SAS
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

# This script will permit to merge each code of a branch to the upper ones.
# If the merge can not be done, a message will explain at which step the script has failed.

# Set up the repos that will have to be handled

export OPENSOURCE_REPOS="rudder-techniques rudder-packages rudder rudder-plugin-helloworld rudder-parent-pom rudder-commons ldap-inventory scala-ldap cf-clerk rudder-doc"
export PROPRIETARY_REPOS="packaging"
export TEMPDIR=`mktemp -d`
export FINAL_REPORT="Hello, this is the automatic repository merging script here.\n\n"
export EMAIL_RECIPIENT="rudder@normation.com"

export ERROR_SPOTTED=0

# Parameters:
#	${1} : Repository name
#	${2} : Error type

function report_error {

	REPO_NAME=${1}
	ERROR_NAME=${2}

	export FINAL_REPORT="${FINAL_REPORT}Repository ${REPO_NAME}: ${ERROR_NAME} failure\n"
	export ERROR_SPOTTED=1
}

echo "Automatic merge engaged at $(date +%T). Now cloning the following repos in $TEMPDIR:"
echo ""
echo "Open source: $OPENSOURCE_REPOS"
echo "Proprietary: $PROPRIETARY_REPOS"
echo ""
echo "Here we go !!!"
echo ""

for i in $OPENSOURCE_REPOS $PROPRIETARY_REPOS
do

	cd $TEMPDIR
	# Define the right clone URL according to the repo type
	CLONE_URL="git@github.com:Normation/$i.git"

	for repo in ${PROPRIETARY_REPOS}
	do
		if [ "z${i}" = "z${repo}" ]; then
			CLONE_URL="ssh://git@git.normation.com:5190/$i.git"
		fi
	done

	git clone ${CLONE_URL} >/dev/null 2>&1
	if [ $? -ne 0 ]; then report_error ${i} "Clone"; continue; fi

	# Then merge branch 2.6 with branch 2.7
	cd ${TEMPDIR}/${i}
	git checkout branches/rudder/2.6 >/dev/null 2>&1 && git pull >/dev/null 2>&1 && git checkout branches/rudder/2.7 >/dev/null 2>&1 && git pull >/dev/null 2>&1
	if [ $? -ne 0 ]; then report_error ${i} "Checkout/Pull"; continue; fi

	git merge --ff-only --log branches/rudder/2.6 >/dev/null 2>&1
	if [ $? -ne 0 ]; then report_error ${i} "Merge 2.6 -> 2.7"; continue; fi

	git push
	if [ $? -ne 0 ]; then report_error ${i} "Push"; continue; fi

	# Then merge branch 2.7 with branch 2.8
	cd ${TEMPDIR}/${i}
	git checkout branches/rudder/2.7 >/dev/null 2>&1 && git pull >/dev/null 2>&1 && git checkout branches/rudder/2.8 >/dev/null 2>&1 && git pull >/dev/null 2>&1
	if [ $? -ne 0 ]; then report_error ${i} "Checkout/Pull"; continue; fi

	git merge --ff-only --log branches/rudder/2.7 >/dev/null 2>&1
	if [ $? -ne 0 ]; then report_error ${i} "Merge 2.7 -> 2.8"; continue; fi

	git push
	if [ $? -ne 0 ]; then report_error ${i} "Push"; continue; fi

	# Then merge branch 2.8 with branch 2.9
	cd ${TEMPDIR}/${i}
	git checkout branches/rudder/2.8 >/dev/null 2>&1 && git pull >/dev/null 2>&1 && git checkout branches/rudder/2.9 >/dev/null 2>&1 && git pull >/dev/null 2>&1
	if [ $? -ne 0 ]; then report_error ${i} "Checkout/Pull"; continue; fi

	git merge --ff-only --log branches/rudder/2.8 >/dev/null 2>&1
	if [ $? -ne 0 ]; then report_error ${i} "Merge 2.8 -> 2.9"; continue; fi

	git push
	if [ $? -ne 0 ]; then report_error ${i} "Push"; continue; fi

	# Then merge branch 2.9 with branch master
	cd ${TEMPDIR}/${i}
	git checkout branches/rudder/2.9 >/dev/null 2>&1 && git pull >/dev/null 2>&1 && git checkout master >/dev/null 2>&1 && git pull >/dev/null 2>&1
	if [ $? -ne 0 ]; then report_error ${i} "Checkout/Pull"; continue; fi

	git merge --ff-only --log branches/rudder/2.9 >/dev/null 2>&1
	if [ $? -ne 0 ]; then report_error ${i} "Merge 2.9 -> master"; continue; fi

	git push
	if [ $? -ne 0 ]; then report_error ${i} "Push"; continue; fi

done

cd /tmp && rm -rf $TEMPDIR

FINAL_REPORT="${FINAL_REPORT}\nYou may want to resolve the conflicts manually.\n\nSorry, bye."

if [ "${ERROR_SPOTTED}" -ne 0 ]
then
	/bin/echo -e "${FINAL_REPORT}" |mail -s "Automatic merging script on $(hostname --fqdn)" "${EMAIL_RECIPIENT}" -- -f noreply@normation.com
fi

echo ""
echo "Automatic merge completed at $(date +%T)."
