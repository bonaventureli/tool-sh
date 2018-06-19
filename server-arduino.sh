#!/bin/bash -e
#wget -c https://downloads.arduino.cc/arduino-nightly-linux64.tar.xz
#wget -c https://downloads.arduino.cc/arduino-nightly-linux32.tar.xz
#wget -c https://downloads.arduino.cc/arduino-nightly-linuxarm.tar.xz
#
#wget -c https://downloads.arduino.cc/ide_beta/arduino-1.9.0-beta-linux32.tar.xz
#wget -c https://downloads.arduino.cc/ide_beta/arduino-1.9.0-beta-linux64.tar.xz
#wget -c https://downloads.arduino.cc/ide_beta/arduino-1.9.0-beta-linuxarm.tar.xz
git clone https://github.com/arduino/Arduino.git

sudo apt-get install git make gcc ant openjdk-8-jdk
git clone --depth 1 https://github.com/arduino/Arduino.git
cd /path/to/arduino/build
ant dist
ant run
