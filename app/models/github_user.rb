class GithubUser
  attr_reader :user_token

  def initialize(current_user)
    @service ||= GithubService.new(current_user)
  end

  def profile_info
    @service.get_profile_info
  end

  def avatar
    profile_info[:avatar_url]
  end

  def name
    profile_info[:name]
  end

  def nickname
    profile_info[:login]
  end

  def profile_header
    header = {public_repos: profile_info[:public_repos],
      followers: profile_info[:followers],
      following: profile_info[:following]}
      return header
  end

  def bio
    profile_info[:bio]
  end

  def company
    profile_info[:company]
  end

  def location
    profile_info[:location]
  end

  def blog
    profile_info[:blog]
  end

  def dates
   dates = {created_at: profile_info[:created_at],
    updated_at: profile_info[:updated_at]}
    return dates
  end

  def all_repos
    @service.get_all_repos.map do |raw_repo|
      Repo.new(raw_repo)
    end
  end
end
