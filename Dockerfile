FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV DOWNLOADS_DIRECTORY="/tmp/lancache-autofill" \
  STEAMCMD_PATH="/usr/games/steamcmd" \
  STEAM_API_KEY=""

COPY / /app

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    gnupg \
    gpg-agent \
    lib32gcc1 \
    nano \
    openssh-client \
    tar \
    expect \
    wget \
    software-properties-common \
    zip \
    unzip && \
    cd /tmp && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && \
  echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main" | tee /etc/apt/sources.list.d/ondrej.list && \
  add-apt-repository multiverse && \
  dpkg --add-architecture i386 && \
  echo steam steam/question select "I AGREE" | debconf-set-selections && \
  echo steam steam/license note '' | debconf-set-selections && \
  apt-get update && apt-get install -y --no-install-recommends \
    lib32gcc-s1 \
    steamcmd \
    composer \
    php7.2-cli \
    php7.2-mbstring \
    php7.2-sqlite \
    php7.2-bcmath \
    php7.2-dom && \
  ln -sf /usr/games/steamcmd /usr/bin/steamcmd && \
  apt-get autoremove -q -y && \
  rm -rf /var/lib/apt/lists/* && \
  cd /app && composer install

ENTRYPOINT [ "/app/entrypoint.sh" ]
CMD "/bin/bash"