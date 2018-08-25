#!/bin/bash -e

git clone https://github.com/bonaventureli/bocreator.git || true

cd bocreator
qmake appB9Creator.pro
make 
./appB9Creator
