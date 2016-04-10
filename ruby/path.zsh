#!/bin/sh
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$PATH:$HOME/.rbenv/bin"
fi

# shellcheck disable=SC2039
if rbenv &>/dev/null; then
  rbenv() {
    eval "$(command rbenv init -)"
    rbenv "$@"
  }
fi
