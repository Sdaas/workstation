#!/usr/bin/env bash         
 
# login as root and run this script via bash & curl: 
apt-get update
apt-get install -y curl git-core openjdk-6-jre-headless

# Install RVM and set it up for use
curl -L get.rvm.io | bash -s stable --auto
cd && echo "[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"" >> .bashrc
source /usr/local/rvm/scripts/rvm

# Install Ruby
rvm install 1.9.3
rvm use 1.9.3 --default

# Install the bundler gem
gem install bundler