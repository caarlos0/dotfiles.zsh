#!/bin/zsh
[ "$(uname -s)" = "Darwin" ] && brew cask install atom
apm install \
  editorconfig autocomplete-plus \
  language-docker language-diff \
  linter linter-shellcheck linter-javac linter-jshint linter-ruby \
  atom-beautify color-picker || true
