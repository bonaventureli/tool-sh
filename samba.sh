#!/bin/bash
apt-get install samba
apt-get -f install
smbpasswd -a root
smbconf=/etc/samba/smb.conf
mkdir /samba-ubuntu
if [ ! -f "$smbconf" ]; then
	touch /etc/samba/smb.conf
fi

(
cat << EOF
[public]
comment = Samba
public = yes
path = /samba-ubuntu
guest ok = yes
writable = yes
share modes = no
EOF
)>>/etc/samba/smb.conf
vim /etc/samba/smb.conf
/etc/init.d/samba restart
#windows运行\\192.168.1.73
