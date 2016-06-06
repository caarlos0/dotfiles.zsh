#!/bin/sh
test "$(which apm)" || return 0
apm update --confirm false
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
  sort-lines \
  wakatime
apm remove metrics exception-reporting || true
