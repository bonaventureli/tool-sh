#!/bin/bash
i=0;
while [ $i -lt 10 ]
do
    var=`date +%Y-%m-%d-%H:%M:%S`
    LOGFILE=iMX6-BBB-qt4.8.6-$var.log
    SHELLFILE=iMX6-Beaglebone-qt4.8.6-1.0.sh
    LOGFILE=$SHELLFILE-$var.log
    /bin/bash -e $PWD/$SHELLFILE 2>&1 | tee $LOGFILE
    email.sh $LOGFILE 
    rm *.log
    rm -rf tmp
done
