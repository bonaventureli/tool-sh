#!/bin/bash
#sudo service cron status
#sudo /etc/init.d/cron start
#sudo /etc/init.d/cron stop
#sudo /etc/init.d/cron restart
#crontab /home/andy/crontest.cron >/home/andy/log
#crontab /home/andy/crontest.cron
#vim /etc/crontab
#sudo /etc/init.d/cron restart


#crontab /home/andy/tool-sh/crona.cron
#crontab   -e
#crontab   -l
#crontab -u andy -e
#crontab -u root -e
#crontab -u andy -l
#crontab -u root -l
#crontab -u root -r
#tail -f /tmp/test.txt
#minute hour day month week commands
case ${1} in
	"update")
		cp -r cron.d/* /etc/cron.d
		#cp -r cron.daily/* /etc/cron.daily
		#cp -r cron.hourly/* /etc/cron.hourly
		#cp -r cron.monthly/* /etc/cron.monthly
		#cp -r cron.weekly/* /etc/cron.weekly
	;;
	"clean")
		rm -rf /etc/cron.d/server-*
		#rm -rf /etc/cron.d/*.sh
		#rm -rf /etc/cron.daily/*.sh
		#rm -rf /etc/cron.hourly/*.sh
		#rm -rf /etc/cron.monthly/*.sh
		#rm -rf /etc/cron.weekly/*.sh
	;;
	*)
		echo -e "\033[31m you must input ./${0} update/clean \033[0m"
	;;
esac
