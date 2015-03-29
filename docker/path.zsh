#!/bin/zsh
if test "$(which docker-machine)"; then
  # shellcheck disable=SC2091
  $(docker-machine env dev)
fi
