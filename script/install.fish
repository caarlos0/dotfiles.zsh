#!/usr/bin/env fish
#
# Run all dotfiles installers.
for installer in */install.sh
	echo "› $installer..."
	sh -c "$installer"
end

for installer in */install.fish
	echo "› $installer..."
	$installer
end
