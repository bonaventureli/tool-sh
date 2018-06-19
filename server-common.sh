#!/bin/bash

if  [ "${1}" != "" ]  
then

	    mkdir -p ../tmp-server
	    rm -rf ../tmp-server/${1}
	    cp ${1} ../tmp-server
	    cp email1.1.sh ../tmp-server
	    cp name-a ../tmp-server
	    cp pass-a ../tmp-server
	    cp version.sh ../tmp-server
	    cp system.sh ../tmp-server
	    cd ../tmp-server
	    export PATH=$PWD:$PATH
	    i=0;
	    while [ $i -lt 10 ]
	    do
	        starttime=`date +%Y-%m-%d-%H:%M:%S`
	        #LOGFILE=${1}-$starttime.log
	        #SHELLFILE=${1}
	        LOGFILE=${1}-$starttime.log
	        (time /bin/bash -e $PWD/${1}) 2>&1 | tee $LOGFILE
	        #(time /bin/bash -e $PWD/$SHELLFILE) 2>&1 | tee $LOGFILE
	        #endtime=`date +%Y-%m-%d-%H:%M:%S`
		#echo $endtime 2>&1 | tee $LOGFILE
	        /bin/bash $PWD/email1.1.sh $LOGFILE && rm -rf *.log
	        #rm *.log
	       # rm -rf ../tmp-server
	    done
else

	    cd ..
	    #rm ../*.log
            rm -rf tmp-server
	    echo -e "\033[31m you must input ${0} [xxx.sh] \033[0m"
fi
