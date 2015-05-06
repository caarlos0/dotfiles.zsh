#!/bin/sh
__reload_dotfiles() {
  PATH="$(command -p getconf PATH)"
  . ~/.zshrc
  cd .
}
alias reload!='__reload_dotfiles'
