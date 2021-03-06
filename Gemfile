source 'https://rubygems.org'

ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.11'

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

gem 'opbeat'

group :development do
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'rb-fsevent'
  gem "better_errors"
  gem 'letter_opener'
  gem 'quiet_assets'
  gem 'meta_request'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
end

group :test, :development do
  gem 'puma'
  gem 'selenium-webdriver'
  gem 'fivemat'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'pry-byebug'
  gem "rspec-rails"
  gem 'rspec-given'
  gem 'rspec-fire'
  gem "cucumber-rails", :require => false
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'capybara-email'
  gem 'capybara'
  gem "factory_girl_rails"
  gem 'shoulda'
  gem 'sqlite3'
  gem 'poltergeist'
end

group :production do
  gem 'passenger'
  gem 'rails_12factor'
  gem 'pg'
end

gem 'newrelic_rpm'
gem "default_value_for"
gem 'foundation-rails', '5.4.3.1' # http://stackoverflow.com/questions/25901261/heroku-zurb-foundation-sass-syntaxerror-in-rails-app
gem 'money-rails', '0.8.1' # till they fix their stupid deprecation warnings
gem 'ransack'
gem 'kaminari'
gem 'devise'
gem 'simple_form'
gem 'awesome_print'
