cask_args appdir: '/Applications'

tap 'homebrew/bundle'
tap 'homebrew/versions'

brew 'coreutils'
brew 'ffmpeg'
brew 'gifsicle'
brew 'git'
brew 'go'
brew 'graphviz'
brew 'grc' if RUBY_PLATFORM =~ /darwin/
brew 'htop-osx' if RUBY_PLATFORM =~ /darwin/
brew 'imagemagick'
brew 'maven32'
brew 'node'
brew 'redis'
brew 'shellcheck' if RUBY_PLATFORM =~ /darwin/
brew 'terminal-notifier' if RUBY_PLATFORM =~ /darwin/
brew 'the_silver_searcher'
brew 'unrar'
brew 'vim'
brew 'wget'
brew 'youtube-dl'
brew 'zsh'

# antibody
tap 'getantibody/antibody'
brew 'antibody'

if RUBY_PLATFORM =~ /darwin/
  # casks
  tap 'caskroom/cask'
  tap 'caskroom/fonts'
  tap 'caskroom/versions'

  cask 'android-file-transfer'
  cask 'appcleaner'
  cask 'atom'
  cask 'beamer'
  cask 'diffmerge'
  cask 'disk-inventory-x'
  cask 'dockertoolbox'
  cask 'dropbox'
  cask 'font-hack'
  cask 'google-chrome'
  cask 'intellij-idea'
  cask 'iterm2'
  cask 'postgres'
  cask 'slack'
  cask 'slate'
  cask 'spotify'
  cask 'telegram'
  cask 'the-unarchiver'
  cask 'transmission'
  cask 'tunnelblick'
  cask 'virtualbox'
  cask 'vlc'

  # https://github.com/sindresorhus/quick-look-plugins
  cask 'betterzipql'
  cask 'qlcolorcode'
  cask 'qlimagesize'
  cask 'qlmarkdown'
  cask 'qlprettypatch'
  cask 'qlstephen'
  cask 'quicklook-csv'
  cask 'quicklook-json'
  cask 'suspicious-package'
  cask 'webpquicklook'
end
