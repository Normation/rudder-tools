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

export REPOS="rudder-techniques rudder-packages rudder rudder-plugin-helloworld rudder-parent-pom rudder-commons ldap-inventory scala-ldap cf-clerk rudder-doc packaging"
export TEMPDIR=`mktemp -d`
export FINAL_REPORT="Hello, this is the automatic repository merging script here.\n\n"
export EMAIL_RECIPIENT="rudder@normation.com"

export ERROR_SPOTTED=0

# Parameters:
#  ${1} : Repository name
#  ${2} : Error type

function report_error {

  REPO_NAME=${1}
  ERROR_NAME=${2}

  export FINAL_REPORT="${FINAL_REPORT}Repository ${REPO_NAME}: ${ERROR_NAME} failure\n"
  export ERROR_SPOTTED=1
}

# merge_repo() will merge a SRC_BRANCH_NAME into TARGET_BRANCH_NAME
# Parameters:
#  REPO_PATH:          Repository to be merged
#  SRC_BRANCH_NAME:    Name of lower branch to be merged (i.e '2.10')
#  TARGET_BRANCH_NAME: Name of higher branch to merge (i.e '2.11')
function merge_repo {
  # Set variables for function which will determine the complete name of branch
  local SRC_BRANCH=branches/rudder/${SRC_BRANCH_NAME}
  if [ "z${TARGET_BRANCH_NAME}" != "zmaster" ];then
    local TARGET_BRANCH=branches/rudder/${TARGET_BRANCH_NAME}
  else
    local TARGET_BRANCH=${TARGET_BRANCH_NAME}
  fi

  echo "REPO_PATH:          ${REPO_PATH}"
  echo "SRC_BRANCH_NAME:    ${SRC_BRANCH_NAME}"
  echo "SRC_BRANCH:         ${SRC_BRANCH}"
  echo "TARGET_BRANCH_NAME: ${TARGET_BRANCH_NAME}"
  echo "TARGET_BRANCH:      ${TARGET_BRANCH}"

  # Update both branches
  cd ${REPO_PATH}
  git checkout ${SRC_BRANCH} >/dev/null 2>&1 && git pull >/dev/null 2>&1 && git checkout ${TARGET_BRANCH} >/dev/null 2>&1 && git pull >/dev/null 2>&1
  if [ $? -ne 0 ]; then report_error ${i} "Checkout/Pull"; continue; fi

  # Merge with fast-forward the lower branch into the higher branch
  git merge --ff-only --log ${SRC_BRANCH} >/dev/null 2>&1
  if [ $? -ne 0 ]; then report_error ${i} "Merge ${SRC_BRANCH_NAME} -> ${TARGET_BRANCH_NAME}"; continue; fi

  # Then push the result
  git push
  if [ $? -ne 0 ]; then report_error ${i} "Push"; continue; fi
}

echo "Automatic merge engaged at $(date +%T). Now cloning the following repos in $TEMPDIR:"
echo ""
echo "Repositories: $REPOS"
echo ""
echo "Here we go !!!"
echo ""

# For each repositories, do merge of each branches
for i in $REPOS
do

  cd $TEMPDIR
  # Get repository to merge
  git clone git@github.com:Normation/$i.git >/dev/null 2>&1
  if [ $? -ne 0 ]; then report_error ${i} "Clone"; continue; fi
  REPO_PATH="${TEMPDIR}/${i}"

  # Then merge branch 2.6 with branch 2.10
  SRC_BRANCH_NAME="2.6"
  TARGET_BRANCH_NAME="2.10"
  merge_repo

  # Then merge branch 2.10 with branch 2.11
  SRC_BRANCH_NAME="2.10"
  TARGET_BRANCH_NAME="2.11"
  merge_repo

  # Then merge branch 2.11 with branch master
  SRC_BRANCH_NAME="2.11"
  TARGET_BRANCH_NAME="master"
  merge_repo

done

cd /tmp && rm -rf $TEMPDIR

FINAL_REPORT="${FINAL_REPORT}\nYou may want to resolve the conflicts manually.\n\nSorry, bye."

if [ "${ERROR_SPOTTED}" -ne 0 ]
then
  /bin/echo -e "${FINAL_REPORT}" |mail -s "Automatic merging script on $(hostname --fqdn)" "${EMAIL_RECIPIENT}" -- -f noreply@normation.com
fi

echo ""
echo "Automatic merge completed at $(date +%T)."
