#!/bin/bash
BASEDIR=$(dirname $(readlink -f "$0"))

set -x

sudo apt -y update

sudo apt -y upgrade

sudo apt -y install \
	htop 

# install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# install dotdrop and the workspace profile dotfiles
pip3 install dotdrop
dotdrop install -f -p workspace

# install repos
setup-repo dogweb
setup-repo dd-source
setup-repo winter
setup-repo team-aaa-internal-tools
setup-repo k8s-resources
setup-repo devtools
