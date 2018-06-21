#!/bin/bash -e
if [ "${1}" == "install" ]; then
npm install -g bower
npm install -g gulp
fi
if [ ! -d $PWD/print-web-sample ]; then
git clone https://github.com/bonaventureli/print-web-sample.git
fi

cd print-web-sample/server
npm install
node server.js
