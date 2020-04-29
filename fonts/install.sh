#!/bin/sh
install() {
	curl -Lso /tmp/mono.zip https://github.com/JetBrains/JetBrainsMono/releases/download/v1.0.6/JetBrainsMono-1.0.6.zip
	unzip -j /tmp/mono.zip '*/ttf/*' -d "$1"

	curl -Lso /tmp/hack.zip https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
	unzip -j /tmp/hack.zip -d "$1"
}

if [ "$(uname -s)" = "Darwin" ]; then
	if command -v brew >/dev/null 2>&1; then
		brew tap homebrew/cask-fonts
		brew cask install font-jetbrains-mono font-hack
	else
		install ~/Library/Fonts
	fi
else
	mkdir -p ~/.local/share/fonts/
	install ~/.local/share/fonts/
	fc-cache -fv
fi
