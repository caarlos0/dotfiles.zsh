#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
  return 0
fi
mkdir -p ~/.dotfiles/antibody/antibody
wget -O /tmp/antibody.tar.gz \
  "http://antibody.elasticbeanstalk.com/latest/$(uname -s)/$(uname -m)"
tar xvzf /tmp/antibody.tar.gz -C ~/.dotfiles/antibody/antibody
