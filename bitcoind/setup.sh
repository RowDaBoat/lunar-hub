#!/bin/bash

. ../core_setup.sh

prepare "bitcoin.conf"

save_config "datadir" "/data"
prompt_config "Chain (main|test|signet|regtest)" "chain" "test"
prompt_config "Enable debug?" "debug" "1"

finalize
