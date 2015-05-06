#!/bin/sh
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi
# shellcheck disable=SC2039
if rbenv &>/dev/null; then
  eval "$(rbenv init -)"
fi
