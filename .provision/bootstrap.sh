#!/bin/bash

# make sure no apt tasks are running in the background
sudo ./waitForApt.sh

# ===================================================================================
# install ruby: 
# according to instructions on stackoverflow:
# http://stackoverflow.com/questions/9056008/installed-ruby-1-9-3-with-rvm-but-command-line-doesnt-show-ruby-v?answertab=votes#tab-top

echo "Removing old versions of ruby..."
sudo apt-get --purge -y remove ruby-rvm ruby
sudo rm -rf /usr/share/ruby-rvm /etc/rvmrc /etc/profile.d/rvm.sh

echo "Installing latest version of ruby..."
curl -L https://get.rvm.io | bash -s stable --ruby --autolibs=enable --auto-dotfiles

# ===================================================================================
# install nodeJS: 
# refer to:
# http://stackoverflow.com/questions/12913141/message-failed-to-fetch-from-registry-while-trying-to-install-any-module
# https://github.com/nodesource/distributions

echo "Removing old versions of nodeJS..."
sudo apt-get purge -y nodejs npm

echo "Installing latest version of nodeJS..."
sudo apt-get install -y curl
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs
