#!/bin/sh
test "$(which code)" || return 0

if [ "$(uname -s)" = "Darwin" ]; then
  VSCODE_HOME="$HOME/Library/Application Support/Code"
else
  VSCODE_HOME="$HOME/.config/Code"
fi

ln -sf "$ZSH/vscode/settings.json" "$VSCODE_HOME/User/settings.json"

modules="
Borke.Puppet
EditorConfig.EditorConfig
WakaTime.vscode-wakatime
lukehoban.Go
"

for module in $modules; do
  code --install-extension "$module" || true
done
