#!/bin/bash

. ../core_setup.sh

prepare "bitcoin.conf"

save_config "datadir" "/data"
NETWORK=$(ask "Chain (main|test|testnet4|signet|regtest)" "testnet4")
save_config "chain" $NETWORK
prompt_config "Enable debug" "debug" "0"

PRUNE=$(ask "Prune (size in MB)" "no")

if [ "$PRUNE" != "no" ]; then
    save_config "prune" $PRUNE
else
    save_config "txindex" "1"
fi

prompt_config "Enable server (required for services such as ord)" "server" "0"

if [ "$NETWORK" = "main" ]; then
    save_config "rpccookiefile" "/data/.cookie"
elif [ "$NETWORK" = "test" ]; then
    save_config "rpccookiefile" "/data/testnet3/.cookie"
elif [ "$NETWORK" = "testnet4" ]; then
    save_config "rpccookiefile" "/data/testnet4/.cookie"
elif [ "$NETWORK" = "signet" ]; then
    save_config "rpccookiefile" "/data/signet/.cookie"
elif [ "$NETWORK" = "regtest" ]; then
    save_config "rpccookiefile" "/data/regtest/.cookie"
fi

finalize

