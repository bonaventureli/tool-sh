#!/bin/bash
#https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/refs/tags
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-2.6.32.71.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-3.0.101.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-3.2.102.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-3.4.113.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-3.6.11.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-3.8.13.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-3.10.108.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-3.12.74.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-3.14.79.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-3.16.56.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-3.18.112.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-4.0.9.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-4.2.8.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-4.4.135.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-4.6.7.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-4.8.17.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-4.10.17.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-4.12.14.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-4.14.47.tar.gz
wget -c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/snapshot/linux-stable-4.16.13.tar.gz


#make ARCH=arm CROSS_COMPILE=${CC} distclean
#make ARCH=arm CROSS_COMPILE=${CC} omap3_evm_defconfig
#make ARCH=arm CROSS_COMPILE=${CC} menuconfig
#make ARCH=arm CROSS_COMPILE=${CC} uImage modules
#make ARCH=arm CROSS_COMPILE=${CC} 
