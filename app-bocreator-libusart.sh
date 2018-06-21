#!/bin/bash -e

git clone https://github.com/bonaventureli/bocreator-libusart.git || true

cd bocreator-libusart
qmake appB9Creator.pro
make
./appB9Creator
