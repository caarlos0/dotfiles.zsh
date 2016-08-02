#!/bin/sh
if [ "$(uname -s)" = "Darwin" ] && which brew >/dev/null 2>&1; then
  if [ ! "$(which antibody)" ]; then
    brew tap getantibody/homebrew-antibody
    brew install antibody
  fi
else
  curl -sL https://git.io/vwMNi | sh -s
fi

command antibody bundle < "$ZSH/antibody/bundles.txt" |
  xargs -I {} echo "source {}" > ~/.bundles.txt

# bundles that should be loaded last, in this specific order
last_bundles="
  sindresorhus/pure
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
"
for bundle in $last_bundles; do
  command antibody bundle "$bundle" |
    xargs -I {} echo "source {}" >> ~/.bundles.txt
done
