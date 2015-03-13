#!/bin/zsh
__reload_dotfiles() {
  export PATH="$(command -p getconf PATH)"
  source ~/.zshrc
}
alias reload!='__reload_dotfiles'
