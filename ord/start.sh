#!/usr/bin/env bash

set -e

PARAMS="\
--config ord.conf \
--bitcoin-rpc-url bitcoind:8332"

# Print ord.conf 
echo "ord.conf:"
cat ord.conf
echo ""

# Wait for cookie to be available
COOKIE_FILE=$(grep -E '^cookie_file: ' ord.conf | awk -F ': ' '{print $2}')
echo "Waiting for bitcoind's cookie file to be created..."

while [ ! -f $COOKIE_FILE ]; do
  sleep 1
done

# Print command
echo "Command: ord $PARAMS server"
echo ""

# Start ord service
exec ord $PARAMS server

