#!/usr/bin/env ruby

require 'pathname'
require 'fileutils'
Confpath = Pathname.new(__FILE__).dirname

if $0 == __FILE__
  home = Pathname.new(Dir.home)
  input = Pathname.new(ARGV[0]).realdirpath

  base = input.basename.to_s.gsub(/^\./, '')
  move_to = Confpath.join(base).realdirpath
  FileUtils.mv(input, move_to)
  FileUtils.ln_s(move_to, input)
  Confpath.join('config-files.list').open('a') do |f|
    f.write("\"#{input.relative_path_from(home)}\",\"#{base}\"\n")
  end
end
