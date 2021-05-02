# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: python3
# Minimum Panel Version: 0.6.0
# ----------------------------------
#Triggered
FROM        python:3.9-slim

LABEL       author="Tweak4141" maintainer="tweak@daftscientist.com"

RUN         apt update \
            && apt -y install git gcc g++ ca-certificates dnsutils curl iproute2 ffmpeg procps imagemagick libmagickwand-dev python-pythonmagick --no-install-recommends \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
