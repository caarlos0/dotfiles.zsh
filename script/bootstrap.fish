#!/usr/bin/env fish
#
# bootstrap installs things.

function info
	echo [(set_color --bold normal) ' .. ' (set_color normal)] $argv
end

function success
	echo [(set_color --bold green) ' OK ' (set_color normal)] $argv
end

function fail
	echo [(set_color --bold red) FAIL (set_color normal)] $argv
end

function user
	echo [(set_color --bold normal) ' ?? ' (set_color normal)] $argv
end

function setup_gitconfig
	# if there is no user.email, we'll assume it's a new machine/setup and ask it
	if test -z (git config --global --get user.email)
		user 'What is your github author name?'
		read user_name
		user 'What is your github author email?'
		read user_email

		git config --global user.name $user_name
		git config --global user.email $user_email
	else test (git config --global --get dotfiles.managed) = "true"
		# if user.email exists, let's check for dotfiles.managed config. If it is
		# not true, we'll backup the gitconfig file and set previous user.email and
		# user.name in the new one
		set user_name (git config --global --get user.name)
		set user_email (git config --global --get user.email)
		mv ~/.gitconfig ~/.gitconfig.backup
		success "moved ~/.gitconfig to ~/.gitconfig.backup"
		git config --global user.name $user_name
		git config --global user.email $user_email
	else
		# otherwise this gitconfig was already made by the dotfiles
		info "already managed by dotfiles"
	end
	# include the gitconfig.local file
	git config --global include.path ~/.gitconfig.local
	# finally make git knows this is a managed config already, preventing later
	# overrides by this script
	git config --global dotfiles.managed true
	success 'gitconfig'
end

function link_file
	echo $argv | read -l old new
	if test -e $new
		set newf (readlink $new)
		if test $newf = $old
			success skipped $old
			return
		else
			mv $new $new.backup
			success moved $new to $new.backup
		end
	end
	ln -sf $old $new
	success linked $old to $new
end

function install_dotfiles
	info 'installing dotfiles'
	link_file ~/.dotfiles/fish/functions ~/.config/fish/functions
	link_file ~/.dotfiles/fish/omf $OMF_CONFIG

end

setup_gitconfig

info installing dependencies
curl -L https://get.oh-my.fish | fish
success oh-my-fish installed

omf install
switch (uname)
case Darwin
	# noop
case '*'
	omf install pbcopy
end
# https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#pure-----
ln -sf $OMF_PATH/themes/pure/conf.d/pure.fish ~/.config/fish/conf.d/pure.fish
success oh-my-fish plugins installed

./bin/dot_update
success installed config files

if ! grep (command -v fish) /etc/shells
	info adding (command -v fish) to /etc/shells
	command -v fish | sudo tee -a /etc/shells
	echo
end
chsh -s (which fish)
success set (fish --version) as the default shell

echo 'done!'
