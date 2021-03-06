#!/bin/bash
if [ "${1}" == "install" ]; then
sudo apt-get -y update || echo "some error"
sudo apt autoremove || echo "some error"
sudo apt-get install libssl-dev
sudo apt-get install build-essential fakeroot flex
sudo apt-get install lzma lzop bison libncurses5-dev:amd64 || echo "some error"
elif [ "${1}" == "remove" ]; then
sudo apt-get remove build-essential fakeroot flex
sudo apt autoremove
sudo apt-get remove libssl-dev
sudo apt-get remove lzma lzop bison libncurses5-dev:amd64 || echo "some error"
else
#wget -c https://jaist.dl.sourceforge.net/project/flexformatter/flexformatter/0.9.0/FlexPrettyPrintCommand_0.9.0.zip
#wget -c http://down1.chinaunix.net/distfiles/flex-2.5.4a.tar.gz
#vim /etc/apt/source.list
#http://cn.archive.ubuntu.com/ubuntu
#http://mirror.lupaworld.com
if [ ! -d bb-kernel ];then
	git config --global http.postBuffer  524288000
git clone https://github.com/RobertCNelson/bb-kernel.git
fi
cd bb-kernel/
#git checkout origin/am33x-v4.4 -b tmp
#git checkout origin/am33x-rt-v4.4 -b tmp
#git checkout origin/am33x-v4.9 -b tmp
#git checkout origin/am33x-rt-v4.9 -b tmp
#git checkout origin/am33x-v4.14 -b tmp
#git checkout origin/am33x-rt-v4.14 -b tmp
git checkout origin/am33x-v4.15 -b tmp || git add .
./build_kernel.sh
fi
