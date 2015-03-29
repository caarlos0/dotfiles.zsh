#!/bin/zsh
[ "$(uname -s)" != "Darwin" ] && return 0

brew install mariadb
brew cask install sequel-pro
