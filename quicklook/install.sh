#!/bin/zsh
[ "$(uname -s)" != "Darwin" ] && return 0
# quick look plugins - https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json \
  qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook \
  suspicious-package
