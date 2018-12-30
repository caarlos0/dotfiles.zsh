#!/bin/sh
mkdir -p "$HOME/.docker/completions"

if command -v docker-compose >/dev/null 2>&1; then
	curl -sL https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose \
		-o "$HOME/.docker/completions/_docker-compose"
fi
if command -v docker-machine >/dev/null 2>&1; then
	curl -sL https://raw.githubusercontent.com/docker/machine/master/contrib/completion/zsh/_docker-machine \
		-o "$HOME/.docker/completions/_docker-machine"
fi
if command -v docker >/dev/null 2>&1; then
	curl -sL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker \
		-o "$HOME/.docker/completions/_docker"
fi
