#!/usr/bin/env ruby

require "fileutils"

class String
  def green
    "\033[32m#{self}\033[0m"
  end

  def red
    "\033[31m#{self}\033[0m"
  end

  def cyan
    "\033[36m#{self}\033[0m"
  end
end

def symlink_unless_target_exists(source, target)
  exists = (File.file?(target) || File.directory?(target) || File.symlink?(target))
  if exists
    puts "Exists: \t".red + "#{target}".cyan
  else
    puts "Symlinking: \t".green + "#{target}".cyan + " -> " + target
    FileUtils.ln_s(source, target)
  end
end

DOTFILES = %w(gemrc gitignore irbrc vimrc vim zlogin zshrc)
HOME = ENV["HOME"]
ZSH_CUSTOM = Dir["oh-my-zsh/custom/*"]

puts "Home:\t\t" + "#{HOME}".cyan
puts "Oh My Zsh:\t" + "#{HOME}/.oh-my-zsh".cyan

puts "\n=> Installing dotfiles"

DOTFILES.each do |file|
  target = File.join(HOME, "." + file)
  source = File.expand_path(file)
  symlink_unless_target_exists(source, target)
end

puts "\n=> Installing custom Oh My Zsh scripts"

ZSH_CUSTOM.each do |file|
  target = File.join(HOME, "." + file)
  source = File.expand_path(file)
  symlink_unless_target_exists(source, target)
end

puts "\n=> All done now!"

exit 0