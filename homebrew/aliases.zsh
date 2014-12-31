#!/bin/zsh
set -eo pipefail
brewbump() {
  brew update
  brew upgrade
  brew cleanup
  brew cask cleanup
}
