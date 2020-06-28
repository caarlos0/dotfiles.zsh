abbr --add l 'ls -lAh'
abbr --add la 'ls -A'
abbr --add ll 'ls -l'
abbr --add less 'less -r'

function cdr
	git rev-parse --show-toplevel | cd -
end

function mkc
	mkdir -p $argv[1]
	cd $argv[1]
end
