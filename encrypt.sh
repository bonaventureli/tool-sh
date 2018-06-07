#!/bin/bash

openssl enc -des-ede3-cbc -in pass -out pass-a -k 123456
openssl enc -des-ede3-cbc -in pass-a -out .pass-a -d -k 123456
