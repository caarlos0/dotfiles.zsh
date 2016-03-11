cask_args appdir: '/Applications'

# antibody
tap 'getantibody/antibody'
brew 'antibody'

unless ENV['TRAVIS_JOB_ID']
  tap 'homebrew/bundle'
  tap 'homebrew/versions'

  brew 'go'
  brew 'rbenv'
  brew 'youtube-dl'

  if RUBY_PLATFORM =~ /darwin/
    brew 'dlite'
    brew 'docker'
    brew 'docker-compose'
    brew 'ffmpeg'
    brew 'gifsicle'
    brew 'git'
    brew 'graphviz'
    brew 'grc'
    brew 'htop'
    brew 'imagemagick'
    brew 'maven32'
    brew 'node'
    brew 'python'
    brew 'redis'
    brew 'shellcheck'
    brew 'terminal-notifier'
    brew 'the_silver_searcher'
    brew 'unrar'
    brew 'vim'
    brew 'wget'
    brew 'zsh'

    # gnu stuff
    brew 'coreutils', args: ['with-default-names']
    brew 'findutils', args: ['with-default-names']
    brew 'gnu-tar', args: ['with-default-names']
    brew 'gnu-sed', args: ['with-default-names']
    brew 'gawk', args: ['with-default-names']
    brew 'gnutls', args: ['with-default-names']
    brew 'gnu-indent', args: ['with-default-names']
    brew 'gnu-getopt', args: ['with-default-names']

    # casks
    tap 'caskroom/cask'
    tap 'caskroom/fonts'
    tap 'caskroom/versions'

    cask 'android-file-transfer'
    cask 'appcleaner'
    cask 'atom'
    cask 'beamer'
    cask 'caffeine'
    cask 'diffmerge'
    cask 'disk-inventory-x'
    cask 'dropbox'
    cask 'font-hack'
    cask 'google-chrome'
    cask 'iterm2-beta'
    cask 'postgres'
    cask 'slack'
    cask 'slate'
    cask 'spotify'
    cask 'telegram'
    cask 'the-unarchiver'
    cask 'transmission'
    cask 'viscosity'
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
end
