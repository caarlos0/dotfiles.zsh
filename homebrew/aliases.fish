if command -q brew
	function brew
		switch "$1"
		case cleanup
			brew-cleanup
		case bump
			brew-bump
		case '*'
			command brew $argv
		end
	end
end
