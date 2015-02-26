#!/usr/bin/env bash
set -eo pipefail
if [ "$(uname -s)" = "Darwin" ]; then
  brew cask install android-file-transfer
  # disable auto-open when connect.
  mv "/opt/homebrew-cask/Caskroom/android-file-transfer/latest/Android File Transfer.app/Contents/Resources/Android File Transfer Agent.app"{,_DISABLED} || true
  mv "$HOME/Library/Application Support/Google/Android File Transfer/Android File Transfer Agent.app"{,_DISABLED} || true
fi
