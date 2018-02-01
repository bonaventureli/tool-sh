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
sudo mkdir -p /media/rootfs/opt/backup/uboot/
sudo cp -v /samba-ubuntu/u-boot/MLO /media/rootfs/opt/backup/uboot/
sudo cp -v /samba-ubuntu/u-boot/u-boot.img /media/rootfs/opt/backup/uboot/
sudo cp -v /samba-ubuntu/uEnv.txt /media/rootfs/

export kernel_version=4.15.0-rc5-armv7-devel-r22
sudo tar xfvp /samba-ubuntu/debian-9.3-minimal-armhf-2017-12-09/armhf-rootfs-debian-stretch.tar -C /media/rootfs/
sync
sudo chown root:root /media/rootfs/
sudo chmod 755 /media/rootfs/
sudo sh -c "echo 'uname_r=${kernel_version}' >> /media/rootfs/boot/uEnv.txt"
sudo cp -v /samba-ubuntu/beaglebone/linux-dev/deploy/${kernel_version}.zImage /media/rootfs/boot/vmlinuz-${kernel_version}
sudo mkdir -p /media/rootfs/boot/dtbs/${kernel_version}/
sudo tar xfv /samba-ubuntu/beaglebone/linux-dev/deploy/${kernel_version}-dtbs.tar.gz -C /media/rootfs/boot/dtbs/${kernel_version}/
sudo tar xfv /samba-ubuntu/beaglebone/linux-dev/deploy/${kernel_version}-modules.tar.gz -C /media/rootfs/
sudo sh -c "echo '/dev/mmcblk0p1  /  auto  errors=remount-ro  0  1' >> /media/rootfs/etc/fstab"
(
cat << EOF
auto lo
iface lo inet loopback
  
auto eth0
iface eth0 inet dhcp
EOF
)>>/etc/network/interfaces
(
cat << EOF
# BeagleBone: net device ()
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{dev_id}=="0x0", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0"
EOF
)>>/media/rootfs/etc/udev/rules.d/70-persistent-net.rules
sync
(
cat << EOF
enable_uboot_overlays=1
disable_uboot_overlay_emmc=1
disable_uboot_overlay_video=1
disable_uboot_overlay_audio=1
disable_uboot_overlay_wireless=1
disable_uboot_overlay_adc=1
uboot_overlay_addr0=/lib/firmware/<file0>.dtbo
uboot_overlay_addr1=/lib/firmware/<file1>.dtbo
uboot_overlay_addr2=/lib/firmware/<file2>.dtbo
uboot_overlay_addr3=/lib/firmware/<file3>.dtbo

#disable_uboot_overlay_addr0=1
#disable_uboot_overlay_addr1=1
#disable_uboot_overlay_addr2=1
#disable_uboot_overlay_addr3=1

uboot_overlay_addr4=/lib/firmware/<file4>.dtbo
uboot_overlay_addr5=/lib/firmware/<file5>.dtbo
uboot_overlay_addr6=/lib/firmware/<file6>.dtbo
uboot_overlay_addr7=/lib/firmware/<file7>.dtbo

#uboot_overlay_pru=/lib/firmware/AM335X-PRU-RPROC-4-4-TI-00A0.dtbo
uboot_overlay_pru=/lib/firmware/AM335X-PRU-UIO-00A0.dtbo
enable_uboot_cape_universal=1
EOF
)>>/media/rootfs/boot/uEnv.txt

sync
sync
sync
#sudo umount /media/rootfs
echo "finish, thank you! please umount /media/rootfs"
