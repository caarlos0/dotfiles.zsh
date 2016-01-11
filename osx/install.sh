#!/bin/sh
[ "$(uname -s)" != "Darwin" ] && exit 0
echo "› sudo softwareupdate -ia"
sudo softwareupdate -ia
