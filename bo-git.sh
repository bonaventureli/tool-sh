#!/bin/bash
#…or create a new repository on the command line

#echo "# tool-sh" >> README.md
#git config --global user.email "xxx@xxx.cn"
#git config --global user.name "bonaventureli"

git init
git add -A
#git add README.md
#git commit -m "vbird"
git commit -m "email"
#git commit -m "first commit"
git remote add origin https://github.com/bonaventureli/tool-sh.git
git push -u origin master

#…or push an existing repository from the command line

#git remote add origin https://github.com/bonaventureli/tool-learn-sh.git
#git push -u origin master
