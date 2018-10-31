#!/bin/bash
sudo apt-get install flex
sudo apt-get install bison
sudo apt-get install g++
sudo apt-get install cmake
sudo apt-get install make
cd ..
git clone https://github.com/doxygen/doxygen.git
cd doxygen
mkdir build
cd build
cmake -G "Unix Makefile" ..
make
make install
