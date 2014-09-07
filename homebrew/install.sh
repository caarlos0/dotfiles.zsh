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

brew update

# more formualae
brew tap phinze/homebrew-cask
brew tap caskroom/versions
brew install brew-cask

# usefull stuff
brew install grc coreutils the_silver_searcher htop-osx heroku-toolbelt \
  imagemagick wget unrar
brew cask install iterm2 the-unarchiver disk-inventory-x appzapper diffmerge

# virtualization
brew cask install virtualbox vagrant

# chat, books, notes and documents
brew cask install kindle google-drive dropbox skype slack \
  messenger-for-telegram evernote skitch

# chrome
brew cask install google-chrome-beta

# vpn stuff
brew cask install tunnelblick-beta

# gaming
brew cask install steam

# clean things up
brew cleanup
brew cask cleanup
