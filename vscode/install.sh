#!/bin/sh
if test "$(which code)"; then
  if [ "$(uname -s)" = "Darwin" ]; then
    VSCODE_HOME="$HOME/Library/Application Support/Code"
  else
    VSCODE_HOME="$HOME/.config/Code"
  fi

  ln -sf "$ZSH/vscode/settings.json" "$VSCODE_HOME/User/settings.json"

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
