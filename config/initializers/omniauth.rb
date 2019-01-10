# config/initializers/omniauth.rb
OmniAuth.config.full_host = Rails.env.production? ? 'https://radiant-shelf-39196.herokuapp.com' : 'http://localhost:3000'