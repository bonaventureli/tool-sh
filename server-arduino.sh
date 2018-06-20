#!/bin/bash -e
#wget -c https://downloads.arduino.cc/arduino-nightly-linux64.tar.xz
#wget -c https://downloads.arduino.cc/arduino-nightly-linux32.tar.xz
#wget -c https://downloads.arduino.cc/arduino-nightly-linuxarm.tar.xz
#
#wget -c https://downloads.arduino.cc/ide_beta/arduino-1.9.0-beta-linux32.tar.xz
#wget -c https://downloads.arduino.cc/ide_beta/arduino-1.9.0-beta-linux64.tar.xz
#wget -c https://downloads.arduino.cc/ide_beta/arduino-1.9.0-beta-linuxarm.tar.xz
#git clone https://github.com/arduino/Arduino.git
if [ "${1}" == "download" ]; then
 if [ ! -f $PWD/arduino-nightly-linux64.tar.xz ]; then
 wget -c https://downloads.arduino.cc/arduino-nightly-linux64.tar.xz
 xz -dv arduino-nightly-linux64.tar.xz
 tar xvf arduino-nightly-linux64.tar
 fi
cd arduino-nightly
./install.sh
fi
if [ "${1}" == "install" ]; then
sudo apt-get install git make gcc ant openjdk-8-jdk
fi
if [ "${1}" == "remove" ]; then
sudo apt-get remove git make gcc ant openjdk-8-jdk
fi
if [ ! -d $PWD/Arduino ]; then
git clone --depth 1 https://github.com/arduino/Arduino.git
fi
cd Arduino/build
ant dist
ant run
