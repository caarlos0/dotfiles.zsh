#!/bin/bash
if [ "$(uname -s)" != "Darwin" ]; then
  FONTS_FOLDER="$HOME/.fonts"
  mkdir -p "$FONTS_FOLDER"
  wget -O /tmp/hack.zip \
   -c https://github.com/chrissimpkins/Hack/releases/download/v2.020/Hack-v2_020-ttf.zip
  unzip -o /tmp/hack.zip -d "$FONTS_FOLDER"
fi
