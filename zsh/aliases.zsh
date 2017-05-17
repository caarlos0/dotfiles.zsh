#!/bin/sh
__reload_dotfiles() {
  exec "$SHELL" -l
}
alias reload!='__reload_dotfiles'
alias orphans!='sudo pacman -Rns $(pacman -Qtdq)'
alias minecraft!= './home/sean/minecraft/minecraft start'
alias minecraft#= './home/sean/minecraft/minecraft stop'
