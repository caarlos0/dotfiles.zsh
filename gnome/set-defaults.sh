#!/bin/sh

if [ "$(uname -s)" != "Linux" ]; then
  exit 0
fi


# disable autorun
gsettings set org.gnome.desktop.media-handling autorun-never true

