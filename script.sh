#!/usr/bin/env bash         
 
# login as root and run this script via bash & curl: 
apt-get update
apt-get install -y curl git-core

# Install RVM and set it up for use
curl -L get.rvm.io | bash -s stable --auto-dotfiles
cd && echo "[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"" >> .bashrc
source /usr/local/rvm/scripts/rvm

# RTFM for rvm docs https://rvm.io/
# Install Ruby
rvm install 1.9.3
rvm use 1.9.3 --default

# Install the bundler gem, and chef
gem install bundler --no-ri --no-rdoc
gem install chef --no-ri --no-rdoc

# Print out the installed version numbers
echo "*"
echo "* Installed Software Version Numbers"
echo "*"
ruby --version
echo Gem `gem --version`