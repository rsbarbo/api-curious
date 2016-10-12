ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end


def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new( {"provider"=>"github",
    "uid"=>"14164092",
    "info"=>
    {"nickname"=>"rsbarbo",
    "email"=>nil,
    "name"=>"Rapha Barbo",
    "image"=>"https://avatars.githubusercontent.com/u/14164092?v=3",
    "urls"=>
    {"GitHub"=>"https://github.com/rsbarbo",
    "Blog"=>"https://www.linkedin.com/in/rbarbo"}},
    "credentials"=>
    {"token"=>ENV['user_token'], "expires"=>false},
    "extra"=>
    {"raw_info"=>
    {"login"=>"rsbarbo",
      "id"=>14164092,
      "type"=>"User",
      "site_admin"=>false,
      "name"=>"Rapha Barbo",
      "company"=>"@turingschool",
      "location"=>"United States",
      "bio"=>
      "I love creating new things that sometimes work. Ruby, Ruby on Rails, Sinatra, and JS.\r\n",
      }}})
end
