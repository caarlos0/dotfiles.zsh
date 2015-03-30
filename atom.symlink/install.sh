#!/bin/zsh
[ "$(uname -s)" = "Darwin" ] && brew cask install atom
apm install \
  editorconfig autocomplete-plus language-docker \
  linter linter-shellcheck linter-javac linter-jshint linter-ruby || true
