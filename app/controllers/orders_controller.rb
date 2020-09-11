class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = CardBuyer.new(order_params)
  end

  private
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def order_params
    params.require(:card_buyer).permit(:user_id, :item_id, :zip, :address_id, :city, :address, :buildname, :phonecall, :order_id)
  end
end
