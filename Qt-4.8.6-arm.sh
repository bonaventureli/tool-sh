#!/bin/bash
srcpath=/samba-ubuntu/qt-everywhere-opensource-src-4.8.6.tar.gz
if [ ! -f  ${srcpath} ]; then
wget -P ${srcpath} http://mirrors.ustc.edu.cn/qtproject/official_releases/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.tar.gz
fi
if [ ! -d /home/andy/qt-arm-src ]; then
mkdir /home/andy/qt-arm-src
fi

if [ ! -d /home/andy/qt-arm-src/qt-everywhere-opensource-src-4.8.6 ]; then
tar zxvf ${srcpath} -C /home/andy/qt-arm-src
fi
#linux-am335x-g++
if [ ! -d /home/andy/qt-arm-src/qt-everywhere-opensource-src-4.8.6/mkspecs/qws/linux-am335x-g++ ]; then
mkdir /home/andy/qt-arm-src/qt-everywhere-opensource-src-4.8.6/mkspecs/qws/linux-am335x-g++
git clone https://github.com/bonaventureli/linux-am335x-g-.git /home/andy/qt-arm-src/qt-everywhere-opensource-src-4.8.6/mkspecs/qws/linux-am335x-g++
fi
cp tslib.sh /samba-ubuntu/tslib
cp configure-Qt-arm.sh /home/andy/qt-arm-src/qt-everywhere-opensource-src-4.8.6 

if [ -f /usr/local/Trolltech/QtEmbedded-4.8.6-tslib-mouse/bin/qmake ]; then
mv /usr/local/Trolltech/QtEmbedded-4.8.6-tslib-mouse/bin/qmake /usr/local/Trolltech/QtEmbedded-4.8.6-tslib-mouse/bin/qmake-tslib
fi

(
cat << EOF
export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-tslib-mouse/bin:$PATH
EOF
)>>/root/.bashrc

if [ ! -d /usr/local/Trolltech/QtEmbedded-4.8.6-tslib-mouse/lib/udev-usb-lib ]; then
git clone https://github.com/bonaventureli/udev-usb-lib.git /usr/local/Trolltech/QtEmbedded-4.8.6-tslib-mouse/lib/udev-usb-lib
fi

if [ ! -d /samba-ubuntu/GUI ]; then
git clone https://github.com/bonaventureli/GUI.git /samba-ubuntu/GUI
fi
#bbb make lib dir 
#mkdir -p /usr/local/Trolltech/QtEmbedded-4.8.6-tslib-mouse/lib
# ./bbb_mkdir_qt_lib.sh
scp bbb_mkdir_qt_lib.sh root@192.168.7.2:/root
scp -r /usr/local/Trolltech/QtEmbedded-4.8.6-tslib-mouse/lib root@192.168.7.2:/usr/local/Trolltech/QtEmbedded-4.8.6-tslib-mouse/lib
scp qtlib.conf root@192.168.7.2:/etc/ld.so.conf.d
