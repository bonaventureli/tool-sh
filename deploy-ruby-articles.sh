#!/bin/bash
ruby -v
sqlite3 --version
gem install rails
rails --version

RUBYNAME=articles
rm -rf $RUBYNAME
rails new $RUBYNAME
#rails new blog --skip-spring --skip-listen
#rails new -h blog
cd $RUBYNAME
bin/rails generate controller Welcome index
vim app/views/welcome/index.html.erb
#<h1>Hello,Rails!</h1>
vim config/routes.rb
#resources :articles
#root 'welcome#index'
bin/rails routes
bin/rails server
firefox localhost:3000

