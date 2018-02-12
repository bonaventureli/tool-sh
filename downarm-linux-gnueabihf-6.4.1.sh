#!/bin/bash
myFile=$PWD/gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz

if [ ! -f "$myFile" ]; then
wget -c https://releases.linaro.org/components/toolchain/binaries/6.4-2017.11/arm-linux-gnueabihf/gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
fi
tar xf gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz

