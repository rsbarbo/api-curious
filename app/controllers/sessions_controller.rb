class SessionsController < ApplicationController

  def create
    user = User.find_or_create_user(request.env['omniauth.auth'])
    if user
      session[:user_id] = user.id
      redirect_to show_page_path(user)
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
