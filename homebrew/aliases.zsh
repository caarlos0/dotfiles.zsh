#!/bin/sh
if command -v brew >/dev/null 2>&1; then
	brew() {
		case "$1" in
		cleanup)
			(cd "$(brew --repo)" && git prune && git gc)
			command brew cleanup
			rm -rf "$(brew --cache)"
			;;
		bump)
			command brew update
			command brew upgrade
			brew cleanup
			;;
		*)
			command brew "$@"
			;;
		esac
	}
fi
