# Rudder set nodes properties tool

This folder contains a utility whose purpose is to set node properties for a Rudder node to be able to search on that properties

It connects to Rudder via the API and sets the node properties

## Dependencies
* [Python](http://www.python.org/) v.2.6+
* Python modules:
** Requests
** docopt

To install them, on Debian/Ubuntu:

```
apt-get update && apt-get install python-requests python-docopt
```

## Configuration

N/A

## Usage

```
./rudder-set-node-props.py [--node=<fqdn>] (--key=OPT ...) (--value=OPT ...)
```

## Example

```
./rudder-set-node-props.py --node=node1.example.com --key=user --value=foo --key=room --value=bar
```

## Contributed by

Dennis Cabooter <Dennis.Cabooter@snow.nl>
