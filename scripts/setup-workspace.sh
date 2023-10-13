#!/bin/bash
BASEDIR=$(dirname $(readlink -f "$0"))

set -x

sudo apt -y update

sudo apt -y upgrade

sudo apt -y install \
	htop 

# avoid git vs https scheme issues
git config unset

# install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# install dotdrop and the workspace profile dotfiles
pip3 install dotdrop --user
dotdrop install -f -p workspace
