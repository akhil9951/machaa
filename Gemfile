
source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.0"
gem "rails", "~> 7.0.3"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem 'devise', '~> 4.8', '>= 4.8.1'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'csv'
gem 'ransack'
gem 'image_processing',"~> 1.2"
group :development, :test do
gem "debug", platforms: %i[ mri mingw x64_mingw ]
gem "letter_opener"
gem 'rails-observers'
gem 'draper'
gem 'rack-cors'
gem 'kaminari'
gem "actionpack-page_caching"
gem 'actionpack-action_caching'
gem 'rack', '~> 2.2', '>= 2.2.3'
end

group :development do
gem "web-console"
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
end

group :test do
gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "sidekiq", "~> 6.5"
