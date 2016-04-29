# carlos' dotfiles

[![DevOps By Rultor.com][rb]][rb] [![Build Status][tb]][tp] [![Powered by Antibody][ab]][ap] [![Issue Stats][isspb]][issp] [![Issue Stats][issib]][issp]

> Config files for ZSH, Java, Ruby, Go, Editors, Terminals and more.

![screenshot][scrn]

[ap]: https://github.com/getantibody/antibody
[ab]: https://img.shields.io/badge/powered%20by-antibody-blue.svg?style=flat-square
[rb]: http://www.rultor.com/b/caarlos0/dotfiles?size=s
[rp]: http://www.rultor.com/p/caarlos0/dotfiles
[tb]: https://img.shields.io/travis/caarlos0/dotfiles/master.svg?style=flat-square
[tp]: https://travis-ci.org/caarlos0/dotfiles
[isspb]: http://issuestats.com/github/caarlos0/dotfiles/badge/pr?style=flat-square
[issib]: http://issuestats.com/github/caarlos0/dotfiles/badge/issue?style=flat-square
[issp]: http://issuestats.com/github/caarlos0/dotfiles
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

This project uses the [pure][pure] prompt (which is awesome!) and some other
[zsh plugins](/antibody/bundles.txt). All of them managed by [Antibody][antibody],
a faster and simpler Antigen-like program written in Go.

[pure]: https://github.com/sindresorhus/pure
[antibody]: https://github.com/caarlos0/antibody

## install

Run this:

```console
$ git clone https://github.com/caarlos0/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ script/bootstrap
$ chsh -s $(which zsh)
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

`dot_update` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot_update` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## compatibility

I try to keep it working in both Linux (no specific distro) and OS X,
mostly because I use OS X at home and Linux at work.

The CI also is also ran on Linux and OSX.

## personalization

The `~/.localrc` file will be sourced if it exist, so, that's the place you
want to put all your custom aliases and stuff.

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

I forked [Holman's](http://github.com/holman) excellent
[dotfiles](http://github.com/holman/dotfiles) and tweaked it to fit my
taste. I have also copied one thing or another from other people, so,
thanks everyone!
