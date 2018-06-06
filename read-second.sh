#!/bin/bash
timeout=5

read -t $timeout -p "please input a num in (5s): " num
num=${num:-y} 
echo "your number is $num"
