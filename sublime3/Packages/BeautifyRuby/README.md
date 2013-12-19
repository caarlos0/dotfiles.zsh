# BeautifyRuby

Beautifies Ruby code. This plugin uses the [Ruby Script Beautifier](http://www.arachnoid.com/ruby/rubyBeautifier.html) written by P.Lotus

I made very little modification to get it to work with a Sublime Text 2 plugin.

Erb html templates uses [Paul Battley's htmlbeautifier gem](https://github.com/threedaymonk/htmlbeautifier). This (as well as rubygems) is assumed to be installed as seen by the ruby interpreter. Note that if you beautify and erb file but `htmlbeautifier` is not found, the error message is 'check your ruby interpreter settings', do not be misled.

This package offers a pre-save hook, i.e., your ruby and erb files will be reformatted automatically before saving. To activate this feature, set:

    "run_on_save": true,

The sublime command "beautify_ruby" performs a save after formatting. You can disable this default by setting:

    "save_on_beautify": false

You can change the file patterns handled by this plugin in the settings:

    "file_patterns": [ "\\.html\\.erb", "\\.rb", "\\.rake", "Rakefile", "Gemfile" ],
    "html_erb_patterns": ["\\.html\\.erb"],

This plugin uses ruby scripts to beautify your buffer, so it needs ruby installed. You can configure your ruby interpreter under Preferences -> Package Settings -> BeautifyRuby -> Settings Default/User. Although the default should work on linux and osx, not setting this right is a common problem.

If you do not use the system ruby, type in your favourite shell:

```
  which ruby
```

and place that in the ruby setting.

On windows, set Preferences -> Package Settings -> BeautifyRuby -> Settings Default

```
  "ruby": "ruby"
```

If you use project-specific rubies and gem sets managed with `rvm`, then simply set

      "ruby": "~/.rvm/bin/rvm-auto-ruby",

and then the `htmlbeautifier` gem is found even if it is only installed for this project.

### Key Binding

```
  ctrl + cmd + k on OS X, or ctrl + alt + k on Windows
```

# Installation

### Package Control
Using [Package Control](http://wbond.net/sublime_packages/package_control), a
package manager for Sublime Text 2.

In ST2, press "cmd + shift + p" and then type "install".

Once you see "Package Control: Install Package", enter.

When the packages load, another selection window will appear. Type

BeautifyRuby and enter. All done!

### Manual Installation

```bash
  cd "~/Library/Application Support/Sublime Text 2/Packages/"
  git clone git://github.com/CraigWilliams/BeautifyRuby.git
```
