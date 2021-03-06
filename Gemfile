source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'aws-sdk'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'email_validator'
gem 'figaro'
gem 'friendly_id'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'paperclip', '~> 5.0.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.3'
gem 'reform-rails'
gem 'sass-rails', '~> 5.0'
gem 'slim'
gem 'stripe'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'i18n-debug'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.7'
end

group :test do
  gem 'capybara', '~> 2.15'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'formulaic'
  gem 'poltergeist', '~> 1.16'
  gem 'simplecov'
end

group :development do
  gem 'brakeman'
  gem 'bundle-audit'
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'overcommit', '~> 0.41'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
