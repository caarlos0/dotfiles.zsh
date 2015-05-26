#!/bin/zsh
SITE_FUNCTIONS_PATH=/usr/local/share/zsh/site-functions
PURE_PATH=~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure.git

antigen bundle sindresorhus/pure
antigen apply

ln -sf "$PURE_PATH/pure.zsh" "$SITE_FUNCTIONS_PATH/prompt_pure_setup"
ln -sf "$PURE_PATH/async.zsh" "$SITE_FUNCTIONS_PATH/async"

fpath=($SITE_FUNCTIONS_PATH $fpath[@])
autoload -U promptinit && promptinit
PURE_CMD_MAX_EXEC_TIME=1
PURE_PROMPT_SYMBOL=λ
prompt pure
