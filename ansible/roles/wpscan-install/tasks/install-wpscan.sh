#!/bin/bash

# setup
apt install gnupg2
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# install rvm
cd /tmp
curl -sSL https://get.rvm.io -o rvm.sh
cat /tmp/rvm.sh | bash -s stable --rails
source /usr/local/rvm/scripts/rvm
export PATH=$PATH:/usr/local/rvm/bin/

# use rvm
rvm install 2.6
rvm use 2.6

# install nokogiri
apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev -y
gem install nokogiri

# wpscan
gem install wpscan
