source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.1'
gem 'puma', '~> 4.3'
gem 'webpacker'
gem "sorcery", "~> 0.13.0"
gem "email_validator", "~> 1.6"
gem 'bootsnap', '>= 1.1.0', require: false
gem "kramdown", "~> 1.17"
gem 'active_model_serializers', '~> 0.10.0'

group :development do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :production do
  gem "rails_12factor", "~> 0.0.3"
  gem "pg", "~> 1.1"
end
