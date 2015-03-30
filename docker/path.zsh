#!/bin/zsh
reload-docker() {
  # shellcheck disable=SC2091
  $(docker-machine env dev)
}
reload-docker >/dev/null 2>&1
