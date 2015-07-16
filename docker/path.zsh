#!/bin/zsh
reload-docker() {
  eval "$(docker-machine env dev)"
}
reload-docker &>/dev/null 2>&1
