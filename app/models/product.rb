class Product < ApplicationRecord
  belongs_to :category
  has_many :free_products, class_name: 'Product', foreign_key: 'free_product_id'
  belongs_to :main_product, class_name: 'Product', optional: true, foreign_key: 'free_product_id'
end
