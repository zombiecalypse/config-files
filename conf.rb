#!/usr/bin/env ruby

require 'pathname'
require 'fileutils'
Confpath = Pathname.new(__FILE__).dirname

def pcall(call)
  puts call
  system(call)
end

def git(command)
  pcall("git #{command}")
end

if $0 == __FILE__
  home = Pathname.new(Dir.home)
  input = Pathname.new(ARGV[0]).realdirpath

  base = input.basename.to_s.gsub(/^\./, '')
  move_to = Confpath.join(base).realdirpath
  FileUtils.mv(input, move_to)
  FileUtils.ln_s(move_to, input)
  config_files = Confpath.join('config-files.list').realdirpath
  config_files.open('a') do |f|
    f.write("\"#{input.relative_path_from(home)}\",\"#{base}\"\n")
  end
  FileUtils.cd(Confpath) do
    git("add #{move_to.relative_path_from(Confpath)} #{config_files.relative_path_from(Confpath)}")
    git("commit -m \"#{base} added\"")
  end
end
