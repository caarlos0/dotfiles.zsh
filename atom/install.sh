#!/bin/sh
if [ "$(uname -s)" == "Darwin" ]; then
  brew cask install atom
fi

apm install project-manager git-plus angularjs color-picker file-icons \
  atom-beautify csslint highlight-line jshint editorconfig  \
  language-rspec
