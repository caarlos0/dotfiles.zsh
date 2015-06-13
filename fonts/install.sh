#!/bin/bash
if [ "$(uname -s)" = "Darwin" ]; then
  brew cask install font-source-code-pro font-fira-code
else
  FONTS_FOLDER="$HOME/.fonts"
  mkdir -p "$FONTS_FOLDER"
  # Fira Code
  if [ ! -f "$FONTS_FOLDER"/FiraCode-Regular.otf ]; then
    wget -c https://github.com/tonsky/FiraCode/releases/download/0.3/FiraCode-Regular.otf \
      -O "$FONTS_FOLDER"/FiraCode-Regular.otf
  fi

  # Source Code Pro
  if [ ! -f "$FONTS_FOLDER"/SourceCodePro-Regular.ttf ]; then
    wget -c https://github.com/adobe-fonts/source-code-pro/archive/1.017R.tar.gz \
      -O /tmp/source-code-pro.tar.gz
    mkdir -p /tmp/source-code-pro
    tar -xzvf /tmp/source-code-pro.tar.gz -C /tmp/source-code-pro
    mv /tmp/source-code-pro/*/OTF/* "$FONTS_FOLDER"/
  fi
fi
