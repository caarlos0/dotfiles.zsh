#!/bin/sh
. "$ZSH/golang/path.zsh"
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
# stringer
go get golang.org/x/tools/cmd/stringer

"$GOPATH"/bin/gox -build-toolchain
"$GOPATH"/bin/gometalinter --install --update
