#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
	alias ls="ls -FG"
else
	alias ls="ls -F --color"
fi
alias l="ls -lAh"
alias la="ls -A"
alias ll="ls -l"

alias grep="grep --color=auto"
alias duf="du -sh * | sort -hr"
alias less="less -r"

alias cdr='cd "$(git rev-parse --show-toplevel)"'

# quick hack to make watch work with aliases
alias watch='watch -c -d -t '

# open, pbcopy and pbpaste on linux
if [ "$(uname -s)" != "Darwin" ]; then
	if [ -z "$(command -v pbcopy)" ]; then
		if [ -n "$(command -v xclip)" ]; then
			alias pbcopy="xclip -selection clipboard"
			alias pbpaste="xclip -selection clipboard -o"
		elif [ -n "$(command -v xsel)" ]; then
			alias pbcopy="xsel --clipboard --input"
			alias pbpaste="xsel --clipboard --output"
		fi
	fi
	if [ -e /usr/bin/xdg-open ]; then
		alias open="xdg-open"
	fi
fi
