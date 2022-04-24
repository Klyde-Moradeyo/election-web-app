# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 7.0.0.rc1" # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "sprockets-rails", ">= 3.4.1" # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sqlite3", "~> 1.4" # Use sqlite3 as the database for Active Record
gem "puma", "~> 5.0" # Use the Puma web server [https://github.com/puma/puma]
gem "importmap-rails", ">= 0.9.2" # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "turbo-rails", ">= 0.9.0" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "stimulus-rails", ">= 0.7.3" # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "jbuilder", "~> 2.11" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "bootsnap", ">= 1.4.4", require: false # Reduces boot times through caching; required in config/boot.rb
gem "pg" # Use postgre as the database for Active Record
gem "haml-rails" # Use haml rails https://haml.info/
gem "jsbundling-rails"  # needed for bootstrap javascript
gem "cssbundling-rails" # Install bootstrap 5
gem "bootstrap-scss" # https://getbootstrap.com/docs/5.0/customize/sass/
gem "sassc-rails", "~> 2.1" # Use Sass to process CSS # Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images] # gem "image_processing", "~> 1.2"
gem "devise"
gem "devise_invitable", "~> 2.0.0"
gem "rolify" # https://github.com/EppO/rolify
# gem "redis", "~> 4.0" # Use Redis adapter to run Action Cable in production
# gem "kredis" # Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "bcrypt", "~> 3.1.7" # Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]

group :test, :ltest do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "brakeman" # https://brakemanscanner.org/docs/install/
  gem "capybara", ">= 3.26"
  gem "rspec-rails" # https://semaphoreci.com/community/tutorials/getting-started-with-rspec
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "factory_bot_rails" # For RSPEC
  gem "shoulda-matchers" # For RSPEC
  gem "parallel_tests" # Parallel threads in RSPEC
  gem "simplecov" # Tests code coverage
  gem "selenium-webdriver", ">= 4.0.0"
  gem "webdrivers"
end

group :development, :test do
  # See https://edgeguides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", ">= 1.0.0", platforms: %i[mri mingw x64_mingw]
end

group :development, :ltest do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", ">= 4.1.0"
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler", ">= 2.3.3"
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
