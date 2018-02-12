#!/bin/bash
srcpath=$PWD/qt-everywhere-opensource-src-4.8.6.tar.gz
if [ ! -f "${srcpath}" ]; then
wget http://mirrors.ustc.edu.cn/qtproject/official_releases/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.tar.gz
#wget -P ${srcpath} http://mirrors.ustc.edu.cn/qtproject/official_releases/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.tar.gz
fi
if [ ! -d "$PWD/qt-everywhere-opensource-src-4.8.6" ]; then
tar zxvf ${srcpath} -C .
fi

