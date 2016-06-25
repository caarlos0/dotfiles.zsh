#!/bin/sh
if test "$(which apm)"; then
  apm upgrade --confirm false

  modules="
    atom-beautify
    atom-wrap-in-tag
    color-picker
    editorconfig
    file-icons
    go-plus
    go-rename
    language-diff
    language-docker
    language-puppet
    language-terraform
    linter
    linter-jshint
    linter-ruby
    native-ui
    one-dark-syntax
    sort-lines
    wakatime
  "
  for module in $modules; do
    apm install "$module" || true
  done

  modules="
    metrics
    exception-reporting
  "
  for module in $modules; do
    apm remove "$module" || true
  done
fi
