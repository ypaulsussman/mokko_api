# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.1'

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.2.3'
# Use Puma as the app server
gem 'puma', '~> 5.5.1'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.16'
# Use JSON web tokens for request-auth
gem 'jwt', '~> 2.2.3'
# Use Rack CORS for cross-origin AJAX
gem 'rack-cors', '~> 1.1.1'
# Use Rack::Attack for throttling by IP
gem 'rack-attack', '~> 6.5'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.7.5', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to
  # stop execution and get a debugger console
  gem 'byebug', platforms: [:mri]
  gem 'solargraph'
  gem 'rubocop'
end

group :development do
  gem 'listen', '~> 3.5'
  # Spring speeds up development by keeping your app running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring'
end
