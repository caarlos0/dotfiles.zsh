#!/bin/bash
if [ ! "$(which go)" ] && [ ! -z "$GOPATH" ]; then
  mkdir -p "$GOPATH/bin" "$GOPATH/src/github.com/"

  go get -u -v github.com/adjust/go-wrk
  go get -u -v github.com/alecthomas/gometalinter
  go get -u -v github.com/golang/lint/golint
  go get -u -v github.com/lukehoban/go-outline
  go get -u -v github.com/mitchellh/gox
  go get -u -v github.com/motemen/gore
  go get -u -v github.com/newhook/go-symbols
  go get -u -v github.com/nsf/gocode
  go get -u -v github.com/rogpeppe/godef
  go get -u -v github.com/tpng/gopkgs
  go get -u -v golang.org/x/tools/cmd/cover
  go get -u -v golang.org/x/tools/cmd/godoc
  go get -u -v golang.org/x/tools/cmd/goimports
  go get -u -v golang.org/x/tools/cmd/gorename
  go get -u -v golang.org/x/tools/cmd/guru
  go get -u -v golang.org/x/tools/cmd/stringer
  go get -u -v sourcegraph.com/sqs/goreturns

  "$GOPATH"/bin/gox -build-toolchain
  "$GOPATH"/bin/gometalinter --install --update
fi
