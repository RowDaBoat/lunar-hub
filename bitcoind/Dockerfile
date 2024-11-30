FROM lightninglabs/bitcoin-core:${BITCOIN_VERSION:-25}

COPY start-bitcoind.sh .
RUN chmod +x ./start-bitcoind.sh
COPY bitcoin.conf .
