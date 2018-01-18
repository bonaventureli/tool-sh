#!/bin/bash

ls /dev/sd*
export DISK=/dev/sdd
sudo dd if=/dev/zero of=${DISK} bs=1M count=10
sudo dd if=/home/andy/u-boot/MLO of=${DISK} count=1 seek=1 conv=notrunc bs=128k
sudo dd if=/home/andy/u-boot/u-boot.img of=${DISK} count=2 seek=1 conv=notrunc bs=384k

sudo sfdisk --in-order --Linux --unit M ${DISK} <<-__EOF__

1,,0x83,*

__EOF__
#########################################################
sudo dd if=/dev/zero of=${DISK} bs=1M count=1000
sudo sfdisk --in-order --Linux --unit M ${DISK} << EOF
1,48,0xE,*
,,,-
EOF
fdisk -l ${DISK}
sudo mkfs.vfat -F 16 ${DISK}1 -n boot
sudo mkfs.ext4  ${DISK}2 -L rootfs
##########################################################
sudo mkfs.ext4 ${DISK}1 -L rootfs
sudo mkdir -p /media/rootfs/
sudo mount ${DISK}1 /media/rootfs/




sudo cp -v /home/andy/u-boot/MLO /media/boot/
sudo cp -v /home/andy/u-boot/u-boot.img /media/boot/
#sudo mount ${DISK}2 /media/rootfs/
sudo mkdir -p /media/rootfs/opt/backup/uboot/
sudo cp -v /home/andy/u-boot/MLO /media/rootfs/opt/backup/uboot/
sudo cp -v /home/andy/u-boot/u-boot.img /media/rootfs/opt/backup/uboot/
#file system
sudo tar xfvp /home/andy/debian-9.3-minimal-armhf-2017-12-09/armhf-rootfs-debian-stretch.tar -C /media/rootfs/
#wget -c https://rcn-ee.net/deb/minfs/wheezy/debian-7.7-minimal-armhf-2014-11-10.tar.xz
#tar xf debian-7.7-minimal-armhf-2014-11-10.tar.xz

#zImage
SOURCECODE=/home/andy/beaglebone/linux-dev/deploy
export kernel_version=4.15.0-rc5-armv7-devel-r22
#SOURCECODE=/home/andy/bb-kernel/deploy
#export kernel_version=4.15.0-rc6-bone2

sudo cp -v $SOURCECODE/${kernel_version}.zImage /media/rootfs/boot/vmlinuz-${kernel_version}
#dtbs
sudo mkdir -p /media/rootfs/boot/dtbs/${kernel_version}/
sudo tar xfv $SOURCECODE/${kernel_version}-dtbs.tar.gz -C /media/rootfs/boot/dtbs/${kernel_version}/
#modules
sudo tar xfv $SOURCECODE/${kernel_version}-modules.tar.gz -C /media/rootfs/
sudo sh -c "echo '/dev/mmcblk0p1  /  auto  errors=remount-ro  0  1' >> /media/rootfs/etc/fstab"
#uEnv.txt
sudo cp -v /home/andy/uEnv.txt /media/rootfs/
sudo mkdir -p /media/rootfs/boot/
sudo sh -c "echo 'uname_r=${kernel_version}' > /media/rootfs/boot/uEnv.txt"
sudo sh -c "echo 'fdtfile=am335x-boneblack.dtb' > /media/rootfs/boot/uEnv.txt"
sudo sh -c "echo 'cmdline=quiet init=/lib/systemd/systemd' >> /media/rootfs/boot/uEnv.txt"
sync
