all: rudder-dev

rudder-dev: rudder-dev-src *.py
	perl -pe '$$_=qx/grep -v "from __future__ import" $$1.py/ if /^from (\S+) import .*# fake import/' $< > $@
	chmod +x $@

clean:
	rm -f rudder-dev

