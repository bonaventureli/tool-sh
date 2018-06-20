#!/bin/bash -e
if [ -f $PWD/qt-everywhere-opensource-src-4.8.6.tar.gz ]; then
md5sum qt-everywhere-opensource-src-4.8.6.tar.gz > qt-everywhere-opensource-src-4.8.6.tar.gz.md5sum
echo "2edbe4d6c2eff33ef91732602f3518eb  qt-everywhere-opensource-src-4.8.6.tar.gz" > qt-everywhere-opensource-src-4.8.6.tar.gz.md5sum.ok
if [ "awk 'NR==FNR{a[$0]++} NR>FNR&&a[$0]' qt-everywhere-opensource-src-4.8.6.tar.gz.md5sum qt-everywhere-opensource-src-4.8.6.tar.gz.md5sum.ok" ]; then
echo "need not download qt-everywhere-opensource-src-4.8.6.tar.gz"
fi
else
wget --tries=0 -c http://mirrors.ustc.edu.cn/qtproject/official_releases/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.tar.gz
fi
rm -rf qt-everywhere-opensource-src-4.8.6
if [ ! -d $PWD/qt-everywhere-opensource-src-4.8.6 ]; then
tar zxvf qt-everywhere-opensource-src-4.8.6.tar.gz
fi

FIEL=$PWD/qt-everywhere-opensource-src-4.8.6/mkspecs/common/gcc-base.conf
INSTALL=/usr/local/Trolltech/Qt-4.8.6-ubuntu
sed -i "46iQMAKE_CXXFLAGS            += \$\$QMAKE_CFLAGS -std=gnu++98" $FILE
  cd qt-everywhere-opensource-src-4.8.6
                ./configure -v -prefix $INSTALL \
                -opensource \
                -confirm-license \
                -no-pch \
                -release  \
                -opengl \
                -nomake examples \
                -nomake tools \
                -nomake docs \
                -nomake demos \
                -fast \
                -svg \
                -graphicssystem opengl
make
make install

