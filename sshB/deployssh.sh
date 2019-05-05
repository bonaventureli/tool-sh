#!/bin/bash 
sudo apt install openssh-client
sudo apt install openssh-server
sudo /etc/init.d/ssh start
#sudo /etc/init.d/ssh stop
#sudo /etc/init.d/ssh restart
ssh ubuntu@118.25.108.6
ssh bona@192.168.1.8
