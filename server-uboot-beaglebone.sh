#!/bin/bash
wget --tries=0 -c https://releases.linaro.org/components/toolchain/binaries/6.4-2017.11/arm-linux-gnueabihf/gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
tar xf gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
export CC=`pwd`/gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
${CC}gcc --version
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
