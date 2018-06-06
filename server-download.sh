#!/bin/bash

/bin/bash -e $PWD/download-arm-linux-gcc.sh 2>&1 | tee download.log
email.sh download.log
