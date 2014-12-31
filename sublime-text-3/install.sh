#!/bin/bash
set -eo pipefail

if [ "$(uname -s)" = "Darwin" ]; then
  brew cask install sublime-text3
  ST3_LOCAL="$HOME/Library/Application Support/Sublime Text 3"
else
  ST3_LOCAL="$HOME/.config/sublime-text-3"
fi

# create needed directories
mkdir -p "$ST3_LOCAL/Installed Packages"
mkdir -p "$ST3_LOCAL/Packages/User/"

# Install Package Control
curl -o "$ST3_LOCAL/Installed Packages/Package Control.sublime-package" \
  "https://sublime.wbond.net/Package Control.sublime-package"

# Link keybindings
ln -sf "$ZSH/sublime-text-3/Default.sublime-keymap" \
  "$ST3_LOCAL/Packages/User/Default (OSX).sublime-keymap"
ln -sf "$ZSH/sublime-text-3/Default.sublime-keymap" \
  "$ST3_LOCAL/Packages/User/Default (Linux).sublime-keymap"

# Link all sublime-settings files
ln -sf "$ZSH/sublime-text-3/"*.sublime-settings "$ST3_LOCAL/Packages/User/"
