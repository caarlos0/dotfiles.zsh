#!/bin/sh
if test "$(which code)"; then
  if [ "$(uname -s)" = "Darwin" ]; then
    VSCODE_HOME="$HOME/Library/Application Support/Code"
  else
    VSCODE_HOME="$HOME/.config/Code"
  fi

  ln -sf "$DOTFILES/vscode/settings.json" "$VSCODE_HOME/User/settings.json"
  ln -sf "$DOTFILES/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"

  modules="
    Borke.Puppet
    DotJoshJohnson.xml
    EditorConfig.EditorConfig
    PeterJausovec.vscode-docker
    WakaTime.vscode-wakatime
    donjayamanne.python
    georgewfraser.vscode-javac
    haaaad.ansible
    lukehoban.Go
    rebornix.Ruby
  "
  for module in $modules; do
    code --install-extension "$module" || true
  done
fi
