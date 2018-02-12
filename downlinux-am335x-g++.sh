#!/bin/bash
#linux-am335x-g++
read -p "Your dir is ../qt-everywhere-opensource-src-4.8.6:(y/n)" YN
if [ $YN == 'Y' ] || [ $YN == 'y' ]; then
if [ ! -d $PWD/mkspecs/qws/linux-am335x-g++ ]; then
mkdir $PWD/mkspecs/qws/linux-am335x-g++
git clone https://github.com/bonaventureli/linux-am335x-g-.git $PWD/mkspecs/qws/linux-am335x-g++
fi
else
exit 0
fi
