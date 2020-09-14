class OrdersController < ApplicationController
  before_action :set_action
  before_action :move_to_index

  def index
    @order = CardBuyer.new
  end

  def create
    @order = CardBuyer.new(card_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def move_to_index
    binding.pry
    if !user_signed_in? || current_user.id == @item.user_id
      redirect_to root_path 
    end
  end

  def set_action
    @item = Item.find(params[:item_id])
  end

  def card_params
    params.require(:card_buyer).permit(:zip, :address_id, :city, :address, :buildname, :phonecall, :order_id, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
