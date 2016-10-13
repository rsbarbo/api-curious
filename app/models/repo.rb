class Repo
  attr_reader :repo_name, :url

  def initialize(argument)
    @repo_name = argument[:name]
    @url = argument[:html_url]
  end
end
