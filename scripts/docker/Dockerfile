FROM ubuntu:latest

ENV \
	DEBIAN_FRONTEND=noninteractive 

RUN \
	apt-get update && \
	apt-get -y --no-install-recommends install psmisc wget ca-certificates gnupg2 && \
	apt-get -y autoremove

RUN \
	ln -sf /bin/true /bin/systemctl && \
	ln -sf /bin/true /usr/bin/systemctl && \
	wget -q https://repository.rudder.io/tools/rudder-setup && \
	chmod +x rudder-setup

RUN \
	apt-get -y install postgresql && \
	/etc/init.d/postgresql start && \
	bash rudder-setup add-repository 5.0 && \
	apt-get -y install rudder-inventory-ldap && \
	/etc/init.d/rudder-slapd start && \
	bash rudder-setup setup-server 5.0

EXPOSE 80 443 5309

CMD \
	/etc/init.d/postgresql start && \
	/etc/init.d/apache2 start && \
	/etc/init.d/rudder-slapd start && \
	/opt/rudder/bin/cf-serverd && \
	/etc/init.d/rudder-jetty start && \
	/opt/rudder/bin/cf-execd -F

