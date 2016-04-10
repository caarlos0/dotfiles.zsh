#!/bin/zsh
antibody() {
  eval "$(command antibody init -)"
  antibody "$@"
}
