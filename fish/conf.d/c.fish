function c
	cd $PROJECTS/$argv
end

function __c_complete
	set arg (commandline -ct)
	set saved_pwd $PWD

	builtin cd $PROJECTS
		and complete -C "cd $arg"

	builtin cd $saved_pwd
end

complete --command c --arguments '(__c_complete)'
