source "https://rubygems.org"

ruby "3.3.1"

gem "rails", "~> 7.1.3", ">= 7.1.3.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "devise"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "bootstrap", "~> 5.1.3"
gem "jquery-rails"
gem "font-awesome-sass", "~> 4.7.0"
gem "sass-rails", "~> 6.0"
gem 'kaminari'
gem 'ransack'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
end

group :development do
  gem "web-console"
  gem 'letter_opener_web'
end

group :test do
  gem "cucumber-rails", require: false
  gem "database_cleaner-active_record"
  gem "rails-controller-testing"
  gem 'simplecov', require: false
  gem 'codeclimate-test-reporter', require: false
end
