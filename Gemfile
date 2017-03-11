source 'https://rubygems.org'
ruby '2.3.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'photoswipe-rails'
gem 'dimensions'

group :development, :test do
  gem 'pry-byebug', platform: :mri # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0' # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'spring' # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
  # gem 'seed_dump', git: 'git@github.com:shhavel/seed_dump.git' # rake db:seed:dump USE_IMPORT=1 EXCLUDE=content_uk,content_ru,content_en,content_be,use_in_menu,php_script FILE=db/seeds/entries.rb
  gem 'activerecord-import'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', '~> 2.8', require: false
  gem 'rails-controller-testing'
  gem 'rspec-collection_matchers'
  gem 'simplecov', require: false
  gem 'coveralls', require: false
end
