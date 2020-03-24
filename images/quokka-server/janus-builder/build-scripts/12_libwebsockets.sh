#!/bin/bash

git clone https://libwebsockets.org/repo/libwebsockets
cd libwebsockets

git checkout v4.0.1

mkdir build
cd build

cmake -DLWS_MAX_SMP=1 -DCMAKE_INSTALL_PREFIX:PATH=/opt/libwebsockets -DCMAKE_C_FLAGS="-fpic" ..
make
make install
