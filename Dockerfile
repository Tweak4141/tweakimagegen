# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: python3
# Minimum Panel Version: 0.6.0
# ----------------------------------
#Triggered
FROM        python:3.9-slim

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN         apt update \
            && apt -y install git gcc g++ ca-certificates dnsutils curl iproute2 ffmpeg procps imagemagick libmagickwand-dev python-pythonmagick --no-install-recommends \
            && useradd -m -d /home/container container
RUN         source /etc/lsb-release && echo "deb https://download.rethinkdb.com/repository/ubuntu-$DISTRIB_CODENAME $DISTRIB_CODENAME main" | tee /etc/apt/sources.list.d/rethinkdb.list
            wget -qO- https://download.rethinkdb.com/repository/raw/pubkey.gpg | apt-key add -
            apt update
            apt -y install rethinkdb
       

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
