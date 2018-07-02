# PHILOSOPHY

> Philosophical stuff about this dotfiles structure, decisions, etc..

## Why?

I was a little tired of having long alias files and everything strewn about
(which is extremely common on other dotfiles projects, too). That led to this
project being much more topic-centric. I realized I could split a lot of things
up into the main areas I used (Ruby, git, system libraries, and so on), so I
structured the project accordingly.

You can also [read my post on the subject](http://carlosbecker.com/posts/dotfiles-are-meant-to-be-forked).

## Decisions

### Do not install a lot of software

At first, this repo contained the homebrew installation and other stuff like
that. I realized it would be better to split that into another repo, so
this one would contain only the configs, and the other handles only software
installation.

With that in mind, [machine](http://github.com/caarlos0/machine) was born.

It's an Ansible recipe that can install a bunch of stuff, and you can comment
out what you don't want. Works on both Linux and OSX.

### Default `EDITOR` and `PROJECTS`

The default `EDITOR` right now is `code`, which is Microsoft's OpenSource
Visual Studio Code editor. You can change that by adding your custom
override to that variable in `~/.localrc`.

`PROJECTS` is default to `~/Code`. The shortcut to that folder in the shell
is `c`. You can override this default in `~/.localrc`.

### Lots of editors

I use `vim` a lot, but I also use `code`, and used to use `atom` and
`sublime-text`. So, the configs for all these editors are provided, you can
use the one you like the most.

### Topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Erlang" — you can simply add a `erlang` directory and
put files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

### Naming conventions

There are a few special files in the hierarchy:

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
ran at `bootstrap` and `dot_update` phase, and are expected to install plugins,
and stuff like that.

### ZSH plugins

This project uses the [pure][pure] prompt (which is awesome!) and some other
[zsh plugins](/antibody/bundles.txt). All of them managed by [Antibody][antibody],
a faster and simpler Antigen-like program written in Go.

[pure]: https://github.com/sindresorhus/pure
[antibody]: https://github.com/caarlos0/antibody

### Compatibility

I try to keep it working in both Linux (no specific distro) and OS X,
mostly because I use OS X at home and Linux at work.

The CI also is also ran on Linux and OSX.
