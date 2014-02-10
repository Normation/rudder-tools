# Tsung — Stress testing suite

This folder contains a stress testing suite which uses the [Tsung](http://tsung.erlang-projects.org/) utility, adding an arbitrary number of pending nodes to an exiting Rudder instances.

##Dependencies
* [Tsung](http://tsung.erlang-projects.org/) v.1.5.0+
* Perl 5 with Data::UUID (libdata-uuid-perl on Debian-like systems)

## Usage
* Generate some hosts using genhosts.pl:

```
./genhosts.pl > /tmp/hosts
```

* Copy inv.ocs to /tmp:

```
cp inv.ocs /tmp/
```

* If needed, change Rudder's hostname in tsung.xml to hit the right server instead of localhost (server configuration section)

* Run Tsung:

```
tsung -f tsung.xml start
```

## Statistics

To gather statistics on a machine beeing benched, you need snmpd running on it. You can then use tsung_stats.pl to get them.

From tsung directory (where tsung.xml is):
```
cd log/<date>
/usr/lib/tsung/bin/tsung_stats.pl
```

The generated logs can be viewed in report.html using your favorite browser.
