#!/usr/bin/env bash

set -e

RPCHOST="bitcoind"
HOSTNAME=$(hostname)

# CAUTION:
#   - setting --rpclisten to $HOSTNAME will cause it to listen on an IP address
#       that is reachable on the internal network. If you do this outside of
#       docker, this might be a security concern!
PARAMS="\
    --rpclisten=$HOSTNAME:10009 \
    --rpclisten=localhost:10009 \
    --bitcoind.rpchost=$RPCHOST \
    --bitcoind.zmqpubrawblock=tcp://$RPCHOST:28332 \
    --bitcoind.zmqpubrawtx=tcp://$RPCHOST:28333"

# Move lnd.conf to the default location and print it
LND_CONF="/root/.lnd/lnd.conf"
mv /lnd.conf $LND_CONF
echo "lnd.conf:"
cat $LND_CONF
echo ""

# Wait for cookie to be available
COOKIE_FILE=$(grep -E '^bitcoind\.rpccookie=' "$LND_CONF" | awk -F '=' '{print $2}')
echo $COOKIE_FILE
echo "Waiting for bitcoind's cookie file to be created..."

while [ ! -f $COOKIE_FILE ]; do
  sleep 1
done

# Print command
echo "Command: lnd $PARAMS"
echo ""

# Start lnd node
exec lnd $PARAMS
