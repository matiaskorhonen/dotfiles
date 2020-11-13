# encoding: UTF-8
require "fileutils"
require "erb"

DOTFILES = %w(ackrc gemrc get_iplayer gitattributes gitignore httpie inputrc irbrc pryrc rvmrc railsrc tm_properties vimrc vim zlogin zprofile zshrc)
HOME = ENV["HOME"]
ZSH_CUSTOM_SCRIPTS = Dir["oh-my-zsh/custom/*.zsh"]
ZSH_CUSTOM_THEMES = Dir["oh-my-zsh/custom/themes/*"]
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
    :work_email => git_config_value("user.email"),
    :signingkey => git_config_value("user.signingkey")
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

    # Special case fot HTTPie
    # httpie_dir = File.join(HOME, "." + file)
    # httpie_target = File.join(http_pie_dir, "config.json")
    # httpie_source = File.expand_path("httpie.json")
    # FileUtils.mkdir_p(httpie_dir)
    # symlink_unless_target_exists(httpie_source, httpie_target)

    puts "\n=> Installing Oh My Zsh customizations"

    ZSH_CUSTOM_SCRIPTS.each do |file|
      target = File.join(HOME, "." + file)
      source = File.expand_path(file)
      symlink_unless_target_exists(source, target)
    end

    [ZSH_CUSTOM_THEMES, ZSH_CUSTOM_PLUGINS].each do |customizations|
      customizations.each do |file|
        target = File.join(HOME, "." + file)
        source = File.expand_path(file)
        symlink_unless_target_exists(source, target)
      end
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

      print "  GPG key ID [#{git_config[:signingkey]}]: "
      signingkey = existing_or_new_value(:signingkey)

      File.open(File.join(HOME, ".gitconfig"), "w") do |f|
        template = File.read(File.expand_path("gitconfig.erb"))
        f.write ERB.new(template).result(binding)
      end
    end

    puts "\n=> Installing .gitconfig_work"
    if File.exists? "#{HOME}/.gitconfig_work"
      print "  ~/.gitconfig_work already exists, do you want to overwrite it ? [yN] "

      override = if $stdin.gets.chomp.downcase == "y"
        true
      else
        puts "=> OK, the existing .gitconfig_work will be left in place."
        false
      end
    end

    if override || !File.exists?("#{HOME}/.gitconfig_work")
      print "  Git work email [#{git_config[:email]}]: "
      work_email = existing_or_new_value(:work_email)

      File.open(File.join(HOME, ".gitconfig_work"), "w") do |f|
        template = File.read(File.expand_path("gitconfig_work.erb"))
        f.write ERB.new(template).result(binding)
      end
    end

    puts "\n=> All done now!"

    exit 0
  end
end

task :default => "dotfiles:install"
