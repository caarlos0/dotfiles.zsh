#!/bin/zsh
source "$ZSH/antigen/antigen/antigen.zsh"

antigen bundle rupa/z
antigen bundle sindresorhus/pure
antigen bundle oknowton/zsh-dwim
antigen bundle Tarrasch/zsh-colors
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen apply
