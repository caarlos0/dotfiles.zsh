#!/bin/sh
if which docker >/dev/null 2>&1; then
  dcleanup() {
    # shellcheck disable=SC2046
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    # shellcheck disable=SC2046
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
  }

  docker() {
    if [ "$1" = "cleanup" ]; then
      dcleanup
    else
      command docker "$@"
    fi
  }
  alias dkr='docker'
fi
