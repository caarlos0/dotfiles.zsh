#!/bin/zsh

if [ "$(uname -s)" = "Darwin" ]; then
  brew cask install atom
fi

apm install \
  editorconfig autocomplete-plus language-docker \
  linter linter-shellcheck linter-javac linter-jshint linter-ruby
