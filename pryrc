# Launch Pry with access to the entire Rails stack.
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below :)
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails
  
  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif %w(3 4).include? Rails.version[0..0]
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails 2, 3, or 4?)"
  end
end

Pry.config.editor = "atom"
