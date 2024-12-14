FROM lightninglabs/bitcoin-core:${BITCOIN_VERSION:-25}

COPY start.sh .
RUN chmod +x ./start.sh
RUN mkdir /root/.bitcoin
COPY bitcoin.conf /root/.bitcoin/bitcoin.conf
