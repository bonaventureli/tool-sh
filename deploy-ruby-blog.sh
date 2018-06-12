#!/bin/bash
sudo apt-get install ruby
sudo apt-get install sqlite3
#sudo apt-get install ruby-railties
sudo gem install rails
#sudo gem instsll redis
sudo gem instsll bundler
#sudo gem install json –v 1.8.3 -- --use-system-libraries
#sudo apt install ruby-bundler
sudo bundle install
bundle install
gem env
ruby -v
sqlite3 --version
rails --version
rm -rf blog
#rails new blog
rails new blog --skip-spring --skip-listen
#rails new -h blog
cd blog
firefox localhost:3000
bin/rails server
#firefox localhost:3000

#sudo apt-get remove ruby
#sudo apt-get remove sqlite3
#sudo gem remove rails
#sudo apt-get remove ruby-railties
