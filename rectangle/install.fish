#!/usr/bin/env fish
switch (uname)
case Darwin
	ln -sf $DOTFILES/rectangle/com.knollsoft.Rectangle.plist ~/Library/Preferences/com.knollsoft.Rectangle.plist
end
