#!/bin/sh
if test "$(which code)"; then
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
caarlos0.language-prometheus
CoenraadS.bracket-pair-colorizer
coolbear.systemd-unit-file
EditorConfig.EditorConfig
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
sourcegraph.sourcegraph
timonwong.shellcheck
"
	for module in $modules; do
		code --install-extension "$module" || true
	done
fi
