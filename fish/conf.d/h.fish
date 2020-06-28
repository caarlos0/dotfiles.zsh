function h -d "quick cd into $HOME"
	cd $HOME/$argv
end

function __h_complete
	set arg (commandline -ct)
	set saved_pwd $PWD

	builtin cd $HOME
		and complete -C "cd $arg"

	builtin cd $saved_pwd
end

complete --command h --arguments '(__h_complete)'
