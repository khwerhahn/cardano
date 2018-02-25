FROM ubuntu:16.04

# Install basic requirements and create cardano user
RUN apt-get update && apt-get install -y bzip2 curl git
RUN apt-get clean && rm -fr /var/lib/apt/lists/*
RUN useradd -ms /bin/bash cardano

# Install nix as cardano user
RUN mkdir /nix && chown cardano /nix
RUN mkdir -p /etc/nix
COPY nix.conf /etc/nix/
USER cardano
# The nix install script needs USER to be set
ENV USER cardano
RUN curl https://nixos.org/nix/install | sh

# Clone and build cardano-sl
WORKDIR /home/cardano
RUN git clone https://github.com/input-output-hk/cardano-sl.git
WORKDIR /home/cardano/cardano-sl
RUN git checkout master
RUN nix-build -A connectScripts.mainnetWallet -o connect-to-mainnet

CMD ./connect-to-mainnet
