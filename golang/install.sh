#!/bin/sh
if [ "$(which go)" ] && [ ! -z "$GOPATH" ]; then
  mkdir -p "$GOPATH/bin" "$GOPATH/src/github.com/"

  packages="
    github.com/alecthomas/gometalinter
    golang.org/x/tools/cmd/cover
    golang.org/x/tools/cmd/godoc
    golang.org/x/tools/cmd/goimports
  "

  for pkg in $packages; do
    go get -u "$pkg"
  done
  "$GOPATH"/bin/gometalinter --install --update
fi
