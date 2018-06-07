#!/bin/bash

if  [ "${1}" != "" ]  
then

	    mkdir -p ../tmp-server
	    cp ${1} ../tmp-server
	    cp email1.1.sh ../tmp-server
	    cp name ../tmp-server
	    cp pass-a ../tmp-server
	    cd ../tmp-server
	    i=0;
	    while [ $i -lt 10 ]
	    do
	        starttime=`date +%Y-%m-%d-%H:%M:%S`
	        LOGFILE=${1}-$starttime.log
	        SHELLFILE=${1}
	        LOGFILE=$SHELLFILE-$starttime.log
	        (time /bin/bash -e $PWD/$SHELLFILE) 2>&1 | tee $LOGFILE
	        endtime=`date +%Y-%m-%d-%H:%M:%S`
		#echo $endtime 2>&1 | tee $LOGFILE
	        /bin/bash $PWD/email1.1.sh $LOGFILE 
	        rm *.log
	        rm -rf tmp-server
	    done
else

	    cd ..
	    rm *.log
            rm -rf tmp-server
	    echo -e "\033[31m you must input ${0} [xxx.sh] \033[0m"
fi
