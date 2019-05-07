#!/bin/bash
#bin/sh
export QTDIR=$PWD
export LD_LIBRARY_PATH=$PWD/lib:/lib
export TSLIB_TSDEVICE=/dev/input/event4
export TSLIB_PLUGINDIR=$PWD/lib/ts
export TSLIB_CXXXOLEDEVICE=none
export QT_TSLIBDIR=$PWD/lib
export TSLIB_CONFFILE=$PWD/etc/ts.conf
export POINTERCAL_FILE=$PWD/etc/ts-calib.conf
export QWS_MOUSE_PROTO=tslib:/dev/input/event4
export TSLIB_CALIBFILE=$PWD/etc/ts-calib.conf
/usr/local/tslib/bin/ts_calibrate
/usr/local/tslib/bin/ts_test
