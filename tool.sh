#!/bin/bash
cp updatetool ..
cd ..
mkdir androidB cc2640r2f-q1 gnueabihfB nordicB qtB ubootB protobufB nanopbB 
#rm -rf  androidB cc2640r2f-q1 gnueabihfB nordicB qtB ubootB protobufB nanopbB
echo androidB cc2640r2f-q1 gnueabihfB nordicB qtB ubootB protobufB nanopbB | xargs -n 1 cp -v updatetool 
rm updatetool
