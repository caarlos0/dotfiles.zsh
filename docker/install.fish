#!/usr/bin/env fish
if command -q docker
	curl -sL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish -o ~/.config/fish/conf.d/docker_completions.fish
end
