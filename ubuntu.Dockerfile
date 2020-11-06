FROM ubuntu:bionic

ENV \
        DEBIAN_FRONTEND=noninteractive

RUN \	
	apt-get -y update && \ 
	apt-get -y install wget psmisc iproute2 ca-certificates gnupg2 python net-tools && \
        wget -q https://repository.rudder.io/tools/rudder-setup && \
	chmod +x rudder-setup

RUN     printf "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

COPY    files/docker/systemctl.py /usr/bin/systemctl 
COPY    files/docker/systemctl.py /bin/systemctl

RUN \	
	bash rudder-setup add-repository 6.1 && \
	apt-get -y install postgresql-10 && \
        apt-get -y install rudder-server-root && \
        rudder agent run && \
        apt clean all

EXPOSE 80 443 5309

CMD \
        /usr/bin/systemctl && \ 
	systemctl start rudder-slapd && \ 
        systemctl start postgresql && \
        systemctl start apache2 && \
	pg_ctlcluster 10 main start && \
        systemctl restart rudder-jetty && \
	/bin/bash
