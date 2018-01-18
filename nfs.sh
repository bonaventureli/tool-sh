#!/bin/bash
#安装nfs服务器
apt-get install nfs-kernel-server
#安装nfs客户端
apt-get install nfs-common
#设置共享目录
#ubuntu上配置
#ubuntu上
#nfsubuntu=/nfs-ubuntu 
nfsubuntu=/beaglebone-nfs
#nfsubuntu=/beaglebone-rootfs 
if [ ! -f "$nfsubuntu" ]; then
	mkdir /beaglebone-nfs
fi
nfsconfigfile=/etc/exports

if [ ! -f "$nfsconfigfile" ]; then
	touch /etc/exports
fi
#
#(
#cat << EOF
#/nfs-ubuntu *(rw,sync,no_root_squash,no_subtree_check) 
#EOF
#)>>/etc/exports
#
#vim /etc/exports
service rpcbind restart 
#映射端口重启
service nfs-kernel-server restart
#重启nfs服务
showmount -e 
# //显示共享出来的目录
#BBB上 mkdir /nfs-BBB
#vim /etc/exports
#/nfs-BBB *(rw,sync,no_root_squash,no_subtree_check)  
#service rpcbind restart  
#service nfs-kernel-server restart
#showmount -e 
#在ubuntu上挂在bbb
#sudo mount -t nfs 192.168.7.2:/ /beaglebone-rootfs 
#sudo mount -t nfs 192.168.7.2:/nfs-BBB /nfs-ubuntu   
#(nfs-ubuntu可以是ubuntu下的任何一个文件夹)
#在bbb上挂在ubuntu
#sudo mount -t nfs 192.168.231.131:/nfs-ubuntu /nfs-BBB   (nfs-BBB可以是beaglebone black下的任何一个文件夹)
