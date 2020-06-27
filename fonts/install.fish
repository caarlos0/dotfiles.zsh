#!/usr/bin/env fish
function install
	curl -Lso /tmp/mono.zip https://github.com/JetBrains/JetBrainsMono/releases/download/v1.0.6/JetBrainsMono-1.0.6.zip
		and unzip -j /tmp/mono.zip '*/ttf/*' -d $argv[1]

	curl -Lso /tmp/hack.zip https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
		and unzip -j /tmp/hack.zip -d $argv[1]
end

switch (uname)
case Darwin
	if command -q brew
		brew tap -q homebrew/cask-fonts
			and brew cask install font-jetbrains-mono font-hack
	else
		install ~/Library/Fonts
	end
case '*'
	mkdir -p ~/.local/share/fonts/
		and install ~/.local/share/fonts/
		and fc-cache -fv
end
