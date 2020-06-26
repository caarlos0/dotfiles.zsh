#!/usr/bin/env fish
#
# bootstrap installs things.

set DOTFILES_ROOT (pwd -P)

function info
	echo [(set_color --bold normal) ' .. ' (set_color normal)] $argv
end

function user
	echo [(set_color --bold normal) ' ?? ' (set_color normal)] $argv
end

function success
	echo [(set_color --bold green) ' OK ' (set_color normal)] $argv
end

function abort
	echo [(set_color --bold yellow) ABRT (set_color normal)] $argv
end

function on_exit -p %self
	if not contains $argv[3] 0
		echo [(set_color --bold red) FAIL (set_color normal)] "Couldn't setup dotfiles, please open an issue at https://github.com/caarlos0/dotfiles"
	end
end

function setup_gitconfig
	# if there is no user.email, we'll assume it's a new machine/setup and ask it
	if test -z (git config --global --get user.email)
		user 'What is your github author name?'
		read user_name
		user 'What is your github author email?'
		read user_email

		test -n $user_name
			or echo "please inform the git author name"
		test -n $user_email
			or abort "please inform the git author email"

		git config --global user.name $user_name
			and git config --global user.email $user_email
	else test (git config --global --get dotfiles.managed) = "true"
		# if user.email exists, let's check for dotfiles.managed config. If it is
		# not true, we'll backup the gitconfig file and set previous user.email and
		# user.name in the new one
		set user_name (git config --global --get user.name)
			and set user_email (git config --global --get user.email)
			and mv ~/.gitconfig ~/.gitconfig.backup
			and git config --global user.name $user_name
			and git config --global user.email $user_email
			and success "moved ~/.gitconfig to ~/.gitconfig.backup"
	else
		# otherwise this gitconfig was already made by the dotfiles
		info "already managed by dotfiles"
	end
	# include the gitconfig.local file
	# finally make git knows this is a managed config already, preventing later
	# overrides by this script
	git config --global include.path ~/.gitconfig.local
		and git config --global dotfiles.managed true
		and success 'gitconfig'
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
				and success moved $new to $new.backup
		end
	end
	ln -sf $old $new
		and success linked $old to $new
end

function install_dotfiles
	info 'installing '
	link_file ~/.dotfiles/fish/omf $OMF_CONFIG
		or abort 'failed to link file'

	for src in $DOTFILES_ROOT/fish/conf.d/*.fish
		link_file $src ~/.config/fish/conf.d/(basename $src)
			or abort 'failed to link file'
	end

	for src in $DOTFILES_ROOT/*/*.symlink
		link_file $src $HOME/.(basename $src .symlink)
			or abort 'failed to link file'
	end

	success 'dotfiles'
end

setup_gitconfig
	and info installing dependencies
	and curl -L https://get.oh-my.fish | fish
	and success oh-my-fish installed

switch (uname)
case Darwin
	# noop
case '*'
	omf install pbcopy
		and success 'pbcopy'
end

omf install
	and success 'plugins'

# https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#pure-----
ln -sf $OMF_PATH/themes/pure/conf.d/pure.fish ~/.config/fish/conf.d/pure.fish
	and success 'theme'

./bin/dot_update
	and success 'dot_update'

if ! grep (command -v fish) /etc/shells
	info adding (command -v fish) to /etc/shells
	command -v fish | sudo tee -a /etc/shells
		or abort 'failed to setup shell'
	echo
end

chsh -s (which fish)
	and success set (fish --version) as the default shell

echo ''
echo '  All installed!'
