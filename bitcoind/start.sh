#!/usr/bin/env bash

set -e

PARAMS=$(echo $PARAMS \
    "-datadir"="/data" \
    "-debuglogfile"="/data/debug.log" \
    "-rpcbind"="0.0.0.0" \
    "-rpcallowip"="0.0.0.0/0" \
    "-zmqpubrawblock"="tcp://0.0.0.0:28332" \
    "-zmqpubrawtx"="tcp://0.0.0.0:28333" \
    "-txindex" \
    "-conf=/bitcoin.conf"
)

# Print command.
echo "Command: bitcoind $PARAMS"
echo ""

# Print bitcoin.conf.
echo "bitcoin.conf:"
cat /bitcoin.conf
echo ""

# Start bitcoin node.
exec bitcoind $PARAMS
