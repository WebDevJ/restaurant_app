class MenusController < ApplicationController
  #before_action :authenticate

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path
    else
      redirect_to request.referer
    end
  end

  def show
    @menus
  end

#---
#both edit and update work together , you need both
  def edit
   @menu = Menu.find(params[:id])
 end

 def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to menus_path
  end
#---
  def destroy
   @menu = Menu.find(params[:id])
   @menu.destroy
   redirect_to menus_path
 end

  private

  def menu_params
    params.require(:menu).permit(:name, :cuisine, :price)
  end



end
