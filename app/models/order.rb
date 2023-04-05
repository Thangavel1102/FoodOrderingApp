class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :location
  belongs_to :restaurant

  accepts_nested_attributes_for :order_items

  DELIVERY_CHARGE = 25

  ORDER_OFFER = { '300' => { 'delivery_charge': false, 'discount': 20, 'max_discount_price': 100 },
                  '100' => { 'delivery_charge': true, 'discount': 20, 'max_discount_price': 100 },
                }

  def update_tax
    total_tax = self.order_items.pluck(:tax_price).sum.to_f
    self.update(total_tax: total_tax)
  end

  def calculate_discount
    total_discount = (self.order_items.pluck(:discount_price).compact.sum.to_f) + self.discount_price.to_f
    final_price =  (self.total.to_f - total_discount).to_f
    self.update(total: final_price, total_discount_price: total_discount)
  end

  def calculate_order_discount
    tax_deducted_total = (total.to_f - total_tax.to_f).to_f
    sorted_offer = ORDER_OFFER
    sorted_offer.each do |k,v|
      puts "key == #{k}, kclass == #{k.class}, tax_deducted_total === #{tax_deducted_total}, tax_deducted_total_class == #{tax_deducted_total.class}, value == #{v}"
      if tax_deducted_total > k.to_f
        puts "discount == #{v[:discount]}, class == #{v[:discount].class}"
        discount_price = ((tax_deducted_total * v[:discount]) / 100).to_f
        puts "discount_price == #{discount_price}"
        if discount_price > v[:max_discount_price].to_f
          discount_price = v[:max_discount_price].to_f
        end
        puts "delivery_charge === #{v[:delivery_charge]}"
        if v[:delivery_charge]
          puts "deliver charge present =========="
          delivery_charge_applicable = true
          delivery_charge = self.delivery_charge
        else
          puts "deliver charge is zero =========="
          delivery_charge_applicable = false
          delivery_charge = 0
        end
        self.update(discount_price: discount_price, discount_percent: v[:discount], delivery_charge_applicable: delivery_charge_applicable, delivery_charge: delivery_charge)
        break
      end
    end
  end

  def calculate_delivery_charge
    if self.delivery_charge_applicable
      total_amt = (self.total.to_f + self.delivery_charge.to_f).to_f
      self.update(total: total_amt)
    end
  end
end
