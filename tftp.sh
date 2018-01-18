#!/bin/bash
apt-get install tftp-hpa tftpd-hpa xinetd
#vim /etc/default/tftpd-hpa			
mytftp1=/etc/default/tftpd-hpa

if [ ! -f "$mytftp1" ]; then
	touch /etc/default/tftpd-hpa	
fi
	
(
cat << EOF
#TFTP_USERNAME="tftp"				
#TFTP_DIRECTORY="/tftpboot " 
##将/tftpboot改成你自己建立的tftpboot文件夹路径				
#TFTP_ADDRESS="0.0.0.0:69"				
#TFTP_OPTIONS="-l -c -s" 
##这里是选项
EOF
)>>/etc/default/tftpd-hpa
vim /etc/default/tftpd-hpa				

#vim /etc/xinetd.d/tftp 
#//目录下如果没有tftp文件创建一个				
mytftp2=/etc/xinetd.d/tftp

if [ ! -f "$mytftp2" ]; then
	touch /etc/xinetd.d/tftp
fi
(
cat << EOF
service tftp				
{				
　　 disable = no				
　　 socket_type = dgram				
　　 protocol = udp				
　　 wait = yes				
　　 user = root 				
　　 server = /usr/sbin/in.tftpd				
　　 server_args = -s /tftpboot -c 				
　　 per_source = 11				
　　 cps = 100 2				
}				
server_args = -s /tftpboot –c				
#-c参数是允许上传用的，参数/tftpboot则是你的tftp目录，修改成你的目录即可。第一个是disabled选项，如果是yes，TFTP服务器是关闭的，修改为no启动TFTP服务器;
EOF
)>>/etc/xinetd.d/tftp
vim /etc/xinetd.d/tftp 


#创建用户下载的文件存放目录				
 sudo mkdir /tftpboot				
 sudo chmod 777 -R /tftpboot

#重启TFTP服务				
 sudo service tftpd-hpa restart //重启服务器				
 sudo /etc/init.d/xinetd reload				
 sudo /etc/init.d/xinetd restart //重启xinetd，tftp的一个脚本

#测试TFTP服务				
sudo ufw disable
# 命令关闭Linux防火墙				
netstat -a|grep tftp				
#结果显示 ：　udp 0 0 *:tftp *:* 则启动tftp服务				
cd /tftpboot				
touch /tftpboot/test				

(
cat << EOF
this is tftp test
EOF
)>>/tftpboot/test

service tftpd-hpa stop
#//停止tftp服务器				
service tftpd-hpa start
#//开启tftp服务器				
service tftpd-hpa stutus
#//查看tftp状态				
service tftpd-hpa restart
#//重启tftp服务器
#在另一个目录下执行
tftp 192.168.231.139 
#(本机IP)				
#tftp>get test				
#tftp>q				
#test文件的内容跟/tftpboot目录下test文件的内容一致，则tftp可以正常使用
#

#bbb从ubuntu下载文件 tftp 192.168.231.131				
#ubuntu从bbb下载文件 tftp 192.168.7.2				
#前提是连个网络要ping通
