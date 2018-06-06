#!/bin/bash
echo "you need two file (name and pass)"
for qqname in $(cat name)
do
    echo $qqname
done
HOSTNAME=$qqname
HOSTEMAIL=$qqname@qq.com
TARGET=1364036694@qq.com

for pass in $(cat pass)
do
    echo $pass
done
emailpassword=$pass

sendemail -s smtp.qq.com -f ${HOSTEMAIL} -t ${TARGET} -u ${1} -o message-file=${1} -xu ${HOSTNAME} -xp ${emailpassword} -o tls=auto 

