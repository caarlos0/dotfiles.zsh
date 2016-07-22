#!/bin/sh
if [ "$(uname -s)" = "Darwin" ] && which brew >/dev/null 2>&1; then
  if [ ! "$(which antibody)" ]; then
    brew tap getantibody/homebrew-antibody
    brew install antibody
  fi
else
  curl -sL https://git.io/vwMNi | sh -s
fi
