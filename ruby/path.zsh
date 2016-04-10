#!/bin/sh
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi

rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}
