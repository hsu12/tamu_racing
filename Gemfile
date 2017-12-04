source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.10'
gem 'simplecov', :require => false, :group => :test
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap-validator-rails', '0.5.3'

# add cryption
gem 'bcrypt', '~> 3.1.7'
gem 'paperclip'
gem 'imagemagick-identify', '~> 0.0.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use CKEditor for rich text editing
# Current version: 4.7.1
gem 'ckeditor'

# Use carrierwave for file uploading
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  gem 'capistrano', '~> 3.7', '>= 3.7.1'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-passenger', '~> 0.2.0'
  
  # Add this if you're using rbenv
  gem 'capistrano-rbenv', '~> 2.1'

end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'

end


group :development, :test do
  gem 'rspec-rails'
end

group :development, :test do
  gem "factory_girl_rails"
  gem 'capybara'
end
gem 'simplecov', :require => false, :group => :test
#gem "rspec-rails", :group => [:development, :test]
# 'rspec-rails', '~> 3.6'