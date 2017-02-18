#!/bin/bash

# make sure no apt tasks are running in the background
sudo ./waitForApt.sh

# ===================================================================================
# install jekyll stuff:

gem install github-pages therubyracer bundler jekyll-livereload --no-ri --no-rdoc
