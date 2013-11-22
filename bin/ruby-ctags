#!/usr/bin/env ruby
system "find . -name '*.rb' | ctags -f .tags -L -"

if File.exist? './Gemfile'
  require 'bundler'
  paths = Bundler.load.specs.map(&:full_gem_path).join(' ')
  system "ctags -R -f .gemtags #{paths}"
end
