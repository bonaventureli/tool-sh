#!/bin/bash
if [ ! -d $PWD/appmain ]; then
git clone https://github.com/bonaventureli/appmain.git
fi
cd appmain
qmake -project
qmake
make
./appmain
