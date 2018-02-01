#!/bin/bash
read -p "How many people eat ?:" numpeo
read -p "How much CanHe ?:" canhe
read -p "How much PeiSong ?:" peisong

for i in $(seq 1 1 ${numpeo})
do
read -p "people${i} eat?:" doller[${i}] 
all=$((${all}+${doller[${i}]}))
done
read -p "How much the total price:" totalprice
echo "total:${all}"
persent=$((${totalprice}/$((${all}+${canhe}+${peisong}))))
eee=$((${canhe}+${peisong}))/2
echo "persent is ${persent}"

for i in $(seq 1 1 ${numpeo})
do
echo "people${i} eat ${doller[${i}]}-----> $(($((${doller[${i}]}*${persent}))+${eee}))" 
done
