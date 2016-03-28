class OrdersController < ApplicationController
  #before_action :authenticate

  def index
    @orders = Order.all
    @items = Item.all
    #find my server id session for my orders using .find() so just current server orders show up
    #need menus table and parties table
    @menu = Menu.all
    @parties = Party.all
  end


  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      redirect_to request.referer
    end
  end

  private

  def order_params
    params.require(:order).permit(:menu_id, :party_id, :user_id)
  end

end
