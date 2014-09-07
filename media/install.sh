#!/bin/sh
[[ "$(uname -s)" != "Darwin" ]] && exit 0

# watch and download stuff
brew install youtube-dl
brew cask install tvshows subtitle-master beamer vlc transmission spotify
