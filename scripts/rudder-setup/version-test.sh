
# version-spec = 5 / 5.1 / 5.1.5 / 5.1-rc3 / [5 7] / [5.1 7] / [5.1 *] / ... # [A B] means between A and B (A and B included)
#

# A component is a version element, components are separated by '.'
# echo the version component number $id (Nth component)
get_component() {
  $local version="$1"
  $local id="$2"
  echo "${version}" | 
    sed -e 's/[^0-9a-zA-Z ]/ /g' | # use ' ' as a separator
    sed -e 's/\([0-9]\)\([^0-9]\)/\1 \2/g' | # separate after a number (23rc1 -> 23 rc1)
    sed -e 's/\([^0-9]\)\([0-9]\)/\1 \2/g' | # separate before a number (rc2 -> rc 2)
    sed -e 's/  */ /g' | # remove duplicate ' '
    cut -d' ' -f${id} # keep the one we want
}

# Return if a version component matches a specification component
# Operator can be "-le" "-eq" or "-ge" 
# Return codes:
#  "no"  -> component doesn't match specification
#  "yes" -> component matches specification and is different from it
#  "continue" -> component is equal to specification (so you must check the next component)
component_cmp() {
  $local version_component="$1"
  $local operator="$2"
  $local spec_component="$3"
  $local alpha_version=`echo -n "${version_component}" | grep "[^0-9]" || true`
  $local alpha_spec=`echo -n "${spec_component}" | grep "[^0-9]" || true`
  if [ -z "${spec_component}" ] # no spec -> match
  then
    echo "yes"
  elif [ -z "${version_component}" ] # no version -> doesn't match
  then
    echo "no"
  elif [ -z "${alpha_spec}" ] && [ -z "${alpha_version}" ] # both are numeric
  then
    if [ "${version_component}" -eq "${spec_component}" ]  # go to next component if this one is equal
    then
      echo "continue"
    elif [ "${version_component}" "${operator}" "${spec_component}" ] # match
    then
      echo "yes"
    else # doesn't match
      echo "no"
    fi
  elif [ -z "${alpha_spec}" ] # numeric spec, alpha version -> version is strictly inferior to spec
  then
    if [ "${operator}" = "-le" ] # true only for "less than"
    then
      echo "yes"
    else
      echo "no"
    fi
  else # alpha spec (beta, rc, ...)
    if [ "${version_component}" = "${spec_component}" ] # same value -> continue
    then
      echo "continue"
    else
      # hack (alpha < beta < rc) but I see no better way for now
      [ "${operator}" = "-le" ] && op="<="
      [ "${operator}" = "-eq" ] && op="=="
      [ "${operator}" = "-ge" ] && op=">="
      echo "${version_component} ${spec_component}" | awk "{ if(\$1 ${op} \$2) print \"yes\"; else print \"no\" }"
    fi
  fi
}

# Return true if a version matches a specification
# Operator can be "-le" "-eq" or "-ge"
version_cmp() {
  $local version="$1"
  $local operator="$2"
  $local spec="$3"

  # comparison with * laways matches
  [ "${spec}" = "*" ] && return 0

  # Iterate over components and stop on first component not matching
  for i in 1 2 3 4 5 6 7 8 9 # maximum 9 components
  do
    $local version_component=`get_component "${version}" "${i}"`
    $local spec_component=`get_component "${spec}" "${i}"`

    # if we have a spec component, test against the matching one in version
    if [ -n "${spec_component}" ]
    then
      cmp=`component_cmp "${version_component}" "${operator}" "${spec_component}"`
      if [ "${cmp}" = "yes" ]
      then
        return 0 # match
      elif [ "${cmp}" = "no" ]
      then
        return 1 # doesn't match
      else
        :        # go to next component 
      fi
    else # given version is more precise than spec -> match
      return 0
    fi

  done
  # given version precisely equals spec or has more than 9 components -> match
  return 0
}

