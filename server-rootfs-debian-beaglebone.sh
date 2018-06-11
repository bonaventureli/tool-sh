#!/bin/bash
#debian temppwd
#root root
wget -c https://rcn-ee.com/rootfs/eewiki/minfs/debian-9.3-minimal-armhf-2017-12-09.tar.xz
sha256sum debian-9.3-minimal-armhf-2017-12-09.tar.xz
#5120fcfb8ff8af013737fae52dc0a7ecc2f52563a9aa8f5aa288aff0f3943d61  debian-9.3-minimal-armhf-2017-12-09.tar.xz
tar xf debian-9.3-minimal-armhf-2017-12-09.tar.xz
