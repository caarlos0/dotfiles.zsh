# carlos' dotfiles

[![Build Status][tb]][tp] 
[![Powered by Antibody][ab]][ap]
[![SayThanks.io](https://img.shields.io/badge/SayThanks.io-%E2%98%BC-1EAEDB.svg?style=flat-square)](https://saythanks.io/to/caarlos0)

> Config files for ZSH, Java, Ruby, Go, Editors, Terminals and more.

![screenshot][scrn]

[ap]: https://github.com/getantibody/antibody
[ab]: https://img.shields.io/badge/powered%20by-antibody-blue.svg?style=flat-square
[tb]: https://img.shields.io/travis/caarlos0/dotfiles/master.svg?style=flat-square
[tp]: https://travis-ci.org/caarlos0/dotfiles
[scrn]: /docs/screenshot.png

## Installation

### Dependencies

First, make sure you have all those things installed:

- `git`: to clone the repo
- `curl`: to download some stuff
- `tar`: to extract downloaded stuff
- `zsh`: to actually run the dotfiles
- `sudo`: some configs may need that

### Install

Then, run these steps:

```console
$ git clone https://github.com/caarlos0/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./script/bootstrap
$ zsh # or just close and open your terminal again.
```

> All changed files will be backed up with a `.backup` suffix.

### Recommended Software

For OSX, I recommend:

- `grc`: for colorizing stuff (like `ls`);
- iTerm: a better terminal emulator;

For Linux:

- Terminator: a better terminal emulator;

Both:

- `diff-so-fancy`: better git difs (you'll need to run `dot_update` to apply it);
- `fzf`: fuzzy finder, used in `,t` on vim, for example.

## Further help:

- [Personalize your configs](/docs/PERSONALIZATION.md)
- [Understand how it works](/docs/PHILOSOPHY.md)
- [License](/LICENSE.md)

## Contributing

Feel free to contribute. Pull requests will be automatically
checked/linted with [Shellcheck](https://github.com/koalaman/shellcheck).
