source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'


gem "config"
gem 'rails', '~> 5.2.0'
gem 'mysql2'
gem "figaro"
gem 'devise'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails_admin'
gem "cancancan"
gem 'mini_magick'
gem 'carrierwave'
gem 'ckeditor'
gem "cocoon"
gem 'webpacker'
gem 'jquery-rails'
gem "ransack"
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem "omniauth-twitter"
gem "omniauth-facebook"
gem 'friendly_id', '~> 5.2.4'
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
gem "react-rails"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :production do
  gem "pg"
  gem "rails_12factor"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
