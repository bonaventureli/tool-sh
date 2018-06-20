#!/bin/bash
if [ ! -d $PWD/tcpip2 ]; then
git clone https://github.com/bonaventureli/tcpip2.git
fi

	cd tcpip2
	qmake -project
	sed -i "4iQT += network" tcpip2.pro
(
cat << EOF
TARGET = tcpip2
EOF
)>> tcpip2.pro
	qmake 
	make
	./tcpip2
