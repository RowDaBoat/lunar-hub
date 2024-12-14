# Lunar Hub

## Goals

- Help both experienced and new Bitcoiners build nodes from scratch.
- Build a lean, controllable setup using `docker` and `docker-compose`.
- Understand how the ecosystem works.
- Encourage command-line proficiency, avoid falling into Umbrel.
- Write easy-to-read scripts.
- Write a markdown doc explaining the setup process.
- I don't know how to do this, but it's fun, and I can learn.


## Requirements

- Linux
- `docker`
- `docker-compose`


## Running it

Just clone this repository and run:

```bash
docker-compose up
```


## TODO
- [x] run `bitcoind` + `lnd`
- [x] run in `testnet3`
- [x] verify `lnd` is communicating with `bitcoind` propperly through ZeroMQ.
- [ ] allow running `bitcoin-cli` without specifying config, user, and pass
    - [x] move the `datadir` configuration from `start.sh` to `bitcoin.conf`
    - [x] move `bitcoin.conf` to the default dir `/root/.bitcoin/bitcoin.conf`
    - [x] do not generate rpcauth
    - [ ] update setup script
- [x] make `lnd` see `bitcoind`'s authentication cookie.
    - [x] adapt `setup.sh` to properly configure `bitcoind.rpccookie`
    - [x] make `start.sh` read `lnd.conf:bitcoind.rpccookie` properly and wait on it to be ready
    - [x] move `lnd.conf` to its default location
    - [ ] update setup script
- [ ] test it by opening some channels
- [ ] run in `mainnet`
- [ ] services to integrate:
    - [ ] Electrs
    - [ ] RTL
    - [ ] Balance of Satoshi
    - [ ] Nostr


## Useful links
- [bitcoin.conf generator](https://jlopp.github.io/bitcoin-core-config-generator/)
- [lnd.conf generator](https://0xbeefcaf3.github.io/LND-config-generator/#config=eyJiaXRjb2luIjp7ImJpdGNvaW4uYWN0aXZlIjoxfX0=)
