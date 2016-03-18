# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
require 'capistrano/rbenv'
 set :rbenv_type, :user # or :system, depends on your rbenv setup
 set :rbenv_ruby, '2.2.2-p451'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/passenger'



# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
