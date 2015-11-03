#!/bin/sh
[ "$(uname -s)" = "Darwin" ] && exit 0
mkdir -p ~/.config/terminator/
ln -sf "$ZSH"/terminator/config ~/.config/terminator/config
