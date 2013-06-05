#!/usr/bin/bash

# Daemon-like script to detect when we're connected to titech-pubnet
#  and log onto it when we are.

while true; do
  TIT=`iwconfig wlan0 | grep "titech-pubnet"`
  # Are we connected to a wifi named "titech-pubnet" ?
  if [ -z "$TIT" ]; then
    echo "Not connected to titech-pubnet"
    sleep 1
  else
    # Use Android's convenient dummy page for forcing a redirect
    #  to the log on page
    wget -qS --spider --timeout=1 -t 1 http://173.194.38.110/generate_204
    if [ $? -eq 0 ]; then
      echo "Logging on to titech-pubnet"
      ./titlogin.sh
      # now that we're connected, we might want to set up the proxy
      # set proxy terminal variable for fish
#      set -x all_proxy "131.112.125.238:3128"
      # for bash and it's ilk you'd do something like:
#      export all_proxy="131.112.125.238:3128"
    else
      echo "Already connected"
      sleep 10
    fi
  fi
done

