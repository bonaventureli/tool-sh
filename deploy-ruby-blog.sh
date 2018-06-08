#!/bin/bash
ruby -v
sqlite3 --version
gem install rails
rails --version
rm -rf blog
rails new blog
#rails new blog --skip-spring --skip-listen
#rails new -h blog
cd blog
bin/rails server
firefox localhost:3000

