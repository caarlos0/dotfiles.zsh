#!/bin/zsh
brewbump() {
  brew update
  brew upgrade --all
  brew cleanup
  brew cask cleanup
}
