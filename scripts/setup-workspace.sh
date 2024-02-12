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
	direnv

# unset to enable cloning because of missing ssh keys, dotdrop will override with new .gitconfig
git config --global --remove-section "url.git@github.com:"

# install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# install dotdrop and the workspace profile dotfiles
pip3 install dotdrop --user
dotdrop install -f -p workspace

# install bazel tools
go install github.com/bazelbuild/buildtools/buildifier@latest
go install mvdan.cc/gofumpt@latest

# install freephite
sudo chmod -R g+w /usr/local/volta
volta install @bradymadden97/freephite-cli

# install grpcurl
go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
