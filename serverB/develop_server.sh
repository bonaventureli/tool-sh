#!/bin/bash
vim /etc/hostname
V470c
Y410p
vim /etc/apache2/prots.conf
vim /etc/apache2/sites-enabled/000-default.conf
/etc/init.d/apache2 restart
set root=(hd1,msdos1)
set prefix=(hd1,msdos1)/boot/grub
insmod normal
normal
