class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  belongs_to_active_hash :address
  belongs_to_active_hash :category
  belongs_to_active_hash :deliv_fee
  belongs_to_active_hash :shipment
  belongs_to_active_hash :status

  validates :name, :text, :price, :images, :address, :category, :deliv_fee, :shipment, :status, presence: true
  validates :address_id, :category_id, :deliv_fee_id, :shipment_id, :status_id, numericality: { other_than: 1 }

  has_one_attached :images
end
