#!/bin/sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa
vim +'PlugUpdate' +qa

if command -v nvim >/dev/null 2>&1; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	mkdir -p ~/.config/nvim/
	ln -sf "$DOTFILES/vim/vimrc.symlink" ~/.config/nvim/init.vim
	nvim +'PlugInstall --sync' +qa
	nvim +'PlugUpdate' +qa
fi
