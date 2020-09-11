class Order < ApplicationRecord

  include ActiveModel::Model
  attr_accessor :name, :text, :price

  has_one :address
  belongs_to :user
  belongs_to :item
end
