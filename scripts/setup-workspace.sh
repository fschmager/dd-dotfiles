#!/bin/bash
BASEDIR=$(dirname $(readlink -f "$0"))

set -x

# pull package updates
sudo apt -y update

# update installed packages
sudo apt -y upgrade

# install new packages
sudo apt -y install \
	clang \
	htop \
	file \
	direnv

# unset to enable cloning because of missing ssh keys, dotdrop will override with new .gitconfig
git config --global --remove-section "url.git@github.com:"

# install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# install dotdrop and the workspace profile dotfiles
pip install --upgrade pip
pip3 install dotdrop --user
export DOTDROP_CONFIG="~/dotfiles/config.yaml"
dotdrop install -f -p workspace

# install bazel tools
go install github.com/bazelbuild/buildtools/buildifier@latest
go install mvdan.cc/gofumpt@latest

# install graphite
sudo chmod -R g+w /usr/local/volta
npm install -g npm@latest
npm install -g @withgraphite/graphite-cli@stable

# install grpcurl
go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
