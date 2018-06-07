#!/bin/bash
DIR=$PWD
wget -c https://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/arm-linux-gnueabihf/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf.tar.xz
#wget -c http://publishing-ap-linaro-org.s3.amazonaws.com/releases/archive/14.05/components/toolchain/binaries/gcc-linaro-arm-linux-gnueabihf-4.9-2014.05_linux.tar.xz
#wget -c https://releases.linaro.org/14.04/components/toolchain/binaries/gcc-linaro-arm-linux-gnueabihf-4.8-2014.04_linux.tar.xz
ARM_LINUX_GNU=gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf
#ARM_LINUX_GNU=gcc-linaro-arm-linux-gnueabihf-4.8-2014.04_linux
if [ ! -d $PWD/$ARM_LINUX_GNU ]; then
tar -zv $ARM_LINUX_GNU.tar.xz
fi
export PATH=$PWD/$ARM_LINUX_GNU/bin:$PATH
export TOOLCHAIN=$PWD/$ARM_LINUX_GNU
export PKG_CONFIG_PREFIX=$TOOLCHAIN/arm-linux-gnueabihf

rm -rf /usr/local/tslib
rm -rf $PWD/tslib
if [ ! -d $PWD/tslib ]; then
git clone https://github.com/kergoth/tslib.git 
fi
cd tslib
./autogen.sh echo "ac_cv_func_malloc_0 _nonnull=yes">arm-linux-gnueabihf.cache
./configure --host=arm-linux-gnueabihf --cache-file=arm-linux-gnueabihf.cache --prefix=/usr/local/tslib ac_cv_func_malloc_0_nonnull=yes --enable-input api=no
make
make install
cd ..

rm -rf qt-everywhere-opensource-src-4.8.6
wget -c http://mirrors.ustc.edu.cn/qtproject/official_releases/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.tar.gz
if [ ! -d $PWD/qt-everywhere-opensource-src-4.8.6 ]; then
tar zxvf qt-everywhere-opensource-src-4.8.6.tar.gz
fi

git clone https://github.com/bonaventureli/linux-am335x-g-
mv linux-am335x-g- linux-am335x-g++
mv linux-am335x-g++ qt-everywhere-opensource-src-4.8.6/mkspecs/qws

cd qt-everywhere-opensource-src-4.8.6
INSTALL_PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-tslib-gfx
./configure -prefix  $INSTALL_PATH \
        -opensource \
        -confirm-license \
        -release  \
        -embedded armv7 \
        -xplatform qws/linux-am335x-g++ \
        -svg\
        -no-cups\
        -shared\
        -no-largefile\
        -no-accessibility\
        -no-xrender\
        -depths 16,18,24,32 \
        -fast \
        -optimized-qmake \
        -pch \
        -qt-sql-sqlite \
        -qt-libjpeg \
        -qt-zlib \
        -qt-libpng \
        -qt-freetype \
        -little-endian  -host-little-endian \
        -no-qt3support  \
        -no-libtiff   -no-libmng \
        -no-opengl \
        -no-mmx  -no-sse  -no-sse2 \
        -no-3dnow \
        -no-openssl \
        -no-webkit \
        -no-qvfb \
        -no-phonon \
        -no-nis \
        -no-opengl \
        -no-cups \
        -no-xcursor   -no-xfixes  -no-xrandr   -no-xrender \
        -no-separate-debug-info \
        -nomake examples   -nomake  tools   -nomake docs -nomake demos\
        -plugin-mouse-pc\
        -lrt\
        -no-libjpeg\
        -qt-mouse-tslib \
        -qt-gfx-linuxfb\
        -qt-gfx-transformed\
        -D QT_NO_QWS_CURSOR\
        -D QT_QWS_CLIENTBLIT\
        -L /usr/local/tslib/lib\
        -I /usr/local/tslib/include
make 2>&1 | tee ../qt-everywhere-opensource-src-4.8.6.log && make install
cd ..

git clone https://github.com/bonaventureli/udev-usb-lib.git
cd udev-usb-lib
cp libudev.so.0.13.1 $INSTALL_PATH/lib
cp libusb-1.0.so.0.1.0 $INSTALL_PATH/lib
cd $INSTALL_PATH/lib
ln -s libudev.so.0.13.1 libudev.so.0
ln -s libudev.so.0.13.1 libudev.so
ln -s libusb-1.0.so.0.1.0 libusb-1.0.so
cd $INSTALL_PATH/bin
mv qmake qmake-gfx
export PATH=$INSTALL_PATH/bin:$PATH

cd $DIR
