#!/bin/sh
VERSION="0.0.4"
mkdir -p ~/.dotfiles/antibody/antibody
wget -O /tmp/antibody.tar.gz \
  "https://github.com/caarlos0/antibody/releases/download/$VERSION/antibody-$VERSION-$(uname -s).tar.gz"
tar xvzf /tmp/antibody.tar.gz -C ~/.dotfiles/antibody/antibody
