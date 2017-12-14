#!/bin/sh
alias d='docker'

docker_prune() {
	docker system prune --volumes -fa
}
