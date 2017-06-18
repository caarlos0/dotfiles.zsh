#!/bin/sh

kubectl() {
	# shellcheck disable=SC1090,SC2039
	source <(command kubectl completion zsh)
	command kubectl "$@"
}

kx() {
	test -n "$1" && kubectl config use-context "$1"
	test -z "$1" && kubectl config get-contexts
}

alias k='kubectl'
alias sk='kubectl -n kube-system'
alias ke='EDITOR=vim kubectl edit'
