#!/bin/bash
dd if=/dev/zero of=bbb.img bs=1M count=1000
kpartx -av bbb.img
sudo mkfs.vfat -F 16 /dev/mapper/loop0p1 -n boot
sudo mkfs.ext4 /dev/mapper/loop0p2 -L rootfs
mkdir -p /media/boot
mkdir -p /media/rootfs
sudo mount /dev/mapper/loop0p1 /media/boot/
sudo mount /dev/mapper/loop0p2 /media/rootfs/

cp -v /home/andy//u-boot/MLO /media/boot/
cp -v /home/andy//u-boot/u-boot.img  /media/boot/







sudo kpartx -dv bbb.img
