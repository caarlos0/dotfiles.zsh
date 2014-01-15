#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)" > /tmp/homebrew-install.log
fi

# Install homebrew packages
brew install grc coreutils spark z ack the_silver_searcher
brew tap phinze/homebrew-cask
brew install brew-cask
brew cask install caffeine dropbox iterm2 sequel-pro virtualbox vagrant \
  the-unarchiver vlc google-chrome skype transmission dash cloudapp \
  sizeup rdio github disk-inventory-x tvshows subtitle-master eclipse-ide \
  sourcetree kindle pgadmin3 lastfm alfred google-drive
# postgres formulae was deleted for now due to some issues.. waiting...

# quick look plugins - https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json \
  qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package

# make alfred look into caskroom folder
brew cask alfred

# more things
brew tap caskroom/versions

# chrome canary!
brew cask install google-chrome-canary


exit 0
