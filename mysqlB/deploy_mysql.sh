#1/bin/bash
sudo apt-get install mysql-server
sudo apt-get install mysql-client
sudo apt-get install libmysqlclient-dev
sudo netstat -tap | grep mysql
sudo mysql_secure_installation
systemctl status mysql.service
sudo mysql -u root -p
# n n n y n y
