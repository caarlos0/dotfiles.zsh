#!/bin/sh
if which kubectl > /dev/null 2>&1; then
  source <(kubectl completion zsh)
fi
