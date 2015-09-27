source 'https://rubygems.org'

gem 'rails', '4.2.4'

# Ruby Libraries
gem 'pg'
gem 'devise'
gem 'pundit'
gem 'paper_trail'
gem 'annotate'

# Servers and deployment
gem 'unicorn'
gem 'capistrano', group: :development

# Meta languages
gem 'coffee-rails'
gem 'haml-rails'
gem 'sass-rails', '~> 5.0'

# Javascript libraries
gem 'lodash-rails'
gem 'font-awesome-rails'
gem 'jquery-rails'

# Asset post-processing and packaging
gem 'uglifier', '>= 1.3.0'

# Testing and mocking libraries
group :development , :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'konacha'
  gem 'capybara'
  gem 'poltergeist'
end

# Auxiliary utilities to ease development
group :development do
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'letter_opener_web', '~> 1.2.0'
  gem 'pry-rails'
  gem 'pry-byebug'
end
