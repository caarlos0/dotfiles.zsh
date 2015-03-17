#!/bin/sh
if test ! "$(which gsettings)"; then
  exit 0
fi

# disable autorun
gsettings set org.gnome.desktop.media-handling autorun-never true

