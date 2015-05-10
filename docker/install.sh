#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
  brew cask install kitematic
  curl -L "https://github.com/docker/compose/releases/download/1.2.0/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
fi
