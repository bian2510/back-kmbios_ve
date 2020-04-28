# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Serializer
gem 'active_model_serializers', '~> 0.10.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.4.2', require: false

# Simple, multi-client and secure token-based authentication for Rails.
gem 'devise_token_auth'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making
# cross-origin AJAX possible
gem 'rack-cors', '~> 1.0.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Generate schema entity-relationship
  gem 'railroady'
  # Generate documentation from RSpec
  gem 'rspec_api_documentation'
  # Framework of RoR for test
  gem 'rspec-rails', '~> 4.0.0.beta'
  # Faker used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker', '~> 2.10'
  # Provides integration between factory_bot and rails 4.2 or newer
  gem 'factory_bot_rails', '~> 5.1'
  # Strategies for cleaning databases. Can be used to ensure a clean slate for testing.
  gem 'database_cleaner', '~> 1.8'
end

group :development do
  gem 'rubocop', require: false
  # Mock send of email
  gem 'letter_opener', '~> 1.7'

  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
