#!/bin/bash
sudo service cron status
#sudo /etc/init.d/cron start
#sudo /etc/init.d/cron stop
#sudo /etc/init.d/cron restart
#crontab /home/andy/crontest.cron >/home/andy/log
#crontab /home/andy/crontest.cron
vim /etc/crontab
sudo /etc/init.d/cron restart


crontab /home/andy/crona.cron
crontab -u root -e
crontab -u root -l
#crontab -u root -r
#tail -f /tmp/test.txt
#minute hour day month week commands

