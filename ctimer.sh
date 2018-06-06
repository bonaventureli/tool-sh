#!/bin/bash
 # script name: ctimer.sh
 # Author: osetc.com
 # --------------------------------------------------------

row=2
 col=2
 countdown() {
 msg="starting..."
 clear
 tput cup $row $col
 echo -n "$msg"
 l=${#msg}
 l=$(( l+$col ))
 for i in {30..1}
 do
     tput cup $row $l
     echo -n "$i"
     sleep 1
 done
 }
 countdown
