#!/bin/zsh
if [ "$(uname -s)" = "Darwin" ]; then
  source "$(brew --prefix)/share/antibody.zsh"
else
  source "$ZSH/antibody/antibody/antibody.zsh"
fi
