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

FileUtils.ln_sf(confpath.join('bin', 'vim-html-markdown'), home.join('.bin'))
home.join('.bin', 'vim-html-markdown').chmod(0755)

csv = open(confpath.join('config-files.list')) {|f| CSV.parse(f, headers: true)}
original, inrel = csv.headers

csv.each do |row|
  orig = Pathname.new(row[original])
  in_path = confpath.join(row[inrel]).realdirpath
  if orig.relative?
    orig = home.join(orig).realdirpath
  end
  FileUtils.ln_sf(in_path, orig)
end

installed = confpath.join('installed').open.readlines.collect {|e| e.strip}
system "sudo apt-get install -y #{installed.join(' ')}"

system "gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3"
system "\\curl -sSL https://get.rvm.io | bash -s stable"

system "git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"
system "chsh -s /bin/zsh"

system "sudo pip install ropevim"
