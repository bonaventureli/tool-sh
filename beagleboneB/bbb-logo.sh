#!/bin/bash
#Export DISPLAY  
export DISPLAY=:0.0  
  
#Call Gnome EOG  
/usr/bin/eog -f /home/root/logo.png &  
  
#Time to display  
sleep 3  
  
killall eog 
