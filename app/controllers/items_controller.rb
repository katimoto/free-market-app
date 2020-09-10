class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  # def edit
  # end

  # def update
  #   item = Item.find(params[:id])
  #   item.update(item_params)
  # end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  #   redirect_to root_path
  # end

  def show
  end

  private

  def move_to_index
      redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :deliv_fee_id, :status_id, :address_id, :shipment_id, :text, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
