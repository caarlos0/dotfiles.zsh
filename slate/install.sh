#!/bin/sh
[ "$(uname -s)" != "Darwin" ] && exit 0
brew cask install slate
