#!/bin/zsh
if [ "$(uname -s)" = "Darwin" ]; then
  completion=/usr/local/etc/bash_completion.d/go-completion.bash
else
  completion="$(brew --prefix)/share/zsh/functions/_go"
fi

[[ -f completion ]] && source "$completion"
