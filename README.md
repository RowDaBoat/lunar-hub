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

For now, just run:
```bash
docker-compose up
```

## TODO
- [x] run `bitcoind` + `lnd`
- [x] run in `testnet3`
- [x] verify `lnd` is communicating with `bitcoind` propperly through ZeroMQ.
- [ ] check Balance of Satoshi.

## Development Notes
- [Configuring `bitcoind` to work with `lnd`](https://github.com/lightningnetwork/lnd/blob/master/docs/INSTALL.md#bitcoind-options)

- Running a basic `lnd`:
```bash
docker run -d --name lnd-testnet lightninglabs/lnd:v0.14.1-beta --bitcoin.active --bitcoin.testnet --bitcoin.node=neutrino --neutrino.connect=faucet.lightning.community
```
