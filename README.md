# Cardano Yourself ![alt text](https://s2.coinmarketcap.com/static/img/coins/32x32/2010.png "Cardano Logo")
This is work in progress (under heavy construction). Please feel free to participate.

### Goal:
Build a setup of containers for all flavours (k8s, docker, ....) so that you can host and build it where every you want and to start staking (when released).

Make it as easy as possible for everybody to participate and setup Cardano on their own machines.

## Containers
The containers are prepared in such a way, that they can be run on their own.
### Cardano SL (WIP)

#### Usage

#### ToDos
- tests
- optimise build

### Daedalus Wallet (WIP)
The container is using a headless VNC environment. This means you can run the container somewhere and connect to it using VNC. The possibility of accessing the container through your browser is possible using [**noVNC**](https://github.com/kanaka/noVNC)

Daedalus gets installed on top of a modified version of [ConSol/docker-headless-vnc-container](https://github.com/ConSol/docker-headless-vnc-container).

Each Docker image is installed with the following components:

* Desktop environment [**Xfce4**](http://www.xfce.org)
* VNC-Server (default VNC port `5901`)
* [**noVNC**](https://github.com/kanaka/noVNC) - HTML5 VNC client (default http port `6901`)

![alt text](https://github.com/khwerhahn/cardano/blob/master/.pics/vnc-daedalus.png)

#### Usage
Run command with mapping to local port `5901` (vnc protocol) and `6901` (vnc web access):

    docker run -d -p 5901:5901 -p 6901:6901 khwhahn/daedalus

Change the default user and group within a container to your own with adding `--user $(id -u):$(id -g)`:

    docker run -d -p 5901:5901 -p 6901:6901 --user $(id -u):$(id -g) khwhahn/daedalus

If you want to get into the container use interactive mode `-it` and `bash`     

    docker run -it -p 5901:5901 -p 6901:6901 khwhahn/daedalus bash

Build an image from scratch:

    docker build -t ImageName ./daedalus

=> connect via __VNC viewer `localhost:5901`__, default password: `vncpassword`

=> connect via __noVNC HTML5 client__: [http://localhost:6901/?password=vncpassword]()

#### ToDos
- Clean up docker build from useless packages
- optimise and reduce build
- improve default security
- tests
- Add startup shortcuts to desktop

### Monitoring App (custom app for network stats etc) (Not started yet)
Run a little interactive app to show real time statistics for the cardano network.

## Kubernetes (k8s) (WIP):
In the k8s folder are the `.yaml` definitions of setting up the containers.
#### Usage
#### ToDos
- finish definitions

## Docker Compose (WIP)
#### Usage
#### ToDos
- finish definitions

## Cloud Platforms
In the folder `cloud-platforms` are the setup scripts and/or guides.
### Google Cloud Engines (WIP)
in the `google-cloud` directory you will find the build script (and cleanup script) to create a kubernetes cluster to run cardano.
#### Usage
#### ToDos
- finish build script
### AWS (WIP)
Not started yet

## Help Wanted
I'm looking for some help to maintain and improve this project. Please feel free to PM me. Best to reach me via [Twitter](https://twitter.com/khwhahn)

## Thanks
Thanks to IOHK and the whole Cardano team for setting new standards within the crypto space!

# Say thanks by sending some $ADA
DdzFFzCqrhtCKFBXEwqVvJfGo4YLBseL8x5yPzahhszRiQwjDQVYUXAd5fjh3oni5ztdaRaUik2U8UYBLVePVuDP5o8rVEPF3ormJ13z
