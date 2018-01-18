#!/bin/sh
#ti-processor-sdk-linux-am335x-evm-04.02.00.09-Linux-x86-Install.bin
myFile=$PWD/ti-processor-sdk-linux-am335x-evm-04.02.00.09-Linux-x86-Install.bin

if [ ! -f "$myFile" ]; then
    wget http://downloads.ti.com/processor-sdk-linux/esd/AM335X/latest/exports/ti-processor-sdk-linux-am335x-evm-04.02.00.09-Linux-x86-Install.bin
fi
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
git clone https://github.com/derekmolloy/exploringbb.git
git clone git://github.com/RobertCNelson/linux-dev.git
git clone https://github.com/RobertCNelson/ti-linux-kernel-dev.git
git checkout origin/ti-linux-4.14.y -b tmp

git clone https://github.com/RobertCNelson/stable-kernel.git
git clone https://github.com/spark3dp/ember-firmware.git
