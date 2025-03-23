#!/bin/bash

echo "Waiting for bitcoind's cookie file to be created..."
while [ ! -f $1 ]; do
  sleep 1
done

cookie="$(cat $1)"
data='{"jsonrpc":"1.0","id":"curltext","method":"getblockchaininfo","params":[]}'
content_header='content-type: text/plain;'
url="http://bitcoind:8332/"

echo "Waiting for bitcoind RPC to be available..."
while ! curl --silent --fail --user $cookie --data-binary $data -H $content_header $url > /dev/null; do
  sleep 1
done
