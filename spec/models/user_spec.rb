require 'rails_helper'

RSpec.describe User, type: :model do
  it "assigns the auth properly" do


    auth = {"provider"=>"github",
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
          {"token"=>"f7aa0ee2bbd17cb0ca564cde78ba3d3bb3ae8e0d", "expires"=>false},
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
              }}}

      result = User.find_or_create_user(auth)

      expect(result.provider).to eq("github")
      expect(result.uid).to eq("14164092")
      expect(result.name).to eq("Rapha Barbo")
    end
end
