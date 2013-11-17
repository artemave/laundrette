source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
#
group :development do
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'rb-fsevent', '~> 0.9'
  gem "better_errors"
  gem 'letter_opener'
  gem 'quiet_assets'
  gem 'meta_request'
end

group :test, :development do
  gem 'sqlite3'
  gem "binding_of_caller"
  gem 'selenium-webdriver'
  gem 'fivemat'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-git'
  gem 'pry-stack_explorer'
  gem 'pry-nav'
  gem 'coderay'
  gem 'coolline'
  gem 'pry-rescue'
  gem "rspec-rails"
  gem 'rspec-given'
  gem 'rspec-fire'
  gem "cucumber-rails", :require => false
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'capybara'
  gem "factory_girl_rails"
  gem 'shoulda'
end

group :production do
  gem 'passenger'
  gem 'rails_12factor'
  gem 'pg'
end

gem 'money-rails'
gem 'ransack'
gem 'devise'
gem 'simple_form'
gem 'awesome_print'
