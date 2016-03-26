class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to root_path
      #for now send us to root but will change to correct user type
    else
      redirect_to splash_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
