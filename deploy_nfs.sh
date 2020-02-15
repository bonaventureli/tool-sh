#!/bin/bash
#安装nfs服务器
apt-get install nfs-kernel-server
#安装nfs客户端
apt-get install nfs-common
#设置共享目录
nfsubuntu=/nfs
if [ ! -f "$nfsubuntu" ]; then
	mkdir /nfs
fi
nfsconfigfile=/etc/exports

if [ ! -f "$nfsconfigfile" ]; then
	touch /etc/exports
fi

(
cat << EOF
/nfs *(rw,sync,no_root_squash,no_subtree_check) 
EOF
)>>/etc/exports

vim /etc/exports
service rpcbind restart 
#映射端口重启
service nfs-kernel-server restart
#重启nfs服务
showmount -e 
# //显示共享出来的目录


#在ubuntu上挂载服务器/nfs目录到本地/nfs
#sudo mount -t nfs 192.168.2.105:/nfs /nfs
#(/nfs可以是ubuntu下的目录)
