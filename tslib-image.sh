#!/bin/bash
if [ ! -d /samba-ubuntu/tslib ]; then
git clone https://github.com/kergoth/tslib.git /samba-ubuntu/tslib
fi

./autogen.sh echo "ac_cv_func_malloc_0 _nonnull=yes">arm-linux-gnueabihf.cache
./configure --host=arm-linux-gnueabihf --cache-file=arm-linux-gnueabihf.cache --prefix=/usr/local/tslib ac_cv_func_malloc_0_nonnull=yes --enable-input api=no
make
make install
mkdir -p /media/usr/local/tslib/
#scp bbb_mkdir_qt_lib.sh root@192.168.7.2:/root
scp -r /usr/local/tslib/ /media/usr/local
scp tslib_touch.sh /media/usr/local/tslib
scp tslib_event.sh /media/usr/local/tslib
scp tslib.conf /media/etc/ld.so.conf.d

