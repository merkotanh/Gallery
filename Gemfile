source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'pg', '~> 1.1', '>= 1.1.3'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.1.3'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'jquery-rails'
gem 'kaminari'
gem 'activeadmin'
gem 'devise', '~> 4.5'
gem 'friendly_id', '~> 5.1'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-oauth2', '~> 1.3.1'
gem 'omniauth-google-oauth2', '~> 0.4.1'
gem 'omniauth-github', '~> 1.1', '>= 1.1.2'
gem 'carrierwave', '~> 1.2.1'
gem 'mini_magick'
gem 'haml'

gem 'acts_as_votable', '~> 0.10.0'
gem 'masonry-rails', '~> 0.2.4'

gem 'font-awesome-sass', '~> 5.4.1'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'figaro'

gem 'fog-aws'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'geckodriver-helper'
  # gem 'sqlite3'
end

group :development do
  gem 'letter_opener'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  # gem 'pg', '~> 1.1', '>= 1.1.3'
  gem 'rails_12factor', '~> 0.0.3'
  gem 'mini_racer'
  # gem 'fog', '~> 1.38'
  # gem 'fog-aws', '~> 2.0.1'
end