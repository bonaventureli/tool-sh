#!/bin/sh
#copy as "system.sh" and tweak for your system

ARCH=$(uname -m)

#ARM Native gcc compiler (running gcc on arm target)
if [ "x${ARCH}" = "xarmv7l" ] ; then
	#Native arm gcc compiler
	echo "Using: Native armv71 gccCompiler"
	CC=
else
        echo "Using: Cross Compiler"
        CC=/home/andy/beaglebone/linux-dev/dl/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-

fi

###REQUIRED:
ZRELADDR=0x80008000
#ARM GCC CROSS Compiler:
#if CC is not set, a known working linaro based gcc compiler will be downloaded and utilized.
#CC=<enter full path>/bin/arm-none-eabi-
#CC=<enter full path>/bin/arm-linux-gnueabi-
#CC=<enter full path>/bin/arm-linux-gnueabihf-

###OPTIONAL:

###OPTIONAL: CORES: number of CPU cores to use for compilation
#CORES=4

###OPTIONAL: LINUX_GIT: specify location of locally cloned git tree.
#
#LINUX_GIT=/home/user/linux-stable/
#LINUX_GIT=/home/andy/beaglebone/linux-stable/

###OPTIONAL: MMC: (REQUIRED FOR RUNNING: tools/install_kernel.sh)
#Note: This operates on raw disks, NOT PARTITIONS..
#
#WRONG: MMC=/dev/mmcblk0p1
#CORRECT: MMC=/dev/mmcblk0
#
#WRONG: MMC=/dev/sde1
#CORRECT: MMC=/dev/sde
#
#MMC=/dev/sde
#MMC=/dev/sdd
MMC=/dev/sdb
#MMC=/dev/sdc

###ADVANCED: RUN_BISECT: used with ./scripts/bisect.sh
#
#RUN_BISECT=1

###ADVANCED: AUTO_BUILD: Easier integration with Jenkins/Buildbot/etc..
#
#AUTO_BUILD=1
