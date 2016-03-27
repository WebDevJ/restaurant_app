class MenusController < ApplicationController
  #before_action :authenticate

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path(@menu)
    else
      redirect_to request.referer
    end
  end


  private

  def menu_params
    params.require(:menus).permit(:name, :cuisine, :price)
  end

end
