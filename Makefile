# List all single files that must be published here
PUBLISH := scripts/rudder-dev/rudder-dev

# This target will be called when we want to build everything
all: $(PUBLISH)

scripts/rudder-dev/rudder-dev:
	# Put commands to build rudder-dev single file here
	touch $@

# This target will be called to get the list of files to publish
list:
	@echo $(PUBLISH)

.PHONY: all list
