class GithubService
  def initialize(user)
    @user_token = user.token
    @user_nickname = user.nickname
  end

  def get_profile_info
    parse(conn.get "/user")
  end

  def get_all_repos
    parse(conn.get "/users/#{@user_nickname}/repos")
  end

  def conn
    Faraday.new(:url => 'https://api.github.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:access_token] = @user_token
    end
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
