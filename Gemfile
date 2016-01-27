source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  #gem 'coffee-rails', '~> 3.2.1'
  gem 'compass', "~> 0.12.2"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '~> 2.0.0'

gem 'slim', "~> 1.3.8"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# Refinery CMS
#gem 'refinerycms', '~> 2.0.0', :git => 'git://github.com/refinery/refinerycms.git', :branch => '2-0-stable'
gem 'refinerycms', '~> 2.0.10'

# Specify additional Refinery CMS Extensions here (all optional):
#gem 'refinerycms-i18n', '~> 2.0.0'
#  gem 'refinerycms-blog', '~> 2.0.0'
  gem 'refinerycms-search', '~> 2.0.0'
  gem 'refinerycms-i18n', '~> 2.0.2'
  gem 'refinerycms-inquiries', '~> 2.0.0'
  gem 'refinerycms-page-images', '~> 2.0.0'
  gem 'refinerycms-footer_slides', :path => 'vendor/extensions'
  
group :production do
  gem 'fog'
end
gem 'refinerycms-media_files', :path => 'vendor/extensions'

gem "globalize3", "0.3.0" # https://github.com/refinery/refinerycms/issues/2450#issuecomment-28261644