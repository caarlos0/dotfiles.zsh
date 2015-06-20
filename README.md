# carlos' dotfiles  [![DevOps By Rultor.com][rb]][rb] [![Build Status][tb]][tp]
> Runs on Linux and OSX. Configurations for ZSH, SublimeText 3, Java, Ruby, Terminals and others.

![screenshot][scrn]

[rb]: http://www.rultor.com/b/caarlos0/dotfiles
[rp]: http://www.rultor.com/p/caarlos0/dotfiles
[tb]: https://travis-ci.org/caarlos0/dotfiles.svg?branch=master
[tp]: https://travis-ci.org/caarlos0/dotfiles
[scrn]: https://raw.githubusercontent.com/caarlos0/dotfiles/master/screenshot.png

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
bash -c "$(wget -O - https://raw.githubusercontent.com/caarlos0/dotfiles/master/script/install)"
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

## plugins

- [pure][pure] prompt (which is awesome!);
- fish-like [syntax highlight][zsh-syntax-highlighting];
- [more completions][zsh-completions];
- fish-like [substring history search][zsh-history-substring-search];
- [alias-tips][alias-tips] to remember you that you have an alias for that;
- [zsh-pg][zsh-pg] a set of utilities to deal with PostgreSQL;
- [zsh-git-sync][zsh-git-sync] to keep your repositories synced;
- [zsh-open-pr][zsh-open-pr] to open pull requests from the command line;
- [jvm][jvm] to manage java versions (a la rvm, but simpler);
- [mkc][zsh-mkc] to `mkdir` and `cd` in one line.
browser.

All those are managed by [Antibody][antibody], a faster version of Antigen
written in Go.

[antibody]: https://github.com/caarlos0/antibody
[jvm]: https://github.com/caarlos0/jvm
[zsh-pg]: https://github.com/caarlos0/zsh-pg
[alias-tips]: https://github.com/djui/alias-tips
[zsh-mkc]: https://github.com/caarlos0/zsh-mkc
[zsh-git-sync]: https://github.com/caarlos0/zsh-git-sync
[zsh-completions]: https://github.com/zsh-users/zsh-completions
[zsh-open-pr]: https://github.com/caarlos0/zsh-open-pr
[zsh-syntax-highlighting]: https://github.com/zsh-users/zsh-syntax-highlighting
[zsh-history-substring-search]: https://github.com/zsh-users/zsh-history-substring-search


## compatibility

I try to keep it working in both Linux (no specific distro) and OS X,
mostly because I use OS X at home and Linux at work.

## test it within Docker

Yes you can! Pull the repo and run:

```sh
$ docker build -t dotfiles .
$ docker run -it dotfiles
```

It will start a fresh container with my dotfiles inside and dumb git
credentials.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/caarlos0/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## known issues

- All SC2039 ignores should be fixed (#65);

## contributing

Feel free to contribute. Pull requests will be automatically
checked/linted with [Shellcheck](https://github.com/koalaman/shellcheck).

## thanks

I forked [Holmans](http://github.com/holman)' excellent
[dotfiles](http://github.com/holman/dotfiles) and tweaked it to fit my
taste. I have also copied one thing or another from other people, so,
thanks everyone!
