#!/usr/bin/env bash
set -e

echo "Install Firefox"

apt-get update && apt-get install -y build-essential curl git libasound2 libgconf-2-4 \
                                         libgtk2.0.0 libnotify-bin libnss3 libxss1
apt-get install -y --no-install-recommends apt-utils
apt-get -y install libgtkextra-dev libgconf2-dev libxtst-dev libxext-dev libxrender-dev x11vnc
curl -sL https://deb.nodesource.com/setup_6.x | bash
apt-get install -y nodejs
apt-get clean && rm -fr /var/lib/apt/lists/*
useradd -ms /bin/bash daedalus
