#!/bin/bash

#device=/dev/mmcblk0
#
#sfdisk --force --no-reread --in-order --Linux --unit S ${device} <<-__EOF__
#2048,,,-
#__EOF__
#
## The existence of this file triggers a filesystem resize on the next reboot
#touch /var/local/resize-rootfs
#
#echo
#echo "Reboot to complete filesystem resize"
vim /root/.bashrc
source /root/.bashrc

route add default gw 192.168.7.1
(
cat << EOF
nameserver 8.8.8.8
EOF
)>>/etc/resolv.conf

vim /etc/resolv.conf
#nameserver 8.8.8.8
ping www.baidu.com
sleep 5

(
cat << EOF
#cape_enable=bone_capemgr.enable_partno=BB-BONE-LCD7-01:00A3
#cape_enable=bone_capemgr.enable_partno=BB-I2C1
#cmdline=coherent_pool=1M quiet init=/lib/systemd/systemd rootflags=data=journal video=HDMI-A-1:1280x800MR@60D

EOF
)>>/boot/uEnv.txt
vim /boot/uEnv.txt
apt-get install connman
connmanctl
#1.sudo connmanctl		
#2.connmanctl>tether wifi disable		
#3.connmanctl>enable wifi		
#4.connmanctl>scan wifi		
#5.connmanctl>services		
#6.connmanctl>agent on		
#7.connmanctl>connect <wifi信息，无尖括号>		
#8.Passphrase?<输入wifi密码,无尖括号>		
#9.connmanctl>quit
ifconfig wlan0 up
iwlist wlan0 scan
wpa_passphrase THC-GROUP 58368055 >/etc/wpa_supplicant.conf
(
cat << EOF
#WiFi Example
auto wlan0
iface wlan0 inet dhcp
	wpa-ssid "THC-GROUP"
	wpa-psk "58368055"
EOF
)>>/etc/network/interfaces
vim /etc/network/interfaces
ifconfig wlan0
ifup wlan0
sleep 1
ifdown wlan0
sleep 1
ifup wlan0
sleep 1
ping www.baidu.com
sleep 5
wget https://github.com/beagleboard/bb.org-overlays.git

dmesg | grep capemgr
cat /sys/devices/platform/bone_capemgr/slots

