#!/bin/zsh
# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
#completion=/usr/local/etc/bash_completion.d/git-completion.bash
#completion=$(brew --prefix)/share/zsh/site-functions/_git

if [ "$(uname -s)" = "Darwin" ]; then
  completion="$(brew --prefix)/share/zsh/functions/_git"
else
  completion=/usr/local/etc/bash_completion.d/git-completion.bash
fi

[[ -f completion ]] && source "$completion"
