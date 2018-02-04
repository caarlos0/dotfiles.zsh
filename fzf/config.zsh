#!/bin/sh
test -d /usr/local/opt/fzf/shell || return 0
# shellcheck disable=SC1091
. /usr/local/opt/fzf/shell/key-bindings.zsh
