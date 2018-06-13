#!/bin/bash
if [ "${1}" == "install" ];then
sudo gem install rails
elif [ "${1}" == "remove" ];then
sodo gem remove rails
else
ruby -v
sqlite3 --version
rails --version

RUBYNAME=hello
rm -rf $RUBYNAME
#rails new $RUBYNAME
rails new $RUBYNAME -h --skip-spring --skip-listen
#rails new -h blog
cd $RUBYNAME
bin/rails generate controller Welcome index
vim app/views/welcome/index.html.erb
#<h1>Hello,Rails!</h1>
vim config/routes.rb
#root 'welcome#index'
bin/rails server
firefox localhost:3000
fi
