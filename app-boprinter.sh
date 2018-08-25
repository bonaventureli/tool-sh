#!/bin/bash

git clone https://github.com/bonaventureli/boprinter.git || true

cd boprinter
qmake boprinter.pro
make
./boprinter
