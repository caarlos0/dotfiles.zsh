#!/bin/zsh
setup_command_t() {
  cd "$ZSH"/vim/vimfiles/vim.symlink/bundle/command-t/ruby/command-t
  ruby extconf.rb
  make
}
vim +PluginInstall +qall
setup_command_t
