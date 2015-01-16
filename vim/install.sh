#!/bin/zsh
setup_command_t() {
  cd "$ZSH"/vim/vimfiles/vim.symlink/bundle/command-t/ruby/command-t
  ruby extconf.rb
  make
}
setup_command_t
vim +PluginInstall +qall

