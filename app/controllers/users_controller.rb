class UsersController < ApplicationController
  def index
  end

  def show
    @user_profile = GithubUser.new(current_user)
  end
end
