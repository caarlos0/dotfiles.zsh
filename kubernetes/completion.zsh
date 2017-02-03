#!/bin/sh
if which kubectl > /dev/null 2>&1; then
  # shellcheck disable=SC1090,SC2039
  source <(kubectl completion zsh)
fi
