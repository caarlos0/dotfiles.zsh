#!/bin/sh
export PATH="$PATH:$HOME/.rbenv/bin"

__rbenv_started=0

__rbenv_init() {
	test $__rbenv_started = 0 && {
		eval "$(command rbenv init -)"
		__rbenv_started=1
	}
}

rbenv() {
	__rbenv_init
	command rbenv "$@"
}

ruby() {
	__rbenv_init
	command ruby "$@"
}

rake() {
	__rbenv_init
	command rake "$@"
}

bundle() {
	__rbenv_init
	command bundle "$@"
}
