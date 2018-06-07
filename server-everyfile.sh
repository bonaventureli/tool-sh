#!/bin/bash

i=0;
while [ $i -lt 10 ]
do
    for file in *
    do
	if [ -f "$file" ]
	then
	    DIR=$PWD
	    mkdir -p ../tmp-server
	    cp email1.1.sh ../tmp-server
	    cp name ../tmp-server
	    cp pass-a ../tmp-server
	    cp $file ../tmp-server
	    cd ../tmp-server
	    starttime=`date +%Y-%m-%d-%H:%M:%S`
	    LOGFILE=$file-$starttime.log
	    SHELLFILE=$file
	    LOGFILE=$SHELLFILE-$starttime.log
	    (time /bin/bash -e $PWD/$SHELLFILE) 2>&1 | tee $LOGFILE
	    endtime=`date +%Y-%m-%d-%H:%M:%S`
	    #echo $endtime 2>&1 | tee $LOGFILE
	    /bin/bash $PWD/email1.1.sh $LOGFILE 
	    cd $DIR
	    rm -rf ../tmp-server
	fi
    done
done
