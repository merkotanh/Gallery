# config/initializers/omniauth.rb
OmniAuth.config.full_host = Rails.env.production? ? 'https://domain.com' : 'http://localhost:3000'