#!/bin/sh
brewbump() {
  brew update
  brew upgrade --all
  brew cleanup
  brew cask cleanup
}
