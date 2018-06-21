#!/bin/bash -e
if [ ! -d $PWD/print-simulator ]; then
git clone https://github.com/bonaventureli/print-simulator.git
fi
cd print-simulator
firefox print_simulator.html
