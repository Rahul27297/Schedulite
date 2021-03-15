source 'https://rubygems.org'
source :rubygems
ruby '>= 2.6.6', '< 2.7.0'
gem 'rails', '4.2.10'
gem 'rerun'
gem 'cucumber'

# for Heroku deployment 
group :development, :test do
  gem 'sqlite3', '1.3.11'
  gem 'byebug'
  gem 'database_cleaner', '1.4.1'
  gem 'capybara', '2.4.4'
  gem 'launchy'
  gem 'rspec-rails', '3.7.2'
  gem 'ZenTest', '4.11.2'
  gem 'factory_bot_rails'  
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'simplecov', :require => false
end
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.

gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '>= 2.7.1'
gem 'jquery-rails'
gem 'execjs'
gem 'therubyracer'
gem 'libv8', '~> 3.16', '>= 3.16.14.19'
# gem 'sprockets', '3.6.3'