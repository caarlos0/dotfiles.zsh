#!/bin/zsh
PURE_CMD_MAX_EXEC_TIME=1
antibody bundle sindresorhus/pure

# these two guys **MUST** be loaded last.
antibody bundle <<EOF
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
EOF
