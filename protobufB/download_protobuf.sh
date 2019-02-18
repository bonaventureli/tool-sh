#!/bin/bash
git clone https://github.com/protocolbuffers/protobuf.git
cd protobuf
sudo apt-get install autoconf automake libtool
./autogen.sh
./configure --prefix=/home/andy/
make
make check
make install
./protoc --version
