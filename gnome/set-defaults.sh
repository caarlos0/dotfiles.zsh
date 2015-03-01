#!/bin/sh
[ "$(uname -s)" != "Linux" ] && exit 0

# disable autorun
gsettings set org.gnome.desktop.media-handling autorun-never true

