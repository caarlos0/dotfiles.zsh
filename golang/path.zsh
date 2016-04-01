#!/bin/sh
export GOPATH="$PROJECTS/Go"
[ ! -d "$GOPATH" ] &&  mkdir -p "$GOPATH/bin"
[ ! -d "$GOPATH/src/github.com/" ] && mkdir -p "$GOPATH/src/github.com/"
export PATH="$PATH:$GOPATH/bin"
