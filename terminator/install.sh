#!/bin/sh
[ "$(uname -s)" = "Darwin" ] && exit 0
mkdir -p ~/.config/terminator/
ln -sf "$ZSH"/terminator/base16-ocean-dark.config ~/.config/terminator/config
