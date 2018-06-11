#!/bin/bash
git clone https://github.com/RobertCNelson/ti-linux-kernel-dev.git
cd ti-linux-kernel-dev/
#git checkout origin/ti-linux-4.4.y -b tmp
#git checkout origin/ti-linux-rt-4.4.y -b tmp
#git checkout origin/ti-linux-4.9.y -b tmp
#git checkout origin/ti-linux-rt-4.9.y -b tmp
#git checkout origin/ti-linux-4.14.y -b tmp
git checkout origin/ti-linux-rt-4.14.y -b tmp
./build_kernel.sh
