class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]
  def new
    @user = User.new
  end

#---
  def create
      @user = User.new(user_params)
      if @user.save
        session[:current_user_id] = @user.id
        if @user.empl_type == "Manager"
          redirect_to admins_path
        elsif @user.empl_type == "Server"
          redirect_to servers_path
        else
          redirect_to chefs_path
        end
      end
    end

    def show
      @user = User.find(params[:id])
      if @user.empl_type == "Manager"
        redirect_to admins_path
      elsif @user.empl_type == "Server"
        redirect_to servers_path
      else
        redirect_to chefs_path
      end
    end
#--
  def destroy
    @user = User.find(params[:id])
    session[:current_user_id] = nil
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :empl_type)
  end

end
