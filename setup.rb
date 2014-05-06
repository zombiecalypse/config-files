#!/usr/bin/env ruby
require 'pathname'
require 'csv'

require_relative './conf'

confpath = Pathname.new(__FILE__).dirname

csv = open(confpath.join('config-files.list')) {|f| CSV.parse(f, headers: true)}
original, inrel = csv.headers

mount = []

csv.each do |row|
  orig = Pathname.new(row[original])
  in_path = confpath.join((row[inrel])).realdirpath
  if orig.relative?
    orig = Pathname.new(Dir.home).join(orig).realdirpath
  end
  FileUtils.ln_s(in_path, orig)
end
