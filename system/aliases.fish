switch (uname)
case Darwin
	abbr --add 'ls' 'ls -FG'
case '*'
	abbr --add 'ls' 'ls -F --color'
end

abbr --add 'l' "ls -lAh"
abbr --add 'la' "ls -A"
abbr --add 'll' "ls -l"

abbr --add 'grep' "grep --color=auto"
abbr --add 'duf' "du -sh * | sort -hr"
abbr --add 'less' "less -r"

function cdr
	git rev-parse --show-toplevel | cd -
end
