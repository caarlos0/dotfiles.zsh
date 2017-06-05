#!/bin/sh
__reload_dotfiles() {
	exec "$SHELL" -l
}
alias reload!='__reload_dotfiles'
