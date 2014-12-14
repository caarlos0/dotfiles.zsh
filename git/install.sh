#!/bin/bash
[[ "$(uname -s)" != "Darwin" ]] && exit 0

# this bumps default OSX git to 2.2.0+
brew install git
