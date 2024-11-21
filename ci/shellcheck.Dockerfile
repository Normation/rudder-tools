FROM debian:12
LABEL ci=rudder/ci/shellcheck.Dockerfile

RUN apt-get update && apt-get install -y shellcheck
