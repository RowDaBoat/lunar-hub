#!/usr/bin/env bash

set -e

PARAMS="\
    -debuglogfile=/data/debug.log \
    -rpcbind=0.0.0.0 \
    -rpcallowip=0.0.0.0/0 \
    -zmqpubrawblock=tcp://0.0.0.0:28332 \
    -zmqpubrawtx=tcp://0.0.0.0:28333"

# Print bitcoin.conf
echo "bitcoin.conf:"
cat /root/.bitcoin/bitcoin.conf
echo ""

# Print command
echo "Command: bitcoind $PARAMS"
echo ""

# Start bitcoin node
exec bitcoind $PARAMS
