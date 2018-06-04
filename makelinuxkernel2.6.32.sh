#!/bin/bash
case ${1} in
	"make")
	    tar xf gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
	    #tar xf gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
	    export CC=`pwd`/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
	    #export CC=`pwd`/gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
	    
	    LINUXKERNELFILE=linux-stable-2.6.32.71.tar.gz
	    LINUXFILE=linux-stable-2.6.32.71
	    
	    tar zxvf $LINUXKERNELFILE
	    cd $LINUXFILE
	    make ARCH=arm CROSS_COMPILE=${CC} distclean
	    make ARCH=arm CROSS_COMPILE=${CC} omap3_evm_defconfig
	    make ARCH=arm CROSS_COMPILE=${CC} menuconfig
	    #make ARCH=arm CROSS_COMPILE=${CC} uImage modules
	    make ARCH=arm CROSS_COMPILE=${CC} 
	;;
	"clean")
	rm -rf gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf
	rm -rf linux-stable-2.6.32.71
	;;
	*)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
	;;
esac
