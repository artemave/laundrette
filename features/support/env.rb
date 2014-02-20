require 'money/core_extensions'
require 'cucumber/rails'
require 'capybara/email'
require 'capybara/poltergeist'

Capybara.javascript_driver = ENV['FF'] ? :selenium : :poltergeist

Cucumber::Rails::Database.javascript_strategy = :truncation

# spring has problems reloading factories
FactoryGirl.reload

World(Capybara::Email::DSL)
