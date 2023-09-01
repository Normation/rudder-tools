#!/bin/bash

set -ex
export LANG=C

# Should we work on private repositories
PRIVATE="false"
# Target, in the X.Y.Z form for Rudder main components
VERSION=""

while getopts 'phv:' opt; do
  case "$opt" in
    p)
      PRIVATE="true"
      ;;

    v)
      VERSION="$OPTARG"
      ;;

    *)
      echo "Usage: $(basename $0) [-p] [-v VERSION]"
      exit 1
      ;;
  esac
done

if [ "${VERSION}" = "" ]; then
  echo "Missing -v version argument"
  exit 1
fi
export VERSION

checkout() {
  repo="$1"
  tag="$2"
  if [ ! -d "${repo}" ]; then
    git clone "https://github.com/Normation/${repo}.git"
  fi
  cd "${repo}"
  git fetch
  git checkout "$tag"
  cd -
}

# Main, i.e. non-plugin parts
main() {
  rm -rf sbom
  mkdir sbom

  # maven (Scala/Java)
  mvn -U org.cyclonedx:cyclonedx-maven-plugin:makeAggregateBom --file rudder/webapp/sources/pom.xml
  mv rudder/webapp/sources/target/bom.json sbom/backend.json

  # npm (JS)
  cd rudder/webapp/sources/rudder/rudder-web/src/main/
  npm_config_loglevel=error npm ci --no-audit
  npx makebom . -o bom.json
  cd -
  mv rudder/webapp/sources/rudder/rudder-web/src/main/bom.json sbom/frontend.json

  # cargo (Rust)
  cargo cyclonedx --all --format json --manifest-path rudder/relay/sources/relayd/Cargo.toml
  mv rudder/relay/sources/relayd/bom.json sbom/relayd.json
  cargo cyclonedx --all --format json --manifest-path rudder/policies/rudderc/Cargo.toml
  mv rudder/policies/rudderc/bom.json sbom/rudderc.json

  if [ "${PRIVATE}" = "true" ]; then
    # dotnet (F#)
    dotnet CycloneDX --exclude-dev --json rudder-agent-windows/common/initial-policy/ncf/rudderLib/rudderLib.sln --out sbom --filename windows.json
  fi

  # Aggregate everything
  cyclonedx merge --input-files sbom/*.json --output-file "rudder-${VERSION}.cdx.json"
  rm -r sbom
  # Can then be signed
  #cyclonedx sign ...
  # Compress
  #xz "rudder-${VERSION}.cdx.json"
}

# Plugins
checkout rudder-plugins "master"
tags=$(git -C rudder-plugins tag | grep "^[a-z-]+-${VERSION}-.*")
for tag in ${tags}; do
  checkout rudder-plugins "${tag}"
  plugin=$(echo "${tag}" | sed -E "s/^([a-z-]+)-${VERSION}-.*\$/\1/")
  cd rudder-plugins/"${plugin}"
    # Only work on webapp plugins
    if [ -f pom-template.xml ]; then
      make generate-pom
      mvn -U org.cyclonedx:cyclonedx-maven-plugin:makeAggregateBom --file pom.xml
      mv target/bom.json "../../rudder-${tag}.cdx.json"
    fi
  cd -
done

# Non-plugins
checkout rudder "${VERSION}"
if [ "${PRIVATE}" = "true" ]; then
  checkout rudder-agent-windows "${VERSION}"
fi
main "${VERSION}"
