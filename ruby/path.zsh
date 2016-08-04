#!/bin/sh
export PATH="$PATH:$HOME/.rbenv/bin"

rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}
