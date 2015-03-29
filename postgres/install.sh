#!/bin/zsh
[[ "$(uname -s)" != "Darwin" ]] && exit 0

brew cask install postgres pg-commander
