#!/bin/zsh
test -d /usr/local/opt/fzf/shell || return 0

export FZF_COMPLETION_TRIGGER='**'
. /usr/local/opt/fzf/shell/completion.zsh
