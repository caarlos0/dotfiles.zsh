#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
  if [ ! "$(which antibody)" ]; then
    brew tap getantibody/homebrew-antibody
    brew install antibody
  fi
else
  curl -sL https://git.io/vwMNi | sh -s
fi
