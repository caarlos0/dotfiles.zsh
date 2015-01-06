#!/bin/bash
[[ "$(uname -s)" != "Darwin" ]] && exit 0

brew cask install iterm2

curl -L \
  https://raw.githubusercontent.com/chriskempson/base16-iterm2/master/base16-ocean.dark.itermcolors \
  > /tmp/base16-ocean.dark.itermcolors
open /tmp/base16-ocean.dark.itermcolors

