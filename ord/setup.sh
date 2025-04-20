#!/bin/bash

export ASSIGN_OP=": "

. ../core_setup.sh

prepare "ord.conf"

save_config "bitcoin_data_dir" "/data"
save_config "data_dir" "/data/ord"
save_config "bitcoin_rpc_url" "bitcoind:8332"

NETWORK=$(ask "Chain (mainnet|regtest|signet|testnet|testnet4)" "testnet4")
save_config "chain" "$NETWORK"

prompt_config "Index Addresses" "index_addresses" "false"
prompt_config "Index Runes" "index_runes" "false"
prompt_config "Index Sats" "index_sats" "false"
prompt_config "Index Transactions" "index_transactions" "false"
prompt_config "No index inscriptions" "no_index_inscriptions" "false"

if [ "$NETWORK" = "mainnet" ]; then
    save_config "cookie_file" "/data/.cookie"
elif [ "$NETWORK" = "regtest" ]; then
    save_config "cookie_file" "/data/regtest/.cookie"
elif [ "$NETWORK" = "signet" ]; then
    save_config "cookie_file" "/data/signet/.cookie"
elif [ "$NETWORK" = "testnet" ]; then
    save_config "cookie_file" "/data/testnet3/.cookie"
elif [ "$NETWORK" = "testnet4" ]; then
    save_config "cookie_file" "/data/testnet4/.cookie"
fi

finalize
