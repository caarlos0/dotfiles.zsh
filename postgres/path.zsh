#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
fi
