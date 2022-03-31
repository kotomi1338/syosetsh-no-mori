# ==============================================================================
# Gemfile
# ==============================================================================
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'


# ------------------------------------------------------------------------------
# Core, DB
# ------------------------------------------------------------------------------
# Rails
gem 'rails', '~> 6.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Redis for in-memory database
gem 'redis', '~> 4.1'
gem 'redis-namespace', '~> 1.6'
# Support for Cross-Origin Resource Sharing (CORS) for Rack compatible web applications
gem 'rack-cors', '~> 1.0'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.4', require: false
# Use ridgepole for schema management
gem 'ridgepole', '~> 0.8'
# Simple, efficient background processing for Ruby
gem 'sidekiq', '~> 6.0'
# adds support for queueing jobs in a recurring way to sidekiq
gem 'sidekiq-scheduler', '~> 3.0'
# An extension to the sidekiq message processing to track your jobs
gem 'sidekiq-status', '~> 1.1'
# Enable per-request global storage
gem 'request_store', '~> 1.4'
# Authorization
gem 'pundit', '~> 2.1'
# Secure hash algorithm
gem 'bcrypt', '~> 3.1'
# Preload using if condition
gem 'activerecord-belongs_to_if', '~> 0.1'


# ------------------------------------------------------------------------------
# Front
# ------------------------------------------------------------------------------
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
gem 'semantic-ui-sass', '~> 2.4'
# Use slim as template language
gem 'slim-rails', '~> 3.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 4.1'
gem 'turbolinks'
gem 'jquery-rails'
# JSON API serializer
gem 'fast_jsonapi', '~> 1.5'
# Pagination
gem 'pagy', '~> 3.5'
gem 'api-pagination', '~> 4.8'


# ------------------------------------------------------------------------------
# Utilities
# ------------------------------------------------------------------------------
# Use Pry as rails console
gem 'pry-rails', '~> 0.3'
# Manage multi-environment settings
gem 'config', '~> 2.0'
# Middleware to handle HTTP caching
gem 'faraday', '~> 0.15'
gem 'faraday_middleware', '~> 0.13'
gem 'faraday-http-cache', '~> 2.0'
gem 'faraday_middleware-aws-sigv4', '~> 0.2'
# Provides a client interface for the Sentry error logger
gem 'sentry-raven', '~> 2.11'
# Make managing seeds better
gem 'seed-fu', '~> 2.3'
# Easily generater of fake data
gem 'ffaker', '~> 2.12'
# Json Web Token
gem 'jwt', '~> 2.2'
gem 'json-jwt', '~> 1.10'
# Use rails-i18n as a set of common locale data
gem 'rails-i18n', '~> 6.0'
# Framework for factories
gem 'factory_bot_rails', '~> 5.0'
# Enumerated attributes with I18n
gem 'enumerize', '~> 2.3'
# Convert between prefecture code and prefecture name
gem 'jp_prefecture', '~> 0.10'
# AWS client gems
gem 'aws-sdk-s3', '~> 1.48'
gem 'aws-sdk-rails', '~> 2.1'
# Encrypt yaml
gem 'yaml_vault', '~> 1.1'
# Make command line utilities
gem 'thor', '~> 0.20'
# For counter caches
gem 'counter_culture', '~> 2.2'
# Authorization for google apis
gem 'googleauth', '~> 0.10'
# Google api client
gem 'google-api-client', '~> 0.36'
# ページネーション
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'bootstrap-sass'


# ------------------------------------------------------------------------------
# Development and Test Only
# ------------------------------------------------------------------------------
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug', '~> 3.7'
  # Ruby code style checking
  gem 'rubocop', '~> 0.74'
  # A RuboCop extension focused on enforcing Rails best practices and coding conventions
  gem 'rubocop-rails', '~> 2.3'
  # Testing framework
  gem 'rspec-rails', '~> 3.8'
  # Speed up RSpec using Spring
  gem 'spring-commands-rspec', '~> 1.0'
  # Simplify request test code
  gem 'rspec-request_describer', '~> 0.3'
  # Simplify test code
  gem 'shoulda-matchers', '~> 4.1'
  # Run RSpec parallel
  gem 'parallel_tests', '~> 2.29'
  # Strategies for cleaning databases
  gem 'database_cleaner', '~> 1.7'
  # Code coverage
  gem 'simplecov', '~> 0.17', require: false
  # Detect N + 1 queries
  gem 'bullet', '~> 6.0'
  # Filesystem event
  gem 'listen', '~> 3.1'
end


# ------------------------------------------------------------------------------
# Development Only
# ------------------------------------------------------------------------------
group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '~> 4.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0'
  # Run db:reset without stopping app
  gem 'pgreset', '~> 0.1'
  # IDE tools for code completion, inline documentation, and static analysis
  gem 'solargraph', '~> 0.37'
end
