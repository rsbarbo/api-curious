require 'rails_helper'

describe "GithubService" do
  context "get user repos" do

    it "filters by attributes for /user/repos" do
      VCR.use_cassette("github_service.repos") do

        user = OpenStruct.new(
        nickname: "rsbarbo",
        token: ENV['user_token']
        )

        repos = GithubService.new(user).get_all_repos
        repo = repos.first

        expect(repos.count).to eq(30)
        expect(repo[:name]).to eq("active-record-exploration")
        expect(repo[:full_name]).to eq("rsbarbo/active-record-exploration")
      end
    end
    
    it "it returns profile info" do
      VCR.use_cassette("github_service.profile_info") do

        user = OpenStruct.new(
        nickname: "rsbarbo",
        token: ENV['user_token']
        )

        bio = "I love creating new things that sometimes work. Ruby, Ruby on Rails, Sinatra, and JS.\r\n"

        profile_info = GithubService.new(user).get_profile_info

        expect(profile_info[:login]).to eq("rsbarbo")
        expect(profile_info[:bio]).to eq(bio)
        expect(profile_info[:followers]).to eq(3)
        expect(profile_info[:public_repos]).to eq(49)
        expect(profile_info[:public_gists]).to eq(7)
        expect(profile_info[:following]).to eq(15)
      end
    end
  end
end
