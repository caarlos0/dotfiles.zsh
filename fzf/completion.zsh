#!/bin/sh
test -d /usr/local/opt/fzf/shell || return 0

export FZF_COMPLETION_TRIGGER='**'

# shellcheck disable=SC1091,SC1094
. /usr/local/opt/fzf/shell/completion.zsh
