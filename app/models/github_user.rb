class GithubUser
  attr_reader :user_token

  def initialize(current_user)
    @service ||= GithubService.new(current_user)
  end

  def profile_info
    @service.get_profile_info
    #since it returns a hash, try to break it down the attributes
    #into separated methods (example, def bio | profile_info[:bio] | end)
  end

  def all_repos
    @service.get_all_repos.map do |raw_repo|
    Repo.new(raw_repo)
    end
  end
end
