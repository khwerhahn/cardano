https://s2.coinmarketcap.com/static/img/coins/32x32/2010.png

# Cardano

This is work in progress (under heavy construction). Please feel free to participate.

## Goal:
Build a setup of containers for all flavours (k8s, docker swarm, docker....) so that you can host and build it where every you want and to start staking (when released).

Make it as easy as possible for everybody to participate and setup Cardano on their own machines.

## Containers
### Cardano SL (WIP)

#### Usage
Coming soon

#### ToDos
Coming soon

### Daedalus Wallet (WIP)
The container is using a headless VNC environment. This means you can run the container somewhere and connect to it using VNC.

Daedalus gets installed on a modified version of [ConSol/docker-headless-vnc-container](https://github.com/ConSol/docker-headless-vnc-container).

#### Usage
Coming soon

#### ToDos
- Clean up docker build from useless packages
- optimise build and startup

### Monitoring App (custom app for network stats etc) (Not started yet)

## Kubernetes (k8s) (WIP):
In the k8s folder are the `.yaml` definitions of setting up the containers.

## Docker Compose (WIP)

## Cloud Platforms
In the folder `cloud-platforms` are the setup scripts and/or guides.
### Google Cloud Engines (WIP)
in the `google-cloud` directory you will find the build script (and cleanup script) to create a kubernetes cluster to run cardano.
### AWS (WIP)
Not started yet

## Help Wanted
I'm looking for some help to maintain and improve this project. Please feel free to PM me. Best to reach me via [Twitter](https://twitter.com/khwhahn)

## Thanks
Thanks to IOHK and the whole Cardano team for setting new standards within the crypto space!

# Say thanks by sending some $ADA
DdzFFzCqrhtCKFBXEwqVvJfGo4YLBseL8x5yPzahhszRiQwjDQVYUXAd5fjh3oni5ztdaRaUik2U8UYBLVePVuDP5o8rVEPF3ormJ13z
