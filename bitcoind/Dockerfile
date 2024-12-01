FROM lightninglabs/bitcoin-core:${BITCOIN_VERSION:-25}

COPY start.sh .
RUN chmod +x ./start.sh
COPY bitcoin.conf .
