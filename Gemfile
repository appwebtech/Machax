source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'




group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # My gems (development)
  gem 'better_errors', '~> 2.8'
  gem 'guard', '~> 2.14', '>= 2.14.1'
  gem 'guard-livereload', '~> 2.5', '>= 2.5.2', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do 
  gem 'pg', '~> 0.20'
  gem 'rails_12factor'
end


# My gems (production)
gem "bulma-rails", "~> 0.6.1"
gem 'devise', '~> 4.7'
gem 'carrierwave', '~> 1.3'
gem 'simple_form', '~> 5.0'
gem "mini_magick"
gem 'impressionist', '~> 1.6'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'gravatar_image_tag'
gem 'acts_as_votable', '~> 0.11.1'
gem 'fog-aws'



