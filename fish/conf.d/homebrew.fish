if command -q brew
	function brew -w brew
		switch $argv[1]
		case cleanup
			brew-cleanup
		case bump
			brew-bump
		case '*'
			command brew $argv
		end
	end
end
