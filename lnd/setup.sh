#!/bin/bash

. ../core_setup.sh

prepare "lnd.conf"

prompt_config "Blockchain interface (btcd|bitcoind|neutrino|nochainbackend)" "bitcoin.node" "bitcoind"

NETWORK=$(ask "Bitcoin network (mainnet|testnet|signet|regtest)" "testnet")
save_config "bitcoin.$NETWORK" "1"

prompt_config "Debug level (trace|debug|info|warn|error|critical)" "debuglevel" "info"

if [ "$NETWORK" = "testnet" ]; then
    save_config "noseedbackup" "1"
elif [ "$NETWORK" = "signet" ]; then
    save_config "noseedbackup" "1"
elif [ "$NETWORK" = "regtest" ]; then
    save_config "noseedbackup" "1"
fi

save_header "Bitcoind"
save_config "bitcoind.dir" "/data"

if [ "$NETWORK" = "mainnet" ]; then
    save_config "bitcoind.rpccookie" "/data/.cookie"
elif [ "$NETWORK" = "testnet" ]; then
    save_config "bitcoind.rpccookie" "/data/testnet3/.cookie"
elif [ "$NETWORK" = "signet" ]; then
    save_config "bitcoind.rpccookie" "/data/signet/.cookie"
elif [ "$NETWORK" = "regtest" ]; then
    save_config "bitcoind.rpccookie" "/data/regtest/.cookie"
fi

finalize
