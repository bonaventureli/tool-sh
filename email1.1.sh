#!/bin/bash
sudo apt install sendemail
echo "you need two file (name and pass-a)"
for qqname in $(cat name)
do
    echo ""
done
HOSTNAME=$qqname
HOSTEMAIL=$qqname@qq.com
TARGET=1364036694@qq.com
openssl enc -des-ede3-cbc -in pass-a -out .pass-a -d -k 123456
for pass in $(cat .pass-a)
do
    echo ""
done
rm -rf .pass-a
emailpassword=$pass

sudo sendemail -s smtp.qq.com -f ${HOSTEMAIL} -t ${TARGET} -u ${1} -o message-file=${1} -xu ${HOSTNAME} -xp ${emailpassword} -o tls=auto 

#sudo apt remove sendemail
