#!/bin/bash
DIR=$PWD
DOWNLOADFILE=gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
if [ -f $PWD/$DOWNLOADFILE ]; then
	md5sum $DOWNLOADFILE > $DOWNLOADFILE.md5sum
	if [ `cat gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz.md5sum | awk -v tem="7c80d2ca5544abcf750f8ca608284a2f" '{print($1>tem)? "1":"0"}'` -eq "0" ]; then
		echo "need not download gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz"
	else
wget --tries=0 -c https://releases.linaro.org/components/toolchain/binaries/6.4-2017.11/arm-linux-gnueabihf/gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
fi
fi
tar xf gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
export CC=`pwd`/gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
${CC}gcc --version
if [ ! -d $PWD/u-boot ]; then
git clone https://github.com/u-boot/u-boot 
fi
cd u-boot/
git checkout v2018.01 -b tmp || echo "tmp alread exists"
if [ ! -f $PWD/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch ]; then
wget -c https://rcn-ee.com/repos/git/u-boot-patches/v2018.01/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
wget -c https://rcn-ee.com/repos/git/u-boot-patches/v2018.01/0002-U-Boot-BeagleBone-Cape-Manager.patch
  
patch -p1 < 0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
patch -p1 < 0002-U-Boot-BeagleBone-Cape-Manager.patch
fi
make ARCH=arm CROSS_COMPILE=${CC} distclean
make ARCH=arm CROSS_COMPILE=${CC} am335x_evm_defconfig
make ARCH=arm CROSS_COMPILE=${CC}
echo "******************************************"
echo "compiled u-boot,Thank you for waiting!"
echo "******************************************"
