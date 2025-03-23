FROM ordinals/ord

RUN apt-get update && apt-get install -y curl
COPY poll-bitcoind.sh .
COPY start.sh .
RUN chmod +x ./start.sh ./poll-bitcoind.sh
COPY ord.conf /ord.conf
