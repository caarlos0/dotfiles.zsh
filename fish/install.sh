#!/bin/sh
set -eo pipefail

curl -L https://get.oh-my.fish > /tmp/omf
fish /tmp/omf --path=~/.local/share/omf --config=~/.dotfiles/fish/config
mkdir -p ~/.config/fish/completions

# docker completions
curl https://raw.githubusercontent.com/moby/moby/master/contrib/completion/fish/docker.fish > ~/.config/fish/completions/docker.fish
