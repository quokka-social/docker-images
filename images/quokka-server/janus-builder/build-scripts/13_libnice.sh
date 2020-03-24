#!/bin/bash

apt-get install -y \
    gtk-doc-tools

git clone https://gitlab.freedesktop.org/libnice/libnice.git
cd libnice

git checkout 0.1.16

sh autogen.sh

./configure --prefix=/opt/libnice
make
make install
