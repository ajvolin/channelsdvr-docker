#!/bin/sh
set -e
if [ ! -x /channels-dvr/latest/channels-dvr ]; then
  echo Installing Channels DVR..
  curl -f -s https://getchannels.com/dvr/setup.sh | DOWNLOAD_ONLY=1 sh
fi
cd /channels-dvr/data

if [[ -z "${STARTUP_DELAY}" ]]; then
  echo Running Channels DVR..
else
  echo "Delaying Channels DVR startup for $STARTUP_DELAY"
  sleep $STARTUP_DELAY
  echo Running Channels DVR..
fi
exec ../latest/channels-dvr >> channels-dvr.log 2>&1
