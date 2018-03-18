FROM ubuntu:16.04

ENV REFRESHED_AT 2018-03-17

LABEL io.k8s.description="Headless VNC Container with Xfce window manager, firefox and chromium" \
      io.k8s.display-name="Headless VNC Container based on Ubuntu" \
      io.openshift.expose-services="6901:http,5901:xvnc" \
      io.openshift.tags="vnc, ubuntu, xfce" \
      io.openshift.non-scalable=true

## Connection ports for controlling the UI:
# VNC port:5901
# noVNC webport, connect via http://IP:6901/?password=vncpassword
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901
EXPOSE $VNC_PORT $NO_VNC_PORT

### Envrionment config
ENV HOME=/headless \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=/headless/install \
    NO_VNC_HOME=/headless/noVNC \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1024 \
    VNC_PW=vncpassword \
    VNC_VIEW_ONLY=false
WORKDIR $HOME

### Add all install scripts for further steps
ADD ./src/common/install/ $INST_SCRIPTS/
ADD ./src/ubuntu/install/ $INST_SCRIPTS/
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +

### Install some common tools
RUN $INST_SCRIPTS/tools.sh
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

### Install xvnc-server & noVNC - HTML5 based VNC viewer
RUN $INST_SCRIPTS/tigervnc.sh
RUN $INST_SCRIPTS/no_vnc.sh

### Install xfce UI
RUN $INST_SCRIPTS/xfce_ui.sh
ADD ./src/common/xfce/ $HOME/

### Install firefox browser
RUN $INST_SCRIPTS/firefox.sh

### configure startup
RUN $INST_SCRIPTS/libnss_wrapper.sh
ADD ./src/common/scripts $STARTUPDIR
RUN $INST_SCRIPTS/set_user_permission.sh $STARTUPDIR $HOME

### Install Daedalus
RUN apt-get update && apt-get install -y build-essential curl git libasound2 libgconf-2-4 \
                                         libgtk2.0.0 libnotify-bin libnss3 libxss1
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get -y install libgtkextra-dev libgconf2-dev libxtst-dev libxext-dev libxrender-dev x11vnc
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs
RUN apt-get clean && rm -fr /var/lib/apt/lists/*
WORKDIR /home/daedalus
RUN git clone https://github.com/input-output-hk/daedalus.git
WORKDIR /home/daedalus/daedalus
RUN mkdir -p node_modules/daedalus-client-api
# remove electron packager
RUN $INST_SCRIPTS/ignore-electron-packager.sh
WORKDIR /home/daedalus/daedalus
RUN npm install && npm run build
RUN cp installers/ca.conf installers/client.conf installers/server.conf .
RUN bash installers/build-certificates-unix.sh
RUN rm -f tls/server.key && ln -s tls/server/server.key tls/server.key
RUN rm -f tls/server.cert && ln -s tls/server/server.crt tls/server.cert
RUN rm ca.conf client.conf server.conf

USER 1984

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--tail-log"]
