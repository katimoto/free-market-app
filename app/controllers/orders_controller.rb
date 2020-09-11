class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
  end

  private
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  # def order_params
  #   params.require(:order).permit()
  # end
end
