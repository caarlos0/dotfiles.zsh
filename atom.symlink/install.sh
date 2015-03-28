#!/bin/zsh
if [ "$(uname -s)" = "Darwin" ]; then
  brew cask install atom
fi

# base
apm install editorconfig autocomplete-plus language-docker
# linters
apm install linter linter-shellcheck linter-javac linter-jshint linter-ruby
