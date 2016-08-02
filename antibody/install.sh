#!/bin/sh
if [ "$(uname -s)" = "Darwin" ] && which brew >/dev/null 2>&1; then
  if [ ! "$(which antibody)" ]; then
    brew tap getantibody/homebrew-antibody
    brew install antibody
  fi
else
  curl -sL https://git.io/vwMNi | sh -s
fi

# this code could be simpler, but right now it's a hack for an antibody bug:
#   https://github.com/getantibody/antibody/issues/119
echo "" > ~/.bundles.txt
for pack in main prompt last; do
  command antibody bundle < "$ZSH/antibody/$pack.txt" |
    xargs -I {} echo "source {}" >> ~/.bundles.txt
done
