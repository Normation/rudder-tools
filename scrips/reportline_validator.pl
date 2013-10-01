#!/usr/bin/env perl
#####################################################################################
# Copyright 2013 Normation SAS
#####################################################################################
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, Version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#####################################################################################

# This script will permit to check the Techniques reporting. It will validate or not
# the structure of each report of the selected Technique.

use strict;
use warnings;

# reportline_validator.pl
# By Matthieu CERDA
# (C) Normation
#
# Check if a report matches rudder's expected pattern.
#

if ( !defined($ARGV[0]) )
{
	print("You gave me nothing to examine!\n");
	exit(1);
}

# Variables init
my $report = $ARGV[0];
my $validation = 0;

chomp($report); # Suppress CR/LF

# Expected format : @@Policy@@State@@ConfigurationRuleId@@PolicyInstanceId@@VersionId@@Component@@Key@@ExecutionTimeStamp##NodeId@#HumanReadableMessage
if ( my ($regexp) = ( $report =~ m/@@(.*)@@(.*)@@(.*)@@(.*)@@(.*)@@(.*)@@(.*)@@(.*)\#\#(.*)@\#(.*)/ ) )
{

	my $state = $2;
	my $crid = $3;
	my $piid = $4; 
	my $versionid = $5;
	my $nodeid = $9;

	print("\nI understand this report. Here is a summary of what I got:\n\n");
	print("Policy: $1\nState: $state\n\nConfigurationRuleId: $3\nPolicyInstanceId: $4\nVersionId: $5\n\nComponent: $6\nKey: $7\nExecutionTimeStamp: $8\nNodeId: $9\n\nHumanReadableMessage: $10\n\n");

	if ( $state eq "log_trace" || $state eq "log_debug" || $state eq "log_info" || $state eq "log_warn" || $state eq "log_repaired" || $state eq "result_success" || $state eq "result_repaired" || $state eq "result_error" ) { print("."); } else { print("\nThe state part failed the validation: $state is not a valid state\n"); $validation = 1; }

	if ( $crid =~ m/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}/ ) { print("."); } else { print("\nThe ConfigurationRuleId part failed the validation: $crid does not look like a valid UUID\n"); $validation = 1; }

	if ( $piid =~ m/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}/ ) { print("."); } else { print("\nThe PolicyInstanceId part failed the validation: $piid does not look like a valid UUID\n"); $validation = 1; }

	if ( $versionid =~ m/^\d+$/ ) { print("."); } else { print("\nThe VersionId part failed the validation: $versionid does not look like a valid integer\n"); $validation = 1; }

	if ( $nodeid =~ m/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}/ ) { print("."); } else { print("\nThe NodeId part failed the validation: $nodeid does not look like a valid UUID\n"); $validation = 1; }

	if ( $validation eq 0 ) { print(" Validation : PASSED!\n"); } else { print(" Validation : FAILED...\n"); }
}
else
{
	print("\nI do not understand this report !!! Please check it has the required number of rows and the required separators.\n");
}
