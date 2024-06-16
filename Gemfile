source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '6.1.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.1.0'
# Use Terser as compressor for JavaScript assets
gem 'terser'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease
gem 'jbuilder', '~> 2.5'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Authentication and authorization
gem 'sorcery'

# Debugging tools
gem 'pry-byebug'
gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

# Front-end framework
gem 'bootstrap'
gem 'sassc-rails'

# File uploads
gem 'carrierwave', '~> 2.0'
gem 'mini_magick'

# Search functionality
gem 'ransack', '>= 2.5.0'

# Pagination
gem 'will_paginate', '~> 3.1.0'

# View decorators
gem 'draper'

# Icon library
gem 'font-awesome-sass', '~> 5.15'

# PostgreSQL as the database for Active Record
gem 'pg'

# Sprockets for asset management
gem 'sprockets-rails'

# Automatically creates HTML links
gem 'rinku'

# Application configuration management
gem 'config'

# Manage environment variables
gem 'dotenv-rails', groups: [:development, :test]

# SEO tags
gem "meta-tags"

# Google login
gem 'googleauth'

# Windows-specific gems
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end
