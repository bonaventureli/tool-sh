#!/bin/bash
myFile=$PWD/debian-9.3-minimal-armhf-2017-12-09.tar.xz

if [ ! -f "$myFile" ]; then
wget -c https://rcn-ee.com/rootfs/eewiki/minfs/debian-9.3-minimal-armhf-2017-12-09.tar.xz
fi
tar xf debian-9.3-minimal-armhf-2017-12-09.tar.xz
