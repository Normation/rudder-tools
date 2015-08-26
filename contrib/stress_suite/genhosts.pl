#!/usr/bin/perl -w

use strict;
use warnings;

# Dependencies
use POSIX qw(strftime); # Builtin
use Socket;             # Builtin
use Data::Dumper;       # Builtin
use Data::UUID;         # libdata-uuid-perl on Debian-like systems

# Configuration begin
my $count = 1000;                           # Number of hosts to generate
my $begin  = "172.16.0.1";                  # First IP address
# Configuration end

# Generate an IP address using inet_aton
my $ip = unpack 'N', inet_aton($begin);
my $ug = new Data::UUID;

# Generate a random MAC address
sub GenMAC {
  my $tmp_mac="00";
  my $i=0;

  # generate random mac-address
  while($i++ < 5) {
    $tmp_mac.=":" . sprintf("%x",int rand 16);
    $tmp_mac.=sprintf("%x",int rand 16);
  }
  return($tmp_mac);
}

# Generate $count hosts
for (my $i = 0; $i < $count; $i++, $ip++) {
  my $uuid = $ug->create();
  my $uuid_str   = $ug->to_string( $uuid );
  my $hostname = "RDR-TST-RandHost" . $i . ".rudder.local";
  my $mac = GenMAC();
  my $logdate = strftime "%F %H:%M:%S", localtime;
  
  print join(";", 
    $i,
    $uuid_str, 
    $hostname,
    inet_ntoa(pack 'N',$ip),
    $mac,
    $logdate,
  ), "\n"; 
}
