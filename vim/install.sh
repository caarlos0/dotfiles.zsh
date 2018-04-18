#!/bin/sh
curl -fLo "$DOTFILES/vim/autoload/plug.vim" --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall
vim +PlugUpdate

if which neovim >/dev/null 2>&1; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	mkdir -p ~/.config/nvim/
	ln -sf "$DOTFILES/vim/vimrc.symlink" ~/.config/nvim/init.vim
	nvim +PlugInstall
	nvim +PlugUpdate
fi
