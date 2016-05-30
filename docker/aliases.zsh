#!/bin/sh
if which docker >/dev/null 2>&1; then
  dcleanup() {
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
  }

  docker() {
    if [ "$1" = "cleanup" ]; then
      dcleanup
    else
      command docker "$@"
    fi
  }
fi
