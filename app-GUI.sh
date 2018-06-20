#!/bin/bash
QMAKENAME=$(which qmake)
#QMAKENAME={which qmake-ubuntu}
if [ ! -d $PWD/GUI ]; then
git clone https://github.com/bonaventureli/GUI.git
fi
cd GUI
$QMAKENAME LCr4500.pro
$QMAKENAME
make || true
sed -i '/setCurrentText/d' ui_mainwindow.h
make
./LightCrafter4500

