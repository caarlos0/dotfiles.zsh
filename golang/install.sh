#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
  brew install go hg
fi
go get -v golang.org/x/tools/cmd/gorename
go get -v golang.org/x/tools/cmd/cover
go get -v github.com/mitchellh/gox
