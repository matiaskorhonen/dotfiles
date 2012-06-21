# encoding: UTF-8
require "fileutils"

DOTFILES = %w(ackrc gemrc gitignore irbrc pryrc railsrc vimrc vim zlogin zshrc)
HOME = ENV["HOME"]
ZSH_CUSTOM = Dir["oh-my-zsh/custom/*"]

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
  if File.exists?(target)
    type = File.ftype(target)
    puts "Exists: \t".red + "#{target}".cyan + " [#{type}]"
  else
    puts "Linking: \t".green + "#{target}".cyan + " -> #{target}"
    FileUtils.ln_s(source, target)
  end
end

namespace :dotfiles do
  desc "Symlink the dotfiles to the right places"
  task :install do
    puts "=> Configuration"
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
  end
end

task :default => "dotfiles:install"