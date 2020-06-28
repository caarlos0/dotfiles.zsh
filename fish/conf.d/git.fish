abbr --add gl 'git pull --prune'
abbr --add glg "git log --graph --decorate --oneline --abbrev-commit"
abbr --add glga "glg --all"
abbr --add gp 'git push origin HEAD'
abbr --add gpa 'git push origin --all'
abbr --add gd 'git diff'
abbr --add gc 'git commit -s'
abbr --add gca 'git commit -sa'
abbr --add gco 'git checkout'
abbr --add gb 'git branch -v'
abbr --add ga 'git add'
abbr --add gaa 'git add -A'
abbr --add gcm 'git commit -sm'
abbr --add gcam 'git commit -sam'
abbr --add gs 'git status -sb'
abbr --add glnext 'git log --oneline $(git describe --tags --abbrev=0 @^)..@'

if command -q svu
	function gtn -d "create the next semantic tag and push"
		git tag (svu n)
		svu c
	end
end

if command -q gh
	function gpr -d "git push and fill the pull request on the browser"
		git push origin HEAD
		git pr
	end
end
