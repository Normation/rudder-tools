# Rudder nodes listing tool

This folder contains a utility whose purpose is to list all the rudder-agents registered on a Rudder server.

It connects to Rudder via the API, creates a XLS file, and tries to automatically open it using LibreOffice when done.

## Dependencies
* [Python](http://www.python.org/) v.2.6+
* Python modules:
** Requests
** XLWT

To install them, on Debian/Ubuntu:

```
apt-get update && apt-get install python-requests python-xlwt
```

## Configuration

The script expects the following variables to be configured in the beginning of the file:
* api_url, Rudder's API endpoint (example: "http://rudder.example.com/rudder/api")
* api_token, A Rudder API token (example: "HRLeYGfBX9TZQnF0aq6Ab7U2M7HbRJO8")

## Usage

```
./rudder-nodes-list
```

## Contributed by

Dennis Cabooter <Dennis.Cabooter@snow.nl>
