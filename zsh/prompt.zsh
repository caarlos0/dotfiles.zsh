#!/bin/zsh
antigen bundle caarlos0/pure --branch=118
antigen apply

autoload -U promptinit && promptinit

PURE_CMD_MAX_EXEC_TIME=1
PURE_PROMPT_SYMBOL=λ

prompt pure
