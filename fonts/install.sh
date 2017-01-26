#!/bin/sh
URL="https://github.com/chrissimpkins/Hack/releases/download/"

install() {
  curl -L -s -o /tmp/hack.tgz "$URL/v2.020/Hack-v2_020-${1}.tar.gz"
  tar xzvf /tmp/hack.tgz -C "$2"
}

if [ "$(uname -s)" = "Darwin" ]; then
  if which brew >/dev/null 2>&1; then
     brew cask install font-hack
  else
    install "otf" ~/Library/Fonts
  fi
else
  mkdir -p ~/.fonts
  install "ttf" ~/.fonts
fi
