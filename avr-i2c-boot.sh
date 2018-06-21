#!/bin/bash -e

git clone https://github.com/bonaventureli/i2c-boot.git || true

cd i2c-boot
make
