# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

require 'capistrano/rails'

# If you are using rbenv add these lines:
 require 'capistrano/rbenv'
 set :rbenv_type, :user # or :system, depends on your rbenv setup
 set :rbenv_ruby, '2.2.4'

# If you are using rvm add these lines:
# require 'capistrano/rvm'
# set :rvm_type, :user
# set :rvm_ruby_version, '2.0.0-p451'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
