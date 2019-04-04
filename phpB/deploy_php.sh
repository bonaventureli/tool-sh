#!/bin/bash

#wget -c https://www.php.net/distributions/php-7.3.3.tar.xz
#xz -d php-7.3.3.tar.xz
#tar xvf php-7.3.3.tar
sudo apt-get install apache2
sudo apt-get install php7.0
php -v
apt-cache search libapache2-mod-php #see what version php is
sudo apt-get install libapache2-mod-php7.0
cd /var/www/html
#编写一个php文件，然后再网页中看是否可以打开
#sudo vim test.php
#<?php
#	phpinfo();
#?>
#localhost/test.php


