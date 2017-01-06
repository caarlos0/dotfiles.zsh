#!/bin/sh
test -z "$KEEP_SUBLIME" || exit 0

for d in \
  "$HOME/Library/Application Support/Sublime Text 3" \
  "$HOME/.config/sublime-text-3"
do
  test -d "$d" && {
    ST3_LOCAL="$d"
    break
  }
done

# st3 is not installed
test -n "$ST3_LOCAL" || exit 1

# create needed directories
mkdir -p "$ST3_LOCAL/Installed Packages"
mkdir -p "$ST3_LOCAL/Packages/User/"

# Install Package Control
PKG_CTRL_FILE="$ST3_LOCAL/Installed Packages/Package Control.sublime-package"
[ ! -f "$PKG_CTRL_FILE" ] && curl -o "$PKG_CTRL_FILE" \
  "https://sublime.wbond.net/Package Control.sublime-package"

# Link keymaps
for platform in OSX Linux; do
  ln -sf "$DOTFILES/sublime-text-3/Default.sublime-keymap" \
    "$ST3_LOCAL/Packages/User/Default ($platform).sublime-keymap"
done

# Link all sublime-settings files
ln -sf "$DOTFILES"/sublime-text-3/*.sublime-settings "$ST3_LOCAL/Packages/User/"
