FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV DOWNLOADS_DIRECTORY="/tmp/lancache-autofill" \
  STEAMCMD_PATH="/steam/steamcmd.sh" \
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
    zip \
    unzip && \
    cd /tmp && \
    mkdir /steam && cd /steam && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar xvf steamcmd_linux.tar.gz && rm steamcmd_linux.tar.gz && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && \
  echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main" | tee /etc/apt/sources.list.d/ondrej.list && \
  apt-get update && apt-get install -y --no-install-recommends \
    composer \
    php7.2-cli \
    php7.2-mbstring \
    php7.2-sqlite \
    php7.2-bcmath \
    php7.2-dom && \
  cd /app && composer install

ENTRYPOINT [ "/app/entrypoint.sh" ]