#!/bin/bash
########################
#fdisk -lu debian-8.2-smith-development-armhf-2016-10-14.img 
#echo $((2048*512))
#mount -o loop,offset=1048576 debian-8.2-smith-development-armhf-2016-10-14.img /media/
#cd /media/
#umount /media
###################################
#kpartx -av debian-8.2-smith-development-armhf-2016-10-14.img
#mount /dev/loop0 /media
#umount /dev/loop0 /media
#kpartx -d debian-8.2-smith-development-armhf-2016-10-14.img
apt-get install gddrescue 
ddrescue -f debian-8.2-smith-development-armhf-2016-10-14.img /dev/sdb
