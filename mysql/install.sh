#!/bin/zsh
[[ "$(uname -s)" != "Darwin" ]] && exit 0

brew install mariadb
brew cask install sequel-pro
