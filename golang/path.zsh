#!/bin/sh
export GOPATH="$PROJECTS/Go"
export PATH="$PATH:$GOPATH/bin"
mkdir -p "$GOPATH/bin" "$GOPATH/src/github.com/"
