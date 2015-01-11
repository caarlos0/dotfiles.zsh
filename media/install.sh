#!/bin/bash
[[ "$(uname -s)" != "Darwin" ]] && exit 0

# watch and download stuff
brew install youtube-dl
brew cask install tvshows subtitle-master beamer vlc transmission spotify

# disable iTunes fuckin helper
sudo mv /Applications/iTunes.app/Contents/MacOS/iTunesHelper.app{,-disabled}

# also this spotify web helper
mv ~/Applications/Spotify.app/Contents/MacOS/SpotifyWebHelper{,-disabled}
