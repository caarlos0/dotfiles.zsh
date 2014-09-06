#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
if [ "$(uname -s)" != "Darwin" ]
then
  exit 0
fi

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)" > /tmp/homebrew-install.log
fi

# more formualae
brew tap phinze/homebrew-cask
brew tap caskroom/versions
brew install brew-cask

# usefull stuff
brew install grc coreutils the_silver_searcher htop-osx heroku-toolbelt \
  imagemagick wget unrar
brew cask install iterm2 the-unarchiver disk-inventory-x appzapper diffmerge \
  slate

# coding
brew install maven node rbenv android-sdk
brew cask install eclipse-jee atom

# virtualization
brew cask install virtualbox vagrant

# chat, books, music, notes and documents
brew cask install spotify kindle google-drive dropbox skype slack \
  messenger-for-telegram evernote skitch

# database stuff
brew install redis mariadb
brew cask install postgres pg-commander sequel-pro

# watch and download stuff
brew install youtube-dl
brew cask install tvshows subtitle-master beamer vlc transmission

# quick look plugins - https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json \
  qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package

# chrome canary
brew cask install google-chrome-canary

# vpn stuff
brew cask install tunnelblick-beta

# gaming
brew cask install steam

# clean things up
brew cleanup
brew cask cleanup

exit 0
