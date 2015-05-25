#!/bin/bash
if [ "$(uname -s)" = "Darwin" ]; then
  FONTS_FOLDER="$HOME/Library/Fonts"
else
  FONTS_FOLDER="$HOME/.fonts"
fi
mkdir -p "$FONTS_FOLDER"

# Fira Code
wget -c https://github.com/tonsky/FiraCode/releases/download/0.3/FiraCode-Regular.otf \
  -O "$FONTS_FOLDER"/FiraCode-Regular.otf

# Source Code Pro
wget -c https://github.com/adobe-fonts/source-code-pro/archive/1.017R.tar.gz \
  -O /tmp/source-code-pro.tar.gz
mkdir -p /tmp/source-code-pro
tar -xzvf /tmp/source-code-pro.tar.gz -C /tmp/source-code-pro
mv /tmp/source-code-pro/*/OTF/* "$FONTS_FOLDER"/
