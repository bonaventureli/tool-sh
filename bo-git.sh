#!/bin/bash
#…or create a new repository on the command line

#ssh-keygen -t rsa -C "xxx@xxx.cn"
#ssh -T git@github.com

#echo "# tool-sh" >> README.md
#git config --global user.email "xxx@xxx.cn"
#git config --global user.name "bonaventureli"
#git config --global http.postBuffer  524288000
git init
git add -A
#git commit -m "vbird"
git commit -m "${1}"
git remote add origin https://github.com/bonaventureli/tool-sh.git
git push -u origin master -f
git whatchanged -1
#git rm empty
#git commit -m "delete file"
#git push origin master

#git branch -a
#git branch tool-sh1.0
#git branch tool-sh1.1
#git branch tool-sh1.2

#git checkout tool-sh1.0
#git push origin tool-sh1.0

#git checkout tool-sh1.1
#git push origin tool-sh1.1

#git checkout tool-sh1.2
#git push origin tool-sh1.2

#git branch --delete tool-sh1.0
#git branch --delete tool-sh1.1
#git branch --delete tool-sh1.2
#git push origin --delete tool-sh1.0
#git push origin --delete tool-sh1.1
#git push origin --delete tool-sh1.2


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