# Return true if the version is compatible with the version specification
# Parameters (version, version specification)
# Version spec is of the form [A B] : between A and B (A and B included)
is_version_valid() {
  $local version_isok="$1"
  $local specification="$2"
  $local v1=`echo "${specification}" | sed 's/[][]//g' | cut -d' ' -f1`
  $local v2=`echo "${specification}" | sed 's/[][]//g' | cut -d' ' -f2`
  if [ -z "${v2}" ]
  then
    version_cmp "${version_isok}" "-eq" "${v1}"
  else
    version_cmp "${version_isok}" "-ge" "${v1}" && version_cmp "${version_isok}" "-le" "${v2}"
  fi
}

# test function for component specification
test_component() {
  $local retval="$1"
  $local ret=`component_cmp "$2" "$3" "$4"`
  if [ "${ret}" = "${retval}" ]
  then
    echo "$2 $3 $4 = $1 -> PASS" 
  else
    echo "$2 $3 $4 = $1 -> ERROR" 
  fi
}

# test function for version specification
test_spec() {
  $local retval=1
  if [ "$1" = "ok" ]
  then
    retval=0
  fi
  is_version_valid "$2" "$3"
  if [ $? -eq ${retval} ]
  then
    echo "$2 ~ $3 = $1 -> PASS"
  else
    echo "$2 ~ $3 = $1 -> ERROR"
  fi
}

# This is the test for version comparison
# This test acts as a definition of version specification
version_spec() {
  test_component continue 2 -le 2
  test_component yes 11 -le 12
  test_component no 12 -le 11
  test_component continue rc -le rc
  test_component yes beta -le rc
  test_component no beta -le alpha
  test_component continue 2 -eq 2
  test_component no 11 -eq 12
  test_component continue rc -eq rc
  test_component no beta -eq rc
  test_component continue 2 -ge 2
  test_component yes 12 -ge 11
  test_component no 11 -ge 12
  test_component continue rc -ge rc
  test_component no beta -ge rc
  test_component yes beta -ge alpha


  test_spec ok "2.11" "2.11" 
  test_spec ok "2.11.2" "2.11" 
  test_spec ok "2.11" "[2.11 2.12]"
  test_spec ok "2.12" "[2.11 2.12]" 
  test_spec ok "2.12" "[2.11 3.1]" 
  test_spec ok "2.11.2" "[2.11.1 2.11.3]" 
  test_spec ok "2.11-rc1" "2.11"
  test_spec ok "2.11-rc1" "2.11-rc"
  test_spec ok "2.11" "[2.10 *]" 
  test_spec ok "2.11" "[* 2.11]" 
  test_spec ok "2.10-rc1" "[2.10-beta1 2.11]" 
  test_spec ko "2.11" "2.11.2" 
  test_spec ko "2.11-rc1" "2.11.1"
  test_spec ko "2.11" "[2.11.1 2.11.3]" 
  test_spec ko "2.11-rc1" "[2.11.1 2.11.3]" 
  test_spec ko "2.10" "2.11"
  test_spec ko "2.10-rc1" "[2.11.1 2.11.3]" 
  test_spec ko "2.11" "[2.12 *]" 
  test_spec ok "3.1" "[3.0 4.0]" 
}


rudder_is_compatible() {
  $local ROLE="$1"
  $local MAJOR_VERSION=$(echo "$2"| cut -f 1-2 -d .)
  $local OS=$(echo "$3"|tr 'A-Z' 'a-z')
  $local OS_VERSION=$(echo "$4"| cut -f 1 -d . | cut -d '-' -f 1)

  if get - "http://www.rudder-project.org/release-info/rudder/versions/${MAJOR_VERSION}/os/${OS}-${OS_VERSION}/roles" | grep "${ROLE}" >/dev/null
  then
    return 0
  else
    return 1
  fi
}

rudder_compatibility_check() {
  $local ROLE="$1"
  [ "${UNSUPPORTED}" = "y" ] && return
  if ! rudder_is_compatible "${ROLE}" "${RUDDER_VERSION}" "${OS_COMPATIBLE}" "${OS_VERSION}"
  then
    echo "Your installation: Rudder ${RUDDER_VERSION} ${ROLE} for ${OS_COMPATIBLE} - ${OS_VERSION} is not supported."
    echo "Aborting."
    echo "export UNSUPPORTED=y to remove this check"
    exit 1
  fi
}
