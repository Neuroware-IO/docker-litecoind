# litecoind for docker
docker file for litecoind

## Current Litecoin Version
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
