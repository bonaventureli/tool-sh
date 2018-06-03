#!/bin/bash
#…or create a new repository on the command line

#ssh-keygen -t rsa -C "xxx@xxx.cn"
#ssh -T git@github.com

#echo "# tool-sh" >> README.md
#git config --global user.email "xxx@xxx.cn"
#git config --global user.name "bonaventureli"

git init
git add -A
#git commit -m "vbird"
git commit -m "${1}"
git remote add origin https://github.com/bonaventureli/tool-sh.git
git push -u origin master -f

#git rm empty
#git commit -m "delete file"
#git push origin master

#git checkout -b dev
#git add -A
#git commit -m "dev"
#git push -f origin dev
#git branch -d dev
#git push origin --delete dev
#git clone -b dev https://github.com/bonaventureli/tool-sh.git

#git tag -a 1.0 -m "dev"
#git push origin --tags
#git tag
#git fetch origin tag <tagname>


