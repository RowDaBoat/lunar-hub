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
    --bitcoind.zmqpubrawtx=tcp://$RPCHOST:28333 \
    --configfile=/lnd.conf"

# Print command.
echo "Command: lnd $PARAMS"
echo ""

# Print lnd.conf.
echo "lnd.conf:"
cat /lnd.conf
echo ""

# Add secrets to lnd.conf
cat /lnd.conf.secret >> /lnd.conf

# Start lnd node.
exec lnd $PARAMS
