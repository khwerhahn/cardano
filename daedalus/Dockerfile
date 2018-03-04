FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y build-essential libssl-dev \
                bzip2 curl git libasound2 libgconf-2-4 \
                libgtk2.0.0 libnotify-bin libnss3 libxss1 \
                xfce4 xfce4-goodies tightvncserver
RUN apt-get install -y --no-install-recommends apt-utils
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs
RUN apt-get clean && rm -fr /var/lib/apt/lists/*
RUN useradd -ms /bin/bash daedalus

WORKDIR /home/daedalus
USER daedalus
RUN npm i -D electron@latest
RUN git clone https://github.com/input-output-hk/daedalus.git
WORKDIR /home/daedalus/daedalus
RUN mkdir -p node_modules/daedalus-client-api
RUN npm install && npm run package
RUN cp installers/ca.conf installers/client.conf installers/server.conf .
RUN bash installers/build-certificates-unix.sh
RUN rm -f tls/server.key && ln -s tls/server/server.key tls/server.key
RUN rm -f tls/server.cert && ln -s tls/server/server.crt tls/server.cert
RUN rm ca.conf client.conf server.conf

CMD npm start
