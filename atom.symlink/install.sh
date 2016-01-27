#!/bin/sh
if test ! "$(which apm)"; then
  return 0
fi
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
  sort-lines \
  file-icons
