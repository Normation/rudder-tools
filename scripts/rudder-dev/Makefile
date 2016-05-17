all: rudder-dev

rudder-dev: rudder-dev-src *.py
	perl -pe '$$_=qx/cat $$1.py/ if /^from (\S+) import .*# fake import/' $< > $@
	chmod +x $@

clean:
	rm -f rudder-dev

