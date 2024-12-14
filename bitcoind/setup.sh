#!/bin/bash

. ../core_setup.sh

prepare "bitcoin.conf"

save_config "Data directory" "/data"
prompt_config "Chain (main|test|signet|regtest)" "chain" "test"
prompt_config "Enable debug" "debug" "1"

PRUNE=$(ask "Prune (size in MB)" "no")

if [ "$PRUNE" != "no" ]; then
    save_config "prune" $PRUNE
else
    save_config "txindex" "1"
fi

finalize
