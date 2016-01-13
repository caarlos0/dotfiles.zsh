#!/bin/zsh
PURE_CMD_MAX_EXEC_TIME=1
PURE_GIT_PULL=0
antibody bundle sindresorhus/pure

# this two guys **MUST** be load last.
antibody bundle <<EOF
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
EOF
