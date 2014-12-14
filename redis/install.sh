#!/bin/bash
[[ "$(uname -s)" != "Darwin" ]] && exit 0
brew install redis
