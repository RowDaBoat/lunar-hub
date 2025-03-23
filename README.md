# nodrop.btc
_No Drama Operations for Bitcoin and frens._


## What's nodrop.btc?
- An easily extensible bare-bones approach to DevOps on Bitcoin that minimizes dependencies.
- `nodrop.btc` integrates well-known Bitcoin-related services in a simple way using `docker` to run and manage services.
- Configurations aim to be as simple as possible, generated with guided scripts, but still retaining the full customization options of each service.
- Startup scripts solve usual pitfalls such as waiting for other services to be available.
- Encourages newcomers to install Bitcoin's ecosystem services without the hassle.


## Requirements
Any Linux machine with `Linux`, `git`, and `docker`.
- No full OS installs.
- No special hardware.
- No drama.


## Getting Started
Clone this repository and start `bitcoind`, `lnd`, and `ord`:
```bash
git clone https://github.com/RowDaBoat/nodrop.btc
cd nodrop.btc
./bitcoin-group.sh up -d
```

Stop all three any time with:
```
./bitcoin-group.sh down
```

The `*-group.sh` scripts wrap `docker compose` for convenience. Any one of the services can be started or stopped individually with regular `docker compose` commands:
```
docker compose up -d lnd
docker compose down lnd
```


## Configuring a service
Each service has a `setup.sh` script in its folder. For example, to configure `bitcoind`, run the setup script, stop the service if running, and then rebuild and restart the service:
```
cd bitcoind
./setup.sh
cd ..
docker compose down bitcoind
docker compose up -d --build bitcoind
```


## Integrated Services
### Bitcoin Group
- `bitcoind`: [Bitcoin](https://github.com/bitcoin/bitcoin). Full node for the Bitcoin network.
- `lnd`: Bitcoin's Layer 2, the [Lightning Network](https://github.com/lightningnetwork/lnd).
- `ord`: [Ordinals](https://github.com/ordinals/ord) indexing service.

### Web Group
- `nipple-05`: a bare-bones implementation of [Nostr's NIP-05](https://github.com/nostr-protocol/nips/blob/master/05.md) internet identifiers.
- `nginx-proxy`: an [nginx](https://github.com/nginx/nginx) configured as a proxy for web services.


## Service Structure
Each service has:
- An entry in the root `docker-compose.yml` detailing the service name and where to locate the actual service's `docker-compose.yml` file.
- A directory named after the service containing a `docker-compose.yml` file describing the service's container, the volumes it requires, the ports it uses, and which network it connects to.

Additionally, the service's directory may include:
- `setup.sh`: a script used to generate configuration files.
- `<service-name>.conf`: a default configuration, this file will be overwritten by `setup.sh`.
- `start.sh`: runs the service with some preset options designed to ease configuration.
- `Dockerfile`: builds the service. It's used if a Docker image was not made publicly available by the original developer of the service.
