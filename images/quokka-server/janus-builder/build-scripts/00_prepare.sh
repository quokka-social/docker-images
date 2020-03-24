#!/bin/bash

apt-get -y update
apt-get -y upgrade

apt-get install -y \
    pkg-config \
    gengetopt \
    libtool \
    automake \
    cmake
