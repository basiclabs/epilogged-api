#!/bin/bash
sudo apt-get install libffi-dev
ruby-build 2.2.1 /usr/local
sudo gem install bundler rails