#!/bin/zsh
setup_command_t() {
  cd "$ZSH"/vim/vimfiles/vim.symlink/bundle/command-t/ruby/command-t
  ruby extconf.rb
  make
}
[ "$(uname -s)" = "Darwin" ] && brew install vim
vim +PluginInstall +qall &> /tmp/vim-plugins.log
setup_command_t &> /tmp/cmd-t.log
