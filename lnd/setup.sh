#!/bin/bash

. ../core_setup.sh

prepare "lnd.conf"

prompt_config "Blockchain interface (btcd|bitcoind|neutrino|nochainbackend)" "bitcoin.node" "bitcoind"

NETWORK=$(ask "Bitcoin network (mainnet|testnet|signet|regtest)" "testnet")
save_config "bitcoin.$NETWORK" "1"

prompt_config "Debug level (trace|debug|info|warn|error|critical)" "debuglevel" "info"

if [ "$NETWORK" != "mainnet" ]; then
    save_config "noseedbackup" "1"
fi

finalize


prepare "lnd.conf.secret"

RPCUSER=$(cat ../bitcoind/rpcauth.secret | jq -r '.username')
RPCPASS=$(cat ../bitcoind/rpcauth.secret | jq -r '.password')

save_config "bitcoind.rpcuser" $RPCUSER
save_config "bitcoind.rpcpass" $RPCPASS

finalize_silently
echo "This secret file is in '.gitignore'."
