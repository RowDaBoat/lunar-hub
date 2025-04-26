#!/bin/bash

. ../core_setup.sh

prepare "lnd.conf"

prompt_config "Blockchain interface (btcd|bitcoind|neutrino|nochainbackend)" "bitcoin.node" "bitcoind"

NETWORK=$(ask "Bitcoin network (mainnet|testnet|testnet4|signet|regtest)" "testnet4")
save_config "bitcoin.$NETWORK" "1"

prompt_config "Debug level (trace|debug|info|warn|error|critical)" "debuglevel" "info"

if [ "$NETWORK" = "testnet" ]; then
    save_config "noseedbackup" "1"
elif [ "$NETWORK" = "testnet4" ]; then
    save_config "noseedbackup" "1"	
elif [ "$NETWORK" = "signet" ]; then
    save_config "noseedbackup" "1"
elif [ "$NETWORK" = "regtest" ]; then
    save_config "noseedbackup" "1"
fi

save_config "rpclisten" "lnd:10009"

save_header "Bitcoind"
save_config "bitcoind.dir" "/data"

if [ "$NETWORK" = "mainnet" ]; then
    save_config "bitcoind.rpccookie" "/data/.cookie"
elif [ "$NETWORK" = "testnet" ]; then
    save_config "bitcoind.rpccookie" "/data/testnet3/.cookie"
elif [ "$NETWORK" = "testnet4" ]; then
    save_config "bitcoind.rpccookie" "/data/testnet4/.cookie"
elif [ "$NETWORK" = "signet" ]; then
    save_config "bitcoind.rpccookie" "/data/signet/.cookie"
elif [ "$NETWORK" = "regtest" ]; then
    save_config "bitcoind.rpccookie" "/data/regtest/.cookie"
fi

BITCOIN_RPCHOST="bitcoind"
save_config "bitcoind.rpchost" "$BITCOIN_RPCHOST:8332"
save_config "bitcoind.zmqpubrawblock" "tcp://$BITCOIN_RPCHOST:28332"
save_config "bitcoind.zmqpubrawtx" "tcp://$BITCOIN_RPCHOST:28333"

HOSTNAME=$(hostname)

finalize
