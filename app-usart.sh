#!/bin/bash
APPNAME=appusart-test
FROMLIB=libusart/src
APPLIB=include
if [ ! -d $PWD/libusart ]; then
git clone https://github.com/bonaventureli/appusart.git
fi
if [ ! -d $PWD/appusart ]; then
git clone https://github.com/bonaventureli/appusart.git
fi
QMAKENAME=$(which qmake)
	rm -rf $APPNAME
       mkdir -p $APPNAME/$APPLIB
        cp -r appusart/* $APPNAME
        cp $FROMLIB/qextserialenumerator.h $APPNAME/$APPLIB
        cp $FROMLIB/qextserialenumerator_p.h $APPNAME/$APPLIB
        cp $FROMLIB/qextserialport.h $APPNAME/$APPLIB
        cp $FROMLIB/qextserialport_global.h $APPNAME/$APPLIB
        cp $FROMLIB/qextserialport_p.h $APPNAME/$APPLIB
        cp $FROMLIB/qextserialenumerator.cpp $APPNAME
        cp $FROMLIB/qextserialenumerator_linux.cpp $APPNAME
        cp $FROMLIB/qextserialport.cpp $APPNAME
        cp $FROMLIB/qextserialport_unix.cpp $APPNAME
        cd $APPNAME
        $QMAKENAME -project
        sed -i '9iunix:!macx: LIBS += -ludev' $APPNAME.pro

        $QMAKENAME
        make
        ./$APPNAME

