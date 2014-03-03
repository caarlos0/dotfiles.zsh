sublime-grunt
=============

A Grunt task runner for Sublime Text

## Installation

sublime-grunt can be installed via [Sublime Package Control](https://sublime.wbond.net/). In Package Control, it is called **Grunt**. Please refer to the offical Package Control documentation to learn how to install packages.

Alternatively, you can also clone the [sublime-grunt repository](https://github.com/tvooo/sublime-grunt/) into your Sublime Text packages folder.

## Usage

Open the command palette using Ctrl+Shift+P (or Cmd+Shift+P on Mac, respectively)
and choose the "Grunt" command.

The plugin expects to find a Gruntfile (`Gruntfile.js` or `Gruntfile.coffee`) in an open folder.
It displays a sorted list of available Grunt tasks out of this Grunt file.
If it finds more than one Gruntfile, it first provides a list for selection.

As of version 0.2, there is also a command to kill running tasks, for example
`watch` tasks.

## Settings

The file `SublimeGrunt.sublime-settings` is used for configuration.

You may override your `PATH` environment variable as follows:

```
{
    "exec_args": {
        "path": "/bin:/usr/bin:/usr/local/bin"
    }
}
```

## Releases

* 1.0 Jumping to 1.0 to support ST versioning with tags
* 0.3 Grunt tasks are cached
* 0.2 Rewrite; supports Grunt >= 0.4, tasks can be killed (for example the `watch` task)
* 0.1 Initial release

## Thanks

Thanks for some contributions go to

* [VirtueMe](https://github.com/VirtueMe)
* [antonellopasella](https://github.com/antonellopasella)
* [structAnkit](https://github.com/structAnkit)
* [lavrton](https://github.com/lavrton)
* [adamcbrewer](https://github.com/adamcbrewer)
* [thebjorn](https://github.com/thebjorn)
* [maliayas](https://github.com/maliayas)
