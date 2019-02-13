#!/bin/bash

/bin/bash -e $PWD/download-arm-linux-gcc.sh 2>&1 | tee download.log
cp email.sh ..
cd ..
email.sh download.log
