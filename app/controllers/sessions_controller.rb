class SessionsController < ApplicationController
  def create
    binding.pry
    @user = User.find_or_create_user(request.env['omniauth.auth'])
    if @user
      session[:user_id] = user.id
    end
  end

  def destroy
    sessions[:user_id] = nil
    redirect_to home_path, notice: "Logged Out"
  end
end
