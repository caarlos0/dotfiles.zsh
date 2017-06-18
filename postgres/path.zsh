#!/bin/sh
if [ -e "/Applications/Postgres.app" ]; then
	export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin/"
fi
