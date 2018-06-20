#!/bin/bash
if [ ! -d $PWD/qt-tcpip ]; then
git clone https://github.com/bonaventureli/qt-tcpip.git
fi
cd qt-tcpip/client
qmake -project
sed -i "4iQT += network" client.pro
(
cat << EOF
TARGET = client
EOF
)>> client.pro
	qmake 
	make
	./client
