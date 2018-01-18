#!/bin/bash
sed -i '3i\127.0.1.1      winsun.localdomain      winsun' /etc/hosts
#sed -i '1i\3a0000' test.txt
#sed -e "/3/a 3a0000" -i test.txt
vim /etc/hosts

sed -i '1i\winsun' /etc/hostname
vim /etc/hostname

(
cat <<EOF
#########################################
\ \      / /_ _| \ | / ___|| | | | \ | |
 \ \ /\ / / | ||  \| \___ \| | | |  \| |
  \ V  V /  | || |\  |___| | |_| | |\  |
   \_/\_/  |___|_| \_|____/ \___/|_| \_|
#########################################
\m
\r
\d
\t
\l
\n
\s
\u
\v
EOF
)>>/etc/issue
vim /etc/issue
#\m:机器类型
#\r:内核版本
#\d:日期
#\t:时间
#\l:登录到的终端
#\n:主机名
#\s:操作系统类型
#\u:已经登录的用户数
#\v:操作系统版本

#apt-get install cowsay
#cowsay 'winsun'
#apt-get install toilet
#toilet winsun
#apt-get install figlet
#figlet winsun
#apt-get install sl
#sl
#apt-get install linuxlogo
#linuxlogo
(
cat <<EOF
Hello ,welcome to WINSUN printer! Thanks a lot
EOF
)>>/etc/motd
vim /etc/motd

(
cat <<EOF
setterm -powersave off -blank 0
EOF
)>>/root/.bashrc
vim /root/.bashrc

