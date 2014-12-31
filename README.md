# carlos does dotfiles [![Build Status](https://travis-ci.org/caarlos0/dotfiles.svg?branch=master)](https://travis-ci.org/caarlos0/dotfiles)

![screenshot](https://raw.githubusercontent.com/caarlos0/dotfiles/master/screenshot.png)

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

I was a little tired of having long alias files and everything strewn about
(which is extremely common on other dotfiles projects, too). That led to this
project being much more topic-centric. I realized I could split a lot of things
up into the main areas I used (Ruby, git, system libraries, and so on), so I
structured the project accordingly.

If you're interested in the philosophy behind why projects like these are
awesome, you might want to [read my post on the subject][post].

[post]: http://carlosbecker.com/posts/dotfiles-are-meant-to-be-forked/

## install

Run this:

```sh
git clone https://github.com/caarlos0/dotfiles ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Erlang" — you can simply add a `erlang` directory and
put files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you. Fork it, remove what you
don't use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
- **topic/install.sh**: Any file with this name and with exec permission, will
ran at bootstrap phase.

## goodies

- [pure][pure] prompt (which is awesome!);
- fish-like [syntax highlight][syntax];
- [more completions][completions];
- fish-like [substring history search][search];
- [z][z] for fast jumping to common dirs;
- [bd][bd] to cd ../../../../../(...) to folder;
- [alias-tips][alias-tips] to remember you that you have an alias for that;
- [zsh-colors][zsh-colors] to `red ERROR`, `yellow WARNING` and other colors;
- [zsh-dwim][zsh-dwim] to `sudo` commands with `CTRL+U`;
- [zsh-git-sync][zsh-git-sync] to keep your repositories synced;
- [zsh-open-pr][zsh-open-pr] to open pull requests from the command line;
- [git-it-on][git-it-on] to open your current project/branch whatever on your
browser.

All those are managed by [antigen][antigen].

[zsh-open-pr]: https://github.com/caarlos0/zsh-open-pr
[zsh-git-sync]: https://github.com/caarlos0/zsh-git-sync
[antigen]: https://github.com/zsh-users/antigen
[git-it-on]: https://github.com/peterhurford/git-it-on.zsh
[pure]: https://github.com/sindresorhus/pure
[syntax]: https://github.com/zsh-users/zsh-syntax-highlighting
[completions]: https://github.com/zsh-users/zsh-completions
[search]: https://github.com/zsh-users/zsh-history-substring-search
[z]: https://github.com/rupa/z
[bd]: https://github.com/Tarrasch/zsh-bd
[alias-tips]: https://github.com/djui/alias-tips
[zsh-colors]: https://github.com/Tarrasch/zsh-colors
[zsh-dwim]: https://github.com/oknowton/zsh-dwim

## compatibility

I try to maintain it working in both Linux (no specific distro) and OS X, most
of all, because I use OS X at home and Linux at work.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/caarlos0/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## contributing

Feel free to contribute. Pull requests will be automatically
checked/linted with [Shellcheck](https://github.com/koalaman/shellcheck).

## thanks

I forked [Holmans](http://github.com/holman)' excellent
[dotfiles](http://github.com/holman/dotfiles) and tweaked it to fit my
taste. I have also copied one thing or another from other people, so,
thanks everyone!
