#!/usr/bin/env fish
test -L ~/.ssh/config || {
	mv ~/.ssh/config ~/.ssh/config.local
	ln -s $DOTFILES/ssh/config ~/.ssh/config
}
test -f ~/.ssh/config.local || touch ~/.ssh/config.local
