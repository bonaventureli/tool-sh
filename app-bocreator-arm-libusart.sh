#!/bin/bash -e

git clone https://github.com/bonaventureli/bocreator-arm-libusart.git || true

cd bocreator-arm-libusart
qmake appB9Creator.pro
make
./appB9Creator
