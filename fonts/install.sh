#!/bin/sh
URL="http://www.marksimonson.com/assets/content/fonts/AnonymousPro-1.002.zip"

install() {
	curl -L -s -o /tmp/anon.zip "$URL"
	unzip /tmp/anon.zip -d /tmp
	cp /tmp/AnonymousPro-1.002.001/*.ttf "$2"
}

if [ "$(uname -s)" = "Darwin" ]; then
	if which brew >/dev/null 2>&1; then
		brew cask install font-anonymous-pro
	else
		install ~/Library/Fonts
	fi
else
	mkdir -p ~/.fonts
	install ~/.fonts
fi
