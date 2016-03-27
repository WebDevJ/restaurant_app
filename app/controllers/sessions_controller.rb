class SessionsController < ApplicationController


  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password]) && user.empl_type == "Chef"
        session[:current_user_id] = user.id
        redirect_to chefs_path
      elsif user && user.authenticate(params[:password]) && user.empl_type == "Server"
        session[:current_user_id] = user.id
        redirect_to servers_path
      elsif user && user.authenticate(params[:password]) && user.empl_type == "Manager"
        session[:current_user_id] = user.id
        redirect_to admins_path
      end
  end


  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
