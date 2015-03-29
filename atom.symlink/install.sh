#!/bin/zsh

instal() {
  if [ "$(uname -s)" = "Darwin" ]; then
    brew cask install atom
  elif test "$(which apt-get)"; then
    sudo add-apt-repository -y ppa:webupd8team/atom
    sudo apt-get update
    sudo apt-get install -y atom
  fi
}

install_plugins() {
  if test "$(which apm)"; then
    # base
    apm install editorconfig autocomplete-plus language-docker
    # linters
    apm install linter linter-shellcheck linter-javac linter-jshint linter-ruby
  fi
}

install || true
install_plugins || true
