#!/bin/sh
if which brew >/dev/null 2>&1; then
  brew untap getantibody/homebrew-antibody || true
  brew tap getantibody/homebrew-antibody
  brew install antibody
else
  curl -sL https://git.io/vwMNi | sh -s
fi

antibody bundle < "$ZSH/antibody/bundles.txt" > ~/.bundles.txt
antibody bundle sindresorhus/pure >> ~/.bundles.txt
antibody bundle < "$ZSH/antibody/last_bundles.txt" >> ~/.bundles.txt
