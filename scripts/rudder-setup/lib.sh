# use local or typeset to define a local variable
setlocal() {
  if eval typeset x=1 2>/dev/null
  then
    local="typeset"
  elif eval local x=1 2>/dev/null
  then
    local="local"
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
  if type  "$1" >/dev/null 2>/dev/null
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
  CURL="curl -s -f -o"
  if type curl >/dev/null 2>/dev/null
  then
    ${CURL} "$@"
  elif type wget >/dev/null 2>/dev/null
  then
    ${WGET} "$@"
  elif [ "$1" = "-" ]
  then
    perl -MLWP::UserAgent -e '$r=LWP::UserAgent->new()->get(shift);if($r->is_success()){print $r->content()}else{exit 1}' "$2"
  else
    perl -MLWP::UserAgent -e '$r=LWP::UserAgent->new()->get(shift);if($r->is_success()){print $r->content()}else{exit 1}' "$2" > "$1"
  fi
}

# run a service using the first available method
service_cmd() {
  if [ -x "/etc/init.d/$1" ]
  then
    name="$1"
    shift
    "/etc/init.d/${name}" "$@"
  elif exists systemctl
  then
    name="$1"
    cmd="$2"
    shift 2
    systemctl "${cmd}" "${name}" "$@"
  elif exists service
  then
    service "$@"
  elif exists startsrc
  then
    name="$1"
    cmd="$2"
    shift 2
    if [ "${cmd}" = "start" ]; then
      startsrc -s "${name}"
    elif [ "${cmd}" = "stop" ];then
      stopsrc -s "${name}"
    else
      echo "Don't know how to manage service $@"
    fi
  else
    echo "Don't know how to manage service $@"
  fi
}
