# litecoind for docker [![CircleCI](https://circleci.com/gh/Neuroware-IO/docker-litecoind.svg?style=svg)](https://circleci.com/gh/Neuroware-IO/docker-litecoind) [![Docker Stars](https://img.shields.io/docker/stars/neuroware/litecoind.svg?style=flat-square)]() [![Docker Pulls](https://img.shields.io/docker/pulls/neuroware/litecoind.svg?style=flat-square)]() [![](https://images.microbadger.com/badges/image/neuroware/litecoind.svg)](https://microbadger.com/images/neuroware/litecoind "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/neuroware/litecoind.svg)](https://microbadger.com/images/neuroware/litecoind "Get your own version badge on microbadger.com")
docker file for litecoind

## Current Litecoind Version
__0.13.2__

## Getting started
### Usage with docker
```bash
# this will generate conf file by default
# not recommend only to run this way, always set your own username and password
docker run neuroware/litecoind

# create docker volume
docker volume create litecoin

# with commands
docker run -v litecoin:/litecoin --rm -it neuroware/litecoind -rpcuser=user -rpcpassword=password -printtoconsole
```

## Development
### Requirements
- vagrant

### Getting started
```bash
vagrant up

vagrant ssh

cd /vagrant

# build docker image
make build
```
