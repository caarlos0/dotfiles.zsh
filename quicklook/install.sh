#!/bin/bash
# quick look plugins - https://github.com/sindresorhus/quick-look-plugins
[ "$(uname -s)" = "Darwin" ] && brew cask install qlcolorcode qlstephen \
  qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql \
  qlimagesize webpquicklook suspicious-package
