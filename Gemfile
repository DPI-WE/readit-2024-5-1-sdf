source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

gem "appdev_support"
gem "awesome_print"
gem "aws-sdk-s3", require: false
gem "bootsnap", require: false
gem "devise"
gem "dotenv-rails"
gem "faker"
gem "good_job", "~> 4.1"
gem "htmlbeautifier"
gem "http"
gem "importmap-rails"
gem "jbuilder"
gem "kaminari", "~> 1.2"
gem "meta-tags"
gem "pg", "~> 1.1"
gem "puma"
gem "pundit", "~> 2.3"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "ransack"
gem "redis", "~> 4.0"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "stimulus-rails"
gem "table_print"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development do
  gem "brakeman", require: false
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "draft_generators"
  gem "grade_runner"
  gem "letter_opener"
  gem "pry-rails"
  gem "rack-mini-profiler"
  gem "rails_db"
  gem "rails-erd"
  gem "rufo"
  gem "specs_to_readme"
  gem "web-console"
end

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 6.0.0"
end

group :test do
  gem "capybara"
  gem "draft_matchers"
  gem "rspec-html-matchers"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "webmock"
end
