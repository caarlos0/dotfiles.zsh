#!/bin/sh
if [ "$(uname -s)" = "Darwin" ] && which brew >/dev/null 2>&1; then
  if [ ! "$(which antibody)" ]; then
    brew tap getantibody/homebrew-antibody
    brew install antibody
  else
    brew update
    brew upgrade antibody
  fi
else
  curl -sL https://git.io/vwMNi | sh -s
fi

antibody bundle < "$ZSH/antibody/bundles.txt" > ~/.bundles.txt
antibody bundle sindresorhus/pure >> ~/.bundles.txt
antibody bundle < "$ZSH/antibody/last_bundles.txt" >> ~/.bundles.txt
