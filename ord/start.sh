#!/usr/bin/env bash

set -e

# Print ord.conf 
echo "ord configuration:"
ord settings
echo ""

# Wait for bitcoind to be available
CONFIG_FILE=/root/.local/share/ord/ord.yaml
COOKIE_FILE=$(grep -E '^cookie_file: ' $CONFIG_FILE | awk -F ': ' '{print $2}')
./poll-bitcoind.sh $COOKIE_FILE

while [ ! -f $COOKIE_FILE ]; do
  sleep 1
done

# Print command
echo "Command: ord $PARAMS server"
echo ""

# Start ord service
exec ord server

