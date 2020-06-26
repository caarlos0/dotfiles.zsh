function git-fetch-merge -d "git fetch && git merge in a breeze"
	set remote (git remote | grep upstream)
	set branch $argv[1]

	if test -z $remote
		set remote origin
	end

	if test -z $branch
		set branch master
	end

	echo (set_color --bold magenta) "-> Fetching and merging $remote/$branch..." (set_color normal)
		and git fetch $remote
		and git merge $remote/$branch
end
