class GithubUser
  attr_reader :user_token

  def initialize(current_user)
    @service = GithubService.new(current_user)
  end

  def profile_info
    @service.get_profile_info
    #since it returns a hash, try to break it down the attributes
    #into separated methods (example, def bio | profile_info[:bio] | end)
  end

  def all_repos
    @service.get_all_repos#.map do |raw_repo|
      #Repo.new(raw_repo)
    #end
  end
end

#send it over to each model separely (instead of githubservice, send it over user and user to githubservice)

#GithubService.new(current_user).user
#send it over to the head model (presenter being the example here:)
#@presenter = Presenter.new(current_user)
#then from presenter you will make individual calls to the Service (GithubService)

#inside of the view you will then call the additional methods created to support this broken downs (attributes)
#@github_user.profile_info
#@github_user.repos
