#!/usr/bin/env ruby
require 'pathname'
require 'csv'

require_relative './conf'

confpath = Pathname.new(__FILE__).dirname.realdirpath
home = Pathname.new(Dir.home)

home.join('.bin', 'conf').open("w") do |f|
  f.write("#!/bin/sh\n")
  f.write("ruby #{confpath.join("conf.rb")} \"$@\"\n")
end
home.join('.bin', 'conf').chmod(0755)

csv = open(confpath.join('config-files.list')) {|f| CSV.parse(f, headers: true)}
original, inrel = csv.headers

mount = []

csv.each do |row|
  orig = Pathname.new(row[original])
  in_path = confpath.join((row[inrel])).realdirpath
  if orig.relative?
    orig = home.join(orig).realdirpath
  end
  FileUtils.ln_s(in_path, orig) unless orig.exist?
end
