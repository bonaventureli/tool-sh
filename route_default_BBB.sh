route add default gw 192.168.7.1
(
cat << EOF
nameserver 8.8.8.8
EOF
)>>/etc/resolv.conf

vim /etc/resolv.conf
#nameserver 8.8.8.8
