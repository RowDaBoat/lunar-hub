#!/usr/bin/env bash

set -e

RPCHOST="bitcoind"
HOSTNAME=$(hostname)

# Print lnd.conf
LND_CONF="/root/.lnd/lnd.conf"
echo "lnd.conf:"
cat $LND_CONF
echo ""

# Wait for bitcoind to be available
COOKIE_FILE=$(grep -E '^bitcoind\.rpccookie=' "$LND_CONF" | awk -F '=' '{print $2}')
./poll-bitcoind.sh $COOKIE_FILE

# Start lnd node
exec lnd
