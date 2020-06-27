function c
	cd $PROJECTS/$argv
end

complete --command c --no-files --arguments='(find $PROJECTS -mindepth 1 -maxdepth 1 -exec basename "{}" \;)'
