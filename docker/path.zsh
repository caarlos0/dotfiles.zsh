#!/bin/zsh
reload-docker() {
  eval "$(docker-machine env default)"
}
reload-docker &>/dev/null 2>&1
