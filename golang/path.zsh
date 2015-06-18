#!/bin/sh
export GOPATH="$PROJECTS/Go"
[ ! -d "$GOPATH" ] &&  mkdir -p "$GOPATH"/bin

export PATH="$GOPATH/bin:$PATH"
