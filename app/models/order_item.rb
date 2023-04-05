class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  ITEM_OFFER = { 2 => 10, 3 => 25 }

  before_create :calculate_tax
  after_create :apply_discount

  def calculate_tax
    product_item = self.product
    self.tax_percent = product_item.tax_percent
    self.tax_price = ((product_item.tax_percent/100) * (qty * product_item.unit_price)).to_f
  end

  def apply_discount
    sorted_offer = ITEM_OFFER.sort_by { |k,v| -k }.to_h
    sorted_offer.each do |k,v|
      if qty > k
        discount_price =  ((v * price) / 100).to_f
        self.update_columns(discount_percent: v, discount_price: discount_price)
        break
      end
    end
  end
end
