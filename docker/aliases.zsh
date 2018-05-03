#!/bin/sh
docker_prune() {
	docker system prune --volumes -fa
}
