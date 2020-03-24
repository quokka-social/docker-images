#!/bin/bash

apt-get install -y \
    libmicrohttpd-dev \
    libjansson-dev \
    libssl-dev \
    libsrtp2-dev \
    libsofia-sip-ua-dev \
    libglib2.0-dev \
    libopus-dev \
    libogg-dev \
    libcurl4-openssl-dev \
    liblua5.3-dev \
    libconfig-dev \
    libavutil-dev \
    libavcodec-dev \
    libavformat-dev

git clone https://github.com/meetecho/janus-gateway.git
cd janus-gateway

git checkout v0.9.1

export PKG_CONFIG_PATH="/opt/libwebsockets/lib/pkgconfig:/opt/libnice/lib/pkgconfig"

export CFLAGS="-I/opt/usrsctp/include -I/opt/libwebsockets/include -I/opt/libnice/include"
export LDFLAGS="-L/opt/usrsctp/lib -L/opt/libwebsockets/lib -L/opt/libnice/lib"

sh autogen.sh

./configure \
    --prefix=/opt/janus \
    --enable-boringssl \
    --enable-data-channels \
    --disable-rabbitmq \
    --disable-mqtt \
    --enable-websockets \
    --enable-websockets-event-handler \
    --enable-gpl \
    --enable-libopus \
    --enable-dtls-settimeout \
    --disable-plugin-echotest \
    --disable-plugin-recordplay \
    --disable-plugin-sip \
    --disable-plugin-videocall \
    --disable-plugin-voicemail \
    --disable-plugin-textroom \
    --disable-plugin-streaming \
    --disable-plugin-videoroom \
    --enable-plugin-audiobridge \
    --disable-plugin-nosip \
    --enable-all-handlers

make
make install
make configs
