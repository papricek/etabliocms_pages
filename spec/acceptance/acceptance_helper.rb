require 'spec_helper.rb'
require 'capybara/rspec'
require 'capybara/rails'
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
Capybara.javascript_driver = :webkit