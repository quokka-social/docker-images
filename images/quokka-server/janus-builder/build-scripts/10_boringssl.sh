#!/bin/bash

apt-get install -y \
    golang

git clone https://boringssl.googlesource.com/boringssl
cd boringssl

mkdir -p build
cd build

cmake -DCMAKE_CXX_FLAGS="-lrt" ..
make

cd ..

mkdir -p /opt/boringssl
cp -R include /opt/boringssl/
mkdir -p /opt/boringssl/lib
cp ./build/ssl/libssl.a /opt/boringssl/lib/
cp ./build/crypto/libcrypto.a /opt/boringssl/lib/
