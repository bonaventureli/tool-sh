#!/bin/bash
ls /dev/sd*
read -p "please input your sd (sdb)" SD
fdisk /dev/$SD

#p
###delect part 1 2 3 ...
##d
##1
##
###32G sd-card
##x
##h 255
##s 63
##c 4079    C=SD-card bytes/H*S*512  34359738368/255/63/512
##R
#####################################
## ember-dev
##x
##h 4
##s 16
##c 477312   
##R

###part-one
##n
##p 1
##2048
##30547967
####################################
###part-one
##n
##p 1
##2048
##+2G
###part-two
##n
##p 2
##4196352
##+6G
###set as FAT32 part
##t
##1
##c
### set as main part *
##a
##1
##
##w
##
mkfs.vfat -F 32 -n boot /dev/"$SD"1
mkfs.ext3 -L rootfs /dev/"$SD"2

sudo fdisk -l /dev/$SD
sudo parted -l /dev/$SD
df -h /dev/$SD
