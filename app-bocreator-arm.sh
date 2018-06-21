#!/bin/bash -e

git clone https://github.com/bonaventureli/bocreator-arm.git || true

cd bocreator-arm
qmake appB9Creator.pro
make
