#!/bin/bash
if [ ! -d $PWD/tcpip1 ]; then
git clone https://github.com/bonaventureli/tcpip1.git
fi
cd tcpip1
qmake -project
sed -i "4iQT += network" tcpip1.pro
(
cat << EOF
TARGET = tcpip1
EOF
)>> tcpip1.pro
	qmake 
	make
	./tcpip1
