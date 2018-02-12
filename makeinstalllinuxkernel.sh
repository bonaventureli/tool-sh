#!/bin/bash
#cd bb-kernel/
read -p "Are you sure your dir is ../bb-kernel ? (y/n)" YN
if [ $YN == 'Y' ] || [ $YN == 'y' ]; then
#git checkout origin/am33x-v4.4 -b tmp
#git checkout origin/am33x-rt-v4.4 -b tmp
#git checkout origin/am33x-v4.9 -b tmp
#git checkout origin/am33x-rt-v4.9 -b tmp
#git checkout origin/am33x-v4.14 -b tmp
#git checkout origin/am33x-rt-v4.14 -b tmp
git checkout origin/am33x-v4.15 -b tmp
./build_kernel.sh
else
exit 0
fi
