FROM centos:7

RUN \	
	yum -y update && \
	yum -y install deltarpm && \ 
	yum -y install wget psmisc iproute2 ca-certificates gnupg2 python net-tools && \
        wget -q https://repository.rudder.io/tools/rudder-setup && \
	chmod +x rudder-setup

COPY   files/docker/systemctl.py /usr/bin/systemctl 
COPY   files/docker/systemctl.py /bin/systemctl

RUN \	
	bash rudder-setup add-repository 6.1 && \
        yum -y install rudder-server-root && \
        rudder agent run && \
        yum clean all

EXPOSE 80 443 5309

CMD \
        /usr/bin/systemctl && \ 
	systemctl start rudder-slapd && \ 
	systemctl start postgresql && \
	systemctl start httpd && \
        systemctl start rudder-jetty && \
	/bin/bash
