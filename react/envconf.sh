#!/bin/bash

# install watchman
# git clone https://github.com/facebook/watchman.git
git checkout v4.9.0
cd watchman/
sudo apt-get install -y autoconf automake build-essential python-dev libssl-dev libtool
./autogen.sh
./configure
make
sudo make install
echo "ya casi"
# end install watchman
