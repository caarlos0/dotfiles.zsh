#!/usr/bin/env fish
switch (uname)
case Darwin
	sed "s;/Users/carlos;$HOME;g" $DOTFILES/iterm/com.googlecode.iterm2.plist.example >$DOTFILES/iterm/com.googlecode.iterm2.plist
		and defaults write com.googlecode.iterm2 PrefsCustomFolder -string $DOTFILES/iterm
		and defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
end
