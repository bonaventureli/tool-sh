#!/bin/bash
#http://git.denx.de/?a=project_list;pf=u-boot
#http://git.denx.de/?p=u-boot%2Fu-boot-ti.git&a=search&h=HEAD&st=commit&s=am335x
#http://git.denx.de/?p=u-boot%2Fu-boot-ti.git&a=search&h=HEAD&st=commit&s=beaglebone
#http://git.denx.de/?p=u-boot%2Fu-boot-imx.git&a=search&h=HEAD&st=commit&s=imx6q
git clone https://github.com/u-boot/u-boot


#how to use
#make ARCH=arm CROSS_COMPILE=${CC} distclean
#make ARCH=arm CROSS_COMPILE=${CC} am335x_evm_defconfig
#make ARCH=arm CROSS_COMPILE=${CC}

