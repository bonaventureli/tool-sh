#!/bin/bash
if  [ "${1}" != "" ]  
then
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
	        email.sh $LOGFILE 
	        rm *.log
	        rm -rf tmp
	    done
else
	rm *.log
        rm -rf tmp
	echo -e "\033[31m you must input ${0} [xxx.sh] \033[0m"
fi
