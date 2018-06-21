#!/bin/bash
if [ ! -d $PWD/SMG ]; then
git clone https://github.com/bonaventureli/SMG.git
fi

cd SMG
	python setup.py install
	cd
	python
