#!/bin/sh
if [ "$(uname -s)" = "Darwin" ] && [ -e $PATH:/Applications/Postgres.app ]; then
  export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin"
fi
