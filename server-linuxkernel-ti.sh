#!/bin/bash
sudo apt-get update
sudo apt-get install build-essential fakeroot lzma lzop bison flex libncurses5-dev:amd64
git clone https://github.com/RobertCNelson/ti-linux-kernel-dev.git || git add .
cd ti-linux-kernel-dev/
#git checkout origin/ti-linux-4.4.y -b tmp
#git checkout origin/ti-linux-rt-4.4.y -b tmp
#git checkout origin/ti-linux-4.9.y -b tmp
#git checkout origin/ti-linux-rt-4.9.y -b tmp
#git checkout origin/ti-linux-4.14.y -b tmp
git checkout origin/ti-linux-rt-4.14.y -b tmp || git add .
./build_kernel.sh
