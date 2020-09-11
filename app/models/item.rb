class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :order
  belongs_to :user

  belongs_to_active_hash :address
  belongs_to_active_hash :category
  belongs_to_active_hash :deliv_fee
  belongs_to_active_hash :shipment
  belongs_to_active_hash :status

  validates :name, :text, :price, :image, :address, :category, :deliv_fee, :shipment, :status, presence: true
  validates :address_id, :category_id, :deliv_fee_id, :shipment_id, :status_id, numericality: { other_than: 1 }
  
  has_one_attached :image
  validates :price,
  numericality: {
    greater_than_or_equal_to: 300,
    less_than: 9999999
  }
  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'には半角数字で入力して下さい'
end
