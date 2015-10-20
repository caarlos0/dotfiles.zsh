#!/bin/sh
if test ! "$(which gsettings)"; then
  exit 0
fi

# disable autorun
gsettings set org.gnome.desktop.media-handling autorun-never true

# set terminator as default terminal
if test "$(which terminator)"; then
  gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'
fi
