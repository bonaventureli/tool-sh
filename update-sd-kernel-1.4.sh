#!/bin/bash
export DISK=/dev/sdb

sudo dd if=/dev/zero of=${DISK} bs=1M count=10
sudo dd if=/samba-ubuntu/u-boot/MLO of=${DISK} count=1 seek=1 bs=128k
sudo dd if=/samba-ubuntu/u-boot/u-boot.img of=${DISK} count=2 seek=1 bs=384k

sudo sfdisk --unit M ${DISK} <<-__EOF__
4,,L,*
__EOF__

sudo mkfs.ext4 -L rootfs ${DISK}1
sudo mkdir -p /media/rootfs/
sudo mount ${DISK}1 /media/rootfs/
echo " your ${DISK}1 mount on /media/rootfs"
tar xvf /samba-ubuntu/rootfs-4.15.0-rc5-armv7-devel-r22.tar -C /media
