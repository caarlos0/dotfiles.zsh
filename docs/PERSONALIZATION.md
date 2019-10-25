# Personalization

> How to add custom configuration without messing the local repository

## For the shell itself

You can add anything you want (secret stuff, for example), to the `~/.localrc`
file.

## For git

You can just change the default `~/.gitconfig` file, since it includes the
dotfiles managed one.

## For psql

You can edit the `~/.psqlrc.local` file.

## For ssh

You can edit the `~/.ssh/config.local` file.

## iTunes

Most people I know don't use iTunes, so it is disabled by default.
If you don't want that to happen, run:

```console
$ echo 'KEEP_ITUNES=1' >> ~/.localrc
```

If your iTunes is already broken, you will also want to run:

```console
$ sudo mv /Applications/iTunes.app/Contents/MacOS/iTunesHelper.app{-disabled,}
$ launchctl load -w /System/Library/LaunchAgents/com.apple.rcd.plist
```

For more info, check [issue #197](https://github.com/caarlos0/dotfiles/issues/197).
