#!/usr/bin/env fish

# Don't ask ssh password all the time
switch (uname)
case Darwin
	git config --global credential.helper osxkeychain
case '*'
	git config --global credential.helper cache
end

# better diffs
if command -q diff-so-fancy
	git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
end

# use vscode as mergetool
if command -q code
	git config --global merge.tool vscode
		and git config --global mergetool.vscode.cmd "code --wait $MERGED"
end
