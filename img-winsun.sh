#!/bin/bash
########################
ls /dev/sd*
read -p "Please input which is your sdcard or (n): " SD
if [ "${SD}" == "sdb" ] || [ "${SD}" == "sdc" ] ||  [ "${SD}" == "sdd" ]; then
	echo "you sdcard is ${SD}"
	fdisk -l /dev/${SD}
	mount
	read -p "which one you need to umount or (n): " umdev
	if [ "${umdev}" == 'n' ] || [ "${umdev}" == 'N' ]; then
		read -p "Do you want to continue to config your SD card? (y/n): " yn
		if [ "${yn}" == 'y' ] || [ "${yn}" == 'Y' ]; then
		fdisk -l /dev/${SD}
		fdisk  /dev/${SD}
		sync
		read -p "Make sure you want to erase ${SD} formate to ext3 (y/n)?" yn
			if [ "${yn}" == 'y' ] || [ "${yn}" == 'Y' ]; then
			mkfs.ext3 -L rootfs /dev/$SD
			fi
		else 
		exit 0
		fi
	else
		umount ${umdev}
	fi
	#umount /dev/${SD}
	#umount /dev/${SD}1
	#umount /dev/${SD}2
	#fdisk /dev/${SD}
#else
#	exit 0
elif [ "${SD}" == "n" ]; then
echo "read edit the image file"	
fi
#p
#d

#x
#h 4
#s 16
#c 477312
#R

#n
#p
#1
#2048
#30547967
#w

#fdisk -l /dev/${SD}
#umount /dev/${SD}1
#umount /dev/${SD}2
#read -p "Are you sure you want to erase ${SD} formate to ext3 ?" yn
	read -p "Do you want to load the image file and edit it? (y/n)?" yn
	if [ "${yn}" == 'n' ] || [ "${yn}" == 'N' ]; then
		exit 0
	fi

read -p "Please input the path and image file eg.(/home/dfa/aaa.img):  " winsunimg
if [  -f ${winsunimg} ]; then
	echo "your image file is ${winsunimg}"
######################################################################################
	kpartx -av ${winsunimg}
	read -p "which loop? (loop0/loop1): " loop
	if [ "${loop}" == "loop0" ] || [ "${loop}" == "loop1" ]; then
		mount /dev/${loop} /media
		echo "mount ${loop} to /media"	
	else 
		umount /dev/${loop} /media
		kpartx -d ${winsunimg}
		exit 0
	fi
#######################################################################################
#fdisk -lu ${winsunimg}	
#echo $((2048*512))
#mount -o loop,offset=1048576 ${winsunimg} /media/
#echo "you mount ${winsunimg} on /media"	
#########################################################################################	
	cat "
	==========================================================
	if your image file have edit finishd, you can umount it and 
	read load your new image file to your SD card.
	Thank you !!!
	=========================================================
	"

	read -p "Do you want to load the image file ${winsunimg} to your SD card (y/n)? " yn
	if [ ${yn} == 'n' ]; then
		umount /dev/${loop} /media
		kpartx -d ${winsunimg}
		exit 0
	elif [ "${yn}" == "y" ]; then
		umount /dev/${loop} /media
		kpartx -d ${winsunimg}
		apt-get install gddrescue 
		ddrescue -f ${winsunimg} ${SD}
	else
		exit 0
		
	fi
###############################################################################################
#	if [ ${yn} == 'n' ]; then
#		umount  /media
#		exit 0
#	elif [ "${yn}" == "y" ]; then
#		umount  /media
#		apt-get install gddrescue 
#		ddrescue -f ${winsunimg} ${SD}
#	else
#		exit 0
#		
#	fi
#############################################################################################
else
	echo "Nothing to be done !"
	exit 0
fi

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
#apt-get install gddrescue 
#ddrescue -f debian-8.2-smith-development-armhf-2016-10-14.img /dev/sdb
