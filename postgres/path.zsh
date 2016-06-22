#!/bin/sh
if [ "$(uname -s)" = "Darwin" ] && [ -e "/Applications/Postgres.app" ]; then
  export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin/"
fi
