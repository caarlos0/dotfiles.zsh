#!/bin/zsh
#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder in $DOTFILES/*; do
	if [ -d "$topic_folder" ]; then
		fpath=($topic_folder $fpath)
	fi
done
