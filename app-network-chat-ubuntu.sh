#!/bin/bash -e
if [ ! -d $PWD/libexample-4.8.6 ]; then
git clone https://github.com/bonaventureli/libexample-4.8.6.git
fi
QMAKENAME=$(which qmake)
APPNAME=ubuntu-chat
FROMNAME=libexample-4.8.6/network/network-chat       
	mkdir $APPNAME || true
        cp -r $FROMNAME/* $APPNAME
        cd $APPNAME
        $QMAKENAME network-chat.pro
        $QMAKENAME
        make
        ./network-chat

