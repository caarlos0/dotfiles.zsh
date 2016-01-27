#!/bin/zsh
set -x
which brew
ls "$(brew --prefix)/share/"
source "$(brew --prefix)/share/antibody.zsh"
set +x
