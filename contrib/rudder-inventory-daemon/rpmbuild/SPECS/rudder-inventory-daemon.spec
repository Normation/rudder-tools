# Copyright 2017 BMW AG - Janos Mattyasovszky
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#     Unless required by applicable law or agreed to in writing, software
#     distributed under the License is distributed on an "AS IS" BASIS,
#     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#     See the License for the specific language governing permissions and
#     limitations under the License.
#

Name:           rudder-inventory-daemon
Version:        1
Release:        0
License:        Apache-2.0
Summary:        Rudder Inventory forwarder and uploader daemon
Url:            https://www.rudder-project.org/site/
Group:          Applications/System
BuildRoot:      %{_tmppath}/%{name}-%{version}-build


%define cfgfile /opt/rudder/etc/%{name}.config.yml.template
%define binfile /opt/rudder/bin/%{name}
%define pidfile /var/rudder/run/%{name}.pid
%define logfile /var/log/rudder/%{name}.log

Requires: rudder-server-relay

%if 0%{?suse_version}
Requires:   perl-JSON, perl-YAML, perl-libwww-perl, perl-Linux-Inotify2

# SLES 11
%if 0%{?suse_version} == 1110
%endif

# Using systemd (as of sles12+) 
# See: https://en.opensuse.org/openSUSE:Systemd_packaging_guidelines
%if 0%{?suse_version} >= 1210
%bcond_without systemd
%else
%bcond_with systemd
%endif

%endif

%if %{with systemd}
%{?systemd_requires}
BuildRequires: systemd
BuildRequires: systemd-rpm-macros
%endif

Source1:   %{name}.bin
Source2:   %{name}.config.yml
Source3:   %{name}.service
Source4:   %{name}.init

%description
Rudder add-on with a perl-based daemon, that sets up inofity-listener,
so that incoming inventory files (via WebDAV) are queued and transferred
to the destination. On a Non-Root server (Relays) this is the upload
directory of the parent policy server, on the Root server the inventory
endpoint.


%build

%install

# Binary
install -D -m 750 %{SOURCE1}              %{buildroot}/%{binfile}

# Config file
install -D -m 640 %{SOURCE2}              %{buildroot}/%{cfgfile}

%if %{with systemd}
install -D -m 644 %{SOURCE3}              %{buildroot}%{_unitdir}/%{name}.service
sed -i '
    s|{PIDFILE}|%{pidfile}|g; 
    s|{BINFILE}|%{binfile}|g;
    ' %{buildroot}%{_unitdir}/%{name}.service
%else
# https://en.opensuse.org/openSUSE:Packaging_init_scripts
install -D -m 755 %{SOURCE4}              %{buildroot}/etc/init.d/%{name}
sed -i '
    s|{PIDFILE}|%{pidfile}|g; 
    s|{BINFILE}|%{binfile}|g;
    ' %{buildroot}/etc/init.d/%{name}
%endif

mkdir -p %{buildroot}/opt/rudder/etc/
touch    %{buildroot}/opt/rudder/etc/no_inventory_upload
mkdir -p %{buildroot}/$(dirname %{pidfile})
touch    %{buildroot}/%{pidfile}

%post
%if %{with systemd}
/usr/bin/systemctl daemon-reload
case "$1" in
    "1") /usr/bin/systemctl enable  %{name}.service ;
         /usr/bin/systemctl start   %{name}.service ;;
    "2") /usr/bin/systemctl restart %{name}.service ;;
esac
%else
case "$1" in
    "1") /etc/init.d/%{name} start  ;;
    "2") /etc/init.d/%{name} restart ;;
esac
%endif

%preun
%if %{with systemd}
case "$1" in
    "0") /usr/bin/systemctl stop %{name}.service ;;
esac
%else
case "$1" in
    "0") /etc/init.d/%{name} stop ;;
esac
%endif

%files
%defattr(-,root,root)
%{binfile}
%{cfgfile}
%ghost %{pidfile}
/opt/rudder/etc/no_inventory_upload

%if %{with systemd}
%{_unitdir}/%{name}.service
%else
/etc/init.d/%{name}
%endif
