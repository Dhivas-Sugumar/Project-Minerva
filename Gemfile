source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.0"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails', '~> 3.0', '>= 3.0.4'

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails","~> 1.3.0"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Added jsbundling for javascript bundling.
gem 'jsbundling-rails', '~> 1.0', '>= 1.0.2'

# Used for pagination
gem 'kaminari'

# foreman to start server
gem 'foreman', '~> 0.87.2'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# simple form to make form making easier
gem 'simple_form', '~> 5.1'

# devise for user authentication.
gem 'devise', '~> 4.8', '>= 4.8.1'

# gem for making progress bars easier
gem 'ruby-progressbar', '~> 1.11.0'

# for css styling
gem "cssbundling-rails", "~> 1.1"
gem 'sassc-rails', '>= 2.1.0'
gem 'sassc', '~> 2.4.0'
gem 'bootstrap_form', '~> 4.5'
gem "bootstrap-kaminari-views"

# for handling file uploads
gem 'carrierwave', '~> 2.0'
gem 'mini_magick', '~> 4.11.0'
gem 'fog', '~> 0.9.0'

#for handling nested forms
gem "cocoon"

#for rich text editor
gem 'tinymce-rails', '~> 6.2.0'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

# For static pages
gem 'high_voltage', '~> 3.1'

# for sending a mail through form
gem 'mail_form', '~> 1.5', '>= 1.5.1'

#for pretty urls
gem 'friendly_id', '~> 5.4.0'

# for environmnet variables
gem 'figaro'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem "binding_of_caller"

  gem 'guard', '~> 2.18'
  gem 'guard-livereload', '~> 2.5', '>= 2.5.2', require: false

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

