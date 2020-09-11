class CardBuyer

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip, :address_id, :city, :address, :buildname, :phonecall, :order_id

  def save
    order = Order.create(user_id: user.id, item_id: item.id)
    Buyer.create( zip: zip, address_id: address_id, city: city, address: address, buildname: buildname, phonecall: phonecall, order_id: order_id)
  end
end