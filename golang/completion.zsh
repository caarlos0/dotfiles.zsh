#!/bin/zsh
if [ "$(uname -s)" = "Darwin" ]; then
  completion="$(brew --prefix)/share/zsh/functions/_go"
else
  completion=/usr/local/etc/bash_completion.d/go-completion.bash
fi

[[ -f completion ]] && source "$completion"
