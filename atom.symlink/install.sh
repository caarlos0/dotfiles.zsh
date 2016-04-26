#!/bin/sh
if test ! "$(which apm)"; then
  return 0
fi
apm install \
  atom-beautify \
  atom-wrap-in-tag \
  color-picker \
  editorconfig \
  file-icons \
  go-plus \
  go-rename \
  language-diff \
  language-docker \
  language-puppet \
  language-terraform \
  linter \
  linter-jshint \
  linter-ruby \
  native-ui \
  one-dark-syntax \
  sort-lines
apm remove metrics exception-reporting
apm update
