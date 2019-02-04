!#/bin/bash

#
# This script allows to update rudder old layout to the new one
# and to merge all scala projects into new subdirectories of rudder 
# repository. 
# The script will clone a fresh new "rudder" repos, and for each
# branch (4.1, 4.3, 5.0, master), it will:
# - change directory layout to create webapp/sources/
# - move existing rudder webapp sources into webapp/sources/rudder
# - then, for each scala project, it will import the corresponding
#   source code in the corresponding webapp/sources/${PROJECT}, 
#   keeping the history of the remote project, 
# And finally, it will clean-up the upmerge. 
# 



BASE="$( cd "$( dirname "$0" )" && pwd )"

REPOS="git@github.com:Normation"
# local repos to speed up the feedback loop
#REPOS="${BASE}/local-repos"

set -e -x

#
# Function which merges an other repository branch into a subdirectory
# of current repository, for the same branch name. 
#
function merge() {
  [ $# -ne 3 ] && echo "Three parameters required, <remote git URI> <name of commonremote/local branche> <subdir into which putting remote sources>" && exit 1;
  git remote add newRepo $1;
  git fetch newRepo;
  git branch tmp_branch_$3 newRepo/$2;
  git checkout tmp_branch_$3;
  mkdir -vp "${GIT_PREFIX}$3";
  git ls-tree -z --name-only HEAD | xargs -0 -I {} git mv {} "${GIT_PREFIX}$3";
  git commit -m "Copy '$(basename $1)' project files to '${GIT_PREFIX}$3'";
  git checkout $2; 
  git merge --allow-unrelated-histories --no-edit -s recursive -X no-renames tmp_branch_$3 -m "Merge project '$(basename $1)' into rudder"
  git branch -D tmp_branch_$3; git remote remove newRepo;
}


echo "=> clone rudder repository..."
git clone ${REPOS}/rudder.git ${BASE}/rudder

echo "=> preparing rudder repository new layout..."
cd ${BASE}/rudder

#
# We need to do the layout change and import for each branch, because we need to 
# keep the history of other projects for all branches. 
# 
for BRANCH in "branches/rudder/4.1" "branches/rudder/4.3" "branches/rudder/5.0" "master"; do

  echo "=> switching to branch ${BRANCH}"
  git checkout ${BRANCH}
  
  echo "=> creating webapp/packaging..."
  mkdir -p webapp/packaging
  echo "This directory will contain build/packaging logic" > webapp/packaging/placeholder.txt
  
  git add webapp/packaging/placeholder.txt
  git commit -m "Issue #14147: Create directory for packaging"
  
  echo "=> creating webapp/sources and moving things into it"
  mkdir -p webapp/sources/rudder
  git mv rudder-core rudder-templates rudder-templates-cli rudder-web pom.xml webapp/sources/rudder
  if [ "${BRANCH}" != "branches/rudder/4.1" ]; then
    git mv rudder-rest webapp/sources/rudder
  fi
  
  # license file: let a copy in base directory
  cp LICENSE LICENSE_EXCEPTION webapp/sources/rudder
  # don't move: readme-resources, scripts, qa-test, README.asciidoc
  git add .
  git commit -m "Issue #14147: move webapp sources"
  
  # moving rudder-parent-pom
  
  for PROJECT in rudder-parent-pom rudder-commons scala-ldap ldap-inventory; do
    echo "=> merging ${PROJECT}"
    cd ${BASE}/rudder
    git clone --bare ${REPOS}/${PROJECT}.git ${BASE}/${PROJECT}.git
    merge ${BASE}/${PROJECT} ${BRANCH} webapp/sources/${PROJECT}
    rm -rf ${BASE}/${PROJECT}.git
    echo "=> done with ${PROJECT}"
  done
  
  echo "==> branch ${BRANCH} MERGED"
done

echo "=> all branches merged"
# now, upmerge from 4.1 to master
git checkout branches/rudder/4.3
git merge -s ours branches/rudder/4.1 -m "Solve upmerge after projects merge into rudder: branch 4.1 to 4.3"

git checkout branches/rudder/5.0
git merge -s ours branches/rudder/4.3 -m "Solve upmerge after projects merge into rudder: branch 4.3 to 5.0"
 
git checkout master
git merge -s ours branches/rudder/5.0 -m "Solve upmerge after projects merge into rudder: branch 5.0 to master"

echo "EVERYTHING MERGED"
