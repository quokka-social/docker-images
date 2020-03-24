#!/bin/bash

git clone https://github.com/sctplab/usrsctp
cd usrsctp

./bootstrap

./configure --prefix=/opt/usrsctp
make
make install
