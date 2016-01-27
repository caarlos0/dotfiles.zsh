#!/bin/sh
setup_command_t() {
  cd "$ZSH"/vim/vimfiles/vim.symlink/bundle/command-t/ruby/command-t || return 1
  ruby extconf.rb
  make
}
vim +PluginInstall +qall >/tmp/vim-plugins.log 2>&1 || true
setup_command_t >/tmp/cmd-t.log 2>&1 || true
