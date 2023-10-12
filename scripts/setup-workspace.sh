#!/bin/bash
BASEDIR=$(dirname $(readlink -f "$0"))

set -x

sudo apt -y update

sudo apt-get -y install \
	htop 

# install dotdrop and the workspace profile dotfiles
pip3 install dotdrop
dotdrop install -f -p workspace
