#!/bin/zsh
PURE_PATH=~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure.git

antigen bundle sindresorhus/pure
antigen apply

ln -sf "$PURE_PATH/pure.zsh" "$PURE_PATH/prompt_pure_setup"

autoload -U promptinit && promptinit

PURE_CMD_MAX_EXEC_TIME=1
PURE_PROMPT_SYMBOL=λ

prompt pure
