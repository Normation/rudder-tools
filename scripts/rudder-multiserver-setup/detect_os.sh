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
set -e

# Default values are empty
export OS=""
export OSVERSION=""
export OSSP=""
export PM_NAME=""
export PM_COMMAND=""

# Detect OS with this logic:
# RHEL has /etc/redhat-release
# SLES has /etc/SuSE-release
# Debian and Ubuntu have /etc/debian_version
# Ubuntu have /etc/lsb-release with a DISTRIB_ID equal to 'Ubuntu'
if [ "z$(uname -s)" = "zAIX" ]; then
  export OS="AIX"
  # Format: Major.Minor (Ex: 5.3)
  export OSVERSION="$(uname -v).$(uname -r)"
  # No Service Pack
  export OSSP=""
elif [ "z$(uname -s)" = "SunOS" ] ; then
  export OS="Solaris"
  # guess
  export OSVERSION="$(uname -v).$(uname -r)"
  # No Service Pack
  export OSSP=""
elif [ -f /etc/SuSE-release ]; then
  export OS="SLES"
  export OSVERSION=$(cat /etc/SuSE-release | grep VERSION | cut -f2 -d '=' | sed 's/ //')
  export OSSP=$(/etc/SuSE-release | grep PATCHLEVEL | cut -f2 -d '=' | sed 's/ //')
  export PM_NAME="zypper"
  export PM_COMMAND="zypper install"
elif [ -f /etc/fedora-release ]; then
  export OS="FEDORA"
  export OSVERSION=$(cat /etc/fedora-release | sed 's/^.* release \([^\.][^\.]\).*$/\1/')
  # No Service Pack
  export OSSP=""
  export PM_NAME="yum"
  export PM_COMMAND="yum install -y"
elif [ -f /etc/redhat-release ]; then
  export OS="RHEL"
  export OSVERSION=$(cat /etc/redhat-release | sed 's/^.* release \([^\.]\).*$/\1/')
  # No Service Pack
  export OSSP=""
  export PM_NAME="yum"
  export PM_COMMAND="yum install -y"
elif [ -f /etc/debian_version ]; then
  if [ -f /etc/lsb-release -a "z$(grep DISTRIB_ID /etc/lsb-release | cut -f2 -d '=' | sed 's/ //')" = "zUbuntu" ]; then
    export OS="UBUNTU"
    # Ubuntu version is always formatted like X.Y
    export OSVERSION=$(cat /etc/lsb-release | grep DISTRIB_RELEASE | cut -f2 -d '=' | sed 's/ //')
    # No Service Pack
    export OSSP=""
  else
    export OS="DEBIAN"
    # Debian version is always formatted like X.Y.Z except for testing and unstable
    # but it does not concern us.
    export OSVERSION=$(cat /etc/debian_version | cut -f1 -d '.')
    # No Service Pack
    export OSSP=""
  fi
  export PM_NAME="apt"
  export PM_COMMAND="aptitude install -y"
elif [ -f /etc/system-release ]; then
  if [ "$(awk -F: '{print $3}' /etc/system-release-cpe)" = "amazon" ]; then
    export OS="AMI"
    export OSVERSION=$(awk -F: '{print $5}' /etc/system-release-cpe)
    export OSSP=""
    export PM_NAME="yum"
    export PM_COMMAND="yum install -y"
  fi
else
  export OS="unknown"
fi
