#!/bin/bash 

nordic="$PWD/nordicB" 
linuxkernel="$PWD/linuxkernelB" 
itchat="$PWD/itchatB" 
cp ../nordicB/*.sh nordicB 
cp ../javaB/*.sh javaB 
if [ ! -d "$PWD/itchatB" ];then 
    mkdir -p itchatB
else 
    echo "itchatB ok"
fi 

if [ -f "$PWD/itchatB/*.sh" ];then 
cp ../itchatB/*.sh itchatB 
else 
    echo "no *.sh file!"
fi 
cp ../itchatB/*.py itchatB 

for i in {$nordic .. $itchat}
do 
    echo $i
    if [ ! -d "$i" ];then 
    mkdir -p $i
    fi 
done
