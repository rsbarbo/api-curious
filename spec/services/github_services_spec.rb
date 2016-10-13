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
  end
end
