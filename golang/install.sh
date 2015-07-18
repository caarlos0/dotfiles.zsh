#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
  brew install go hg
fi
# docs
go get -u golang.org/x/tools/cmd/godoc
# rename funcs
go get -u golang.org/x/tools/cmd/gorename
# coverage
go get -u golang.org/x/tools/cmd/cover
# multi-arch compiler
go get -u github.com/mitchellh/gox
# linter
go get -u github.com/alecthomas/gometalinter
# repl
go get -u github.com/motemen/gore

"$GOPATH"/bin/gox -build-toolchain
"$GOPATH"/bin/gometalinter --install --update
