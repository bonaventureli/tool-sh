#!/bin/bash
if [ ! -d $PWD/BO_LAN_IM ]; then
git clone https://github.com/bonaventureli/BO_LAN_IM.git
fi
cd BO_LAN_IM/IMClient
qmake IMClient.pro
qmake
make
./IMClient
