#!/bin/sh
[ "$(uname -s)" != "Darwin" ] && return 0
brew install node
