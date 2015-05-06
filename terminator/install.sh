#!/bin/sh
[ "$(uname -s)" = "Darwin" ] && return 0
mkdir -p ~/.config/terminator/
ln -sf "$ZSH"/terminator/base16-ocean-dark.config ~/.config/terminator/config
