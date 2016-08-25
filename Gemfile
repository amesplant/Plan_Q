source 'https://rubygems.org'

ruby '2.3.0'

# PostgreSQL driver
gem 'pg', group: :production
gem 'sqlite3', group: :development

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'

gem 'activesupport', '~>4.2.0'
gem 'activerecord', '~>4.2.0'

gem 'rake'

gem 'shotgun'
gem 'bcrypt'
gem 'rest-client'

group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec', '~>3.0'
  gem 'capybara'
end

group :test, :development do
  gem 'factory_girl'
  gem 'faker'
end

gem 'rails_12factor', group: :production
