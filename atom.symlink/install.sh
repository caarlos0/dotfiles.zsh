#!/bin/sh
[ "$(uname -s)" = "Darwin" ] && brew cask install atom
apm install \
  editorconfig \
  language-docker \
  language-diff \
  language-puppet \
  language-terraform \
  linter \
  linter-jshint \
  linter-ruby \
  atom-beautify \
  color-picker \
  go-plus go-rename \
  file-icons || true
