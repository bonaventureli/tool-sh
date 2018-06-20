#!/bin/bash
wget -c https://hewlettpackard.github.io/wireless-tools/wireless_tools.29.tar.gz
wget -c http://www.linuxfromscratch.org/patches/blfs/svn/wireless_tools-29-fix_iwlist_scanning-1.patch
tar zxvf wireless_tools.29.tar.gz
        cd wireless_tools.29
        patch -Np1 -i ../wireless_tools-29-fix_iwlist_scanning-1.patch
        make
        make PREFIX=/usr INSTALL_MAN=/usr/share/man install

