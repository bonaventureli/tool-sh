#!/bin/bash
read -p "Please input password: " emailpassword
HOSTNAME=123456
HOSTEMAIL=123456@qq.com
TARGET=789123@qq.com

#sendemail -s smtp.qq.com -f 641049624@qq.com -t 1364036694@qq.com -u linux-download-task-ti-over -m "download over now!" -xu 641049624 -xp 6410qq -o tls=auto
#sendemail -s smtp.qq.com -f 641049624@qq.com -t 1364036694@qq.com -u linux-download-task-ti-over -o message-file=mail.txt -xu 641049624 -xp 6410qq -o tls=auto
#sendemail -s smtp.qq.com -f ${HOSTEMAIL} -t ${TARGET} -u linux-download-task-ti-over -o message-file=mail.txt -xu ${HOSTNAME} -xp ${emailpassword} -o tls=auto -a mail.txt show123.sh
sendemail -s smtp.qq.com -f ${HOSTEMAIL} -t ${TARGET} -u ${1} -o message-file=${1} -xu ${HOSTNAME} -xp ${emailpassword} -o tls=auto 

