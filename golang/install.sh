#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
  brew install go hg
fi
go get -u golang.org/x/tools/cmd/godoc
go get -u golang.org/x/tools/cmd/gorename
go get -u golang.org/x/tools/cmd/cover
go get -u github.com/mitchellh/gox
go get -u github.com/alecthomas/gometalinter

"$GOPATH"/bin/gox -build-toolchain
"$GOPATH"/bin/gometalinter --install --update
