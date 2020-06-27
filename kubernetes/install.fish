#!/usr/bin/env fish
if command -q kubectl
	curl -sL https://raw.githubusercontent.com/evanlucas/fish-kubectl-completions/master/completions/kubectl.fish -o ~/.config/fish/conf.d/kubectl_completions.fish
end
