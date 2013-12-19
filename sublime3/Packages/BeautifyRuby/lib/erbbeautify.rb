require 'rubygems'
require 'htmlbeautifier'

def beautify(input, output)
  HtmlBeautifier::Beautifier.new(output).scan(input)
  output << "\n"
end

beautify $stdin.read, $stdout
