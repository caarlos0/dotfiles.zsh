#!/bin/sh
if [ "$(uname -s)" == "Darwin" ]; then
  brew cask install postgres pg-commander
fi
