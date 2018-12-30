#!/bin/sh
if command -v code >/dev/null; then
	if [ "$(uname -s)" = "Darwin" ]; then
		VSCODE_HOME="$HOME/Library/Application Support/Code"
	else
		VSCODE_HOME="$HOME/.config/Code"
	fi
	mkdir -p "$VSCODE_HOME/User"

	ln -sf "$DOTFILES/vscode/settings.json" "$VSCODE_HOME/User/settings.json"
	ln -sf "$DOTFILES/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"
	ln -sf "$DOTFILES/vscode/snippets" "$VSCODE_HOME/User/snippets"

	# from `code --list-extensions`
	modules="
be5invis.toml
budparr.language-hugo-vscode
caarlos0.language-prometheus
coolbear.systemd-unit-file
eamodio.gitlens
EditorConfig.EditorConfig
fabiospampinato.vscode-monokai-night
heptio.jsonnet
HookyQR.beautify
mauve.terraform
monokai.theme-monokai-pro-vscode
ms-python.python
ms-vscode.Go
patbenatar.advanced-new-file
PeterJausovec.vscode-docker
pnp.polacode
rebornix.ruby
rust-lang.rust
shanoor.vscode-nginx
timonwong.shellcheck
wmaurer.change-case
"
	for module in $modules; do
		code --install-extension "$module" || true
	done
fi
