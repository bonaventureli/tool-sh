# Ash profile 
# vim: syntax=sh

# No core files by default
ulimit -S -c 0 > /dev/null 2>&1

USER="`id -un`"
LOGNAME=$USER
PS1='[$USER@$HOSTNAME]# '
PATH=$PATH

HOSTNAME=`/bin/hostname`

export USER LOGNAME PS1 PATH

tslibpath=/usr/local/tslib
export TSLIB_PLUGINDIR=${tslibpath}/lib/ts
export TSLIB_CXXXOLEDEVICE=none
export TSLIB_CONFFILE=${tslibpath}/etc/ts.conf
export TSLIB_TSDEVICE=/dev/input/event5
export TSLIB_CONSOLEDEVICE=none
export TSLIB_FBDEVICE=/dev/fb0
export TSLIB_CALIBFILE=/etc/pointercal
export POINTERCAL_FILE=${tslibpath}/etc/ts-calib.conf
export TSLIB_CALIBFILE=${tslibpath}/etc/ts-calib.conf
export LD_LIBRARY_PATH=${tslibpath}/lib:/lib
if [ ${1} == "1" ]; then
/usr/local/tslib/bin/ts_calibrate
/usr/local/tslib/bin/ts_test
fi

#export QWS_DISPLAY="Multi:/dev/fb0"
export QWS_DISPLAY="LinuxFb:/dev/fb0"
export QWS_MOUSE_PROTO=tslib:/dev/input/event5
#export QWS_DISPLAY="LinuxFb:mmWidth160:mmHeight240"
#export QWS_DISPLAY="Multi: LinuxFb:0 LinuxFb:offset=0,0:1:2"
#export QWS_DISPLAY="Multi: LinuxFb:0 LinuxFb:offset=320,0:1:2"
#export QWS_DISPLAY="Multi:LinuxFb:mmWidth160:mmHeight240:0:1"
#export QWS_DISPLAY="LinuxFb:mmWidth80:mmHeight120"
#export QWS_DISPLAY=EP93xx:/dev/fb0
#export QWS_DISPLAY=:1:/dev/fb0
#export QWS_DISPLAY=LinuxFb:Rot90
export QWS_DISPLAY=Transformed:Rot90
#export QWS_DISPLAY=Transformed:Rot90:LinuxFb:mmWidth80:mmHeight120:0

#export QWS_DISPLAY="LinuxFb:mmWidth80:mmHeight120:0"
export QTDIR=/usr/local/Trolltech/QtEmbedded-4.8.6-tslib-gfx
#export QTDIR=/usr/local/Trolltech/QtEmbedded-4.8.6-tslib-mouse
export QT_PLUGIN_PATH=$QTDIR/plugins/
#export QWS_SIZE=400x240
export QWS_SIZE=1280x800
#export QWS_SIZE=800x480
#export QWS_MOUSE_PROTO="TSLIB:/dev/input/event4"
#export QT_TSLIBDIR=$PWD/lib

