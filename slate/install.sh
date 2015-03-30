#!/bin/zsh
[ "$(uname -s)" != "Darwin" ] && return 0
brew cask install slate
