#!/bin/zsh
set -e

# link to ~ and cd to it
cd ..
cp -rf dotfiles ~/.dotfiles
cd ~/.dotfiles

# setup git credentials
echo "setup git fake user/email"
git config --global user.name "dotfiles demo"
git config --global user.email "dotfiles@demo.com"

# bootstrap the mighty
echo "boostraping..."
./script/bootstrap

# load zshrc and check if antibody is working
echo "sourcing ~/.zshrc"
# shellcheck disable=SC1090
source ~/.zshrc || true

test "$(antibody list | wc -l)" -gt 10 || {
	echo "expecting 10+ bundles loaded" >&2
	exit 1
}

test -s ~/.zcompdump || {
	echo "zcompdump file is empty" >&2
	exit 1
}

# check if a random plugin is working (meaning that the bundles were loaded)
ports ls
