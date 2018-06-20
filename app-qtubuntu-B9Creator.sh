#!/bin/bash

QMAKENAME=$(which qmake)

if [ ! -d $PWD/B9Creator ]; then
git clone https://github.com/B9Creations/B9Creator.git
fi

cd B9Creator/Root/B9Creator
$QMAKENAME B9Creator.pro
$QMAKENAME
make
./B9Creator


