#!/bin/sh
[ "$(uname -s)" != "Darwin" ] && exit 0
ln -sf "$DOTFILES"/rectangle/com.knollsoft.Rectangle.plist ~/Library/Preferences/com.knollsoft.Rectangle.plist
