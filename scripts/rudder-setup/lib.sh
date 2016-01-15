# use local or typeset to define a local variable
setlocal() {
  if eval local x=1 2>/dev/null
  then
    local="local"
  elif eval typeset x=1 2>/dev/null
  then
    local="typeset"
  else
    # unsupported
    return 1
  fi
}

# reexcute current script with another shellif we can find one
re_exec()
{
  for shell in bash /opt/csw/bin/bash
  do
    if exists "$shell"
    then
      exec "$shell" "$0" "$@"
    fi
  done
  # no supported shell stop here
  print "I need a fully posix shell please find me one"
  exit 255
}

# return true if the command exists
exists() {
  if sh -c "hash '$1'" >/dev/null 2>/dev/null
  then
    return 0
  elif type  "$1" >/dev/null 2>/dev/null
  then
    return 0
  else
    return 1
  fi
}

# Reimplement which (taken from 10_ncf_internals/list-compatible-inputs)
which() {
  $local name="$1"
  $local IFS_SAVE="$IFS"
  IFS=:
  for directory in $PATH
  do
    if [ -x "${directory}/${name}" ]
    then
      echo "${directory}/${name}"
      IFS="$IFS_SAVE"
      return 0
    fi
  done
  IFS="$IFS_SAVE"
  return 1
}

# get a remote url content using the first available method
get() {
  WGET="wget -q -O"
  CURL="curl -s -o"
  if type curl >/dev/null 2>/dev/null
  then
    ${CURL} "$@"
  else
    ${WGET} "$@"
  fi
}

# run a service using the first available method
service_cmd() {
  if [ -x "/etc/init.d/$1" ]
  then
    name="$1"
    shift
    "/etc/init.d/${name}" "$@"
  else
    service "$@"
  fi
}
