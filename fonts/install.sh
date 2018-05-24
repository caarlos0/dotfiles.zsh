#!/bin/sh
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip"

install() {
	curl -L -s -o /tmp/fura.zip "$URL"
	unzip /tmp/fura.zip -d /tmp
	cp /tmp/FiraCode/*.ttf "$2"
}

if [ "$(uname -s)" = "Darwin" ]; then
	if which brew >/dev/null 2>&1; then
		brew cask install font-firacode-nerd-font
		brew cask install font-firacode-nerd-font-mono
	else
		install ~/Library/Fonts
	fi
else
	mkdir -p ~/.fonts
	install ~/.fonts
fi
