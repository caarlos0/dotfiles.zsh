#!/bin/sh
[ "$(uname -s)" = "Darwin" ] && brew cask install atom
apm install \
  editorconfig autocomplete-plus \
  language-docker language-diff language-puppet \
  linter linter-jshint linter-ruby \
  atom-beautify color-picker || true
