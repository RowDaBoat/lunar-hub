FROM lightninglabs/bitcoin-core:${BITCOIN_VERSION:-28}

COPY start.sh .
RUN chmod +x ./start.sh
RUN mkdir -p /root/.bitcoin
COPY bitcoin.conf /root/.bitcoin/bitcoin.conf
