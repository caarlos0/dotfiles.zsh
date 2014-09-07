#!/bin/sh
if [ "$(uname -s)" == "Darwin" ]; then
  brew install redis
fi
