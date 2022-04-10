source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '3.0.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.0'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

gem 'acts-as-taggable-on'
gem 'client_side_validations'
gem 'cocoon'
gem 'cssbundling-rails', '~> 1.1'
gem 'devise'
gem 'image_processing', '>= 1.2'
gem 'jsbundling-rails', '~> 1.0'
gem 'mail_form'
gem 'mailgun-ruby'
gem 'pg_search'
gem 'pundit'
gem 'rails_12factor'
gem 'ruby-vips', '~> 2.1', '>= 2.1.4'
gem 'sidekiq'
gem 'simple_form'
gem 'stimulus-rails'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end
