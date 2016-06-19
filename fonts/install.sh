#!/bin/bash
curl -L -s -o /tmp/hack.zip \
  https://github.com/chrissimpkins/Hack/releases/download/v2.020/Hack-v2_020-ttf.zip

if [ "$(uname -s)" = "Darwin" ] && [ ls ~/Library/Fonts/Hack* >/dev/null 2>/dev/null ]; then
  unzip -o /tmp/hack.zip -d ~/Library/Fonts
else
  mkdir -p ~/.fonts
  unzip -o /tmp/hack.zip -d ~/.fonts
fi
