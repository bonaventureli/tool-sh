#!/bin/bash
if [ ! -d $PWD/qt-tcpip ]; then
git clone https://github.com/bonaventureli/qt-tcpip.git
fi
cd qt-tcpip/server
qmake -project
sed -i "4iQT += network" server.pro
(
cat << EOF
TARGET = server
EOF
)>> server.pro
	qmake 
	make
	./server
