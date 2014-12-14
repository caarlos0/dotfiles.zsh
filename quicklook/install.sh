#!/bin/bash
[[ "$(uname -s)" != "Darwin" ]] && exit 0
# quick look plugins - https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json \
  qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package
