#!/bin/bash
tslibpath=/usr/local/tslib
export TSLIB_PLUGINDIR=${tslibpath}/lib/ts
export TSLIB_CXXXOLEDEVICE=none
export TSLIB_CONFFILE=${tslibpath}/etc/ts.conf
export TSLIB_TSDEVICE=/dev/input/event4
export TSLIB_CONSOLEDEVICE=none
export TSLIB_FBDEVICE=/dev/fb0
export TSLIB_CALIBFILE=/etc/pointercal
export POINTERCAL_FILE=${tslibpath}/etc/ts-calib.conf
export TSLIB_CALIBFILE=${tslibpath}/etc/ts-calib.conf
export LD_LIBRARY_PATH=${tslibpath}/lib:/lib
/usr/local/tslib/bin/ts_calibrate
/usr/local/tslib/bin/ts_test

export QWS_DISPLAY="LinuxFb:/dev/fb0"
export QWS_MOUSE_PROTO=tslib:/dev/input/event4
export QWS_DISPLAY="LinuxFb:mmWidth80:mmHeight120:0"
export QTDIR=/usr/local/Trolltech/QtEmbedded-4.8.6-tslib-mouse
export QT_PLUGIN_PATH=$QTDIR/plugins/
#export QWS_SIZE=800x480
#export QWS_MOUSE_PROTO="TSLIB:/dev/input/event4"
#export QT_TSLIBDIR=$PWD/lib

