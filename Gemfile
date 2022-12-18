# frozen_string_literal: true

source "https://rubygems.org"

gem "hanami", "~> 2.0"
gem "hanami-router", "~> 2.0"
gem "hanami-controller", "~> 2.0"
gem "hanami-validations", "~> 2.0"

gem "dry-types", "~> 1.0", ">= 1.6.1"
gem "puma"
gem "rake"

group :development, :test do
  gem "dotenv"
  gem "warning", "~> 1.3"
end

group :cli, :development do
  gem "hanami-reloader"
end

group :cli, :development, :test do
  gem "hanami-rspec"
end

group :development do
  gem "guard-puma", "~> 0.8"
end

group :test do
  gem "rack-test"
  gem "database_cleaner-sequel"
end

gem "rom", "~> 5.3"
gem "rom-sql", "~> 3.6"
gem "pg", "~> 1.4"

gem "rodauth", "~> 2.26"
gem "bcrypt", "~> 3.1"
gem "mail", "~> 2.8"
gem "tilt", "~> 2.0"

gem "alba", "~> 2.1"
