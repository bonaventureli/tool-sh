#!/bin/bash
apt-get install ruby
apt-get autoremove
if [ ! -f /samba-ubuntu/ruby-2.5.0.tar.gz ]; then
wget -P /samba-ubuntu https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz
fi

gem install rails
sudo apt-get install sqlite3
sqlite3 --version
apt-get install libsqlite3-dev
rails --version
mkdir rubycode
cd rubycode
rails new blog
##https://rubygems.org->http://mirrors.aliyuncs.com/rubygems/
#sed -i 'http://mirrors.aliyuncs.com/rubygems/' rubycode/blog/Gemfile
#vim rubycode/blog/Gemfile
#bundle install
#rails server
#rails generate controller welcome index
#vim app/views/welcome/index.html.erb

rails g controller posts index show admin_index create edit update destroy
rails g controller comments create destroy
rails g controller users login logout show update
vim config/routes.rb
root 'posts#index'
get '/login', to: 'users#login'
post '/login', to: 'users#login'
post '/logout', to: 'users#logout'
get '/profile', to: 'users#show'
patch '/profile', to: 'users#update'

scope '/admin' do
    resources :posts, except: [:index, :show]
  end

get '/admin/posts', to: 'posts#admin_index'
post '/posts/:id/comments', to: 'comments#create'
scope '/admin' do
    resources :comments, only: [:destroy]
  end
/samba-ubuntu/bonaventureli-ssh/rubycode/blog# rake routes
/samba-ubuntu/bonaventureli-ssh/rubycode/blog# vim Gemfile
gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"
/samba-ubuntu/bonaventureli-ssh/rubycode/blog# bundle install

Bootstrap
/samba-ubuntu/bonaventureli-ssh/rubycode/blog# rake db:migrate
/samba-ubuntu/bonaventureli-ssh/rubycode/blog# rails g bootstrap:install
/samba-ubuntu/bonaventureli-ssh/rubycode/blog# rails g bootstrap:layout
/samba-ubuntu/bonaventureli-ssh/rubycode/blog# rails g bootstrap:themed Posts
