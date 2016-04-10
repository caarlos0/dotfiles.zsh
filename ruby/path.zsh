#!/bin/sh
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$PATH:$HOME/.rbenv/bin"
fi

if which rbenv >/dev/null 2>&1; then
  rbenv() {
    eval "$(command rbenv init -)"
    rbenv "$@"
  }
fi
