#!/bin/bash
#https://github.com/eewiki/u-boot-patches
#https://rcn-ee.com/repos/git/u-boot-patches

wget -c https://rcn-ee.com/repos/git/u-boot-patches/v2018.01/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
wget -c https://rcn-ee.com/repos/git/u-boot-patches/v2018.01/0002-U-Boot-BeagleBone-Cape-Manager.patch

#or

#wget -c https://github.com/eewiki/u-boot-patches/blob/master/v2018.01/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
#wget -c https://github.com/eewiki/u-boot-patches/blob/master/v2018.01/0002-U-Boot-BeagleBone-Cape-Manager.patch


#how to use
#patch -p1 < 0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
#patch -p1 < 0002-U-Boot-BeagleBone-Cape-Manager.patch
