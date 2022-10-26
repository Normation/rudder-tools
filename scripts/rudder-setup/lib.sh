ISRG_ROOT_X1="-----BEGIN CERTIFICATE-----
MIIFazCCA1OgAwIBAgIRAIIQz7DSQONZRGPgu2OCiwAwDQYJKoZIhvcNAQELBQAw
TzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh
cmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwHhcNMTUwNjA0MTEwNDM4
WhcNMzUwNjA0MTEwNDM4WjBPMQswCQYDVQQGEwJVUzEpMCcGA1UEChMgSW50ZXJu
ZXQgU2VjdXJpdHkgUmVzZWFyY2ggR3JvdXAxFTATBgNVBAMTDElTUkcgUm9vdCBY
MTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAK3oJHP0FDfzm54rVygc
h77ct984kIxuPOZXoHj3dcKi/vVqbvYATyjb3miGbESTtrFj/RQSa78f0uoxmyF+
0TM8ukj13Xnfs7j/EvEhmkvBioZxaUpmZmyPfjxwv60pIgbz5MDmgK7iS4+3mX6U
A5/TR5d8mUgjU+g4rk8Kb4Mu0UlXjIB0ttov0DiNewNwIRt18jA8+o+u3dpjq+sW
T8KOEUt+zwvo/7V3LvSye0rgTBIlDHCNAymg4VMk7BPZ7hm/ELNKjD+Jo2FR3qyH
B5T0Y3HsLuJvW5iB4YlcNHlsdu87kGJ55tukmi8mxdAQ4Q7e2RCOFvu396j3x+UC
B5iPNgiV5+I3lg02dZ77DnKxHZu8A/lJBdiB3QW0KtZB6awBdpUKD9jf1b0SHzUv
KBds0pjBqAlkd25HN7rOrFleaJ1/ctaJxQZBKT5ZPt0m9STJEadao0xAH0ahmbWn
OlFuhjuefXKnEgV4We0+UXgVCwOPjdAvBbI+e0ocS3MFEvzG6uBQE3xDk3SzynTn
jh8BCNAw1FtxNrQHusEwMFxIt4I7mKZ9YIqioymCzLq9gwQbooMDQaHWBfEbwrbw
qHyGO0aoSCqI3Haadr8faqU9GY/rOPNk3sgrDQoo//fb4hVC1CLQJ13hef4Y53CI
rU7m2Ys6xt0nUW7/vGT1M0NPAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNV
HRMBAf8EBTADAQH/MB0GA1UdDgQWBBR5tFnme7bl5AFzgAiIyBpY9umbbjANBgkq
hkiG9w0BAQsFAAOCAgEAVR9YqbyyqFDQDLHYGmkgJykIrGF1XIpu+ILlaS/V9lZL
ubhzEFnTIZd+50xx+7LSYK05qAvqFyFWhfFQDlnrzuBZ6brJFe+GnY+EgPbk6ZGQ
3BebYhtF8GaV0nxvwuo77x/Py9auJ/GpsMiu/X1+mvoiBOv/2X/qkSsisRcOj/KK
NFtY2PwByVS5uCbMiogziUwthDyC3+6WVwW6LLv3xLfHTjuCvjHIInNzktHCgKQ5
ORAzI4JMPJ+GslWYHb4phowim57iaztXOoJwTdwJx4nLCgdNbOhdjsnvzqvHu7Ur
TkXWStAmzOVyyghqpZXjFaH3pO3JLF+l+/+sKAIuvtd7u+Nxe5AW0wdeRlN8NwdC
jNPElpzVmbUq4JUagEiuTDkHzsxHpFKVK7q4+63SM1N95R1NbdWhscdCb+ZAJzVc
oyi3B43njTOQ5yOf+1CceWxG1bQVs5ZufpsMljq4Ui0/1lvh+wjChP4kqKOJ2qxq
4RgqsahDYVvTH9w7jXbyLeiNdd8XM2w9U/t7y0Ff/9yi0GE44Za4rF2LN9d11TPA
mRGunUHBcnWEvgJBQl9nJEiU0Zsnvgc/ubhPgXRR4Xq37Z0j4r7g1SgEEzwxA57d
emyPxgcYxn/eR44/KJ4EBs+lVDR3veyJm+kXQ99b21/+jh5Xos1AnX5iItreGCc=
-----END CERTIFICATE-----
"

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

has_ssl() {
  URL="https://www.rudder-project.org/release-info/"
  WGET="wget -O /dev/null"
  CURL="curl -s -f -o /dev/null"
  if type apt-cache >/dev/null 2>/dev/null
  then
    # libgnutls <=26 is known to fail
    if apt-cache pkgnames libgnutls2 | grep -q 'libgnutls2[0-6]'
    then
      return 1
    fi
  fi
  if type curl >/dev/null 2>/dev/null
  then
    curl -s -f -o /dev/null "${URL}" || ret=$?
    if [ -n "${ret}" ] && [ ${ret} -eq 35 ]; then
      return 1
    elif [ -n "${ret}" ] && [ ${ret} -eq 60 ]; then
      echo "${ISRG_ROOT_X1}" > /usr/local/share/ca-certificates/isrg_root_x1.crt
      update-ca-certificates
      return 0
    else
      return 0
    fi
  fi
  if type wget >/dev/null 2>/dev/null
  then
    if wget -O /dev/null "${URL}" 2>&1 | grep -q "SSL23_GET_SERVER_HELLO:tlsv1 alert protocol version"; then
      return 1
    elif wget -O /dev/null "${URL}" 2>&1 | grep -q "GnuTLS: A TLS fatal alert has been received."; then
      return 1
    else
      return 0
    fi
  fi
  return 1
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
