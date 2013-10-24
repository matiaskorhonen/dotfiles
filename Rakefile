# encoding: UTF-8
require "fileutils"
require "erb"

DOTFILES = %w(ackrc gemrc gitignore inputrc irbrc pryrc rvmrc railsrc tm_properties vimrc vim zlogin zprofile zshrc)
HOME = ENV["HOME"]
ZSH_CUSTOM = Dir["oh-my-zsh/custom/*"]
ZSH_CUSTOM_PLUGINS = Dir["oh-my-zsh/custom/plugins/*"]

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
    puts "Linking: \t".green + "#{target}".cyan + " -> #{source}"
    FileUtils.ln_s(source, target)
  end
end

def git_config_value(key)
  `git config --get #{key}`.chomp
end

def git_config
  @git_config ||= {
    :name => git_config_value("user.name"),
    :email => git_config_value("user.email"),
    :github_user => git_config_value("github.user"),
    :github_token => git_config_value("github.token")
  }
end

def existing_or_new_value(key)
  value = $stdin.gets.chomp
  value.empty? ? git_config[key] : value
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

    ZSH_CUSTOM_PLUGINS.each do |file|
      target = File.join(HOME, "." + file)
      source = File.expand_path(file)
      symlink_unless_target_exists(source, target)
    end

    puts "\n=> Installing .gitconfig"

    if File.exists? "#{HOME}/.gitconfig"
      print "  ~/.gitconfig already exists, do you want to overwrite it ? [yN] "

      override = if $stdin.gets.chomp.downcase == "y"
        true
      else
        puts "=> OK, the existing .gitconfig will be left in place."
        false
      end

    end

    if override || !File.exists?("#{HOME}/.gitconfig")
      print "  Git name [#{git_config[:name]}]: "
      name = existing_or_new_value(:name)

      print "  Git email [#{git_config[:email]}]: "
      email = existing_or_new_value(:email)

      print "  GitHub user [#{git_config[:github_user]}]: "
      github_user = existing_or_new_value(:github_user)

      print "  GitHub token [#{git_config[:github_token]}]: "
      github_token = existing_or_new_value(:github_token)

      File.open(File.join(HOME, ".gitconfig"), "w") do |f|
        template = File.read(File.expand_path("gitconfig.erb"))
        f.write ERB.new(template).result(binding)
      end
    end

    puts "\n=> All done now!"

    exit 0
  end
end

task :default => "dotfiles:install"
