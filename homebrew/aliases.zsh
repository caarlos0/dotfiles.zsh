#!/bin/sh
which brew >/dev/null 2>&1 || return
brew() {
  case "$1" in
    cleanup)
      command brew cleanup
      command brew cask cleanup
      command brew prune
      ;;
    bump)
      command brew update
      command brew upgrade --all
      brew cleanup
      ;;
    *)
      command brew "$@"
      ;;
  esac
}
