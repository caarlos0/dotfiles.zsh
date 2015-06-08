#!/bin/sh
VERSION="0.0.3-Darwin"
mkdir -p ~/.dotfiles/antibody/antibody
wget -O /tmp/antibody.tar.gz \
  "https://github.com/caarlos0/antibody/releases/download/$VERSION/antibody-$VERSION.tar.gz"
tar xvzf /tmp/antibody.tar.gz -C ~/.dotfiles/antibody/antibody
