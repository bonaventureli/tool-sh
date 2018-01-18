#!/bin/bash
(
cat << EOF
service tftp                            
{                               
　　 disable = no                               
　　 socket_type = dgram                                
　　 protocol = udp                             
　　 wait = yes                         
　　 user = root //修改为你登录系统的用户名                             
　　 server = /usr/sbin/in.tftpd                                
　　 server_args = -s /tftpboot -c // /tftpboot为你存放TFTP的文件目录                           
　　 per_source = 11                            
　　 cps = 100 2                                
}                               
server_args = -s /tftpboot –c                    
EOF
)>>log


