#!/usr/bin/env python
# -*- coding: utf-8 -*-
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

import urllib2
import simplejson

# Main function. Takes as an argument:
# - The URL to connect to Rudder
# - The API token key
def main(url, token):
	# Open connection to Rudder
	req = urllib2.Request(url, None, {'X-API-Token':token})
	opener = urllib2.build_opener()
	f = opener.open(req)

	# Load returned content in a JSON object
	json = simplejson.load(f)

	# Print the prettified JSON output
	print simplejson.dumps(json, sort_keys=True, indent=4 * ' ')

# Program start
if __name__ == "__main__":
    main("http://localhost/rudder/api/1.0/rules", 'oPFL9gfp8KJQVjQAKg40t8WRyZtIGTCm')
