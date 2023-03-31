class Order < ApplicationRecord
  has_many :order_items
  belongs_to :location
  belongs_to :restaurant
end
