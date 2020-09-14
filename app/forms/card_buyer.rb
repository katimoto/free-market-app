class CardBuyer

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip, :address_id, :city, :address, :buildname, :phonecall, :order_id, :token

  with_options presence: true do
    validates :city, :address
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :phonecall, format: {with: /\A[0-9]+\z/}
    validates :address_id, numericality: { other_than: 1}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create( zip: zip, address_id: address_id, city: city, address: address, buildname: buildname, phonecall: phonecall, order_id: order.id)
  end
end