#!/bin/bash
if [ ! -d $PWD/ember-firmware ]; then
git clone https://github.com/spark3dp/ember-firmware.git
fi

cd ember-firmware/C++
mkdir build || true
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make -j4
./smith
