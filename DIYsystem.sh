#!/bin/bash
#ARM Cross Compiler: GCC
wget -c https://releases.linaro.org/components/toolchain/binaries/6.4-2017.11/arm-linux-gnueabihf/gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
tar xf gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
export CC=`pwd`/gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-

#Bootloader: U-Boot
git clone https://github.com/u-boot/u-boot
cd u-boot/
git checkout v2018.01 -b tmp

wget -c https://rcn-ee.com/repos/git/u-boot-patches/v2018.01/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
wget -c https://rcn-ee.com/repos/git/u-boot-patches/v2018.01/0002-U-Boot-BeagleBone-Cape-Manager.patch
  
patch -p1 < 0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
patch -p1 < 0002-U-Boot-BeagleBone-Cape-Manager.patch

make ARCH=arm CROSS_COMPILE=${CC} distclean
make ARCH=arm CROSS_COMPILE=${CC} am335x_evm_defconfig
make ARCH=arm CROSS_COMPILE=${CC}

#Linux Kernel
git clone https://github.com/RobertCNelson/bb-kernel
cd bb-kernel/

#git checkout origin/am33x-v4.4 -b tmp
#git checkout origin/am33x-rt-v4.4 -b tmp
#git checkout origin/am33x-v4.9 -b tmp
#git checkout origin/am33x-rt-v4.9 -b tmp
#git checkout origin/am33x-v4.14 -b tmp
#git checkout origin/am33x-rt-v4.14 -b tmp
git checkout origin/am33x-v4.15 -b tmp
./build_kernel.sh

#Root File System
wget -c https://rcn-ee.com/rootfs/eewiki/minfs/debian-9.3-minimal-armhf-2017-12-09.tar.xz
tar xf debian-9.3-minimal-armhf-2017-12-09.tar.xz

