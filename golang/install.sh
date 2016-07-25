#!/bin/sh
if [ "$(which go)" ] && [ ! -z "$GOPATH" ]; then
  mkdir -p "$GOPATH/bin" "$GOPATH/src/github.com/"

  packages="
    github.com/adjust/go-wrk
    github.com/alecthomas/gometalinter
    github.com/golang/lint/golint
    github.com/lukehoban/go-outline
    github.com/mitchellh/gox
    github.com/motemen/gore
    github.com/newhook/go-symbols
    github.com/nsf/gocode
    github.com/rogpeppe/godef
    github.com/tpng/gopkgs
    golang.org/x/tools/cmd/cover
    golang.org/x/tools/cmd/godoc
    golang.org/x/tools/cmd/goimports
    golang.org/x/tools/cmd/gorename
    golang.org/x/tools/cmd/guru
    golang.org/x/tools/cmd/stringer
    sourcegraph.com/sqs/goreturns
  "

  for pkg in $packages; do
    go get -u "$pkg"
  done
  "$GOPATH"/bin/gometalinter --install --update
fi
