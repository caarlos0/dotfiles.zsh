#!/bin/zsh
[ "$(uname -s)" != "Darwin" ] && return 0

# install some java stuff
brew install maven
brew cask install eclipse-jee
