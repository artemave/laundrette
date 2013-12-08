require 'cucumber/rails'
require 'capybara/email'

Cucumber::Rails::Database.javascript_strategy = :truncation

# spring has problems reloading factories
FactoryGirl.reload

World(Capybara::Email::DSL)
