#!/bin/bash
dd if=/dev/zero of=bbb.img bs=1M count=1000
kpartx -av bbb.img
sudo mkfs.vfat -F 16 /dev/mapper/loop0p1 -n boot
sudo mkfs.ext4 /dev/mapper/loop0p2 -L rootfs
mkdir -p tmpmnt/boot
mkdir -p tmpmnt/rootfs
sudo mount /dev/mapper/loop0p1 tmpmnt/boot/
sudo mount /dev/mapper/loop0p2 tmpmnt/rootfs/

cp -v /home/andy//u-boot/MLO /home/andy/tmpmnt/boot/
cp -v /home/andy//u-boot/u-boot.img  /home/andy/tmpmnt/boot/
export kernel_version=4.15.0-rc5-armv7-devel-r22
cd /home/andy/bb-kernel/deploy
cp -v ${kernel_version}.zImage /home/andy/tmpmnt/rootfs/boot/vmlinuz-${kernel_version}
mkdir -p /home/andy/tmpmnt/rootfs/boot/dtbs/${kernel_version}
tar xvf ${kernel_version}-dtbs.tar.gz -C /home/andy/tmpmnt/rootfs/boot/dtbs/${kernel_version}
tar xvf ${kernel_version}-modules.tar.gz -C /home/andy/tmpmnt/rootfs/
sh -c "echo 'uname_r=${kernel_version}' >> /home/andy/tmpmnt/rootfs/boot/uEnv.txt"
cp -v /home/andy/uEnv.txt /home/andy/tmpmnt/rootfs/
sync

#sudo umount /home/andy/tmpmnt/boot/
#sudo umount /home/andy/tmpmnt/rootfs/
#sudo kpartx -dv bbb.img
