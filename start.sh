#!/bin/sh

# start the sabnzbd daemon
sabnzbdplus --daemon --browser 0 --config-file /config --server :8080

# wait for a few seconds
sleep 5

# start watching the logs
tail -f /config/logs/sabnzbd.*
