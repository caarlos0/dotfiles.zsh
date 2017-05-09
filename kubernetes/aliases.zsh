#!/bin/sh

kubectl() {
  # shellcheck disable=SC1090,SC2039
  source <(command kubectl completion zsh)
  command kubectl "$@"
}

alias k='kubectl'
alias sk='kubectl -n kube-system'
alias kx='kubectl config use-context'
