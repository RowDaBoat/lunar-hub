#!/bin/bash

. ../core_setup.sh

prepare "bitcoin.conf"

authorization=$(python3 rpcauth.py user -j)
rpcauth=$(echo $authorization | jq -r '.rpcauth')

save_config "rpcauth" $rpcauth
prompt_config "Chain (main|test|signet|regtest)" "chain" "test"
prompt_config "Enable debug?" "debug" "1"

finalize


echo "$authorization" | jq > rpcauth.secret
echo "Configuration saved: 'rpcauth.secret'."
echo "This secret file is in '.gitignore'."
