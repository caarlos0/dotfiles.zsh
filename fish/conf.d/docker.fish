abbr --add d docker

function docker -w docker
	switch $argv[1]
	case prune
		command docker system prune --volumes -fa
	case '*'
		command brew $argv
	end
end
