#!/bin/bash -e
git clone https://github.com/bonaventureli/IIC.git || true
mkdir -p IIC/build
cd IIC/build
cmake ..
make
./winsun
