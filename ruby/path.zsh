#!/bin/sh
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$PATH:$HOME/.rbenv/bin"
fi

rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}
