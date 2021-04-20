# frozen_string_literal: true

# Avoid CORS issues when API is called from frontends via (cross-origin) AJAX requests
# Be sure to restart your server when you modify this file.
# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource(
      '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
    )
  end
end
