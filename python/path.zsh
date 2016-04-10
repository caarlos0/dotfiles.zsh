#!/bin/sh
pyenv() {
  eval "$(command pyenv init -)"
  pyenv "$@"
}
